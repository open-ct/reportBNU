/*
 * $HeadURL: $
 * $Id: $
 * Copyright (c) 2011 by Ericsson, all rights reserved.
 */

package com.key.common.plugs.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.log.SysoLogger;
import com.key.common.base.entity.User;
import com.key.common.base.service.AccountManager;
import com.key.common.utils.web.Struts2Utils;
import com.octo.captcha.service.image.ImageCaptchaService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.convention.annotation.AllowedMethods;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;

/**
 *
 *
 *
 *
 */
@Namespace("/")
@Results({
		@Result(name = "login", location = "index.jsp", type = "redirect"),
		@Result(name = "login_disp", location = "index.jsp?una=10", type = Struts2Utils.REDIRECT),
		@Result(name = "login_disp11", location = "index.jsp?una=11", type = Struts2Utils.REDIRECT),
		@Result(name = "c_survey", location = "c/survey.action", type = "redirect"),
		@Result(name = "c_info", location = "c/survey!infoConfirm.action", type = "redirect")
})
@AllowedMethods({"login","logout"})
public class LoginAction extends ActionSupport {

	private static final long serialVersionUID = 7392913081177740732L;
	@Autowired
	private FormAuthenticationWithLockFilter formAuthFilter;
	@Autowired
	protected AccountManager accountManager;
	@Autowired
	private ImageCaptchaService imageCaptchaService;

	public String login() throws Exception {
		
		System.out.println("username1-1");
		HttpServletRequest request = Struts2Utils.getRequest();
		HttpServletResponse response = Struts2Utils.getResponse();
		
		Subject subject = SecurityUtils.getSubject();
		boolean isAuth = subject.isAuthenticated();
		// 返回成功与否
		String error="";
		Long resetnum=0L;
		try{
			if (!isAuth) {
				String code = request.getParameter("jcaptchaInput");
				String role = request.getParameter("role");
				System.out.println("code:"+code);
				if (!imageCaptchaService.validateResponseForID(request.getSession().getId(), code)) {
					isAuth = false;
					error="imageCaptchaCodeError";
				}else if(!formAuthFilter.checkIfAccountLocked(request)){
					String username = request.getParameter("username");
//				String password = request.getParameter("password");
					User user = accountManager.findUserByLoginName(username);
					if(user!=null && user.getRoleType()>0){
						Integer roleType = user.getRoleType();
						System.out.println(user.getName());
						String password = "123456";

						if(role!=null && !"".equals(role)){
							subject.getSession().setAttribute("role",role);
							boolean roleCheck=false;
							if("100".equals(role) && (11 == roleType || 21 == roleType)){
								//学生身份不对
								roleCheck = true;
							}
							if(!roleCheck && "110".equals(role) && (13 == roleType  || 23 == roleType )){
								roleCheck = true;
							}
							if(!roleCheck && "120".equals(role) && (14 == roleType || 24 == roleType || 90 == roleType)){
								roleCheck = true;
							}
							if(!roleCheck && "130".equals(role) && (11 == roleType || 21 == roleType)){
								roleCheck = true;
							}

							//正式环境必须去掉
							/*if(roleType!=90 && user.getVersion()==3){
								roleCheck = false;
								return "login_disp11";
							}*/

							System.out.println(roleCheck+":"+roleType+":"+role);
							if(roleCheck){
								UsernamePasswordToken token = new UsernamePasswordToken(username,password);
								try {
									subject.login(token);
									formAuthFilter.resetAccountLock(username);
									isAuth = true;
									user.setLastLoginTime(new Date());
									accountManager.saveUp(user);
									subject.getSession().setTimeout(18000000);
								}catch (IncorrectCredentialsException e) {
									formAuthFilter.decreaseAccountLoginAttempts(request);
									isAuth = false;
									error="IncorrectCredentialsException";
									resetnum=formAuthFilter.getAccountLocked(username);
								} catch (AuthenticationException e) {
									isAuth = false;
									error="AuthenticationException";
								}
							}else {
								isAuth = false;
							}

						}
					}else{
						isAuth = false;
						error="noAuthenticationException";
					}
				}else{
					//ExcessiveAttemptsException超过登录次数
					error="ExcessiveAttemptsException";
				}
			}
			//PrintWriter writer = response.getWriter();
			//writer.write(isAuth + ","+error);//此种方式，在$.getJson()进行仿问时会出现不执行回调函数
			System.out.println(isAuth+","+error);
//		response.setContentType("text/plain");// 1.设置返回响应的类型
			//2. 01 一定要注意：要包括jsoncallback参数，不然回调函数不执行。
			//2. 02 返回的数据一定要是严格符合json格式 ，不然回调函数不执行。
//        response.getWriter().write( request.getParameter("jsoncallback") + "({isAuth:'"+isAuth+"',error:'"+error+"',resetnum:'"+resetnum+"'})" );

			if(isAuth){
				return "c_info";
			}
		}catch (Exception e){
			e.printStackTrace();
		}
		return "login_disp";
		// 跳转到成功页面
	}

	public String logout() throws Exception {
		System.out.println("............logout..................");
		if (SecurityUtils.getSubject() != null) {
			SecurityUtils.getSubject().logout();
		}
		Struts2Utils.getSession().invalidate();
		return "login";
	}
	/* 给某个锁定的账号开锁,管理员使用 */
	
	public String lockout() throws Exception {
		HttpServletRequest request=Struts2Utils.getRequest();
		HttpServletResponse response=Struts2Utils.getResponse();
		String username=request.getParameter("username");
		//确认有没账号
		boolean isup=false;
		String error="用户不存在";
		
		if(username!=null){
//			User user=accountManager.findUserByLoginName(username);
			User user = accountManager.findUserByLoginNameOrEmail(username);
			if(user!=null){
				formAuthFilter.resetAccountLock(username);
				isup=true;
			}
		}
		response.getWriter().write(isup?username+"解锁成功":username+"，"+error);
		return null;
	}
	
	public String register() throws Exception {
		
		return "";
	}

}
