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
import com.key.common.utils.JspToHtml;
import com.key.common.utils.Property;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;
import com.opensymphony.xwork2.ActionSupport;


/**
 * 设计问卷
 *
 *
 */

@Namespace("/design")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
	@Result(name=ActionSupport.SUCCESS,location="/MyHtml.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name=MyReportDesignAction.PREVIEWDEV,location="/preview.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name=MyReportDesignAction.COLLECTSURVEY,location="my-collect.action?reportId=${reportId}",type=Struts2Utils.REDIRECT),
	@Result(name=MyReportDesignAction.RELOADDESIGN,location="/design/my-report-design.action?reportId=${reportId}",type=Struts2Utils.REDIRECT)
})
@AllowedMethods({"previewDev","devReport","ajaxSave","copyReport"})
public class MyReportDesignAction extends ActionSupport{
	//发布设置
	protected final static String PREVIEWDEV="previewDev";
	protected final static String COLLECTSURVEY="collectReport";
	protected final static String RELOADDESIGN="reloadDesign";
	
	@Autowired
	private ReportManager ReportManager;
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
		Report report=ReportManager.get(reportId);
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
			ReportManager.save(report);
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
			if(user.getRoleType() == 2) Report=ReportManager.getReportByUser(reportId, userId);
			else Report=ReportManager.getReport(reportId);
			if(Report!=null){
				ReportManager.save(Report);
				String data = null;
				try {
					data = readData(reportId);
				} catch (IOException e) {
					e.printStackTrace();
				}
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
	
	private String readData(String reportId) throws IOException {
		String filePath = "files/reportHtml/";
		filePath = filePath.replace("/", File.separator);
		filePath = filePath.replace("\\", File.separator);
		String fileName = reportId + ".data";
		ServletContext sc = ServletActionContext.getServletContext();
		filePath = sc.getRealPath("/") + filePath;
		File file2 = new File(filePath);
		if (!file2.exists() || !file2.isDirectory()) return null;
		File file = new File(filePath + fileName);
		if (!file.exists()) return null;
		BufferedReader in=new BufferedReader(new FileReader(file));
		String data = in.readLine();
		in.close();
		return data;
	}

	public String ajaxSave() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		String svyName=request.getParameter("svyName");
		
		Report report=ReportManager.getReport(reportId);
		User user= accountManager.getCurUser();
		if(user!=null && report!=null){
			String userId=user.getId();
			if(userId.equals(report.getUserId())){
				if(svyName!=null && !"".equals(svyName)){
					svyName=URLDecoder.decode(svyName,"utf-8");
					report.setReportName(svyName);
				}
				ReportManager.save(report);

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
		Report directory=ReportManager.createByReport(fromBankId,reportName,tag);
		reportId=directory.getId();
		return RELOADDESIGN;
	}
	
	private void buildReportHtml() throws Exception{
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		String url = "";
		String name = "";
		ServletContext sc = ServletActionContext.getServletContext();

		String file_name = request.getParameter("file_name");
		url = "/design/my-collect.action?reportId=402880ea4675ac62014675ac7b3a0000";
		// 这是生成的html文件名,如index.htm.
		name = "/report.htm";
		name = sc.getRealPath(name);
		
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		final ByteArrayOutputStream os = new ByteArrayOutputStream();

		final ServletOutputStream stream = new ServletOutputStream() {
			public void write(byte[] data, int offset, int length) {
				os.write(data, offset, length);
			}

			public void write(int b) throws IOException {
				os.write(b);
			}
		};
		
		final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os,"utf-8"));

		HttpServletResponse rep = new HttpServletResponseWrapper(response) {
			public ServletOutputStream getOutputStream() {
				return stream;
			}

			public PrintWriter getWriter() {
				return pw;
			}
		};

//		rd.include(request, rep);
		rd.forward(request,rep);
		pw.flush();
		
		// 把jsp输出的内容写到xxx.htm
		File file = new File(name);
		if (!file.exists()) {
			file.createNewFile();
		}
		FileOutputStream fos = new FileOutputStream(file);
		
		os.writeTo(fos);
		fos.close();
	}

	
}
