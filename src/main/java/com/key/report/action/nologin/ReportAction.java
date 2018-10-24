package com.key.report.action.nologin;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.key.report.service.ReportManager;
import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.plugs.ipaddr.IPService;
import com.key.common.utils.Property;
import com.key.common.utils.twodimension.TwoDimensionCode;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.opensymphony.xwork2.ActionSupport;
//import com.sun.image.codec.jpeg.JPEGCodec;
//import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 问卷 action
 *
 */
@Namespace("/")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
	@Result(name=ReportAction.INDEXJSP,location="/index.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name=ReportAction.ANSERSURVEY,location="/WEB-INF/page/content/diaowen-design/answer-report.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name=ReportAction.ANSERSURVEY_MOBILE,location="/WEB-INF/page/content/diaowen-design/answer-report-mobile.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name = ResponseAction.RESPONSE_MSG, location = "/WEB-INF/page/content/diaowen-answer/response-msg.jsp", type = Struts2Utils.DISPATCHER)
})

@AllowedMethods({"answerReport","answerSurveryMobile","reportModel","answerTD","ajaxCheckReport"})
public class ReportAction extends ActionSupport{
	
	protected final static String INDEXJSP="indexJsp";
	protected final static String ANSERSURVEY="answerReport";
	protected final static String ANSERSURVEY_MOBILE="answerReportMobile";
	protected final static String SURVEYMODEL="reportModel";
	protected final static String ANSWER_INPUT_ERROR = "answerInputError";//已经答过，在间隔时间内
	protected final static String ANSWER_INPUT_RULE = "answer_input_rule";//令牌
	
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private IPService ipService;
	
	private String sid;
	private String reportId;
	//外部回答公共访问路径--静态访问
	@Override
	public String execute() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		String htmlPath="http://wj.diaowen.net/test";
		//request.getRequestDispatcher(htmlPath).forward(request, response);
		response.sendRedirect(htmlPath);
		return NONE;
	}

	//问卷的动态访问方式
	public String answerReport() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report report=reportManager.getReport(reportId);
		buildReport(report);
		return ANSERSURVEY;
	}
	//问卷动态访问-移动端
	public String answerSurveryMobile() throws Exception {
		HttpServletRequest request = Struts2Utils.getRequest();
		Report report=reportManager.getReport(reportId);
		buildReport(report);
	    return ANSERSURVEY_MOBILE;
	}
	
	private void buildReport(Report report) {
		if (report==null)
			report=reportManager.getReport(reportId);
		Struts2Utils.setReqAttribute("report", report);
		Struts2Utils.setReqAttribute("prevHost", Property.STORAGE_URL_PREFIX);
	}

	//回答问卷的二维码
	public String answerTD() throws Exception{
	    	HttpServletRequest request=Struts2Utils.getRequest();
	    	HttpServletResponse response=Struts2Utils.getResponse();
	    	
	    	String down=request.getParameter("down");

			String baseUrl = "";
			baseUrl = request.getScheme() +"://" + request.getServerName()
					+ (request.getServerPort() == 80 ? "" : ":" +request.getServerPort())
					+ request.getContextPath();

	    	String encoderContent=baseUrl+"/response!answerMobile.action?reportId="+reportId;
	    	ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();  
	    	BufferedImage twoDimensionImg = new TwoDimensionCode().qRCodeCommon(encoderContent, "jpg", 7);

			ImageIO.write(twoDimensionImg, "jpg", jpegOutputStream);

	        if(down==null){
		    	response.setHeader("Cache-Control", "no-store");
		        response.setHeader("Pragma", "no-cache");
		        response.setDateHeader("Expires", 0);
		        response.setContentType("image/jpeg");
		        ServletOutputStream responseOutputStream = response.getOutputStream();
		       responseOutputStream.write(jpegOutputStream.toByteArray());
		       responseOutputStream.flush();
		       responseOutputStream.close();
	        }else{
        	   response.addHeader("Content-Disposition", "attachment;filename=" + new String(("diaowen_"+reportId+".jpg").getBytes()));
        	   byte[] bys = jpegOutputStream.toByteArray();
    		   response.addHeader("Content-Length", "" + bys.length);
    		   ServletOutputStream responseOutputStream = response.getOutputStream();
    		   response.setContentType("application/octet-stream");	
    		   responseOutputStream.write(bys);
    		   responseOutputStream.flush();
    		   responseOutputStream.close();
	        }


	        return null;
	}

	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

}
