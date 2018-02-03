package com.ankit.portal.web.action.cpanel;

import net.sf.json.JSONObject;

import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.util.ArticleUtil;
import com.ankit.portal.service.util.CategoryUtil;
import com.ankit.portal.web.action.PortalAction;

public class CategoryArticleLinkAction extends PortalAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer categoryId;
	private Long articleId;
	private JSONObject jsonObject;

	public String linkArticle() {
		System.out.println("CategoryArticleLinkAction.linkArticle()");
		try {
			System.out.println("Hey yaa Link article-" + categoryId + " " + articleId);
			Article article = ArticleUtil.getArticle(articleId);
			jsonObject = new JSONObject();
			if (article == null) {
				jsonObject.put("STATUS", "ERROR");
				jsonObject.put("MESSAGE", "No article with given Id");
			} else {
				Category category = CategoryUtil.getCategory(categoryId);
				category.setArticle(article);
				CategoryUtil.updateCategory(category);
				jsonObject.put("STATUS", "OK");
				jsonObject.put("MESSAGE", "Updated successfully");
			}

			jsonObject.put("STATUS", "OK");
		} catch (Throwable e) {
			e.printStackTrace();
			jsonObject.put("STATUS", "ERROR");
			jsonObject.put("MESSAGE", "Sorry unable to process!");
		}

		return SUCCESS;
	}
	
	public String unLinkArticle() {
		System.out.println("CategoryArticleLinkAction.linkArticle()");
		System.out.println("Hey yaa unLink article-" + categoryId + " " + articleId);
		return SUCCESS;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Long getArticleId() {
		return articleId;
	}

	public void setArticleId(Long articleId) {
		this.articleId = articleId;
	}

	public JSONObject getJsonObject() {
		return jsonObject;
	}

	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}

}
