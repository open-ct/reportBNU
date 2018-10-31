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
		saveData(data, reportId);
		return SUCCESS;
	}
	
	private void saveData(String data, String reportId) throws IOException{
		String filePath = "files/reportHtml/";
		filePath = filePath.replace("/", File.separator);
		filePath = filePath.replace("\\", File.separator);
		ServletContext sc = ServletActionContext.getServletContext();
		String fileRealPath = sc.getRealPath("/") + filePath;
		saveFile(data, reportId + ".data", fileRealPath);
		saveHtml(data, reportId + ".html", fileRealPath);
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
		String htmlData = "<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
				+ "<style id=\"tablesort\">table.sortEnabled tr.firstRow th,table.sortEnabled tr.firstRow td{padding-right:20px;background-repeat: no-repeat;background-position: center right;   background-image:url(https://ueditor.baidu.com/ueditor/themes/default/images/sortable.png);}</style>"
	            + "<style id=\"table\">.selectTdClass{background-color:#edf5fa !important}table.noBorderTable td,table.noBorderTable th,table.noBorderTable caption{border:1px dashed #ddd !important}table{margin-bottom:10px;border-collapse:collapse;display:table;}td,th{padding: 5px 10px;border: 1px solid #DDD;}caption{border:1px dashed #DDD;border-bottom:0;padding:3px;text-align:center;}th{border-top:1px solid #BBB;background-color:#F7F7F7;}table tr.firstRow th{border-top-width:2px;}.ue-table-interlace-color-single{ background-color: #fcfcfc; } .ue-table-interlace-color-double{ background-color: #f7faff; }td p{margin:0;padding:0;}</style>"
				+ "</head>\n<body>\n<div style=\"width:596pt; margin:auto; word-wrap:break-word;\">\n";
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
		    if(type.equals("graph")){
		    	htmlData += "<p class=\"" + type + "\" style=\"text-align: center;\">\n";
		    	htmlData +=	"<img src=\"../" + text + "\">\n</p>\n";
		    }
		    else if(type.equals("table")){
		    	htmlData += "<table class=\"" + type + "\" style=\"margin: 0 auto;\">\n";
		    	htmlData += text.substring(7);
		    }
		    else if(type.equals("paging")){
		    	htmlData += "<div style=\"page-break-before:left\"></div>";
		    }
		    else{
		    	String style = "";
		    	if(type.equals("texttitle1")) style="text-align: center; font-family: SimHei; font-size: 18pt;";
		    	else if(type.equals("texttitle2")) style="text-align: left; font-family: SimHei; font-size: 16pt;";
		    	else if(type.equals("texttitle3")) style="text-align: left; font-family: SimHei; font-size: 14pt;";
		    	else if(type.equals("texttitle4")) style="text-align: left; font-family: SimHei; font-size: 12pt;";
		    	else if(type.equals("textbody")) style="text-indent: 24pt; text-align: left; font-family: 华文仿宋; font-size: 12pt;";
		    	else if(type.equals("textnote")) style="text-align: left; font-family: KaiTi; font-size: 10.5pt;";
		    	else if(type.equals("imagetitle")) style="text-align: center; font-family: STXinwei; font-size: 12pt;";
		    	htmlData += "<p class=\"" + type + "\" style=\"" + style + "\">" + text + "</p>\n";
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
