<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>首页</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>

<body style="background:#518861;">
	<div class="home-title" style="letter-spacing: 6px;font-size: 36px;margin: 60px 0px;">区域教育质量健康体检项目网络测评系统</div>
    <div id="msg_index" style="text-align: center;margin: 15px 0px;color: #fdecc3;font-size: 23px;">
        <c:if test="${param.una eq 10}">
            账号、验证码或身份不匹配，请核对无误后重新登录！<br/>
            请依据自己的身份，先点击下边我是，再进行登录操作！
        </c:if>
        <c:if test="${param.una eq 11}">
            请依据自己的身份，先点击下边我是，再进行登录操作！
        </c:if>
    </div>
    <div class="home-modules">
    	<ul>
        	<li>
            	<div class="module-logo"><i class="stu"></i></div>
                <div class="module-name">我是<span style="">学生</span></div>
                <div class="module-enter"><a href="login.jsp?role=100" class="btn">点击进入</a></div>
            </li>
            <li>
            	<div class="module-logo"><i class="tea"></i></div>
                <div class="module-name">我是<span style="">老师</span>
                </div>
                <div class="module-enter"><a href="login.jsp?role=110" class="btn">点击进入</a></div>
            </li>
            <li>
            	<div class="module-logo"><i class="principal"></i></div>
                <div class="module-name">我是<span style="">校长</span>
                </div>
                <div class="module-enter"><a href="login.jsp?role=120" class="btn">点击进入</a></div>
            </li>
            <li>
                <div class="module-logo"><i class="parent"></i></div>
                <div class="module-name">我是<span style="">家长</span></div>
                <div class="module-enter"><a href="login.jsp?role=130" class="btn">点击进入</a></div>
            </li>
        </ul>
    </div>
<div style="text-align: center;color: #c4c5c5;margin-top: 30px;line-height: 28px;">
    <div style="">Copyright © 2017 版权所有 中国基础教育质量监测协同创新中心</div>
    <div style="line-height: 26px;margin-top: 3px;">电话：010-58801910&nbsp;&nbsp;<%--QQ群：101630969--%></div>
</div>
</body>
</html>
