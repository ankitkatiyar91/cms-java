package com.ankit.portal.web.action.cpanel;

import java.util.List;

import com.ankit.portal.service.domain.ImageFile;
import com.ankit.portal.service.util.ImageFileUtil;
import com.ankit.portal.web.action.PortalAction;

public class ImageListAction extends PortalAction {

	private static final long serialVersionUID = 1L;
	private Integer pageNo;
	private List<ImageFile> imageFiles;
	private Long totalImages;

	public String list() {
		System.out.println("Page--" + pageNo);
		if (pageNo == null) {
			pageNo = 0;
		}
		imageFiles = ImageFileUtil.getImageFiles(pageNo * 10, 10);
		totalImages = ImageFileUtil.getTotalImageFiles();
		System.out.println("totalImages--"+getTotalImages());
		return SUCCESS;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public List<ImageFile> getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(List<ImageFile> imageFiles) {
		this.imageFiles = imageFiles;
	}

	public Long getTotalImages() {
		return totalImages;
	}

	public void setTotalImages(Long totalImages) {
		this.totalImages = totalImages;
	}

}
