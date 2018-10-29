<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>区域教育质量健康体检项目网络测评系统</title>
<meta name="description" content="调问问卷表单－开源且专业的调研系统" />

<script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="${ctx }/js/dw/responsive-width.js"></script>
<script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js"></script>
<link href="${ctx }/css/dw-user.css" rel="stylesheet" type="text/css" />

<script src="${ctx}/js/plugs/jquery/jquery.cookie.js" type="text/javascript"></script>
<link href="${ctx}/js/plugs/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/js/plugs/validate/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx}/js/plugs/validate/messages_cn.js" type="text/javascript"></script>
<script src="${ctx }/js/plugs/validate/jquery.metadata.js" type="text/javascript"></script>
<script src="${ctx}/js/common/common.js" type="text/javascript"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<script type="text/javascript">
	$(document).ready(function(){

		var loginFormValidate=$("#loginForm").validate({
			rules:{
				username:{required:true,number:true,minlength:3,maxlength:60},
				//email:{required:true,email:true,maxlength:60},
				password:{required:true,minlength:6,maxlength:40}
			},
			messages: {
				username: {
		    		minlength:"不能少于3个字符！",
					maxlength:"不能超过60个字符！",
					number: "请输入正确的准考证号！",
					required: "准考证号不能为空！"
				},
				password:{
					required: "密码不能为空！"
		    	}
			},
			errorPlacement: function(error, element) {
			    //error.appendTo(element.parent().parent());
				element.parent().append(error);
			//	$(element).css("borderColor","#C40000");
			}
		});
		
		var ckCodeError=$.cookie("registerError");
		if(ckCodeError!=null && ckCodeError=="0"){
			$("#register-error").text("验证码不正确!");
			$.removeCookie('registerError',{path:'/'});
		}
		
	});
</script>
<style type="text/css">
label.error{
	display: block;
	margin-top: 3px;
}
#header{
	opacity:0.9;
}
#dwLoginContent{
	opacity:0.95;
}
</style>
</head>
<body style="background-color: rgb(83, 136, 99);">
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/6608914805422388314.jpg" style="margin-top:-50px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%>
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/6608415627143877023.jpg" style="margin-top:-375px; margin-left: 0px; opacity: 1;" width="100%" ></div>--%>
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/6619354668328056805.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%> 
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/132daa5ad6227e1fb5aa3c7f52033279.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%>
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/5da3acedb562404bed2457bc4bcff436.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div>--%>
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/1d841d916211750f292f37449042b3a1.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%>
 
<%--  <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/9b39ef953da82d911cb886effe8f55a0.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%> 
<%--  <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/b02577eda22997e9882dfe7212e459ef.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%> 
<%--  <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/19473ca656f68ea546bc9a181b713952.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%> 
<%-- <div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/1a357f7a35cc6a1445f8a9d2fac7166e.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div> --%> 
<%--<%@ include file="/WEB-INF/page/layouts/loginbgimg.jsp"%>--%>
<%--<div class="m-logbg"><img src="${ctx }/images/style-model/login_bg/7.jpg" style="margin-top:0px; margin-left: 0px; opacity: 1;" width="100%" ></div>--%>

<div id="wrap" class="wrapLogin">

	<input type="hidden" id="id" name="id" value="${report.id }">
	<input type="hidden" id="ctx" name="ctx" value="${ctx }">

	<div id="header" style="display: none;" >
		<div id="headerCenter"  class="bodyCenter">

			<div class="header_Item header_logo">
				<%@ include file="WEB-INF/page/layouts/logo-img.jsp"%>
			</div>

			<%--
			<shiro:guest>
				<div class="header_Item header_menu">
					<ul></ul>
				</div>
				<div class="header_Item header_user" style="float: right;">
					<a href="${ctx }/login.jsp" class="btn-a-1 active">学生入口</a>
					<a href="${ctx }/admin_login.jsp" class="btn-a-1">管理员入口</a>
				</div>
			</shiro:guest>
			--%>
		</div>
		<div style="clear: both;"></div>
	</div>

	<div style="clear: both;"></div>
	<div id="dwBody" style="margin-top: 50px;" >
		<div id="dwBodyContent" class="bodyCenter" style="background: none;">
				
					<div class="dw_login_logo" style="width: 560px;">
						<h1 class="f1">DIAOWEN</h1>
						<%--<h2 class="f2" style="width: 460px;">调问专业<span class="f3">、</span>开源<span class="f3">、</span>实用的调研方式</h2>--%>
						<h2 class="f2" style="width: 560px;font-size: 20px;margin-bottom: 10px;letter-spacing: 8px;">区域教育质量健康体检项目网络测评系统</h2>
					</div>
					
					
					<shiro:guest>
					<div id="dwLoginContent">
						<div class="dlcTitleBg" ></div>
						<div class="dlcTitle" >
							<a href="#" class="dlcTitleTab crt" > ${param.role eq 100 ? "学生":param.role eq 110?"老师":param.role eq 130 ? "家长":param.role eq 120 ? "校长":""}登录</a>
						</div>

					<div class="loginFormContent">
						
						<form id="loginForm" action="${ctx }/login!login.action" method="post">
						<div id="loginTabContent" >
							<div id="login-error" class="errorMsg" style="color: red;padding-left: 60px;">&nbsp;
						   <c:choose>
								<c:when test="${fn:endsWith(shiroLoginFailure,'IncorrectCredentialsException')}">
									用户名或密码不正确
								</c:when>
								<c:when test="${fn:endsWith(shiroLoginFailure,'UnknownAccountException')}">
									用户名或密码不正确
								</c:when>
								<c:when  test="${fn:endsWith(shiroLoginFailure,'ExcessiveAttemptsException')}">
									${username }密码错误超过3次，请与管理员联系
								</c:when>
							   <c:when  test="${fn:endsWith(shiroLoginFailure,'imageCaptchaCodeError')}">
								   验证码不正确
							   </c:when>
							   <c:when  test="${fn:endsWith(shiroLoginFailure,'noAuthenticationException')}">
								   ${username } 准考证号不存在，请确认！
							   </c:when>

							</c:choose>
							</div>
							<div class="dlcLeft">
								<div class="frmItem">
									<label for="" class="frm_label">准考证号</label>
									<div class="frm_controls">
										<input id="username" type="text" class="frm-controlM" name="username" value="" placeholder="请输入准考证号" >
										<input id="roleType" type="hidden" class="frm-controlM" name="role" value="${param.role}" >
										<span class="frm_desc">用来登录调问网，接收到激活邮件才能完成注册</span>
									</div>
								</div>
								<%--<div class="frmItem">
									<label for="" class="frm_label">密码</label>
									<div class="frm_controls">
										<input type="password"  name="password" id="passwordInput"  class="frm-controlM" value="" >
										<span class="frm_desc">字母、数字或者英文符号，最短6位，区分大小写</span>
									</div>
								</div>--%>
								<div class="frmItem" >
									<label for="" class="frm_label">验证码</label>
									<div class="frm_controls">
										<span class="auth-code" id="verifycodeImgArea">
										<input name="jcaptchaInput" type="text"  class="" style="width:196px;" autocomplete="off" placeholder="请输入验证码" >
										<img id="jcaptchaImg"  class="refreshJcaptchaImg" src="${ctx }/jcaptcha.action" alt="验证码"  height="40"></span>
										<br/>
										<div style="text-align: right;padding-top: 8px;padding-right: 36px;"><a class="refreshJcaptchaImg" href="javascript:;" style="margin-left: 5px;">换一张</a></div>
										<span class="frm_desc">输入下面图片的字符，不区分大小写</span>
										<p class="valid-msg fail" style="display: none;"><i>●</i><span class="msg_content">验证码错误，请重新输入</span></p>
									</div>
								</div>
								<div class="frmItem" style="display: none;padding: 3px 5px;padding-bottom: 7px;">
									<label for="" class="frm_label">&nbsp;</label>
									<label class="frmItemLabel" ><input id="agree" name="agree" type="checkbox" checked="checked">我同意并遵守<a href="#" target="_blank">《KX调研问卷系统服务协议》</a></label>
								</div>
								<div class="frmItem" style="padding: 6px 5px;">
									<label for="" class="frm_label">&nbsp;</label>
									<input type="submit"  value=" 登 录 " class="btnGreen" style="width: 330px;height: 45px;" />
								</div>
								
								<div class="frmItem" style="overflow: auto;padding: 6px 5px;">
									<label for="" class="frm_label">&nbsp;</label>
									<!-- <label class="frmItemLabel" style="float: left;">
										<input id="agree" name="agree" type="checkbox" checked="checked" style="color: color: #777;;">
									</label> -->
									<span class="ztagCheckbox checkedTrue">
									<%--<input id="c0" type="checkbox" name="rememberMe" value="true" checked="checked"></span>--%>
									<%--<a class="dw_style_a_1" tabindex="3" href="#">记住密码</a>--%>
									<%--<a class="dw_style_a_1" href="${ctx }/pwd/findPwd.jsp" target="_blank" style="float: right;">忘记密码</a>--%>
								</div>
								<!-- 
								<div class="frmItem" style="padding: 10px 5px;">
									<label for="" class="frm_label">&nbsp;</label>
									还没有账号&nbsp;&nbsp;<a href="">免费注册</a>
								</div> -->
						</div>
						<div class="dlcRight">
							<div style="color: gray;">
								<%--<h3 style="line-height: 40px;">联系信息</h3>
								<p style="line-height: 40px;">电话：0000000000</p>
								<p style="line-height: 40px;">QQ：0000000000</p>--%>
									<%--<p style="line-height: 40px;">京ICP备18013798号-1</p>--%>
								<%--<p style="line-height: 40px;">亲爱的同学、家长<br/>请在左边输入准考证号及验证码。</p>--%>
								<h3 style="line-height: 40px;margin-top: 28px;">温馨提示</h3>
								<p style="line-height: 40px;">1. 请在规定时间内完成问卷；</p>
								<p style="line-height: 40px;">2. 完成问卷后请提交答案。</p>
							</div>
						</div>
						</div>
						</form>
						
					</div>
			</div>
			</shiro:guest>
			<shiro:user>
				<div id="dwLoginContent">
					<div class="dlcTitleBg" ></div>
						<div class="dlcTitle" style="padding: 17px;" >
							提示：已登录
						</div>
					
					<div class="loginFormContent">
							<div> 
								<div style="margin: 80px auto;">
									<div style="padding-left: 100px;font-size: 20px;">
										亲爱的&nbsp;<span style="color:#497289;"><shiro:principal></shiro:principal></span>&nbsp;您已经登陆
										<%--<span style="margin-left: 10px;"><a href="${ctx }/c/report.action" >问卷列表</a>&nbsp;&nbsp;--%>
											<shiro:hasRole name="admin">
										<span style="margin-left: 10px;"><a href="${ctx }/design/my-report.action">管理</a>&nbsp;&nbsp;</span>
											</shiro:hasRole>
											<shiro:hasRole name="editer">
										<span style="margin-left: 10px;"><a href="${ctx }/design/my-report.action">编写报告</a>&nbsp;&nbsp;</span>
											</shiro:hasRole>
											<shiro:hasRole name="reviewer">
										<span style="margin-left: 10px;"><a href="${ctx }/design/my-report.action">审核报告</a>&nbsp;&nbsp;</span>
											</shiro:hasRole>
											<shiro:hasRole name="xxans">
										<%--<span style="margin-left: 10px;"><a href="${ctx}/ans/answer-stat!nojoin.action" id="nojoin_yangben">未填写用户</a>&nbsp;&nbsp;</span>--%>
												<span style="margin-left: 10px;"><a href="${ctx}/ans/answer-stat!answerData.action?roleType=2&isAnswer=0" id="nojoin_yangben">答卷情况</a>&nbsp;&nbsp;</span>
											</shiro:hasRole>
										<a href="${ctx }/login!logout.action">退出登录</a>
									</div>
								 </div>
								  <div style="text-align: center;">
								  	<c:if test="${!empty param['una'] }"><h3 style="margin-bottom: 30px;">您没有相应的权限!</h3></c:if>
								  </div>
							  </div>
					</div>
				</div>
				
			</shiro:user>
		</div>
	</div>
	
	<div class="dw_foot" style="padding-top:15px;">
		<!-- 必须保留声明 start -->
	<div class="footer-copyright" style="color: #c4c5c5;padding-top: 0px;font-size: 16px;">
		<%-- &nbsp;&nbsp;&nbsp;Copyright © 2012-2017
		<a href="http://www.diaowen.net" style="text-decoration: none;color: #c4c5c5;">协同创新中心</a>--%>
			<div style="">Copyright © 2017 版权所有 中国基础教育质量监测协同创新中心</div>
			<div style="line-height: 26px;margin-top: 10px;">电话：010-58801910&nbsp;&nbsp;<%--QQ群：101630969--%></div>
	</div>
		<!-- 必须保留声明 end -->
	</div>
	
	</div>
<script type="text/javascript">
resizeBodyWidth();
$(".dlcTitleBg").animate({opacity:0.6},0);
$("a").attr("hidefocus",true);
</script>

<script type="text/javascript">

$(document).ready(function(){
	 
	 var top=$(window).height()/2-320/2;
	 var left=$(window).width()/2-550/2;
	 //var A=window.open(url,"TencentLogin","top="+top+",left="+left+",width=550,height=320,menubar=0,scrollbars=1,resizable=1,status=1,titlebar=0,toolbar=0,location=1");

});
</script>
</body>
</html>