/**
 * 
 */
package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.service.dao.UserGroupDAO;
import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.domain.UserGroup;
import com.ankit.portal.service.impl.UserGroupImpl;

/**
 * @author Ankit
 * 
 */
public class UserGroupUtil {

    private static final UserGroupDAO DAO = new UserGroupImpl();

    public static UserGroup addUserGroup(UserGroup group) {
        return DAO.addUserGroup(group);
    }

    public static UserGroup getUserGroup(Long id) {
        return DAO.getUserGroup(id);
    }

    public static Long getUserGroupCount() {
        return DAO.getUserGroupCount();
    }

    public static List<UserGroup> getUserGroups(Integer startIndex,
            Integer maxReocrds) {
        return DAO.getUserGroups(startIndex, maxReocrds);
    }

    public static void deleteUserGroup(Long id) {
        deleteUserGroup(getUserGroup(id));
    }

    public static void deleteUserGroup(UserGroup group) {
        DAO.deleteUserGroup(group);
    }

    public static void updateUserGroup(UserGroup group) {
        DAO.updateUserGroup(group);
    }

    public static List<User> getUsers(Long groupId, Integer startIndex,
            Integer maxReocrds) {
        return DAO.getUsers(groupId, startIndex, maxReocrds);
    }

    public static List<User> getUsers(Long groupId) {
        return DAO.getUsers(groupId, 0, 0);
    }

    public static List<Role> getRoles(Long groupId, Integer startIndex,
            Integer maxReocrds) {
        return DAO.getRoles(groupId, startIndex, maxReocrds);
    }

    public static List<Role> getRoles(Long groupId) {
        return DAO.getRoles(groupId, 0, 0);
    }

    /**
     * add a role to Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link Role} userId
     */
    public static void addRole(Long groupId, Integer roleId) {
        DAO.addRole(groupId, roleId);
    }

    /**
     * Remove a role from Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link Role} userId
     */
    public static void removeRole(Long groupId, Integer roleId) {
        DAO.removeRole(groupId, roleId);
    }

    /**
     * Add an user to Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link User} userId
     */
    public static void addUser(Long groupId, Long userId) {
        DAO.addUser(groupId, userId);
    }

    /**
     * Remove an user from Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link User} userId
     */
    public static void removeUser(Long groupId, Long userId) {
        DAO.removeUser(groupId, userId);
    }

    public static Integer getTotalUsers(Long groupId) {
        return DAO.getTotalUsers(groupId);
    }

    public static Integer getTotalRoles(Long groupId) {
        return DAO.getTotalRoles(groupId);
    }
    
    public static List<UserGroup> getUserGroups(List<Long> ids){
        return DAO.getUserGroups(ids);
    }
}
