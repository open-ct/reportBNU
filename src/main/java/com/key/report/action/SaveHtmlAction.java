package com.key.report.action;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.Property;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONObject;


@Namespace("/design")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
	@Result(name=ActionSupport.SUCCESS,location="/preview.jsp",type=Struts2Utils.DISPATCHER)
})
@AllowedMethods({})
public class SaveHtmlAction extends ActionSupport {
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private AccountManager accountManager;

	private String reportId;
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		Report report=reportManager.getReport(reportId);
		User user= accountManager.getCurUser();
		if(user!=null && report!=null){
			String userId=user.getId();
			if(user.getRoleType() != 2 || userId.equals(report.getUserId())){
				System.out.println("OK");
				report.setVisibility(1);
				reportManager.save(report);
			}else{
				Struts2Utils.setReqAttribute("msg", "未登录或没有相应数据权限");
			}
		}else{
			Struts2Utils.setReqAttribute("msg", "未登录或没有相应数据权限");
		}
		String data = request.getParameter("data");
		Struts2Utils.setReqAttribute("data", data);
		Struts2Utils.setReqAttribute("report", report);
		Struts2Utils.setReqAttribute("prevHost", Property.STORAGE_URL_PREFIX);
		reportManager.saveData(data, reportId);
		return SUCCESS;
	}
	
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

}
