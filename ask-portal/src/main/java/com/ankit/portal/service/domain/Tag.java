/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On Mar 22, 2014 for the hibernate services of a portal project
 */
package com.ankit.portal.service.domain;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * {@link Tag} are used for search and provide references of same kind.<br>
 * {@link Article} have same {@link Tag} will have somthing related to each other<br>
 * <b>meta data can be generated by these tags to improve SEO</b>
 * @author Ankit
 *
 */
@Entity(name="Tag")
@Table(name="tag")
@Cacheable(value=true)
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Tag implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="tag_id")
    private Long id;
    
    @Column(nullable=false,unique=true)
    private String name;

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
    
}