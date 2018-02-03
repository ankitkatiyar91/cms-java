/**
 * 
 */
package com.ankit.portal.util;

import java.util.UUID;

/**
 * Generate a new UUID
 * @author Ankit
 *
 */
public class UUIDUtil {
	
	public static String getRandomUuid(){
		return UUID.randomUUID().toString();
	}

}
