package com.ankit.portal.service.dao;

import java.util.List;
import java.util.Set;

import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.domain.UserGroup;

public interface UserDAO {

    User getUser(Long userId);

    User findByEmail(String email);

    Set<Role> getRolesByUserId(Long userId);
    
    List<UserGroup> getGroupByUserId(Long userId);

    User addUser(User user);

    List<User> getUsers();

    Long getTotalUsers();

    List<User> getUsers(Integer startIndex, Integer maxReocrds);

    void updateUser(User user);

    List<User> getUsersLike(User user, Integer startIndex, Integer maxReocrds);

    Long getTotalUsersLike(User user);
    
    List<User> searchUser(String queryString,Integer startIndex, Integer maxReocrds);
    
    Integer searchUserCount(String queryString);
    
}
