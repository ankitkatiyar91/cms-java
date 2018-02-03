package com.ankit.portal.util;

import org.apache.shiro.SecurityUtils;

public class SubjectUtil {

	public static Long getCurrentUserId() {
		return (Long) SecurityUtils.getSubject().getPrincipal();
	}

	public static void logout() {
		SecurityUtils.getSubject().logout();
	}
}
