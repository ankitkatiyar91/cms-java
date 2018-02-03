package com.ankit.portal.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.UserUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * A Support class for the actions.<br>
 * Every action should extend this Action
 * 
 * @author Ankit
 * 
 */
public class PortalAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {

	/**
	 * @author Ankit
	 *
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response; 
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.struts2.interceptor.ServletResponseAware#setServletResponse
	 * (javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.struts2.interceptor.ServletRequestAware#setServletRequest(
	 * javax.servlet.http.HttpServletRequest)
	 */
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}

	/**
	 * @return {@link HttpServletRequest}
	 */
	public HttpServletRequest getRequest() {
		return request;
	}
	/**
	 * @return {@link HttpServletResponse}
	 */
	public HttpServletResponse getResponse() {
		return response;
	}

	public Long getCurrentSubjectId() {
		Subject subject = SecurityUtils.getSubject();
		return (Long) subject.getPrincipal();
	}

	public User getCurrentUser() {
		Subject subject = SecurityUtils.getSubject();
		return UserUtil.getUser((Long) subject.getPrincipal());
	}

}
