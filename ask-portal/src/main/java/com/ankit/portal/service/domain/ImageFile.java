package com.ankit.portal.service.domain;

import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OrderBy;
import javax.persistence.QueryHint;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OptimisticLockType;
import org.hibernate.annotations.OptimisticLocking;
import org.hibernate.annotations.Source;
import org.hibernate.annotations.SourceType;
import org.hibernate.annotations.UpdateTimestamp;

/**
 * @author Ankit
 * 
 */
@Entity(name = "ImageFile")
@Table(name = "imagefile")
@OptimisticLocking(type = OptimisticLockType.VERSION)
@NamedQueries(value = {
        @NamedQuery(name = "GetImageFiles", query = "from ImageFile order by id desc,lastUpdated desc", hints = @QueryHint(value = "true", name = "cacheable")),
        @NamedQuery(name = "GetTotalImageFiles", query = "select count(*) from ImageFile"),
        @NamedQuery(name = "GetLatestImageFileByUUID", query = "from ImageFile where uuid=? order by lastUpdated desc", hints = @QueryHint(value = "true", name = "cacheable")) })
@Cacheable(value=false)
public class ImageFile {

    @Id
    @Column(name = "image_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "uuid_")
    private String uuid;

    @Column(nullable = false)
    @Lob
    private byte[] content;

    @Lob
    private byte[] thumb;

    private String description;

    @Column(nullable = false)
    private String fileType;

    @Version
    private Long version;

    @Temporal(TemporalType.TIMESTAMP)
    @Source(SourceType.VM)
    @UpdateTimestamp
    @OrderBy(value = "desc")
    private Date lastUpdated = new Date();

    @ManyToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(updatable = false)
    private User createdBy;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(nullable = false, updatable = false)
    @Source(SourceType.VM)
    @CreationTimestamp
    private Date createdOn = new Date();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public byte[] getThumb() {
        return thumb;
    }

    public void setThumb(byte[] thumb) {
        this.thumb = thumb;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
