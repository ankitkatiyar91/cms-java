/**
 * This file is generated by Ankit Singh Katiyar
 * Generated On Mar 30, 2014 for the web application of a portal project
 */
package com.ankit.portal.web.action.cpanel;

import org.apache.shiro.authz.annotation.RequiresPermissions;

import com.ankit.portal.logger.Level;
import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.UserUtil;
import com.ankit.portal.util.EncryptUtil;
import com.ankit.portal.util.PropsUtil;
import com.ankit.portal.web.action.PortalAction;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;

/**
 * @author Ankit
 * 
 */
public class UserAction extends PortalAction {

	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = new Logger(UserAction.class, Level.INFO);
	private User user;
	private String confirmpassword;

	@Validations(requiredFields = { @RequiredFieldValidator(fieldName = "user.email", message = "Enter your email", type = ValidatorType.SIMPLE) },
	/*
	 * requiredStrings = {
	 * 
	 * @RequiredStringValidator(fieldName = "user.firstName", key =
	 * "register.firstname.null", type = ValidatorType.SIMPLE, trim = true),
	 * 
	 * @RequiredStringValidator(fieldName = "user.lastname", key =
	 * "register.firstname.null", type = ValidatorType.SIMPLE, trim = true) }
	 */emails = { @EmailValidator(fieldName = "user.email", key = "email.invalid", type = ValidatorType.SIMPLE) })
	@RequiresPermissions(value = { "cpanel:user:add" })
	public String addNew() {
		try {
			System.out.println("UserAction.addNew()");
			System.out.println("Email->" + user.getEmail());
			System.out.println("First Name->" + user.getFirstName());
			System.out.println("Last Name->" + user.getLastName());
			System.out.println("Password->" + user.getPassword());
			System.out.println("Confirm Password->" + confirmpassword);
			System.out.println("Admin->" + user.isAdmin());
			/*
			 * If user password and confirm password doesn't match return wit an
			 * Error
			 */
			if (!user.getPassword().equals(confirmpassword)) {
				addFieldError("user.password", "Password and Confirm Password doesn't match");
				addFieldError("confirmpassword", "");
				return INPUT;
			}
			/*
			 * Check if user already exist
			 */
			try {
				User existingUser = UserUtil.findByEmail(user.getEmail());
				addActionError("User already exist with email " + existingUser.getEmail() + " id #" + existingUser.getId());
				return INPUT;
			} catch (Exception e1) {
			}
			/*
			 * All goes fine add a User
			 */
			if (PropsUtil.isPASSWORD_ENCRYPTED()) {
				user.setPassword(EncryptUtil.encryptPassword(user.getPassword()));
				user.setPasswordEncrypted(true);
			}
			user.setScreenName(user.getEmail().substring(0, user.getEmail().lastIndexOf("@")));
			user = UserUtil.addUser(user);
		} catch (Throwable e) {
			addActionError("Can not add this user " + e.getMessage());
			e.printStackTrace();
			LOGGER.log("Add new User ", e);
			return INPUT;
		}
		addActionMessage("User added successfully email " + user.getEmail() + " id #" + user.getId());
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

}
