package com.ankit.portal.service.util;

import java.util.concurrent.Semaphore;

import org.hibernate.CacheMode;
import org.hibernate.Session;
import org.hibernate.search.FullTextSession;

import com.ankit.portal.exception.PendingTaskException;
import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.domain.User;

public class SearchUtil {

    private static final java.util.concurrent.Semaphore SEMAPHORE = new Semaphore(
            1, true);

    public static boolean rebuildSearchIndex() throws InterruptedException, PendingTaskException {
        Session session = HibernateUtil.getSession();
        FullTextSession fullTextSession;
        if (SEMAPHORE.tryAcquire()) {
            try {
                fullTextSession = org.hibernate.search.Search
                        .getFullTextSession(session);
                fullTextSession.createIndexer(User.class, Article.class)
                        .typesToIndexInParallel(2).batchSizeToLoadObjects(25)
                        .cacheMode(CacheMode.NORMAL).threadsToLoadObjects(5)
                        .idFetchSize(150)
                        // a MassIndexerProgressMonitor implementation
                        .optimizeOnFinish(true)
                        .startAndWait();
            } finally {
                SEMAPHORE.release();
                HibernateUtil.closeSession();
            }
        } else {
            throw  new PendingTaskException("One task in already in progress");
        }
        return true;
    }

}
