package com.key.report.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

public class ExcutePython {
	public static String drawGraph(String bookmark) throws IOException, InterruptedException{
		String s = "--bookmark=" + bookmark;
		String line = "";
		Process process = Runtime.getRuntime().exec("C:/Workspace/PythonProject/report/report/Scripts/python C:/Workspace/PythonProject/report/process.py " + s);
		process.waitFor();
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), Charset.forName("GBK")));
	    line = br.readLine();
		return line;
	}
	
	public static String htmlToPDF(String reportId) throws IOException, InterruptedException{
		String url = "http://localhost:8080/report/files/reportHtml/" + reportId + ".html";
		String filePath = "C:/Users/H/Workspaces/MyEclipse 2017/.metadata/.me_tcat85/webapps/report/files/reportPDF/";
		File file2 = new File(filePath);
		if (!file2.exists() || !file2.isDirectory()) file2.mkdirs();
		String filename = "\"" + filePath + reportId + ".pdf\"";
		String cmd = "C:/Workspace/PythonProject/report/wkhtmltopdf/bin/wkhtmltopdf " + url + " " + filename;
		Process process = Runtime.getRuntime().exec(cmd);
		process.waitFor();
		return reportId + ".pdf";
	}
	
}
