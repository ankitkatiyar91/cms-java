/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On Mar 2, 2014 for the hibernate services of a portal project
 */
package com.ankit.portal.service.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * This class Represent a group of users
 * 
 * @author Ankit
 * 
 */

@Entity(name = "UserGroup")
@Table(name = "usergroup")
@Cacheable(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@NamedQueries(value = {
        @NamedQuery(name = "GetUserGroups", query = "from UserGroup"),
        @NamedQuery(name = "GetUserGroupsByIds", query = "from UserGroup where id in(:ids)"),
        @NamedQuery(name = "GetUserGroupCount", query = "select count(*) from UserGroup"),
        @NamedQuery(name = "GetUsersByUserGroupId", query = "select users from UserGroup u where u.id=? "),
        @NamedQuery(name = "GetRolesByUserGroupId", query = "select roles from UserGroup u where u.id=? "),
        @NamedQuery(name = "GetUserCountInGroupById", query = "select size(g.users) from UserGroup g where g.id=?"),
        @NamedQuery(name = "GetRoleCountInGroupById", query = "select size(g.roles) from UserGroup g where g.id=?") })
public class UserGroup implements Serializable {

    private static final long serialVersionUID = 1490155841032345090L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "group_id")
    private Long id;

    @Column(unique = true, nullable = false)
    private String name;

    @Column(length = 500, nullable = true)
    private String comments;

    @ManyToOne
    @JoinColumn(updatable = false, nullable = false)
    private User createdBy;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_group", joinColumns = @JoinColumn(name = "group_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    private Set<User> users = new HashSet<User>();

    @ManyToMany(fetch = FetchType.LAZY)
    private Set<Role> roles = new HashSet<Role>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        UserGroup other = (UserGroup) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
