package com.ankit.portal.service.test;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;

import com.ankit.portal.exception.PendingTaskException;
import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.util.SearchUtil;

public class ArticleSearchTest {

    public static void main(String[] args) {
        /*
         * try { SearchUtil.rebuildSearchIndex(); } catch (PendingTaskException
         * e) { // TODO Auto-generated catch block e.printStackTrace(); } catch
         * (InterruptedException e) { // TODO Auto-generated catch block
         * e.printStackTrace(); }
         */

        final String[] ARTICLE_SEARCH_COLUMNS_STRINGS = { "articleId", "title",
                "uuid", "content" };

        List<Article> articles = new ArrayList<Article>();
        try {
            Session session = new Configuration().configure().buildSessionFactory().openSession();
            SearchUtil.rebuildSearchIndex();
            FullTextSession fullTextSession = Search
                    .getFullTextSession(session);
            QueryBuilder queryBuilder = fullTextSession.getSearchFactory()
                    .buildQueryBuilder().forEntity(Article.class).get();
            org.apache.lucene.search.Query query = queryBuilder.keyword()
                    .onFields(ARTICLE_SEARCH_COLUMNS_STRINGS).matching("a")
                    .createQuery();

            System.out.println("query-" + query);

            FullTextQuery fullTextQuery = fullTextSession.createFullTextQuery(
                    query, Article.class);

            articles = fullTextQuery.list();

            System.out.println(articles);

        } catch (PendingTaskException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 

    }

}
