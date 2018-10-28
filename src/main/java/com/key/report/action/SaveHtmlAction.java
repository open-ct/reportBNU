package com.key.report.action;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.Iterator;
import java.util.Scanner;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
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

import com.itextpdf.text.log.SysoCounter;
import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.Property;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Namespace("/")
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
			if(userId.equals(report.getUserId())){
				System.out.println("OK");
				report.setReportState(1);
				report.setVisibility(1);
				reportManager.save(report);
			}
		}
		String data = request.getParameter("data");
		String filePath = "files/reportHtml/";
		String fileName = reportId + ".html";
		filePath = filePath.replace("/", File.separator);
		filePath = filePath.replace("\\", File.separator);
		ServletContext sc = ServletActionContext.getServletContext();
		String fileRealPath = sc.getRealPath("/") + filePath;
		saveHtml(data, fileName, fileRealPath);
		return SUCCESS;
	}
	
	private void saveFile(String data, String fileName, String filePath) throws IOException {
		File file2 = new File(filePath);
		if (!file2.exists() || !file2.isDirectory()) file2.mkdirs();
		File file = new File(filePath + fileName);
		if (!file.exists()) file.createNewFile();
		BufferedWriter out = new BufferedWriter (new OutputStreamWriter (new FileOutputStream (file, false),"UTF-8"));
		out.write(data);
		out.close();
	}
	
	private void saveHtml(String data, String fileName, String filePath) throws IOException {
		String htmlData = "<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n</head>\n<body>\n<div style=\"width:596pt; margin:auto;\">\n";
	    StringBuilder sb=new StringBuilder();
		for(String s:data.split(","))
			sb.append((char)Integer.parseInt(s));
		data=sb.toString();
		JSONObject jsonData = JSONObject.fromObject(data);
		Iterator iterator = jsonData.keys();
		while(iterator.hasNext()){
		    String key = (String) iterator.next();
		    JSONObject value = jsonData.getJSONObject(key);
		    String type = value.getString("type");
		    String text = value.getString("text");
		    System.out.println(type);
		    if(type.substring(0, type.length()-1).equals("texttitle")){
		    	String style = "";
		    	if(type.equals("texttitle1")) style="text-align: center; font-family: SimHei; font-size: 18pt;";
		    	else if(type.equals("title2")) style="text-align: left; font-family: SimHei; font-size: 16pt;";
		    	else if(type.equals("title3")) style="text-align: left; font-family: SimHei; font-size: 14pt;";
		    	else if(type.equals("title4")) style="text-align: left; font-family: SimHei; font-size: 12pt;";
		    	else if(type.equals("body")) style="text-indent: 24pt; text-align: left; font-family: FangSong; font-size: 12pt;";
		    	else if(type.equals("note")) style="text-align: left; font-family: KaiTi; font-size: 10.5pt;";
		    	else if(type.equals("imagetitle")) style="text-align: center; font-family: STXinwei; font-size: 12pt;";
		    	htmlData += "<p class=\"" + type + "\" style=\"" + style + "\">" + text + "</p>\n";
		    }
		    else if(type.equals("graph")){
		    	htmlData += "<p class=\"" + type + "\" style=\"text-align: center;\">\n";
		    	htmlData +=	"<img src=\"../../" + text + "\">\n</p>\n";
		    }
		}
		htmlData += "</div>\n</body>\n</html>\n";
		saveFile(htmlData, fileName, filePath);
	}
	
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

}
