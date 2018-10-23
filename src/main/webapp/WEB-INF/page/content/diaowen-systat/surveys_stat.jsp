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

	<title>我的问卷</title>
	<style type="text/css">
		.surveyLeftBtnGroup a{
			color: #5A9ECD;
		}
		/*rgba(77, 169, 50, 0.37)*/
		.btn-group{
			/* border: 1px solid #D1D1D1; */
			border-color: #4f903c;
		}
		.btn-group a{
			/* border-radius: 0px; */
			/* border-color: white; */
			border-color: #4f903c;
			color: #4da932;
		}
		.btn-group a:hover{
			/*background: #317BCF;*/
			color: white;
			/*border-color: #317BCF;
			border-color: #4f903c;
			background: #4f903c;*/
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
		.head_use_name{
			width: auto!important;
		}
		a:hover{
			color: white;;
		}
		.sbtn25_1{
			background: white;
		}
		.sbtn25{
			padding: 0px 16px!important;
		}
		.contacts-table tr td{
			padding: 13px 0px!important;
		}
		.n_detail_1{
			padding-left: 16px;
			margin-top: 10px;
		}
		.n_item_1{
			margin: 10px;
			margin-top: 16px;
		}
		.n_detail_1 label{
			color: grey;;
			font-weight: normal;
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


						<div style="padding: 5px;color: #666565;letter-spacing: 2px;display: none;">
							<a href="${ctx }/ans/answer-stat.action?answerState=10" class="answerState_10" style="outline: none;text-decoration: none;" ><i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;总体进度</a>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="${ctx }/ans/answer-stat.action?answerState=10" class="answerState_10" style="outline: none;text-decoration: none;" ><i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;未填写家长</a>
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="${ctx }/ans/answer-stat.action?answerState=20" class="answerState_20" style="outline: none;text-decoration: none;" ><i class="fa fa-star-half-o" aria-hidden="true"></i>&nbsp;未填写学生</a>
							<%--&nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成家长</a>
                            &nbsp;&nbsp;|&nbsp;&nbsp;
                            <a href="" style="outline: none;text-decoration: none;" ><i class="fa fa-star" aria-hidden="true"></i>&nbsp;已经完成学生</a>
                            --%>
						</div>


						<div class="contacts_search" style="padding: 5px;color:#666565;border-color: #a3c554;" >
							<div style="padding-left: 20px;padding-top: 8px;padding-bottom: 8px;font-size: 18px;color: #6cb158;">
								<%--亲爱的同学：<br/>--%>
								<div style="text-indent: 26px;">
									<h3>郑州市郑东新区外国语学校</h3>
									<hr/>
									<div class="n_item_1">
										<div><label style="color: #89b134;">总用户数：${schoolCountUser}&nbsp;&nbsp;</label></div>
										<div class="n_detail_1" style="font-size: 14px;display: none;">
											<div>
												<label>小学生：&nbsp;&nbsp;</label>
												<label>小学教师：4337&nbsp;&nbsp;</label>
											</div>
											<div>
												<label>中学生：51281&nbsp;&nbsp;</label>
												<label>中学教师：5319</label>
											</div>
										</div>
									</div>
									<div class="n_item_1">
										<div>
											<label style="color: #89b134;">总参与人次：${joinUsersNum}&nbsp;&nbsp;</label>
											<span>占比：80%</span>
										</div>
										<div class="n_detail_1" style="font-size: 14px;display: none;">
											<div>
												<label>小学生：68348&nbsp;&nbsp;</label>
												<label>小学家长：68348&nbsp;&nbsp;</label>
												<label>小学教师：4337&nbsp;&nbsp;</label>
											</div>
											<div>
												<label>中学生：51281&nbsp;&nbsp;</label>
												<label>中学家长：5319</label>
												<label>中学教师：5319</label>
											</div>
										</div>
									</div>

									<div class="n_item_1">
										<div>
											<label style="color: #89b134;">总收集到答卷份数：${answerUsersNum}&nbsp;&nbsp;</label>
											<span>完成比：80%</span>
										</div>
										<div class="n_detail_1" style="font-size: 14px;display: none;">
											<div>
												<label>小学生答卷数：68348&nbsp;&nbsp;</label>
												<label>小学家长答卷数：68348&nbsp;&nbsp;</label>
												<label>小学教师答卷数：4337&nbsp;&nbsp;</label>
											</div>
											<div>
												<label>中学生答卷数：51281&nbsp;&nbsp;</label>
												<label>中学家长答卷数：5319</label>
												<label>中学教师答卷数：5319</label>
											</div>
										</div>
									</div>


								</div>
							</div>
						</div>
						<div style="margin-top: 15px;display: none;">
							<!-- <div style="padding: 5px;color: #666565;text-align: right;">
								<a href="" class="export-contacts active"><span>&nbsp;</span>导出联系人</a>
							</div> -->
							<div style="padding: 5px;color:#666565; ">
								<table class="contacts-table" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<th style="text-align: center;" width="60">序号</th>
										<th align="left" >问卷标题</th>
										<%--<th align="left" width="300">截止时间</th>--%>
										<th align="left" width="80">状态</th>
										<th align="center" width="160" style="text-align: center;">操作</th>
									</tr>

									<c:forEach items="${surveys }" var="en" varStatus="i">

										<tr id="survey_${en.id}">
											<td align="center">
												<input type="hidden" name='surveyId' value="${en.id }">
													${i.count}
											</td>
											<td align="left">${en.surveyName }</td>
												<%--<td align="left">
                                                    <fmt:formatDate value="${en.createDate }" pattern="yyyy年MM月dd日 HH时mm分"/>
                                                </td>--%>
											<td align="left" class="answerStatus" >
												未回答
											</td>
											<td align="center" class="answerEvent">
												<a target="_blank" href="${ctx }/wenjuan/${en.sid }.html" class="sbtn25 sbtn25_1">作答详情</a>
											</td>
										</tr>

									</c:forEach>

								</table>
								<%--
								<div style="padding-top: 15px;text-align: center;">
									<div class="btn-group">
										<c:if test="${page.pageNo > 1}">
											<a href="${ctx }/design/my-survey.action?page.pageNo=${page.pageNo-1}" class="btn btn-default">&lt;</a>
										</c:if>
										<c:if test="${page.startpage > 1}">
											<a href="${ctx }/design/my-survey.action?page.pageNo=1" class="btn btn-default">1</a>
											<c:if test="${page.startpage > 2 }">
												<span>...</span>
											</c:if>
										</c:if>
										<c:forEach begin="${page.startpage }" end="${page.endpage }" var="en">
											<c:choose>
												<c:when test="${page.pageNo eq en }"><a href="${ctx }/design/my-survey.action?page.pageNo=${en }" class="btn btn-default" style="background: #4f903c;color: white;">${en }</a></c:when>
												<c:otherwise><a href="${ctx }/design/my-survey.action?page.pageNo=${en}" class="btn btn-default">${en }</a></c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${page.totalPage > (page.endpage)}">
											<c:if test="${page.totalPage > (page.endpage+1)}">
												<span>...</span>
											</c:if>
											<a href="${ctx }/design/my-survey.action?page.pageNo=${page.totalPage}" class="btn btn-default">${page.totalPage }</a>
										</c:if>
										<c:if test="${page.totalPage > page.pageNo}">
											<a href="${ctx }/design/my-survey.action?page.pageNo=${page.pageNo+1}" class="btn btn-default">&gt;</a>
										</c:if>

									</div>
								</div>
								--%>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
</div>

<div>

</div>
<%--批量添加 --%>
<%--
<c:forEach items="${surveyAnswers}" var="en">
	<input type="hidden" class="surveyAnswersId" value="${en.surveyId}" >
</c:forEach>
--%>
<%--
<script type="application/javascript">
	$(document).ready(function(){
		var surveyAnswersIds = $(".surveyAnswersId");
		$.each(surveyAnswersIds,function(item,i){
			var surveyAnswerTr = $("#survey_"+$(this).val());
			//alert("#survey_"+$(this).val());
			surveyAnswerTr.find(".answerStatus").html("<span style='color:#25bfc3;'>已回答</span>");
			surveyAnswerTr.find(".answerEvent").html("");
		})
	})
</script>
--%>

<script type="text/javascript">
	currentMenu("survey_center");
</script>
</body>
</html>