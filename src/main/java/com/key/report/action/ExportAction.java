package com.key.report.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;
import com.key.report.utils.ExcutePython;
import com.opensymphony.xwork2.ActionSupport;


@Namespace("/")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({})
@AllowedMethods({"exportPDF"})
public class ExportAction extends ActionSupport {
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private AccountManager accountManager;

	private String reportId;
	
	public String exportPDF() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		Report report=reportManager.getReport(reportId);
		User user= accountManager.getCurUser();
		if(user!=null && report!=null){
			String fileName = ExcutePython.htmlToPDF(reportId);
			response.sendRedirect(request.getContextPath() + "/files/reportPDF/" + fileName);
		}else{
			Struts2Utils.setReqAttribute("msg", "未登录或没有相应数据权限");
		}
		return null;
	}
	
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

}
