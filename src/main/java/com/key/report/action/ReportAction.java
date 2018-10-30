package com.key.report.action;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.key.common.base.action.CrudActionSupport;
import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.web.Struts2Utils;
import com.key.report.entity.Report;
import com.key.report.service.ReportManager;

/**
 * 我的问卷 action
 *
 *
 */
@Namespace("/c")
@InterceptorRefs({ @InterceptorRef("paramsPrepareParamsStack")})
@Results({
    @Result(name= ReportAction.SUCCESS,location="/WEB-INF/page/content/diaowen-center/reports.jsp",type=Struts2Utils.DISPATCHER),
	@Result(name= "confirmInfo",location="/WEB-INF/page/content/diaowen-center/info-confirm.jsp",type=Struts2Utils.DISPATCHER)
})
@AllowedMethods({"infoConfirm"})
public class ReportAction extends CrudActionSupport<Report, String>{
	
	@Autowired
	private ReportManager reportManager;
	@Autowired
	private AccountManager accountManager;

	@Override
	public String list() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
//	    page=reportManager.findPage(page);

		User user = accountManager.getCurUser();
		if(user!=null){
			if(entity == null){
				entity = new Report();
			}
			entity.setReportState(1);
			//根据用户的身份取结果
			Subject subject = SecurityUtils.getSubject();
			Object role = subject.getSession().getAttribute("role");
			Integer userRoleType = user.getRoleType();
			if(userRoleType!=null && role!=null && "130".equals(role.toString())){
				int roleType = 12;
				if(userRoleType.intValue()==11){
					roleType = 12;
				}else if(userRoleType.intValue()==21){
					roleType=22;
				}
				entity.setReportType(roleType);
			}else{
				entity.setReportType(userRoleType);
			}
			if(userRoleType!=null){
				page=reportManager.findPage(page,entity);
			}
		}
	    return SUCCESS;
	}

	@Override
	public String save() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response = Struts2Utils.getResponse();
		Report report = reportManager.getReport(id);
		Boolean s=false;
		if(report!=null){
			report.setReportName(URLDecoder.decode(entity.getReportName(),"utf-8"));
			report.setReportState(entity.getReportState());
			report.setReportLevel(entity.getReportLevel());
			report.setOrderbyNum(entity.getOrderbyNum());
			reportManager.save(report);
			s=true;
		}
		response.getWriter().write(s.toString());
		return null;
	}

	@Override
	protected void prepareModel() throws Exception {
		entity=reportManager.getModel(id);
	}

	public String infoConfirm() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		User user = accountManager.getCurUser();

		Subject subject = SecurityUtils.getSubject();
		Object role = subject.getSession().getAttribute("role");
		int userRoleType = user.getRoleType();
		int roleType = userRoleType;
		if(role!=null && "130".equals(role.toString())){
			if(userRoleType==11){
				roleType = 12;
			}else if(userRoleType==21){
				roleType = 22;
			}
		}
		//subject.getSession().setAttribute("roleType",roleType);
		request.setAttribute("roleType",roleType);
		request.setAttribute("user",user);;

		return "confirmInfo";
	}
}
