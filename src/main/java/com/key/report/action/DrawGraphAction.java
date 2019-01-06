package com.key.report.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.key.common.utils.web.Struts2Utils;
import com.key.report.utils.ExecutePython;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({})
@AllowedMethods({})
public class DrawGraphAction extends ActionSupport {
	private static final Logger LOGGER = LoggerFactory.getLogger(DrawGraphAction.class);
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		PrintWriter out = response.getWriter();
		//String bookmark = "13102_区依附各区单科得分盒式图_01_4";
		String bookmark = request.getParameter("data");
		LOGGER.info(bookmark);
		String line = ExecutePython.drawGraph(bookmark);
		LOGGER.info(line);
	    out.write(line);
    	out.flush();
    	out.close();
		return NONE;
	}

}
