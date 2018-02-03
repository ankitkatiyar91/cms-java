package com.ankit.portal.web.action.cpanel;

import net.sf.json.JSONObject;

import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.util.ArticleUtil;
import com.ankit.portal.service.util.MenuUtil;
import com.ankit.portal.web.action.PortalAction;

public class MenuArticleLinkAction extends PortalAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer menuId;
	private Long articleId;
	private JSONObject jsonObject;

	
	public String linkArticle(){
		System.out.println("MenuArticleLinkAction.linkArticle()");
		try {
			System.out.println("Hey yaa Link article-"+menuId+" "+articleId);
			Article article=ArticleUtil.getArticle(articleId);
			jsonObject=new JSONObject();
			if(article==null){
				jsonObject.put("STATUS", "ERROR");
				jsonObject.put("MESSAGE", "No article with given Id");
			}else {
				Menu menu=MenuUtil.getMenu(menuId);
				menu.setContent(article);
				MenuUtil.updateMenu(menu);
				jsonObject.put("STATUS", "OK");
				jsonObject.put("MESSAGE", "Updated successfully");
			}
			
			jsonObject.put("STATUS", "OK");
		} catch (Throwable e) {
			e.printStackTrace();
			jsonObject.put("STATUS", "ERROR");
		}
		
		return SUCCESS;
	}
	
	
	public Integer getMenuId() {
		return menuId;
	}

	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
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
