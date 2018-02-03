package com.ankit.portal.service.impl;

import java.util.List;

import org.hibernate.Session;

import com.ankit.portal.hibernate.util.HibernateUtil;
import com.ankit.portal.service.dao.ImageFileDAO;
import com.ankit.portal.service.domain.ImageFile;

public class ImageFileImpl implements ImageFileDAO {

    @Override
    public void addImageFile(ImageFile imageFile) {
        try {
            Session session = HibernateUtil.getSession();
            session.beginTransaction();
            session.save(imageFile);
            session.getTransaction().commit();
        } finally {
            HibernateUtil.closeSession();
        }

    }

    @Override
    public ImageFile updateImageFile(ImageFile imageFile) {
        try {
            Session session = HibernateUtil.getSession();
            session.beginTransaction();
            session.update(imageFile);
            session.getTransaction().commit();
        } finally {
            HibernateUtil.closeSession();
        }
        return imageFile;
    }

    @Override
    public void deleteImageFile(Long id) {
        try {
            Session session = HibernateUtil.getSession();
            session.beginTransaction();
            session.delete(session.get(ImageFile.class, id));
            session.getTransaction().commit();
        } finally {
            HibernateUtil.closeSession();
        }
    }

    @Override
    public ImageFile getImageFile(Long id) {
        ImageFile file;
        try {
            Session session = HibernateUtil.getSession();
            file = (ImageFile) session.get(ImageFile.class, id);
        } finally {
            HibernateUtil.closeSession();
        }
        return file;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<ImageFile> getImageFiles(Integer startIndex, Integer maxRecords) {
        List<ImageFile> files;
        try {
            Session session = HibernateUtil.getSession();
            files = session.getNamedQuery("GetImageFiles")
                    .setMaxResults(maxRecords).setFirstResult(startIndex)
                    .list();
        } finally {
            HibernateUtil.closeSession();
        }
        return files;
    }

    @Override
    public Long getTotalImageFiles() {
        Long total = 0L;
        try {
            Session session = HibernateUtil.getSession();
            total = (Long) session.getNamedQuery("GetTotalImageFiles")
                    .uniqueResult();
        } finally {
            HibernateUtil.closeSession();
        }
        return total;
    }

    @Override
    public ImageFile getLatestImageFile(String uuid) {
        ImageFile file;
        try {
            Session session = HibernateUtil.getSession();
            file = (ImageFile) session.getNamedQuery("GetLatestImageFileByUUID").setString(0, uuid)
                    .uniqueResult();
        } finally {
            HibernateUtil.closeSession();
        }
        return file;
    }

}
