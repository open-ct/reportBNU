<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/js/plugs/jquery-ui-1.10.3.custom/css/mycss/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<script src="${ctx }/js/plugs/jquery-ui-1.10.3.custom/js/jquery-1.10.1.js" type="text/javascript" ></script>

	<link href="${ctx}/js/plugs/validate/jquery.validate.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/js/plugs/font-awesome-4.2.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/js/plugs/validate/jquery.validate.js" type="text/javascript"></script>
	<script src="${ctx}/js/plugs/validate/messages_cn.js" type="text/javascript"></script>
	<script src="${ctx }/js/plugs/validate/jquery.metadata.js" type="text/javascript"></script>
	<script src="${ctx }/js/common/common.js" type="text/javascript"></script>
<title>信息确认</title>
<script type="text/javascript">
</script>
<style type="text/css" >
    td.ac-input-td{
       color:#14170e!important;
		text-align: left;
    }
</style>
</head>
<body>
	<input type="hidden" id="id" name="id" value="${survey.id }">
	
	<div style="margin-top: 15px;">
		<div class="main-tabs-content bodyCenter" >
			<div class="tab-content">
				<div class="tab-content-collectTab" style="text-align: left;">
					<%--<a href="" class="nav_a">信息确认</a>--%>
				</div>
			</div>
		</div>
	</div>


	<div style="clear: both;"></div>
	<div id="dwBody" >
		<div id="dwBodyContent" class="" style="width: 560px;margin-top: 80px;">

			<div id="dwBodyUser">
			<div class="surveyCollectMiddle">


				<div class="surveyCollectMiddleContent">
					<div style="padding: 25px 45px;overflow: auto;padding-top: 35px;">



						<div style="padding: 5px;color: #666565;">
							<h3 style="text-align: center;padding-bottom: 8px;letter-spacing: 4px;border-bottom: 1px solid grey;">信息确认</h3>
						</div>

						<%--<div style="border: 1px dashed #a3c554;color: #a3c554;font-size: 16px;padding: 8px;border-radius: 3px;background: white;">
							亲爱的同学，请先确认以下准考信息的正确！
						</div>--%>


						<div style="padding: 5px;color:#666565;">
								<form id="input_form" action="${ctx }/c/survey.action" method="post" >
								<table class="ac-form-table" style="">
									<tr>
										<td width="180" align="right">角色</td>
										<td class="ac-input-td">${roleType eq 11 ? '小学生':roleType eq 12 ? '小学生家长':roleType eq 13 ? '小学老师': roleType eq 14 ? '小学校长':roleType eq 21 ? '中学生':roleType eq 22 ? '中学生家长':roleType eq 23 ? '中学老师':roleType eq 24 ? '中学生校长': roleType eq 90 ? '校长':'未知'}</td>
									</tr>
									<tr>
										<td width="180" align="right">准考证号</td>
										<td class="ac-input-td">${user.loginName }</td>
									</tr>
									<tr>
										<td width="180" align="right">姓名</td>
										<td class="ac-input-td">${user.name }</td>
									</tr>
									<%--<tr>--%>
										<%--<td width="80" align="right">地区</td>--%>
										<%--<td class="ac-input-td">郑有</td>--%>
									<%--</tr>--%>
									<tr>
										<td width="180" align="right">学校</td>
										<td class="ac-input-td">${user.xxName }</td>
									</tr>
									<%--
									<c:choose>
										<c:when test="${(user.roleType>20 && user.roleType<24 ) || (user.roleType>10 && user.roleType<14)}">
											<tr>
												<td width="180" align="right">班级</td>
												<td class="ac-input-td">${user.bgName}</td>
											</tr>
										</c:when>
									</c:choose>
									--%>
									<tr>
										<td align="right">
											<button type="submit" class="sbtn25 sbtn25_1" > <i class="fa fa-check" aria-hidden="true"></i> 确认登录 </button>
										</td>
										<td class="ac-input-td" colspan="2" align="left" >
                                            <a href="${ctx}/login!logout.action" class="sbtn25 sbtn25_1 sbtn25_1_1" ><i class="fa fa-times" aria-hidden="true"></i> 重新登录</a>
										</td>
									</tr>
								</table>
								</form>
							</div>

					</div>
					
				</div>
			</div>
			
		</div>
		</div>
	</div>
<script type="text/javascript">

</script>
</body>
</html>