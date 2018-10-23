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


						<div class="contacts_search" style="padding: 5px;color:#666565;border-color: #a3c554;" >
							<div style="padding-left: 20px;padding-top: 8px;padding-bottom: 8px;font-size: 18px;color: #6cb158;">
								<%--亲爱的同学：<br/>--%>
									<div style="text-indent: 26px;">
										<h3>${user.city2}&nbsp;${user.city3}</h3>
										<hr/>
										<div class="n_item_1">
											<div><label style="color: #89b134;">总用户数：${totalUser+totalUserStu11+totalUserStu21}&nbsp;&nbsp;</label></div>
											<div class="n_detail_1" style="font-size: 14px;">
												<div>
													<label>小学生：${totalUserStu11}&nbsp;&nbsp;</label>
													<label>小学生家长：${totalUserStu11}&nbsp;&nbsp;</label>
													<label>小学教师：${totalUserTea13}&nbsp;&nbsp;</label>
												</div>
												<div>
													<label>中学生：${totalUserStu21}&nbsp;&nbsp;</label>
													<label>中学生家长：${totalUserStu21}&nbsp;&nbsp;</label>
													<label>中学教师：${totalUserTea23}&nbsp;&nbsp;</label>
												</div>
												<div>
													<label>小学校长：${totalUserXz14}</label>
													<label>中学校长：${totalUserXz24}</label>
													<font style="font-size: 14px;">（校长账号是由程序自动按每个学校10账号来生成的）</font>
												</div>
											</div>
										</div>

										<div class="n_item_1">
											<div>
												<label style="color: #89b134;">总参与人数：${joinUser}&nbsp;&nbsp;</label>
												<span>占比：
												<%--${joinUsersNum/schoolCountUser * 100}%--%>
													<fmt:formatNumber type="number" value="${(joinUser/(totalUser+totalUserStu11+totalUserStu21))*100 }" pattern="0.00" maxFractionDigits="2"/>%
												</span>
											</div>
											<div class="n_detail_1" style="font-size: 14px;">
												<div>
													<label>小学生：${joinUserStu11}&nbsp;&nbsp;</label>
													<label>小学生家长：${joinUserJz12}&nbsp;&nbsp;</label>
													<label>小学教师：${joinUserTea13}&nbsp;&nbsp;</label>
												</div>
												<div>
													<label>中学生：${joinUserStu21}&nbsp;&nbsp;</label>
													<label>中学生家长：${joinUserJz22}&nbsp;&nbsp;</label>
													<label>中学教师：${joinUserTea23}&nbsp;&nbsp;</label>
												</div>
												<div>
													<label>小学校长：${joinUserXz14}</label>
													<label>中学校长：${joinUserXz24}</label>
												</div>
											</div>
										</div>

										<div class="n_item_1">
											<div>
												<label style="color: #89b134;">总完成答卷份数：${answerSumTotle}&nbsp;&nbsp;</label>
												<%--<span>完成比：<fmt:formatNumber type="number" value="${joinUser/totalUserStu*4 }" pattern="0.00" maxFractionDigits="2"/>%%</span>--%>
											</div>
											<div class="n_detail_1" style="font-size: 14px;">
												<div>
													<label>小学生答卷数：${answerSumStu11}&nbsp;&nbsp;</label>
													<label>小学生家长答卷数：${answerSumJz12}&nbsp;&nbsp;</label>
													<label>小学教师答卷数：${answerSumTea13}&nbsp;&nbsp;</label>
												</div>
												<div>
													<label>中学生答卷数：${answerSumStu21}&nbsp;&nbsp;</label>
													<label>中学生家长答卷数：${answerSumJz22}&nbsp;&nbsp;</label>
													<label>中学教师答卷数：${answerSumTea23}&nbsp;&nbsp;</label>
												</div>
												<div>
													<label>小学校长答卷数：${answerSumXz14}</label>
													<label>中学校长答卷数：${answerSumXz24}</label>
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
	currentMenu("total_survey");
</script>
</body>
</html>