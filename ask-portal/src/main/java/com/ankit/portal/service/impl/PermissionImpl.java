/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On Mar 21, 2014 for the hibernate services of a portal project
 */
package com.ankit.portal.service.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.dao.PermissionDAO;
import com.ankit.portal.service.domain.Permission;

public class PermissionImpl implements PermissionDAO {

    @SuppressWarnings("unchecked")
    @Override
    public List<Permission> getPermissions() {
        try {
            Session session = HibernateUtil.getSession();
            Query query = session.createQuery("from Permission");
            query.setCacheable(true);
            List<Permission> permissions = query.list();
            return permissions;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Permission> getPermissions(Integer... ids) {
        try {
            Session session = HibernateUtil.getSession();
            Query query = session.getNamedQuery("GetPermissionsByIds");
            query.setCacheable(true);
            query.setParameterList("ids", ids);
            query.setCacheable(true);
            List<Permission> permissions = query.list();
            return permissions;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Permission> getPermissions(List<Integer> ids) {
        try {
            Session session = HibernateUtil.getSession();
            Query query = session.getNamedQuery("GetPermissionsByIds");
            query.setCacheable(true);
            query.setParameterList("ids", ids);
            query.setCacheable(true);
            List<Permission> permissions = query.list();
            return permissions;
        } finally {
            HibernateUtil.closeSession();
        }
    }

}
