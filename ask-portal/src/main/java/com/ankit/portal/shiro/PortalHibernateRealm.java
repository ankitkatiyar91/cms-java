/**
 * 
 */
package com.ankit.portal.shiro;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import com.ankit.portal.logger.Logger;
import com.ankit.portal.service.domain.Permission;
import com.ankit.portal.service.domain.Role;
import com.ankit.portal.service.domain.User;
import com.ankit.portal.service.util.PermissionUtil;
import com.ankit.portal.service.util.RoleUtil;
import com.ankit.portal.service.util.UserUtil;
import com.ankit.portal.util.EncryptUtil;

/**
 * @author Ankit
 * 
 */
public class PortalHibernateRealm extends AuthorizingRealm {

	private static final Logger LOGGER = new Logger(
			PortalHibernateRealm.class.toString());

	/**
	 * 
	 */
	public PortalHibernateRealm() {
		super();
		/*
		 * Set credential macher on object creation
		 */
		setCredentialsMatcher(new CredentialsMatcher() {

			@Override
			public boolean doCredentialsMatch(AuthenticationToken arg0,
					AuthenticationInfo arg1) {
				UsernamePasswordToken token = (UsernamePasswordToken) arg0;
				String username = token.getUsername();
				String password = new String(token.getPassword());
				System.out.println("Credential Matcher looking for Username->"
						+ username + " Password->" + password);
				LOGGER.log("Credential Matcher looking for Username->"
						+ username + " Password->" + password);
				User user = null;
				try {
					user = UserUtil.findByEmail(username);
				} catch (Throwable e) {
					e.printStackTrace();
					LOGGER.log("Problem in fetching user by mail ", e);
				}
				if (user != null) {
					System.out.println("Password match ->"
							+ EncryptUtil.encryptPassword(password)
							+ " db->"
							+ user.getPassword()
							+ " match->"
							+ (EncryptUtil.encryptPassword(password)
									.equals(user.getPassword())));
					LOGGER.log("Password match ->"
							+ password
							+ " db->"
							+ user.getPassword());
					if (user.isPasswordEncrypted()) {
						password = EncryptUtil.encryptPassword(password);
						LOGGER.log("Comparing two encrypted password as defined given->"+ password + "  In db->" + user.getPassword()+"  Match-->"+(user.getPassword().equals(password)));
					}
					if (user.getPassword().equals(password)) {
						LOGGER.log("User logged in with email "+ user.getEmail() + " Host- " + token.getHost());
						try {
							user.setFailedLoginAttempts(0);
							user.setLoginDate(new Date());
							user.setLoginIP(token.getHost());
							UserUtil.updateUser(user);
						} catch (Exception e) {
							e.printStackTrace();
							LOGGER.log("Update failed for user entity ",e);
						}
						System.out.println("Returning true-->");
						return true;
					} else {
						user.setFailedLoginAttempts(user.getFailedLoginAttempts() + 1);
						user.setLastFailedLoginDate(new Date());
						UserUtil.updateUser(user);
						return false;
					}
				} else {
					LOGGER.log("No User exist for email-" + username);
				}
				return false;
			}
		});
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache
	 * * .shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principalCollection) {
		Collection<String> permissionSet;
		SimpleAuthorizationInfo info = null;
		Long userId = (Long) principalCollection.getPrimaryPrincipal();
		User user = UserUtil.getUser(userId);
		LOGGER.log("User details->" + user);
		System.out.println("User details->" + user);
		if (user != null) {
			info = new SimpleAuthorizationInfo();
			/*
			 * If user is Admin allow all the access
			 */
			if (user.isAdmin()) {
				System.out.println("User is admin so have all the rights");
				LOGGER.log("User is admin so have all the rights");
				for (Role role : RoleUtil.getRoles()) {
					info.addRole(role.getName());
				}
				permissionSet = new HashSet<String>();
				for (Permission permission : PermissionUtil.getPermissions()) {
					permissionSet.add(permission.getName());
				}
				LOGGER.log("\nAdding permission->" + permissionSet + "\n");
				info.addStringPermissions(permissionSet);
			} else {
				/*
				 * If user is not admin give limited access
				 */
				for (Role role : UserUtil.getRolesByUserId(user.getId())) {
					info.addRole(role.getName());
					permissionSet = new HashSet<String>();
					for (Permission permission : role.getPermissions()) {
						permissionSet.add(permission.getName());
					}
					info.addStringPermissions(permissionSet);
				}
			}
		}
		return info;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org
	 * .apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		User user = UserUtil.findByEmail(token.getUsername());
		System.out.println("Found user->" + token.getUsername() + " Password"
				+ token.getPassword().toString() + " Token->" + token);
		LOGGER.log("Found user->" + token.getUsername() + " Password"
				+ token.getPassword().toString() + " Token->" + token);
		System.out.println("Service got user " + user.getEmail() + "");
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
				user.getId(), user.getPassword(), getName());
		System.out.println("\nPrimary Principal"
				+ authenticationInfo.getPrincipals().getPrimaryPrincipal());
		LOGGER.log("\nPrimary Principal"
				+ authenticationInfo.getPrincipals().getPrimaryPrincipal());
		return authenticationInfo;
	}

}
