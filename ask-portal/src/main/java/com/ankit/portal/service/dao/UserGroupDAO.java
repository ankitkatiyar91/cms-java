package com.ankit.portal.service.dao;

import java.util.List;

import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.domain.UserGroup;

public interface UserGroupDAO {

    UserGroup addUserGroup(UserGroup group);

    UserGroup getUserGroup(Long id);

    Long getUserGroupCount();

    List<UserGroup> getUserGroups(Integer startIndex, Integer maxReocrds);
    
    List<UserGroup> getUserGroups(List<Long> ids);

    void deleteUserGroup(UserGroup group);

    void updateUserGroup(UserGroup group);

    List<User> getUsers(Long groupId,Integer startIndex, Integer maxReocrds);
    
    Integer getTotalUsers(Long groupId);
    
    List<Role> getRoles(Long groupId,Integer startIndex, Integer maxReocrds);
    
    Integer getTotalRoles(Long groupId);
    
    /**
     * add a role to Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link Role} userId
     */
    void addRole(Long groupId, Integer roleId);

    /**
     * Remove a role from Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link Role} userId
     */
    void removeRole(Long groupId, Integer roleId);

    /**
     * Add an user to Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link User} userId
     */
    void addUser(Long groupId, Long userId);

    /**
     * Remove an user from Group
     * 
     * @param {@link UserGroup} groupId
     * @param {@link User} userId
     */
    void removeUser(Long groupId, Long userId);
}