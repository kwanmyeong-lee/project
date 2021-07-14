package com.it.lylj.common;

import javax.servlet.http.HttpServletRequest;

public class Utility {

	public static String getFileInfo(String fileName, long fileSize, HttpServletRequest request) {
		String result = "";
		if (fileName != null && !fileName.isEmpty()) {
			double dFileSize = fileSize / 1000.0;
			dFileSize = Math.round(dFileSize * 10) / 10;
			result = "<img src='" + request.getContextPath() + "/resources/images/file.gif'> ";
			result += fileName + " (" + dFileSize + " KB)";
		}

		return result;
	}
}
