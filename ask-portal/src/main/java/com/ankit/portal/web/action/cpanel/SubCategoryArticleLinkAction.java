package com.ankit.portal.web.action.cpanel;

import net.sf.json.JSONObject;

import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.domain.SubCategory;
import com.ankit.portal.service.util.ArticleUtil;
import com.ankit.portal.service.util.SubCategoryUtil;
import com.ankit.portal.web.action.PortalAction;

public class SubCategoryArticleLinkAction extends PortalAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long subCategoryId;
	private Long articleId;
	private JSONObject jsonObject;

	public String linkArticle() {
		System.out.println("CategoryArticleLinkAction.linkArticle()");
		try {
			System.out.println("Hey yaa Link article-" + subCategoryId + " "
					+ articleId);
			Article article = ArticleUtil.getArticle(articleId);
			jsonObject = new JSONObject();
			if (article == null) {
				jsonObject.put("STATUS", "ERROR");
				jsonObject.put("MESSAGE", "No article with given Id");
			} else {
				SubCategory subCategory = SubCategoryUtil
						.getSubCategory(getSubCategoryId());
				subCategory.setArticle(article);
				SubCategoryUtil.updateSubCategory(subCategory);
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
		System.out.println("SubCategoryArticleLinkAction.unLinkArticle()");
		System.out.println("Hey yaa Link article-" + subCategoryId + " "
				+ articleId);
		return SUCCESS;
	}

	public Long getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(Long subCategoryId) {
		this.subCategoryId = subCategoryId;
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
