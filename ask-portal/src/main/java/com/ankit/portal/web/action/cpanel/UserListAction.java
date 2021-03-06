/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On 10-Apr-2014 for the web application of a portal project
 */
package com.ankit.portal.web.action.cpanel;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.UserUtil;
import com.ankit.portal.util.Util;
import com.ankit.portal.web.action.PortalAction;

/**
 * @author Ankit
 * 
 */
public class UserListAction extends PortalAction {

	private static final long serialVersionUID = 743435092660976050L;
	private static final Logger LOGGER = new Logger(UserListAction.class, Level.INFO);
	private List<User> users;
	private Integer jtStartIndex;
	private Integer jtPageSize;
	private JSONObject usersJsonObject;
	private Long userId;
	private User user;

	public String list() {
		
		
		try {
			String searchQuery = getRequest().getParameter("searchQuery");
			LOGGER.log("UserListAction.list() search"+searchQuery);
			System.out.println("UserListAction.list() search"+searchQuery);

			if (jtPageSize == null || jtStartIndex == null) {
				jtStartIndex = 0;
				jtPageSize = 10;
			}

			usersJsonObject = new JSONObject();

			
			if (searchQuery != null && searchQuery.trim().length()>0) {
				users = UserUtil.searchUser(searchQuery, jtStartIndex, jtPageSize);
				usersJsonObject.put("TotalRecordCount", UserUtil.searchUserCount(searchQuery));
			} else {

				users = UserUtil.getUsers(jtStartIndex, jtPageSize);
				usersJsonObject.put("TotalRecordCount", UserUtil.getTotalUsers());
				
			}
			
			JSONArray usersJsonArray = new JSONArray();
			JSONObject jsonObject;
			final DateFormat dateFormat = new SimpleDateFormat(Util.DATE_TIME_FORMAT);
			for (User user : users) {
				jsonObject = new JSONObject();
				jsonObject.put("id", user.getId());
				jsonObject.put("firstName", user.getFirstName());
				jsonObject.put("lastName", user.getLastName());
				jsonObject.put("email", user.getEmail());
				jsonObject.put("created", dateFormat.format(user.getCreated()));
				usersJsonArray.add(jsonObject);
			}
			usersJsonObject.put("Result", "OK");
			usersJsonObject.put("Records", usersJsonArray);
		} catch (Throwable e) {
			e.printStackTrace();
			LOGGER.log(e);
			usersJsonObject = new JSONObject();
			usersJsonObject.put("Result", "ERROR");
			usersJsonObject.put("Message", "Unable to process-" + e.getMessage());
		}
		return SUCCESS;
	}

	public String viewDetail() {
		System.out.println("UserListAction.viewDetail() userId->" + userId);
		LOGGER.log("UserListAction.viewDetail() userId->" + userId);
		try {
			user = UserUtil.getUser(userId);
			if (user == null) {
				addActionError(getText("failed"));
				addActionError("No user find with id #" + userId);
			} else {
				addActionMessage(getText("success"));
			}
		} catch (Exception e) {
			LOGGER.log(e);
			addActionError(getText("failed"));
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String changeStatus() {
		try {
			System.out.println("UserListAction.changeStatus() " + user.getId() + "  status->" + user.getActive());
			LOGGER.log("UserListAction.changeStatus() " + user.getId() + "  status->" + user.getActive());
			User tempUser = UserUtil.getUser(user.getId());
			tempUser.setActive(user.getActive());
			UserUtil.updateUser(tempUser);
			addActionMessage(getText("success"));
		} catch (Exception e) {
			LOGGER.log(e);
			addActionError(getText("failed"));
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public Integer getJtStartIndex() {
		return jtStartIndex;
	}

	public void setJtStartIndex(Integer jtStartIndex) {
		this.jtStartIndex = jtStartIndex;
	}

	public Integer getJtPageSize() {
		return jtPageSize;
	}

	public void setJtPageSize(Integer jtPageSize) {
		this.jtPageSize = jtPageSize;
	}

	public JSONObject getUsersJsonObject() {
		return usersJsonObject;
	}

	public void setUsersJsonObject(JSONObject usersJsonObject) {
		this.usersJsonObject = usersJsonObject;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
