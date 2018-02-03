package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.exception.PermissionLacks;
import com.ankit.portal.service.dao.RoleDAO;
import com.ankit.portal.service.domain.Permission;
import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.impl.RoleImpl;

public class RoleUtil {

    private static final RoleDAO ROLE_DAO = new RoleImpl();

    /**
     * This will return all the Roles
     * 
     * @return {@link List}<{@link Role}>
     */
    public static List<Role> getRoles() {
        return ROLE_DAO.getRoles();
    }

    /**
     * Get a {@link Role} object by it;s id
     * 
     * @param roleId
     * @return {@link Role}
     */
    public static Role getRole(Integer roleId) {
        return ROLE_DAO.getRole(roleId);
    }

    /**
     * Add a new {@link Role}
     * 
     * @param role
     * @return the generated identifier
     */
    public static Integer addRole(Role role) {
        return ROLE_DAO.addRole(role);
    }

    /**
     * Get count of all the {@link Role} available in DB
     * 
     * @return
     */
    public static Long getRoleCount() {
        return ROLE_DAO.getRoleCount();
    }

    public static List<Role> getRoles(Integer firstResult, Integer maxResults) {
        return ROLE_DAO.getRoles(firstResult, maxResults);
    }

    public static Integer addRole(String roleName, Long createdBy,
            Boolean modifiable) {
        return ROLE_DAO.addRole(roleName, createdBy, modifiable);
    }

    public static void updateRole(Role role, Long updatingUserId)
            throws PermissionLacks {
        ROLE_DAO.updateRole(role, updatingUserId);
    }

    public static void deleteRole(Integer roleId, Long userId)
            throws Exception, PermissionLacks {
        ROLE_DAO.deleteRole(roleId, userId);
    }

    public static List<Role> getRoles(Integer... roleIds) {
        return ROLE_DAO.getRoles(roleIds);
    }

    public static List<Permission> loadPermissions(Integer roleId) {
        return ROLE_DAO.loadPermissions(roleId);
    }
}
