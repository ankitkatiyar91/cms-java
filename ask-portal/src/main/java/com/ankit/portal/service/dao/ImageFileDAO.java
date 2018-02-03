package com.ankit.portal.service.dao;

import java.util.List;

import com.ankit.portal.service.domain.ImageFile;

public interface ImageFileDAO {

    void addImageFile(ImageFile imageFile);

    ImageFile updateImageFile(ImageFile imageFile);

    void deleteImageFile(Long id);

    ImageFile getImageFile(Long id);

    List<ImageFile> getImageFiles(Integer startIndex, Integer maxRecords);

    Long getTotalImageFiles();

    ImageFile getLatestImageFile(String uuid);
}
