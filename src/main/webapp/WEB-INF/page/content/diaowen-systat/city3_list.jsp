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
	.tr_warnCl td{
		color: red;
		background: #ffdfdc;
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

						<h3>${user.city2}&nbsp;${user.city3}&nbsp;${cityAnswerStat.cityName}</h3>
						<div id="notice">
							<h4>此列表数据将在每日0:00、12:00、18:00更新。</br>如需查看实时数据，请点击对应学校行的刷新实时数据；</br>如需查看区域所有学校实时数据，请进入区域并点击下方的刷新所有数据（此操作需要一定时间，请耐心等待）</h4>
							<c:if test="${searchType eq 2}">
								<a href="${ctx}/ans/answer-stat!refreshAll.action?cityId=${cityId}">刷新所有数据</a>
							</c:if>
						</div>
						<hr/>
							<div style="padding: 5px;color: #666565;letter-spacing: 2px;display: none;">
								<%--<a href="${ctx }/ans/answer-stat!answerData.action?roleType=2&isAnswer=0" class="answerState_20" style="outline: none;text-decoration: none;" ><i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;未完成家长</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=1&isAnswer=0" class="answerState_10" style="outline: none;text-decoration: none;" ><i class="fa fa-star-half-o" aria-hidden="true"></i>&nbsp;未完成学生</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=3&isAnswer=0" class="answerState_30" style="outline: none;text-decoration: none;" ><i class="fa fa-star-half-o" aria-hidden="true"></i>&nbsp;未完成教师</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=2&isAnswer=1" class="answerState_21" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成家长</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=1&isAnswer=1" class="answerState_11" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成学生</a>
								&nbsp;|&nbsp;
								<a href="${ctx }/ans/answer-stat!answerData.action?roleType=3&isAnswer=1" class="answerState_31" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成教师</a>--%>
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
							
							<div style="margin-top: 5px;">
								<div style="padding: 5px;color: #666565;">
									<%--总计：${list.length}&nbsp;条记录&nbsp;&nbsp;共${page.totalPage}页--%>
									<%--<span style="float: right;margin-right: 30px;"><a href="${ctx}/ans/answer-stat!exportNoAnswerUser.action?roleType=${roleType}&isAnswer=${isAnswer}" class=""><i class="fa fa-external-link" aria-hidden="true"></i>&nbsp;导出联系人</a></span>--%>
									<%--
										<c:if test="${!empty cityAnswerStat }">
										<label style="color: #89b134;">总用户数：${cityAnswerStat.totalUser+cityAnswerStat.totalUserStu11+cityAnswerStat.totalUserStu21}&nbsp;&nbsp;</label>&nbsp;&nbsp;
										<label style="color: #89b134;">总参与人数：${cityAnswerStat.joinUser}&nbsp;&nbsp;</label>
										占比：<fmt:formatNumber type="number" value="${(cityAnswerStat.joinUser/(cityAnswerStat.totalUser+cityAnswerStat.totalUserStu11+cityAnswerStat.totalUserStu21))*100 }" pattern="0.00" maxFractionDigits="2"/>%&nbsp;&nbsp;&nbsp;&nbsp;
										<label style="color: #89b134;">总完成答卷份数：${cityAnswerStat.answerSumTotle}&nbsp;&nbsp;</label>
										</c:if>
									--%>
								</div>
							<%--<div style="padding: 5px;color: #666565;text-align: right;">
								<a href="" class="export-contacts active"><span>&nbsp;</span>导出联系人</a>
							</div>--%>
							<div style="padding: 5px;color:#666565; ">
								<table class="contacts-table" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<th style="text-align: center;" width="30"><!-- <input type="checkbox">  --></th>
										<th align="left" width="" >地区代码</th>
										<th align="left" width="">地区名称</th>
										<th align="left" width="">总用户数</th>
										<%--<th align="left" width="200">代码</th>--%>
										<th align="left" width="">总参与人数</th>
										<th align="left" width="">总完成答卷份数</th>
										<th align="left" width="">参与百分比</th>
										<%--<th align="center" width="100" style="padding-left: 10px;">卷子列表</th>--%>
										<th align="left" width="">查看</th>
										<c:if test="${searchType eq 2}">
											<th align="left" width="">操作</th>
										</c:if>
									</tr>
									<c:forEach items="${lists }" var="en">
										<tr class="${(en.joinUser/(en.totalUser+en.totalUserStu11+en.totalUserStu21))*100 < 50 ? 'tr_warnCl':'' }">
											<td align="center">
												<input type="hidden" name='id' value="${en.id }">
											</td>
											<td align="left">${en.cityId}</td>
											<td align="left">${en.cityName }</td>
											<c:if test="${en.cityId eq schoolId}">
												<td align="left">${userNum}</td>
												<td align="left">${joinUserNum}</td>
												<td align="left" >${joinSurveyNum}</td>
												<td align="left" >
													<fmt:formatNumber type="number" value="${(joinUserNum/userNum)*100 }" pattern="0.00" maxFractionDigits="2"/>%
												</td>
											</c:if>
											<c:if test="${en.cityId ne schoolId}">
												<td align="left">${en.totalUser+en.totalUserStu11+en.totalUserStu21}</td>
												<td align="left">${en.joinUser}</td>
												<td align="left" >${en.answerSumTotle}</td>
												<td align="left" >
													<fmt:formatNumber type="number" value="${(en.joinUser/(en.totalUser+en.totalUserStu11+en.totalUserStu21))*100 }" pattern="0.00" maxFractionDigits="2"/>%
												</td>
											</c:if>
											<c:if test="${searchType eq 1}">
												<td>
													<a href="${ctx}/ans/answer-stat!answerList.action?cityId=${en.cityId}">详情</a>
												</td>
											</c:if>
											<c:if test="${searchType eq 2}">
												<td>
													<a href="${ctx}/ans/answer-stat!exportNoAnswerUser.action?schoolId=${en.cityId}">导出未完成用户</a>
												</td>
												<td>
													<a href="${ctx}/ans/answer-stat!refresh.action?schoolId=${en.cityId}&cityId=${cityId}">刷新实时数据</a>
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</table>
								<div style="padding-top: 15px;text-align: center;display: none;">
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