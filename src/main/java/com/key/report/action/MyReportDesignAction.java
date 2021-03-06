package com.key.report.action;

import java.io.BufferedReader;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import com.key.report.utils.DataProcesser;
import com.key.report.utils.ExecutePython;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.JspToHtml;
import com.key.common.utils.Property;
import com.key.common.utils.web.Struts2Utils;
import com.key.common.plugs.page.Page;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * 设计问卷
 *
 *
 */

@Namespace("/design")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
	@Result(name=ActionSupport.SUCCESS,location="/Design.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name=MyReportDesignAction.PREVIEWDEV,location="/preview.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name=MyReportDesignAction.COLLECTSURVEY,location="my-collect.action?reportId=${reportId}",type=Struts2Utils.REDIRECT),
	@Result(name=MyReportDesignAction.RELOADDESIGN,location="/design/my-report-design.action?reportId=${reportId}",type=Struts2Utils.REDIRECT),
	@Result(name=MyReportDesignAction.REVIEWREPORT,location="/design/my-report.action",type=Struts2Utils.REDIRECT),
})
@AllowedMethods({"previewDev","devReport","ajaxSave","copyReport","reviewReport", "listReport", "importReport"})
public class MyReportDesignAction extends ActionSupport{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MyReportDesignAction.class);
	//发布设置
	protected final static String PREVIEWDEV="previewDev";
	protected final static String COLLECTSURVEY="collectReport";
	protected final static String RELOADDESIGN="reloadDesign";
	protected final static String REVIEWREPORT="reviewReport";
	
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private AccountManager accountManager;

	private String reportId;
	
	@Override
	public String execute() throws Exception {
		buildReport();
		return SUCCESS;
	}
	
	public String previewDev() throws Exception {
		buildReport();
		return PREVIEWDEV;
	}
	
	public String devReport() throws Exception {
		Report report=reportManager.get(reportId);
		Date createDate=report.getCreateDate();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd/");
		try{
			String url="/report!answerReport.action?reportId="+reportId;
			String filePath="WEB-INF/wjHtml/"+dateFormat.format(createDate);
			String fileName=reportId+".html";
			new JspToHtml().postJspToHtml(url, filePath, fileName);
			report.setHtmlPath(filePath+fileName);

			url="/report!answerSurveryMobile.action?reportId="+reportId;
			filePath="WEB-INF/wjHtml/"+dateFormat.format(createDate);
			fileName="m_"+reportId+".html";
			new JspToHtml().postJspToHtml(url, filePath, fileName);

			report.setReportState(1);
			reportManager.save(report);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return COLLECTSURVEY;
	}
	
	private void buildReport() {
		//判断是否拥有权限
		User user= accountManager.getCurUser();
		if(user!=null){
			String userId=user.getId();
			Report Report = null;
			if(user.getRoleType() == 2) Report=reportManager.getReportByUser(reportId, userId);
			else Report=reportManager.getReport(reportId);
			if(Report!=null){
				reportManager.save(Report);
				String data = DataProcesser.readData(reportId);
				Struts2Utils.setReqAttribute("data", data);
				Struts2Utils.setReqAttribute("report", Report);
				Struts2Utils.setReqAttribute("prevHost", Property.STORAGE_URL_PREFIX);
			}else{
				Struts2Utils.setReqAttribute("msg", "未登录或没有相应数据权限");
			}
		}else{
			Struts2Utils.setReqAttribute("msg", "未登录或没有相应数据权限");
		}
	}

	public String ajaxSave() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		String svyName=request.getParameter("svyName");
		
		Report report=reportManager.getReport(reportId);
		User user= accountManager.getCurUser();
		if(user!=null && report!=null){
			String userId=user.getId();
			if(userId.equals(report.getUserId())){
				if(svyName!=null && !"".equals(svyName)){
					svyName=URLDecoder.decode(svyName,"utf-8");
					report.setReportName(svyName);
				}
				reportManager.save(report);

				response.getWriter().write("true");
				
			}
		}
		
		return NONE;
	}
	
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public String copyReport() throws Exception {
		//引用问卷
//		id="402880e541d051000141d0f708ff0004";
		HttpServletRequest request=Struts2Utils.getRequest();
		String fromBankId=request.getParameter("fromBankId");
		String reportName=request.getParameter("reportName");
		reportName=URLDecoder.decode(reportName,"utf-8");
		String tag=request.getParameter("tag");
		tag="2";
		Report directory=reportManager.createByReport(fromBankId,reportName,tag);
		reportId=directory.getId();
		return RELOADDESIGN;
	}
	
	public String reviewReport() {
		HttpServletRequest request=Struts2Utils.getRequest();
		String data = request.getParameter("data");
		DataProcesser.saveData(data, reportId);
		return REVIEWREPORT;
	}
	
	
	public String listReport() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		PrintWriter out = response.getWriter();
		User user= accountManager.getCurUser();
		if(user != null){
			Page<Report> page = new Page();
			Report report = new Report();
			page=reportManager.findByUser(page, report);
			JSONArray jsonArray = new JSONArray();
			for(Report r : page) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("id", r.getId());
				jsonObject.put("name", r.getReportName());
				jsonArray.add(jsonObject);
			}
			System.out.println(jsonArray.size());
			LOGGER.info(jsonArray.toString());
			out.write(jsonArray.toString());
		} else {
			out.write("未登录或没有相应数据权限");
		}
    	out.flush();
    	out.close();
		return NONE;
	}
	
	public String importReport() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		if(id != null){
			String data = DataProcesser.readData(id);
			LOGGER.info(data);
			out.write(data);
		} else {
			out.write("未选择报告");
		}
    	out.flush();
    	out.close();
		return NONE;
	}
	
}
