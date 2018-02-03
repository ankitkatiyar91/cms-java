package com.ankit.portal.web.action.cpanel;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;

import com.ankit.portal.service.domain.ImageFile;
import com.ankit.portal.service.util.ImageFileUtil;
import com.ankit.portal.util.ImageUtil;
import com.ankit.portal.util.UUIDUtil;
import com.ankit.portal.web.action.PortalAction;

public class ImageUploadAction extends PortalAction {

	private static final long serialVersionUID = 1L;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private Long id;

	public String upload() {
		System.out.println("File-" + getUpload() + " \nFile Type-"
				+ getUploadContentType() + "  \nname-" + getUploadFileName());
		try {
			ImageFile imageFile = new ImageFile();
			byte[] bt = IOUtils.toByteArray(new FileInputStream(upload));
			imageFile.setContent(bt);
			imageFile.setFileType(getUploadContentType());
			imageFile.setDescription(getUploadFileName());
			imageFile.setUuid(UUIDUtil.getRandomUuid());
			/*
			 * Create thumbnail
			 */
			imageFile.setThumb(ImageUtil.createThumbnail(getUpload(),getUploadFileName()));
			ImageFileUtil.addImageFile(imageFile);
			/*
			 * Image file added successfully.
			 */
			id = imageFile.getId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
