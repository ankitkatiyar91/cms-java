package com.ankit.portal.web.action;

import com.ankit.portal.service.domain.ImageFile;
import com.ankit.portal.service.util.ImageFileUtil;

public class ImageAction extends PortalAction {

	private static final long serialVersionUID = 1L;
	private Long id;
	private byte[] content;
	private String conetentType;

	public String content() {
		ImageFile file = ImageFileUtil.getImageFile(id);
		setConetentType(file.getFileType());
		content = file.getContent();
		return SUCCESS;
	}

	public String thumb() {
		System.out.println("ImageAction.content()---" + getId());
		ImageFile file = ImageFileUtil.getImageFile(id);
		setConetentType(file.getFileType());
		content = file.getThumb();
		return SUCCESS;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public String getConetentType() {
		return conetentType;
	}

	public void setConetentType(String conetentType) {
		this.conetentType = conetentType;
	}

}
