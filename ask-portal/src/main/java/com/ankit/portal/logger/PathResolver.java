/**
 * 
 */
package com.ankit.portal.logger;

/**
 * @author Ankit
 *This class contains fields for path to generate logs
 */
public class PathResolver {
	
	private static String path="",fileName="log.out";

	public static String getPath() {
		return path;
	}
	public static void setPath(String realPath) {
		PathResolver.path = realPath;
	}
	public static void setFileName(String fileName) {
		PathResolver.fileName = fileName;
	}
	public static String getFileName() {
		return fileName;
	}
}
