package com.ankit.portal.web.action.front;

import java.util.List;

import com.ankit.portal.exception.NoSuchElementException;
import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.domain.Article;
import com.ankit.portal.service.domain.Category;
import com.ankit.portal.service.domain.Menu;
import com.ankit.portal.service.domain.SubCategory;
import com.ankit.portal.service.util.ArticleUtil;
import com.ankit.portal.service.util.CategoryUtil;
import com.ankit.portal.service.util.MenuUtil;
import com.ankit.portal.service.util.SubCategoryUtil;
import com.ankit.portal.support.StatusType;
import com.ankit.portal.web.action.PortalAction;

/**
 * @author Ankit
 * 
 */
public class HomeAction extends PortalAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = new Logger(HomeAction.class, Level.INFO);

	private String uuid;
	private String title;
	private Long id;
	private Integer mid;
	private Integer cid;
	private Article article;
	private List<Menu> menus;
	private List<Category> categories;

	public String render() {
		System.out.println("Home.render() mid->" + mid + " cid->" + cid + " id->" + id + " uuid->" + uuid + " title->" + title);

		/*
		 * Load Menu
		 */
		try {
			menus = MenuUtil.getDispayableMenus();
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * Id of sub-category is represented as id variable. if id found load
		 */
		if (id != null) {
			try {
				SubCategory subCategory = SubCategoryUtil.getSubCategory(id);
				Category category = subCategory.getCategory();
				cid = category.getId();
				article = subCategory.getArticle();
				categories = CategoryUtil.getDisplayableCategoryByMenuId(category.getMenu().getId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {

			/*
			 * Set Menu Id
			 */
			if (mid == null && cid != null) {
				try {
					Category category = CategoryUtil.getCategory(cid);
					mid = category.getMenu().getId();
				} catch (NoSuchElementException e) {
					e.printStackTrace();
				}
			}
			if (mid == null && (menus != null && menus.size() > 0)) {
				mid = menus.get(0).getId();
			}

			/*
			 * Load Categories
			 */
			if (mid != null) {
				try {
					categories = CategoryUtil.getDisplayableCategoryByMenuId(mid);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			/*
			 * Load Article
			 */
			if (id != null) {
				article = ArticleUtil.getArticle(id);
			}
			if (article == null && uuid != null) {
				article = ArticleUtil.getLatestVersionByUUID(uuid);
			}

			if (article == null && title != null) {
				System.out.println("Fetch By Id");
			}

			if (article == null && cid != null) {
				try {
					article = CategoryUtil.getCategory(cid).getArticle();
				} catch (NoSuchElementException e) {
					e.printStackTrace();
				}
				// return INPUT;
			}

			if (article == null && mid != null) {
				System.out.println("Fetching by mid->" + mid);
				article = MenuUtil.getMenu(mid).getContent();
			}

			if (article == null && categories != null && categories.size() > 0) {
				article = categories.get(0).getArticle();
			} else if (article == null) {
				/*System.out.println("No Article");
				addActionError("No Article Exist");*/
			}

			if (article != null) {
				System.out.println("Article fetch-" + article.getArticleId() + " article uuid->" + article.getUuid() + " Status->"
						+ article.getStatus());
				LOGGER.log("Article fetch-" + article.getArticleId() + " article uuid->" + article.getUuid() + " Status->" + article.getStatus());

				Article tempArticle = ArticleUtil.getLatestVersionArticleByUUIDStatus(article.getUuid(), StatusType.PUBLISHED);

				if (tempArticle != null) {
					article = tempArticle;
					System.out.println("Article fetch for latest Published-" + article.getArticleId());
					LOGGER.log("Article fetch for latest Published-" + article.getArticleId());
				}
			} else {
				LOGGER.log("No article found for given ids with status PUBLISHED");
			}

			if(article!=null){
				ArticleUtil.getLatestVersionArticleByUUIDStatus(article.getUuid(), StatusType.PUBLISHED);
			}
		}
		return SUCCESS;
	}
	
	public String previewRender(){

		System.out.println("Home.render() mid->" + mid + " cid->" + cid + " id->" + id + " uuid->" + uuid + " title->" + title);

		/*
		 * Load Menu
		 */
		try {
			menus = MenuUtil.getDispayableMenus();
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * Id of sub-category is represented as id variable. if id found load
		 */
		if (id != null) {
			try {
				article=ArticleUtil.getArticle(id);				
			} catch (Exception e) {
				//e.printStackTrace();
			}
		} else {

			/*
			 * Set Menu Id
			 */
			if (mid == null && cid != null) {
				try {
					Category category = CategoryUtil.getCategory(cid);
					mid = category.getMenu().getId();
				} catch (NoSuchElementException e) {
					e.printStackTrace();
				}
			}
			if (mid == null && (menus != null && menus.size() > 0)) {
				mid = menus.get(0).getId();
			}

			/*
			 * Load Categories
			 */
			if (mid != null) {
				try {
					categories = CategoryUtil.getDisplayableCategoryByMenuId(mid);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			/*
			 * Load Article
			 */
			if (id != null) {
				article = ArticleUtil.getArticle(id);
			}
			if (article == null && uuid != null) {
				System.out.println("Fetch by uuid");
			}

			if (article == null && title != null) {
				System.out.println("Fetch By Id");
			}

			if (article == null && cid != null) {
				try {
					article = CategoryUtil.getCategory(cid).getArticle();
				} catch (NoSuchElementException e) {
					e.printStackTrace();
				}
				// return INPUT;
			}

			if (article == null && mid != null) {
				System.out.println("Fetching by mid->" + mid);
				article = MenuUtil.getMenu(mid).getContent();
			}

			if (article == null && categories != null && categories.size() > 0) {
				article = categories.get(0).getArticle();
			} else if (article == null) {
				/*System.out.println("No Article");
				addActionError("No Article Exist");*/
			}

			if (article != null) {
				System.out.println("Article fetch-" + article.getArticleId() + " article uuid->" + article.getUuid() + " Status->"
						+ article.getStatus());
				LOGGER.log("Article fetch-" + article.getArticleId() + " article uuid->" + article.getUuid() + " Status->" + article.getStatus());

				Article tempArticle = ArticleUtil.getLatestVersionArticleByUUIDStatus(article.getUuid(), StatusType.PUBLISHED);

				if (tempArticle != null) {
					article = tempArticle;
					System.out.println("Article fetch for latest Published-" + article.getArticleId());
					LOGGER.log("Article fetch for latest Published-" + article.getArticleId());
				}
			} else {
				LOGGER.log("No article found for given ids with status PUBLISHED");
			}

			if(article!=null){
				ArticleUtil.getLatestVersionArticleByUUIDStatus(article.getUuid(), StatusType.PUBLISHED);
			}
		}
		System.out.println("article--"+article.getArticleId());
		return SUCCESS;
	
		
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

}
