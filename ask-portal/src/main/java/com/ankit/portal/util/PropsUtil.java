/**
 * 
 */
package com.ankit.portal.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Properties;



/**
 * @author Ankit
 *
 */
public class PropsUtil {

	private static Properties properties;
	private static boolean PASSWORD_ENCRYPTED=false;
	
	static{
		reloadProperties();
	}
	
	public static void reloadProperties(){
		try {
			properties=new Properties();
				System.out.println("%%%%%%%%%%%%%%%%%%%%%loading---"+PropsUtil.class.getClass().getClassLoader().getResource("portal.properties").getFile());
			properties.load(new FileInputStream("portal.properties"));
			PASSWORD_ENCRYPTED=Boolean.parseBoolean(properties.getProperty("password.isencrypted"));
		} catch (FileNotFoundException e) {
	
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public static boolean getBoolean(String key){
		return Boolean.parseBoolean(properties.getProperty(key));
	}
	public static String get(String key){
		return properties.getProperty(key);
	}

	public static boolean isPASSWORD_ENCRYPTED() {
		return PASSWORD_ENCRYPTED;
	}
}
