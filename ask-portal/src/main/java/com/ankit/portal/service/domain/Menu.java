/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On Mar 1, 2014 for the hibernate services of a portal project
 */
package com.ankit.portal.service.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.Source;
import org.hibernate.annotations.SourceType;

import com.ankit.portal.support.StatusType;

/**
 * {@link Menu} represent a menu item in top of the site
 * 
 * @author Ankit
 * 
 */
@Entity(name = "Menu")
@Table(name = "menu")
@NamedQueries(value = {
        @NamedQuery(name = "GetCount", query = "select count(*) from Menu"),
        @NamedQuery(name = "GetByLabel", query = "from Menu m where m.label=?"),
        @NamedQuery(name = "Get", query = "from Menu"),
        @NamedQuery(name = "GetOrderedBySequenceNo", query = "from Menu m order by m.sequenceNo"),
        @NamedQuery(name = "UpdateSequenceNoAfter", query = "update Menu m set m.sequenceNo=m.sequenceNo+? where m.sequenceNo>=?"),
        @NamedQuery(name = "UpdateSequenceNoBefore", query = "update Menu m set m.sequenceNo=m.sequenceNo+? where m.sequenceNo<=?"),
        @NamedQuery(name = "GetMaxSequenceNo", query = "select max(m.sequenceNo) from Menu m"),
        //@NamedQuery(name = "GetDisplayableMenu", query = "from Menu m where m.status='PUBLISHED' and (m.content!=null or size(m.categories)>0) order by m.sequenceNo") 
        @NamedQuery(name = "GetDisplayableMenu", query = "from Menu m where m.status='PUBLISHED' order by m.sequenceNo")
        })
@Cacheable(value = true)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(length = 2, name = "menu_id")
    private Integer menuId;

    @Column(nullable = false, unique = true)
    private String label;

    @Column(nullable = false)
    private Integer sequenceNo;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    private Date created = new Date();

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false)
    @Source(SourceType.VM)
    private Date lastUpdated = new Date();

    @Enumerated(value = EnumType.STRING)
    @Column(nullable = false)
    private StatusType status;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "menu", targetEntity = Category.class, cascade = CascadeType.ALL)
    @Cache(usage = CacheConcurrencyStrategy.TRANSACTIONAL)
    private Set<Category> categories = new TreeSet<Category>();

    @OneToOne(optional = true, targetEntity = Article.class)
    @JoinColumn(name = "article_id")
    @Formula("(1)")
    private Article content;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "menu_roles", joinColumns = @JoinColumn(name = "menu_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    @Cache(usage = CacheConcurrencyStrategy.TRANSACTIONAL)
    private Set<Role> roles = new HashSet<Role>();

    public Integer getId() {
        return menuId;
    }

    public void setId(Integer id) {
        this.menuId = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getSequenceNo() {
        return sequenceNo;
    }

    public void setSequenceNo(Integer sequenceNo) {
        this.sequenceNo = sequenceNo;
    }

    public Date getCreated() {
        return created;
    }

    @PrePersist
    private void setCreated(Date created) {
        this.created = new Date();
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    @PreUpdate
    private void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = new Date();
    }

    public StatusType getStatus() {
        return status;
    }

    public Set<Category> getCategories() {
        return categories;
    }

    public void setCategories(Set<Category> categories) {
        this.categories = categories;
    }

    public Article getContent() {
        return content;
    }

    public void setContent(Article content) {
        this.content = content;
    }

    /**
     * It receives a type of {@link StatusType}
     * 
     * @param {@link StatusType}
     * 
     */
    public void setStatus(StatusType status) {
        this.status = status;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "Menu [menuId=" + menuId + ", label=" + label + ", sequenceNo="
                + sequenceNo + ", created=" + created + ", lastUpdated="
                + lastUpdated + ", staus=" + status + "]";
    }

}
