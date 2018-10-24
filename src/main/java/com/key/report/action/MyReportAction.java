package com.key.report.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.key.report.service.ReportManager;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.convention.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.base.action.CrudActionSupport;
import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;

/**
 * 我的问卷 action
 *
 *
 */
@Namespace("/design")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
    @Result(name=MyReportAction.SUCCESS,location="/WEB-INF/page/content/diaowen-design/list.jsp",type=Struts2Utils.DISPATCHER),
    @Result(name="design",location="/design/my-report-design.action?reportId=${id}",type=Struts2Utils.REDIRECT),
})
@AllowedMethods({"reportState","attrs"})
public class MyReportAction extends CrudActionSupport<Report, String>{
	
	@Autowired
	private ReportManager reportDirectoryManager;
	@Autowired
	private AccountManager accountManager;

	@Override
	public String list() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		String reportState = request.getParameter("reportState");
		if(reportState==null||"".equals(reportState)){
			entity.setReportState(null);
		}
	    page=reportDirectoryManager.findByUser(page,entity);
	    return SUCCESS;
	}
	
	public String delete() throws Exception {
	    HttpServletResponse response=Struts2Utils.getResponse();
	    String result="false";
	    try{
		User user = accountManager.getCurUser();
		if(user!=null){
		    String userId=user.getId();
		    Report reportDirectory=reportDirectoryManager.getReportByUser(id,userId);
		    if(reportDirectory!=null){
		    	reportDirectoryManager.delete(id);
		    	result="true";
		    }
		}
	    }catch (Exception e) {
			result="false";
	    }
	    response.getWriter().write(result);
	    return null;
	}
	
	//问卷壮态设置
	public String reportState() throws Exception{
		HttpServletResponse resp=Struts2Utils.getResponse();
		String result="";
		try{
			User user= accountManager.getCurUser();
			if(user!=null){
				String userId=user.getId();
				Report reportDirectory=reportDirectoryManager.getReportByUser(id, userId);
				if(reportDirectory!=null){
					int reportState=entity.getReportState();
					reportDirectory.setReportState(reportState);
				}
			}
			result="true";
		}catch(Exception e){
			e.printStackTrace();
			result="error";
		}
		resp.getWriter().write(result);
		return null;
	}
	


	public String attrs() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		try{
			Report report=reportDirectoryManager.getReport(id);
			JsonConfig cfg = new JsonConfig();
			cfg.setExcludes(new String[]{"handler","hibernateLazyInitializer"});
			JSONObject jsonObject=JSONObject.fromObject(report,cfg);
			response.getWriter().write(jsonObject.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	@Override
	protected void prepareModel() throws Exception {
		entity=reportDirectoryManager.getModel(id);
	}
	
	public void prepareReportState() throws Exception {
		prepareModel();
	}

	public void prepareExecute() throws Exception {
		prepareModel();
	}
	
}
