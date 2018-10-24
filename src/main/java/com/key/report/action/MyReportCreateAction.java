package com.key.report.action;

import java.net.URLDecoder;

import com.key.report.service.ReportManager;

import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.opensymphony.xwork2.ActionSupport;


/**
 * 创建问卷
 *
 *
 */

@Namespace("/design")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
	@Result(name="design",location="/design/my-report-design.action?reportId=${reportId}",type=Struts2Utils.REDIRECT)
})
public class MyReportCreateAction extends ActionSupport{
	@Autowired
	private ReportManager directoryManager;

	private String reportId;

	@Override
	public String execute() throws Exception {
	    return SUCCESS;
	}
	
	public String save() throws Exception {
		String reportName=Struts2Utils.getParameter("reportName");
		Report report = new Report();
	    try{
	    	if(reportName==null || "".equals(reportName.trim())){
	    		reportName="请输入问卷标题";
	    	}else{
	    		reportName=URLDecoder.decode(reportName,"utf-8");
	    	}
	 	    report.setReportName(reportName);
	 	    directoryManager.save(report);
	 	    reportId = report.getId();
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    return "design";
	}
	
	public String getReportId() {
	    return reportId;
	}
	
}
