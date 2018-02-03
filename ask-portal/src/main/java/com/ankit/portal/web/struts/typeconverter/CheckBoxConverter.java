package com.ankit.portal.web.struts.typeconverter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class CheckBoxConverter extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {
		for (String string : arg1) {
			return string.equals("on")?true:false;
		}
		return null;
	}

	@Override
	public String convertToString(Map context, Object o) {
		System.out.println(o);
		return null;
	}

}
