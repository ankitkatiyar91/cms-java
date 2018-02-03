package com.ankit.portal.service.dao;

import java.util.List;

import com.ankit.portal.service.domain.Permission;

public interface PermissionDAO {

    List<Permission> getPermissions();
    
    List<Permission> getPermissions(Integer... ids);
    
    List<Permission> getPermissions(List<Integer> ids);
}
