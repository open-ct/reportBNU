<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/WEB-INF/page/layouts/other.jsp"%>
<div id="header" >
		<div id="headerCenter"  class="bodyCenter">
			<div class="header_Item header_logo">
			<%@ include file="logo-img.jsp"%>
			</div>
			<shiro:guest>
				<div class="header_Item header_menu">
					<ul></ul>
				</div>
				<div class="header_Item header_user" style="float: right;">
				<%--	<a href="${ctx }/login.jsp" class="btn-a-1 ">学生/家长入口</a>
					<a href="${ctx }/admin_login.jsp" class="btn-a-1 active">管理员入口</a>--%>
				</div>
			</shiro:guest>
			<shiro:user>
				<div class="header_Item header_menu">
					<ul></ul>
				</div>
				<div class="header_Item header_user" style="float: right;padding-top: 22px;">
					<%--<span style="margin-right: 2px;font-size: 18px;color: #999999;">
						<shiro:principal></shiro:principal>
					</span>--%>
					<a href="${ctx }/login!logout.action" style="margin: 0px;">退出</a>
				</div>
			</shiro:user>
			<shiro:hasRole name="surveyRole">
				<div class="header_Item header_menu">
					<ul>
							<%-- <li><a href="${ctx }/" >首页</a></li> --%>
						<li><a href="${ctx }/design/my-report.action" id="mysurvey">报告</a></li>
					</ul>
				</div>
				<div class="header_Item header_user" style="float: right;margin-top: 12px;position: relative;zoom: 1;z-index: 165;">
					<a href="#" class="clickHideUserMenu">
						<span class="head_use_name">
						<shiro:principal></shiro:principal>
						</span>
						<span class="header_user_icon">&nbsp;</span>
					</a>
					<div class="a-w-sel a-w-sel-head" style="">
						<div class="w-sel" style="margin-top: 16px;">
							<div class="selc">
								<div class="selcc tbtag">
									<div class="seli"><a class="nx-1" href="${ctx }/ic/user!myaccount.action">修改密码</a></div>
									<div class="seli"><a class="nx-7" href="http://support.diaowen.net/">帮助及反馈</a></div>
									<div class="seli"><a class="nx-8" href="${ctx }/login!logout.action">退出</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="header_Item header_menu">
					<ul>
					<%-- <li><a href="${ctx }/" >首页</a></li> --%>
					<li><a href="${ctx }/design/my-report.action" id="mysurvey">报告</a></li>
					</ul>
				</div>
				<div class="header_Item header_user" style="float: right;margin-top: 12px;position: relative;zoom: 1;z-index: 165;">
					<a href="#" class="clickHideUserMenu">
						<span class="head_use_name">
						<shiro:principal></shiro:principal>
						</span>
						<span class="header_user_icon">&nbsp;</span>
					</a>
					<div class="a-w-sel a-w-sel-head" style="">
		            	<div class="w-sel" style="margin-top: 16px;">
		                	<div class="selc">
		                    	<div class="selcc tbtag">
		                            <div class="seli"><a class="nx-1" href="${ctx }/ic/user!myaccount.action">修改密码</a></div>
		                            <div class="seli"><a class="nx-7" href="http://support.diaowen.net/">帮助及反馈</a></div>
		                            <div class="seli"><a class="nx-8" href="${ctx }/login!logout.action">退出</a></div>
		                        </div>
		                    </div>
		                </div>
		            </div>
				</div>
			</shiro:hasRole>
			<shiro:hasRole name="admin" >
				<div class="header_Item header_menu">
					<ul>
							<%-- <li><a href="${ctx }/" >首页</a></li> --%>
						<li><a href="${ctx }/design/my-report.action" id="mysurvey">报告</a></li>
						<%--<li><a href="${ctx }/sy/user/user-admin.action" id="usermanager">用户</a></li>
						<li><a href="${ctx}/sy/user/yang-ben.action" id="yangben">样本</a></li>
						<li><a href="${ctx }/sy/system/sys-property!input.action" id="systemset">设置</a></li>--%>
					</ul>
				</div>
				<div class="header_Item header_user" style="float: right;margin-top: 12px;position: relative;zoom: 1;z-index: 165;">
					<a href="#" class="clickHideUserMenu">
						<span class="head_use_name">
						<shiro:principal></shiro:principal>
						</span>
						<span class="header_user_icon">&nbsp;</span>
					</a>
					<div class="a-w-sel a-w-sel-head" style="">
						<div class="w-sel" style="margin-top: 16px;">
							<div class="selc">
								<div class="selcc tbtag">
									<div class="seli"><a class="nx-1" href="${ctx }/ic/user!myaccount.action">修改密码</a></div>
									<div class="seli"><a class="nx-7" href="http://support.diaowen.net/">帮助及反馈</a></div>
									<div class="seli"><a class="nx-8" href="${ctx }/login!logout.action">退出</a></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</shiro:hasRole>
			<shiro:hasRole name="xxans" >
				<div class="header_Item header_menu">
					<ul>
							<%-- <li><a href="${ctx }/" >首页</a></li> --%>
						<li><a href="${ctx }/ans/answer-stat.action" id="total_survey">总览</a></li>
							<%--<li><a href="${ctx }/sy/user/user-admin.action" id="usermanager">用户</a></li>--%>
						<li><a href="${ctx}/ans/answer-stat!answerData.action?roleType=2&isAnswer=0" id="join_yangben">答卷情况</a></li>
					</ul>
				</div>
			</shiro:hasRole>
		</div>
		<div style="clear: both;"></div>
	</div>