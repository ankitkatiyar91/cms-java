package com.ankit.portal.web.action.cpanel;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;

import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.UserUtil;
import com.ankit.portal.web.action.PortalAction;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;

public class UserLoginAction extends PortalAction {

	/**
	 * 
	 */
	private static final Logger LOGGER = new Logger(UserLoginAction.class,
			Level.DEBUG);
	private static final long serialVersionUID = 1L;
	private String email;
	private String password;
	private Boolean rememberMe;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(Boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	@Validations(requiredStrings = {
			@RequiredStringValidator(fieldName = "email", key = "texts.email.null", trim = true, type = ValidatorType.SIMPLE),
			@RequiredStringValidator(fieldName = "password", key = "password.null", trim = true, type = ValidatorType.SIMPLE) }, emails = { @EmailValidator(fieldName = "email", key = "email.invalid", type = ValidatorType.SIMPLE) })
	public String login() {
		System.out.println("Email->" + email + " Password->" + password
				+ " Remember Me->" + rememberMe);
		LOGGER.log("Email->" + email + " Password->" + password
				+ " Remember Me->" + rememberMe);
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(email,
				password, rememberMe, getRequest().getRemoteHost());
		try {
			subject.login(token);
			System.out.println("Login successful");
			Session session = subject.getSession();
			User user = UserUtil.getUser((Long) subject.getPrincipal());
			session.setAttribute("user", user);
			WebUtils.getAndClearSavedRequest(getRequest());
			return SUCCESS;
		} catch (IncorrectCredentialsException e) {
			addActionError(getText("login.invalid.user"));
			e.printStackTrace();
			LOGGER.log("In correct credentials", e);
			return INPUT;
		} catch (AuthenticationException e) {
			addActionError(getText("login.invalid.user"));
			e.printStackTrace();
			LOGGER.log("Exception in user login", e);
			return INPUT;
		} catch (Throwable e) {
			addActionError(getText("login.error") + " " + e);
			e.printStackTrace();
			LOGGER.log("Exception in user login", e);
			return INPUT;
		}
	}

}
