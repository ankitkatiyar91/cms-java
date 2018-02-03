/**
 * 
 */
package com.ankit.portal.logger;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import com.ankit.portal.util.PropsUtil;
import com.ankit.portal.util.SubjectUtil;
import com.ankit.portal.util.Util;
import com.ankit.portal.web.listener.PortalContextListener;

/**
 * @author Ankit {@link Logger} class provides convenient way to log your
 *         messages in a log file from a proper path
 */
public class Logger {

	private String loggerName = getClass().toString();
	private Level loggerLevel = Level.DEBUG;
	private DateFormat loggerDateFormat = new SimpleDateFormat();
	private final DateFormat directoryDateFormat = new SimpleDateFormat("dd-MM-yyyy");

	public Logger(String name, Level level) {
		this.loggerName = name;
		this.loggerLevel = level;
	}

	public Logger(String name) {
		this.loggerName = name;
		this.loggerLevel = Level.INFO;
	}

	public Logger() {
	}

	/**
	 * @param class1
	 * @param debug
	 */
	public Logger(Class<?> cls, Level level) {
		this(cls.toString(), level);
	}

	public void setLoggerName(String loggerName) {
		this.loggerName = loggerName;
	}

	public String getLoggerName() {
		return loggerName;
	}

	public void setLoggerLevel(Level loggerLevel) {
		this.loggerLevel = loggerLevel;
	}

	public Level getLoggerLevel() {
		return loggerLevel;
	}

	public void setLoggerDateFormat(DateFormat loggerDateFormat) {
		this.loggerDateFormat = loggerDateFormat;
	}

	public DateFormat getLoggerDateFormat() {
		return loggerDateFormat;
	}

	/**
	 * @author Ankit
	 * @param Log
	 *            your message to proper file. This method may not work if file
	 *            path {@link PathResolver}.path {@link PathResolver}.fileName
	 *            and name are not setted.
	 */
	public void log(final String message) {
		try {
			write(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @author Ankit
	 * @param Log
	 *            your message to proper file. This method may not work if file
	 *            path {@link PathResolver}.path {@link PathResolver}.fileName
	 *            and name are not setted.
	 */
	public void log(final String message, Level level) {
		try {
			write(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void log(final Throwable throwable) {
		try {

			PrintWriter printWriter = new PrintWriter(getLogFile());
			printWriter.print("\n" + Level.ERROR + ": " + getLoggerDateFormat().format(new Date()) + ": " + getLoggerName() + ": ");
			throwable.printStackTrace(printWriter);
			printWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void log(final String message, final Throwable throwable) {
		try {
			write(message, throwable);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return the Log File
	 */
	public java.io.File getLogFile() {
		StringBuffer path;
		if (PropsUtil.get("log.location") == null) {
			path = new StringBuffer(PathResolver.getPath());
		} else {			
			path = new StringBuffer(PropsUtil.get("log.location"));
		}
		path.append(File.separator).append("log");
		logFile = new File(path.toString());
		if (!logFile.exists()) {
			logFile.mkdirs();
		}
		path.append(File.separator).append(directoryDateFormat.format(new Date()) + ".log");
		logFile = new File(path.toString());
		if (!logFile.exists()) {
			try {
				System.out.println("New file created----------" + logFile.getAbsolutePath());
				logFile.createNewFile();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		if (!logFile.canRead() || !logFile.canWrite()) {
			logFile.setExecutable(true);
			logFile.setReadable(true);
		}
		System.out.println("\nUsing old log file----------" + logFile.getAbsolutePath());
		return logFile;
	}

	private void write(String message) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(getLogFile(), true);
			writer.write("\n"+loggerName+" "+loggerLevel+" User-" + SubjectUtil.getCurrentUserId() + " " + new SimpleDateFormat(Util.DATE_TIME_FORMAT).format(new Date()) + "-"
					+ message);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				writer.close();
			} catch (Exception e) {
			}
		}

	}

	private void write(String message, Throwable throwable) {
		FileWriter writer = null;
		try {
			writer = new FileWriter(getLogFile(), true);
			writer.write("\n"+loggerName+" "+Level.ERROR+" User-" + SubjectUtil.getCurrentUserId() + " " + new SimpleDateFormat(Util.DATE_TIME_FORMAT).format(new Date()) + "-"
					+ message);
			throwable.printStackTrace(new PrintWriter(writer));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (writer != null) {
					writer.close();
				}
			} catch (IOException e) {
			}
		}

	}

	private static java.io.File logFile;

}
