package com.ankit.portal.service.test;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.ankit.portal.exception.ServiceException;
import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.domain.SubCategory;
import com.ankit.portal.service.util.ArticleUtil;
import com.ankit.portal.service.util.CategoryUtil;
import com.ankit.portal.service.util.MenuUtil;
import com.ankit.portal.service.util.SubCategoryUtil;

public class RemoveUnnecessaryArticles {

	public static void main(String[] args) {
		try {
			System.out.println("\n#############################  starting app #############################");
			List<Article> articles = ArticleUtil.getArticles(0, 0);
			Set<Long> availableIds = new HashSet<Long>();
			for (Article art : articles) {
				availableIds.add(art.getArticleId());
			}
			Set<Long> toKeep = new HashSet<Long>();
			System.out.println("\n############################# All available--"+availableIds);
			for (Menu menu : MenuUtil.getMenus()) {
				Article article = menu.getContent();
				if(article==null)
					continue;
				article = ArticleUtil.getLatestVersionByUUID(article.getUuid());
				menu.setContent(article);
				MenuUtil.updateMenu(menu);
				toKeep.add(article.getArticleId());
			}
			System.out.println("\n############################# To keep for menu--" + toKeep);
			for (Category category : CategoryUtil.getCategories(0, 0)) {
				Article article = category.getArticle();
				if(article==null)
					continue;
				article = ArticleUtil.getLatestVersionByUUID(article.getUuid());
				category.setArticle(article);
				CategoryUtil.updateCategory(category);
				toKeep.add(article.getArticleId());
			}
			System.out.println("\n############################# To Keep after category--"+toKeep);
			for (SubCategory subCategory : SubCategoryUtil.getSubCategories(0, 0)) {
				Article article = subCategory.getArticle();
				if(article==null)
					continue;
				article = ArticleUtil.getLatestVersionByUUID(article.getUuid());
				subCategory.setArticle(article);
				SubCategoryUtil.updateSubCategory(subCategory);
				toKeep.add(article.getArticleId());
			}
			System.out.println("\n############################# To Keep after sub-category--"+toKeep);
			System.out.println("\n#################### Deleting ALL-----  "+availableIds+" Total-"+availableIds.size());
			if (availableIds.removeAll(toKeep)) {
				for (Long articleId : availableIds) {
					ArticleUtil.deleteArticle(articleId);
					System.out.println("\n#################### Deleting-----  "+articleId);
				}
			}
			System.exit(0);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
