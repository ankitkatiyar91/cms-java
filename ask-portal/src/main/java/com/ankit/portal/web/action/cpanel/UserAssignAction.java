/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On 11-Apr-2014 for the web application of a portal project
 */
package com.ankit.portal.web.action.cpanel;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import net.sf.json.JSONObject;

import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.domain.UserGroup;
import com.ankit.portal.service.util.RoleUtil;
import com.ankit.portal.service.util.UserGroupUtil;
import com.ankit.portal.service.util.UserUtil;
import com.ankit.portal.web.action.PortalAction;

/**
 * @author Ankit
 * 
 */
public class UserAssignAction extends PortalAction {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = new Logger(UserAssignAction.class, Level.INFO);
	private User user;
	private List<Role> roles;
	private Integer[] assignedRoles;
	private List<UserGroup> groups;
	private JSONObject jsonObject;

	public String assignRoleForm() {
		try {
			System.out.println("UserAssignAction.assignRoleForm()->" + user.getId());
			user = UserUtil.getUser(user.getId());
			user.setRoles(UserUtil.getRolesByUserId(user.getId()));
			roles = RoleUtil.getRoles();
			addActionMessage(getText("success"));
		} catch (Throwable e) {
			e.printStackTrace();
			addActionError(getText("failed"));
			LOGGER.log("Error in showing assignRole Form for user", e);
		}
		return SUCCESS;
	}

	public String assignRole() {
		try {
			System.out.println("\n\nUserAssignAction.assignRole() id->" + user.getId() + " Roles" + user.getRoles() + " assigned roles->"
					+ getAssignedRoles() + " Length->" + (getAssignedRoles() != null ? getAssignedRoles().length : null));
			for (Integer item : getAssignedRoles()) {
				System.out.println(item + ",");
			}
			System.out.println(RoleUtil.getRoles(getAssignedRoles()));
			user = UserUtil.getUser(user.getId());
			user.getRoles().clear();
			user.getRoles().addAll(RoleUtil.getRoles(getAssignedRoles()));
			UserUtil.updateUser(user);
		} catch (Throwable e) {
			e.printStackTrace();
			LOGGER.log("Error in showing assignRole for user", e);
		}
		return SUCCESS;
	}

	public String assignGroupForm() {
		try {
			System.out.println("UserAssignAction.assignGroupForm()->" + user.getId());
			groups = UserGroupUtil.getUserGroups(0, 0);
			groups.removeAll(UserUtil.getGroupByUserId(user.getId()));
			addActionMessage(getText("success"));
		} catch (Throwable e) {
			e.printStackTrace();
			LOGGER.log("Error in showing assignGROUP Form for user", e);
			addActionError(getText("failed"));
		}
		return SUCCESS;
	}

	public String assignGroup() {
		try {
			jsonObject = new JSONObject();
			System.out.println("UserAssignAction.assignGroup()");
			Long userId = Long.parseLong(getRequest().getParameter("userId"));
			String[] groups = getRequest().getParameterValues("group");
			System.out.println("userId->" + userId + "  groups->" + groups);
			if (userId == null) {
				jsonObject.put("Result", "Unable to process try refreshing!");
				return SUCCESS;
			}

			user = UserUtil.getUser(userId);
			if (groups == null) {
				user.setGroups(null);
			} else {
				List<Long> groupIds = new ArrayList<Long>();
				for (String s : groups) {
					System.out.println(s);
					try {
						groupIds.add(Long.parseLong(s));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				System.out.println("Assigning groups->" + UserGroupUtil.getUserGroups(groupIds));
				user.setGroups(new HashSet<UserGroup>(UserGroupUtil.getUserGroups(groupIds)));
			}
			UserUtil.updateUser(user);
			System.out.println("user updated");
			jsonObject.put("Result", "User assigned Group!");
		} catch (Throwable e) {
			e.printStackTrace();
			LOGGER.log("Error in showing assignGROUP for user", e);
			jsonObject = new JSONObject();
			jsonObject.put("Result", "Sorry unable to process!");
		}
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<UserGroup> getGroups() {
		return groups;
	}

	public void setGroups(List<UserGroup> groups) {
		this.groups = groups;
	}

	public Integer[] getAssignedRoles() {
		return assignedRoles;
	}

	public void setAssignedRoles(Integer[] assignedRoles) {
		this.assignedRoles = assignedRoles;
	}

	public JSONObject getJsonObject() {
		return jsonObject;
	}

	public void setJsonObject(JSONObject jsonObject) {
		this.jsonObject = jsonObject;
	}

}
