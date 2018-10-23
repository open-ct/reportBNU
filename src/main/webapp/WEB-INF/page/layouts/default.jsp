<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sitemesh:write property='title' />&nbsp;&nbsp;</title>

<link href="${ctx }/js/plugs/jquery-ui-1.10.3.custom/css/mycss/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-1.10.1.js"></script>
<script type="text/javascript" src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" src="${ctx }/js/dw/responsive-width.js"></script>
<script language="javascript" type="text/javascript" src="${ctx }/js/plugs/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
	<sitemesh:write property='head' />
<link href="${ctx }/css/dw-user.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
</head>
<body>
<div id="wrap" >
	<input type="hidden" id="ctx" name="ctx" value="${ctx }">
	<%@ include file="/WEB-INF/page/layouts/header.jsp"%>
	<sitemesh:write property='body' />
	
	
	<div class="dw_foot" style="padding-top:20px;">
		<%--<%@ include file="/WEB-INF/page/layouts/footer-1.jsp"%>--%>

		<!-- 必须保留声明 start -->
		<div class="footer-copyright" style="color: gray;padding-top: 0px;font-size: 16px;padding-bottom: 16px;">
				<div style="margin-top: 10px;">Copyright © 2017 版权所有 中国基础教育质量监测协同创新中心</div>
				<div style="line-height: 26px;margin-top: 10px;">电话：010-58801910&nbsp;&nbsp;
		</div>
		<!-- 必须保留声明 end -->
	</div>
	
	
	</div>
	<%@ include file="/WEB-INF/page/layouts/other.jsp"%>
<script type="text/javascript">
	resizeBodyWidth();
</script>
</body>
</html>