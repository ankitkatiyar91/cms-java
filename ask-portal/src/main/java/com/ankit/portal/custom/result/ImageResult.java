package com.ankit.portal.custom.result;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ankit.portal.web.action.ImageAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;

public class ImageResult implements Result {

	private static final long serialVersionUID = 1L;

	@Override
	public void execute(ActionInvocation arg0) throws Exception {
		ImageAction imageAction = (ImageAction) arg0.getAction();
		HttpServletResponse response = ServletActionContext.getResponse();

		response.setContentType(imageAction.getConetentType());
		response.getOutputStream().write(imageAction.getContent());
		response.getOutputStream().flush();
	}

}
