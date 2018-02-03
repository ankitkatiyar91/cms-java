/**
 * 
 */
package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.service.dao.ArticleDAO;
import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.impl.ArticleImpl;
import com.ankit.portal.support.StatusType;

/**
 * @author Ankit
 * 
 */
public class ArticleUtil {
    private static final ArticleDAO DAO = new ArticleImpl();

    public static Article addArticle(Article article) {
        return DAO.addArticle(article);
    }

    public static List<Article> getArticles(Integer startIndex,
            Integer maxRecords) {
        return DAO.getArticles(startIndex, maxRecords);
    }

    public static Article getArticle(Long articleId) {
        return DAO.getArticle(articleId);
    }

    /*
     * If Current article is not available then it will add a new
     */
    public static Article updateArticle(Article article) {
        return DAO.updateArticle(article);
    }

    public static Article fetchArticleByTitle(String articleTitle) {
        return DAO.fetchArticleByTitle(articleTitle);

    }

    public static List<Article> fetchArticlesByTitle(String articleTitle,
            Integer startIndex, Integer maxRecords) {
        return DAO.fetchArticlesByTitle(articleTitle, startIndex, maxRecords);

    }

    public static Article getLatestVersionByUUID(String uuid) {
        return DAO.getLatestVersionByUUID(uuid);
    }

    public static Article getLatestVersionByArticleId(Long id) {
        return DAO.getLatestVersionByArticleId(id);
    }

    public static List<Article> getArticlesByUUID(String uuid,
            Integer startIndex, Integer maxRecords) {
        return DAO.getArticlesByUUID(uuid, startIndex, maxRecords);
    }

    public static Article publishArticle(Long articleId) {
        return DAO.publishArticle(articleId);
    }

    public static void deleteArticle(Long articleId) {
        DAO.deleteArticle(articleId);
    }

    public static Long getTotalArticles() {
        return DAO.getTotalArticles();
    }

    public static Long getTotalArticlesByUUID(String uuid) {
        return DAO.getTotalArticlesByUUID(uuid);
    }

    public static Article getLatestVersionArticleByUUIDStatus(String uuid,
            StatusType statusType) {
        return DAO.getLatestVersionArticleByUUIDStatus(uuid, statusType);
    }

    public static List<Article> searchArticle(String queryString,
            Integer startIndex, Integer maxReocrds) {
        return DAO.searchArticle(queryString,null, startIndex, maxReocrds);
    }

    public static Long searchArticleCount(String queryString) {
        return DAO.searchArticleCount(queryString,null);
    }

    public static List<Article> searchArticle(String queryString,
            StatusType statusType, Integer startIndex, Integer maxReocrds) {
        return DAO.searchArticle(queryString, statusType, startIndex,
                maxReocrds);
    }

    public static Long searchArticleCount(String queryString,
            StatusType statusType) {
        return DAO.searchArticleCount(queryString, statusType);
    }

    public static List<Article> getLatestArticles(Integer startIndex,
            Integer maxRecords) {
        return DAO.getLatestArticles(startIndex, maxRecords);
    }

    public static Long getTotalLatestArticles() {
        return DAO.getTotalLatestArticles();
    }
}
