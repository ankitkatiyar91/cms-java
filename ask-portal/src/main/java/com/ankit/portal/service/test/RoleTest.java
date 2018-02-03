package com.ankit.portal.service.test;

import java.util.HashSet;
import java.util.Set;

import com.ankit.portal.service.domain.Permission;
import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.util.PermissionUtil;
import com.ankit.portal.service.util.RoleUtil;
import com.ankit.portal.service.util.UserUtil;

public class RoleTest {

    public static void main(String[] args) {
        /*
         * Role role = new Role(); Set<Permission> permissions = new
         * HashSet<Permission>(); role.setName("Test1");
         * 
         * permissions.addAll(PermissionUtil.getPermissions());
         * role.setPermissions(permissions);
         * role.setCreatedBy(UserUtil.getUser(2L)); RoleUtil.addRole(role);
         * 
         * role = new Role(); role.setName("Test2");
         * 
         * permissions.addAll(PermissionUtil.getPermissions());
         * role.setPermissions(permissions);
         * role.setCreatedBy(UserUtil.getUser(2L)); RoleUtil.addRole(role);
         * 
         * for (Role r : RoleUtil.getRoles()) {
         * System.out.println(r.getPermissions()); }
         * System.out.println("Total role->" + RoleUtil.getRoles(0, 0).size());
         */

        /*
         * try { Role role=RoleUtil.getRole(4); role.setName("test3");
         * RoleUtil.updateRole(role, 1L); } catch (PermissionLacks e) { // TODO
         * Auto-generated catch block e.printStackTrace(); }
         * 
         * try { RoleUtil.deleteRole(11,1L); } catch (NoSuchElementException e)
         * { // TODO Auto-generated catch block e.printStackTrace(); } catch
         * (PermissionLacks e) { // TODO Auto-generated catch block
         * e.printStackTrace(); } catch (Exception e) { // TODO Auto-generated
         * catch block e.printStackTrace(); }
         */
        /*
         * Role role2=new Role(); role2.setCreatedBy(UserUtil.getUser(1L));
         * role2.setModifiable(true); role2.setName("Test");
         * RoleUtil.addRole(role2);
         */
        Integer roleId = RoleUtil.addRole("Test", 1L, true);
        System.out.println("Role added with id->" + roleId);

    }
}
