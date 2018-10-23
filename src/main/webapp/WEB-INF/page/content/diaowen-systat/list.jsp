<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/js/plugs/jquery-ui-1.10.3.custom/css/mycss/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="${ctx }/js/plugs/bootstrap-3.3.0-dist/dist/css/bootstrap.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<!-- <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css"> -->
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<!-- <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="${ctx }/js/plugs/bootstrap-3.3.0-dist/dist/js/bootstrap.js"></script>
<!-- <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> -->
<link href="${ctx }/js/plugs/font-awesome-4.2.0/css/font-awesome.css" rel="stylesheet">

<title>答卷情况</title>
<style type="text/css">
.surveyLeftBtnGroup a{
	color: #5A9ECD;
}
.btn-group{
	/* border: 1px solid #D1D1D1; */
}
.btn-group a{
	/* border-radius: 0px; */
	/* border-color: white; */
	color: #4da932;
}
.btn-group a:hover{
	background: #317BCF;
	color: white;
	border-color: #317BCF;
	border-color: #4f903c;
	background: #4f903c;
}
.btn-group>.btn:not(:first-child) {
	margin-left: -1px;
}

.contacts-table tr:hover td{
	background: #eff9ec;
}
.contacts-table tr td{
	font-size: 14px! important;
}
.dialogBtn1{
	border:none;
	font-size: 1em;
	font-weight:bold;
  	cursor: pointer;
  	padding: 8px 10px;
}
.dialogBtn1 .ui-button-text {
    padding: .4em 1em;
    display: block;
    line-height: normal;
}
.dialogBtn1Cencel{
	background: none;
}
.dialogBtn1Cencel:hover{
	background: #f6f6f6;
}
button {
	outline: none;
}

.dialogMessage select, .dialogMessage input {
    padding: 5px;
    color: #333333;
    border: 1px solid #98C5C3;
}
	.cur_a{
		color: grey;
	}
</style>
</head>
<body>
	<input type="hidden" id="id" name="id" value="${survey.id }">
	<div style="clear: both;"></div>
	<div id="dwBody" style="margin-top: 15px;">
		<div id="dwBodyContent" class="bodyCenter" style="">
		<div id="dwBodyUser">
			<div class="surveyCollectMiddle">
				<div class="surveyCollectMiddleContent">
					<div style="padding: 25px 45px;overflow: auto;padding-top: 20px;">

						<h3>${xxname}</h3>
						<hr/>
							<div style="padding: 5px;color: #666565;letter-spacing: 2px;">
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=2&isAnswer=0" class="answerState_20" style="outline: none;text-decoration: none;" ><i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;未完成家长</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=1&isAnswer=0" class="answerState_10" style="outline: none;text-decoration: none;" ><i class="fa fa-star-half-o" aria-hidden="true"></i>&nbsp;未完成学生</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=3&isAnswer=0" class="answerState_30" style="outline: none;text-decoration: none;" ><i class="fa fa-star-half-o" aria-hidden="true"></i>&nbsp;未完成教师</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=2&isAnswer=1" class="answerState_21" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成家长</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=1&isAnswer=1" class="answerState_11" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成学生</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=3&isAnswer=1" class="answerState_31" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成教师</a>
							</div>

						<form action="${ctx}/ans/answer-stat.action" method="post" >
							<div class="contacts_search" style="padding: 5px;color:#666565;display: none;" >
								<div style="padding-left: 20px;padding-top: 8px;padding-bottom: 8px;">
									<span style="font-size: 14px;vertical-align: middle;">准考证号&nbsp;</span>
									<input type="text" class="inputS1" name="surveyName" value="${surveyName}">
									&nbsp;&nbsp;&nbsp;
									<input type="submit" value="查询" class="sbtn25 sbtn25_1" style="font-size: 16px;"/>
								</div>
							</div>
						</form>

							<form action="${ctx}/ans/answer-stat.action" method="post" >
							<div class="contacts_search" style="padding: 5px;color:#666565;display: none;" >
								<div style="padding-left: 20px;padding-top: 8px;padding-bottom: 8px;">
									<span style="font-size: 14px;vertical-align: middle;">身份&nbsp;</span>
									<select name="surveyState" style="vertical-align: middle;">
										<option value="">不限</option>
										<option value="0">学生/家长</option>
										<option value="2">教师</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<span style="font-size: 14px;vertical-align: middle;">班级&nbsp;</span>
									<select name="surveyState" style="vertical-align: middle;">
										<option value="">不限</option>
										<option value="0">学生/家长</option>
										<option value="2">教师</option>
									</select>
									&nbsp;&nbsp;
									<span style="font-size: 14px;vertical-align: middle;">准考证号&nbsp;</span>
									<input type="text" class="inputS1" name="surveyName" value="${surveyName}">
									&nbsp;&nbsp;&nbsp;
									<input type="submit" value="查询" class="sbtn25 sbtn25_1" style="font-size: 16px;"/>
								</div>
								
							</div>
							</form>
							
							<div style="margin-top: 15px;">
								<div style="padding: 5px;color: #666565;">
									总计：${page.totalItems}&nbsp;条记录&nbsp;&nbsp;共${page.totalPage}页
									<span style="float: right;margin-right: 30px;"><a href="${ctx}/ans/answer-stat!exportNoAnswerUser.action?roleType=${roleType}&isAnswer=${isAnswer}" class=""><i class="fa fa-external-link" aria-hidden="true"></i>&nbsp;导出联系人</a></span>
								</div>
							<%--<div style="padding: 5px;color: #666565;text-align: right;">
								<a href="" class="export-contacts active"><span>&nbsp;</span>导出联系人</a>
							</div>--%>
							<div style="padding: 5px;color:#666565; ">
								<table class="contacts-table" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<th style="text-align: center;" width="30"><!-- <input type="checkbox">  --></th>
										<th align="left" width="160" >准考证号</th>
										<th align="left" width="120">姓名</th>
										<th align="left" width="200">学校</th>
										<%--<th align="left" width="200">代码</th>--%>
										<th align="left" width="60">班级</th>
										<th align="left" width="120">身份类型</th>
										<th align="left" width="120">状态</th>
										<%--<th align="center" width="100" style="padding-left: 10px;">卷子列表</th>--%>
									</tr>
									<c:choose>
									<c:when test="${page.totalItems > 0}">
									<c:forEach items="${page.result }" var="en">
									<tr>
										<td align="center">
											<input type="hidden" name='id' value="${en.id }">
										</td>
										<td align="left">${en.loginName}</td>
										<td align="left">${en.name }</td>
										<td align="left">${en.xxName}</td>
										<%--<td align="left">${en[3]}</td>--%>
										<td align="left">${en.bgId}</td>
										<td align="left" >
											${en.roleType eq 11 ? '小学生':en.roleType eq 13 ? '小学老师': en.roleType eq 14 ? '小学校长':en.roleType eq 21 ? '中学生':en.roleType eq 23 ? '中学老师':en.roleType eq 24 ? '中学生校长': en.roleType eq 90 ? '校长':'未知'}
											 ${roleType eq '2' ? "家长":""}
										</td>
										<td>
											<%--${en.roleType eq 0 ? '设计':en.surveyState eq 1?'收集':en.surveyState eq 2?'收集完成':'' }--%>
												<%--<a href="">详情</a>--%>
												<c:choose>
													<c:when test="${en.roleType eq 11 || en.roleType eq 21}">
														<c:choose>
															<c:when test="${roleType eq 2}">
																<c:choose>
																	<c:when test="${en.jzAnswer eq 1}">
																		<span style='color: white;background: #428861;padding: 2px 5px;'>家长已完成</span>
																	</c:when>
																	<c:otherwise>
																		<span style='color: white;background: #ff2da4;padding: 2px 5px;'>家长未完成</span>
																	</c:otherwise>
																</c:choose>
															</c:when>
															<c:otherwise>
																<c:choose>
																	<c:when test="${en.surveyFinal eq 1}">
																		<span style='color: white;background: #428861;padding: 2px 5px;'>
																		${en.roleType eq 11 ? '小学生':en.roleType eq 13 ? '小学老师': en.roleType eq 14 ? '小学校长':en.roleType eq 21 ? '中学生':en.roleType eq 23 ? '中学老师':en.roleType eq 24 ? '中学生校长': en.roleType eq 90 ? '校长':'未知'}
																		已完成</span>
																	</c:when>
																	<c:otherwise>
																		<span style='color: white;background: #ff2da4;padding: 2px 5px;'>
																		${en.roleType eq 11 ? '小学生':en.roleType eq 13 ? '小学老师': en.roleType eq 14 ? '小学校长':en.roleType eq 21 ? '中学生':en.roleType eq 23 ? '中学老师':en.roleType eq 24 ? '中学生校长': en.roleType eq 90 ? '校长':'未知'}
																		未完成</span>
																	</c:otherwise>
																</c:choose>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${en.surveyFinal eq 1}">
																		<span style='color: white;background: #428861;padding: 2px 5px;'>
																		${en.roleType eq 11 ? '小学生':en.roleType eq 13 ? '小学老师': en.roleType eq 14 ? '小学校长':en.roleType eq 21 ? '中学生':en.roleType eq 23 ? '中学老师':en.roleType eq 24 ? '中学生校长': en.roleType eq 90 ? '校长':'未知'}
																		已完成</span>
															</c:when>
															<c:otherwise>
																		<span style='color: white;background: #ff2da4;padding: 2px 5px;'>
																		${en.roleType eq 11 ? '小学生':en.roleType eq 13 ? '小学老师': en.roleType eq 14 ? '小学校长':en.roleType eq 21 ? '中学生':en.roleType eq 23 ? '中学老师':en.roleType eq 24 ? '中学生校长': en.roleType eq 90 ? '校长':'未知'}
																		未完成</span>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>

										</td>
									</tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">

												<div style="padding: 60px;font-size: 22px;text-align: center;color: #b1aeae;">没有找到相关数据！</div>

											</td>
										</tr>
									</c:otherwise>
									</c:choose>
								</table>
								<div style="padding-top: 15px;text-align: center;">
									<div class="btn-group">
										<c:if test="${page.pageNo > 1}">
											<a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${page.pageNo-1}&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default">&lt;</a>
										</c:if>
										<c:if test="${page.startpage > 1}">
											<a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=1&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default">1</a>
											<c:if test="${page.startpage > 2 }">
												<%--<span>...</span>--%>
												<a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${page.pageNo-1}&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default disabled">...</a>
											</c:if>
										</c:if>
										<c:forEach begin="${page.startpage }" end="${page.endpage }" var="en">
											<c:choose>
												<c:when test="${page.pageNo eq en }"><a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${en }&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default" style="background: #D3DEED;">${en }</a></c:when>
												<c:otherwise><a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${en}&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default">${en }</a></c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${page.totalPage > page.endpage}">
											<c:if test="${page.totalPage > (page.endpage+1)}">
												<%--<span>...</span>--%>
												<a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${page.pageNo-1}&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default disabled">...</a>
											</c:if>
										<a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${page.totalPage}&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default">${page.totalPage }</a>
										</c:if>
										<c:if test="${page.totalPage > page.pageNo}">
											<a href="${ctx }/ans/answer-stat!answerData.action?page.pageNo=${page.pageNo+1}&roleType=${roleType}&isAnswer=${isAnswer}" class="btn btn-default">&gt;</a>
										</c:if>

									</div>
								</div>
							</div>
							</div>
					</div>
					
				</div>
			</div>
			
		</div>
		</div>
	</div>
	
	<%--批量添加 --%>


<script type="text/javascript">

	currentMenu("join_yangben");

	<%--$("select[name='surveyState']").val("${surveyState}");--%>
	$(".answerState_${roleType}${isAnswer}").addClass("cur_a");

	var options={
		animation:true,
		delay:100,
		container:"body",
		trigger:'hover' //触发tooltip的事件
	};
	$('a[data-toggle=tooltip]').tooltip(options);

</script>
</body>
</html>