package com.ankit.portal.service.util;

import java.util.List;

import com.ankit.portal.service.dao.ImageFileDAO;
import com.ankit.portal.service.domain.ImageFile;
import com.ankit.portal.service.impl.ImageFileImpl;

public class ImageFileUtil {

    private static ImageFileDAO fileDAO = new ImageFileImpl();

    public static void addImageFile(ImageFile imageFile) {
        fileDAO.addImageFile(imageFile);
    }

    public static ImageFile updateImageFile(ImageFile imageFile) {
        return fileDAO.updateImageFile(imageFile);
    }

    public static void deleteImageFile(Long id) {
        fileDAO.deleteImageFile(id);
    }

    public static ImageFile getImageFile(Long id) {
        return fileDAO.getImageFile(id);
    }

    public static List<ImageFile> getImageFiles(Integer startIndex,
            Integer maxRecords) {
        return fileDAO.getImageFiles(startIndex, maxRecords);
    }

    public static Long getTotalImageFiles() {
        return fileDAO.getTotalImageFiles();
    }

    public static ImageFile getLatestImageFile(String uuid) {
        return fileDAO.getLatestImageFile(uuid);
    }

    public static ImageFile getLatestImageFile(Long id) {
        return fileDAO.getLatestImageFile(getImageFile(id).getUuid());
    }

}
