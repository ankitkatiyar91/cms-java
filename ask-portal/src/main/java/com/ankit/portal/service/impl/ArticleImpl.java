package com.ankit.portal.service.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.hibernate.util.SC;
import com.ankit.portal.service.dao.ArticleDAO;
import com.ankit.portal.service.domain.Article;
import com.ankit.portal.support.StatusType;

public class ArticleImpl implements ArticleDAO {

	@Override
	public Article addArticle(Article article) {
		try {
			Session session = HibernateUtil.getSession();
			session.beginTransaction();
			session.save(article);
			session.getTransaction().commit();
			return article;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> getArticles(Integer startIndex, Integer maxRecords) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetArticle");
			query.setFirstResult(startIndex);
			query.setMaxResults(maxRecords);
			query.setCacheable(true);
			List<Article> articles = query.list();
			return articles;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Article getArticle(Long articleId) {
		try {
			Session session = HibernateUtil.getSession();
			Article article = (Article) session.get(Article.class, articleId);
			return article;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Article updateArticle(Article article) {
		try {
			Session session = HibernateUtil.getSession();
			session.beginTransaction();
			session.update(article);
			session.getTransaction().commit();
			return article;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Article fetchArticleByTitle(String articleTitle) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetArticleByTitle");
			query.setParameter(0, articleTitle);
			query.setCacheable(true);
			Article articles = (Article) query.uniqueResult();
			return articles;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> fetchArticlesByTitle(String articleTitle, Integer startIndex, Integer maxRecords) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetArticlesByTitle");
			query.setParameter(0, articleTitle);
			query.setCacheable(true);
			query.setFirstResult(startIndex);
			query.setMaxResults(maxRecords);
			List<Article> articles = query.list();
			return articles;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Article getLatestVersionByUUID(String uuid) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetArticleLatestVersionByUUID");
			query.setParameter("uuid", uuid);
			query.setCacheable(true);
			Article articles = (Article) query.uniqueResult();
			return articles;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Article getLatestVersionByArticleId(Long id) {
		Article articles = null;
		try {
			Session session = HibernateUtil.getSession();
			String uuid = ((Article) session.get(Article.class, id)).getUuid();
			Query query = session.getNamedQuery("GetArticleLatestVersionByUUID");
			query.setParameter("uuid", uuid);
			query.setCacheable(true);
			articles = (Article) query.uniqueResult();
		} catch (HibernateException e) {
			HibernateUtil.closeSession();
		}

		return articles;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> getArticlesByUUID(String uuid, Integer startIndex, Integer maxRecords) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetArticleByUUID");
			query.setCacheable(true);
			query.setParameter(0, uuid);
			query.setFirstResult(startIndex);
			query.setMaxResults(maxRecords);
			List<Article> articles = query.list();
			return articles;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Article publishArticle(Long articleId) {
		try {
			Session session = HibernateUtil.getSession();
			session.beginTransaction();
			Article article = (Article) session.get(Article.class, articleId);
			Query query = session.getNamedQuery("GetArticleByUUID");
			query.setParameter(0, article.getUuid());
			List<Article> articles = query.list();
			for (Article ar : articles) {

				if (ar.getArticleId() == article.getArticleId()) {
					ar.setStatus(StatusType.PUBLISHED);
				} else if (ar.getStatus().equals(StatusType.PUBLISHED)) {
					ar.setStatus(StatusType.SAVE);
				}
			}
			session.getTransaction().commit();
			return article;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public void deleteArticle(Long articleId) {
		try {
			Session session = HibernateUtil.getSession();
			session.beginTransaction();
			session.delete(session.get(Article.class, articleId));
			session.getTransaction().commit();
		} finally {
			HibernateUtil.closeSession();
		}

	}
	@Override
	public Long getTotalArticles() {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetTotalArticles");
			Long count = (Long) query.uniqueResult();
			return count;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Long getTotalArticlesByUUID(String uuid) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetTotalArticlesByUUID");
			query.setParameter(0, uuid);
			Long count = (Long) query.uniqueResult();
			return count;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Article getLatestVersionArticleByUUIDStatus(String uuid, StatusType statusType) {
		Article article = null;
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetLatestArticleByUUIDStatus");
			query.setCacheable(true);
			query.setParameter("uuid", uuid);
			query.setParameter("status", statusType);
			query.setMaxResults(1);
			article = (Article) query.uniqueResult();
		} finally {
			HibernateUtil.closeSession();
		}
		return article;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> searchArticle(String queryString, StatusType statusType, Integer startIndex, Integer maxRecords) {
		List<Article> articles;
		try {
			Session session = HibernateUtil.getSession();
			Criteria criteria = session.createCriteria(Article.class);
			if (queryString != null && queryString.length() > 0) {
				criteria.add(Restrictions.or(Restrictions.like("content", SC.PERCENTAGE + queryString + SC.PERCENTAGE),
						Restrictions.like("title", SC.PERCENTAGE + queryString + SC.PERCENTAGE),
						Restrictions.like("uuid", SC.PERCENTAGE + queryString + SC.PERCENTAGE)));
			}
			if (statusType != null) {
				criteria.add(Restrictions.eq("status", statusType));
			}
			criteria.setFirstResult(startIndex);
			criteria.setMaxResults(maxRecords);
			criteria.setCacheable(true);
			articles = criteria.list();
		} finally {
			HibernateUtil.closeSession();
		}
		return articles;
	}

	@Override
	public Long searchArticleCount(String queryString, StatusType statusType) {
		Long count;
		try {
			Session session = HibernateUtil.getSession();
			Criteria criteria = session.createCriteria(Article.class);
			criteria.setProjection(Projections.count("articleId"));
			if (queryString != null && queryString.length() > 0) {
				criteria.add(Restrictions.or(Restrictions.like("content", SC.PERCENTAGE + queryString + SC.PERCENTAGE),
						Restrictions.like("title", SC.PERCENTAGE + queryString + SC.PERCENTAGE),
						Restrictions.like("uuid", SC.PERCENTAGE + queryString + SC.PERCENTAGE)));
			}
			if (statusType != null) {
				criteria.add(Restrictions.eq("status", statusType));
			}
			criteria.setMaxResults(1);
			criteria.setCacheable(true);
			count = (Long) criteria.list().get(0);
		} finally {
			HibernateUtil.closeSession();
		}
		return count;
	}

	@Override
	public List<Article> getLatestArticles(Integer startIndex, Integer maxRecords) {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetLatestArticles");
			query.setFirstResult(startIndex);
			query.setMaxResults(maxRecords);
			query.setCacheable(true);
			@SuppressWarnings("unchecked")
			List<Article> articles = query.list();
			return articles;
		} finally {
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Long getTotalLatestArticles() {
		try {
			Session session = HibernateUtil.getSession();
			Query query = session.getNamedQuery("GetLatestArticlesCount");
			Long count = (Long) query.uniqueResult();
			return count;
		} finally {
			HibernateUtil.closeSession();
		}
	}
}
