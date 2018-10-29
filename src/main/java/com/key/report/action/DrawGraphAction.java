package com.key.report.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.key.common.utils.web.Struts2Utils;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({})
@AllowedMethods({})
public class DrawGraphAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		PrintWriter out = response.getWriter();
		//String bookmark = "13102_区依附各区单科得分盒式图_01_4";
		String bookmark = request.getParameter("data");
		String s = "--bookmark=" + bookmark;
		Process process = Runtime.getRuntime().exec("C:/Workspace/PythonProject/report/report/Scripts/python C:/Workspace/PythonProject/report/process.py " + s);
		try {
			process.waitFor();
			BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream(), Charset.forName("GBK")));
	        String line = br.readLine();
	        if(line != null){
	        	out.write(line);
	        	out.flush();
	        	out.close();
	            System.out.println(line);
	        }
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("return");
		return NONE;
	}

}
