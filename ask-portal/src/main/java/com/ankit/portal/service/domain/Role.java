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
import org.hibernate.annotations.SelectBeforeUpdate;

/**
 * Role is a group of permissions.<br>
 * It represents a meaningful name to define access
 * 
 * @author Ankit
 * 
 */
@NamedQueries(value = { @NamedQuery(name = "LoadPermissions", query = "select permissions from Role  r where r.roleId=?") })
@Entity(name = "Role")
@Table(name = "role")
@Cacheable(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SelectBeforeUpdate
public class Role implements Serializable {

    /**
	 * 
	 */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "role_id")
    private Integer roleId;

    @Column(unique = true)
    private String name;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "role_permissions", joinColumns = @JoinColumn(name = "role_id"), inverseJoinColumns = @JoinColumn(name = "permission_id"))
    private Set<Permission> permissions = new HashSet<Permission>();

    /**
     * Only Role creator or Admin can mark role modifiable or unmodifiable
     */
    @Column(nullable = false)
    private Boolean modifiable = true;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(updatable = false, nullable = false)
    private User createdBy;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(Set<Permission> permissions) {
        this.permissions = permissions;
    }

    public Boolean getModifiable() {
        return modifiable;
    }

    public void setModifiable(Boolean modifiable) {
        this.modifiable = modifiable;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    /*
     * (non-Javadoc)
     * 
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        return roleId;
    }

    @Override
    public String toString() {
        return "Role [roleId=" + roleId + ", name=" + name + ", permissions="
                + permissions + ", modifiable=" + modifiable + ", createdBy="
                + createdBy + "]";
    }

}
