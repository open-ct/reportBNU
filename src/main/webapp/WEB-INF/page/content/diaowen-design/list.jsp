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

<title>我的报告</title>
<style type="text/css">
.reportLeftBtnGroup a{
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
</style>
</head>
<body>
	<input type="hidden" id="id" name="id" value="${report.id }">
	<div style="clear: both;"></div>
	<div id="dwBody" style="margin-top: 15px;">
		<div id="dwBodyContent" class="bodyCenter" style="">
		<div id="dwBodyUser">
			<div class="reportCollectMiddle">
				<div class="reportCollectMiddleContent">
					<div style="padding: 25px 45px;overflow: auto;padding-top: 20px;">
							<div style="padding: 5px;color: #666565;letter-spacing: 2px;">
							所有报告&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="${ctx }/design/my-report-create!save.action" id="reportAdd-a" style="outline: none;text-decoration: none;" ><i class="fa fa-plus " aria-hidden="true"></i>&nbsp;新建报告</a>
							</div>

							<form action="${ctx}/design/my-report.action" method="post" >
							<div class="contacts_search" style="padding: 5px;color:#666565;" >
								<div style="padding-left: 20px;padding-top: 8px;padding-bottom: 8px;">
									<span style="font-size: 14px;vertical-align: middle;">状态&nbsp;</span>
									<select name="reportState" style="vertical-align: middle;">  <option value="">不限</option><option value="0">设计</option><option value="1">发布</option><option value="2">结束</option> </select>
									&nbsp;&nbsp;
									<span style="font-size: 14px;vertical-align: middle;">名称&nbsp;</span>
									<input type="text" class="inputS1" name="reportName" value="${reportName}">
									&nbsp;&nbsp;&nbsp;
									<input type="submit" value="查询" class="sbtn25 sbtn25_1" style="font-size: 16px;"/>
								</div>
								
							</div>
							</form>
							
							<div style="margin-top: 15px;">
							<div style="padding: 5px;color: #666565;text-align: right;">
								<a href="" class="export-contacts active"><span>&nbsp;</span>导出联系人</a>
							</div>
							<div style="padding: 5px;color:#666565; ">
								<table class="contacts-table" width="100%" cellpadding="0" cellspacing="0">
									<tr>
										<th style="text-align: center;" width="30"><!-- <input type="checkbox">  --></th>
										<th align="left" >报告</th>
										<th align="left" width="100">创建者</th>
										<th align="left" width="200">创建时间</th>
										<th align="left" width="60">类型</th>
										<th align="left" width="80">状态</th>
										<th align="center" width="260" style="padding-left: 10px;">操作</th>
									</tr>
									<c:choose>
									<c:when test="${page.totalItems > 0}">
									<c:forEach items="${page.result }" var="en">
									<tr>
										<td align="center">
											<input type="hidden" name='reportId' value="${en.id }">
											<input type="hidden" name='reportType' value="${en.reportType }">
											<input type="hidden" name='orderbyNum' value="${en.orderbyNum }">
										</td>
										<td align="left"><a target="_blank" href="${ctx }/wenjuan/${en.sid }.html" class="titleTag">${en.reportName }</a></td>
										<td align="left" width="100" >${en.userName }</td>
										<td align="left">
											<fmt:formatDate value="${en.createDate }" pattern="yyyy年MM月dd日 HH:mm"/>
										</td>
										<td align="left">0&nbsp;</td>
										<td align="left" >
											${en.reportState eq 0 ? '设计':en.reportState eq 1?'收集':en.reportState eq 2?'收集完成':'' }
										</td>
										<td align="left">
											<div class="btn-group reportLeftBtnGroup">
											  <a class="btn btn-default" href="${ctx }/design/my-report-design.action?reportId=${en.id}" title="设计"data-toggle="tooltip" data-placement="top" ><i class="fa fa-pencil-square-o"></i></a>
											  <a class="btn btn-default" href="${ctx }/design/my-collect.action?reportId=${en.id}" title="预览" data-toggle="tooltip" data-placement="top" ><i class="fa fa-comments-o"></i></a>
											  <a class="btn btn-default" href="${ctx }/da/report-report!defaultReport.action?reportId=${en.id}" title="导出PDF" data-toggle="tooltip" data-placement="top" ><i class="fa fa-line-chart"></i></a>
											  <a class="btn btn-default attrSurvey" href="#${en.id}" title="属生设置" data-toggle="tooltip" data-placement="top" ><i class="fa fa-cog" aria-hidden="true"></i></a>
											  <a class="btn btn-default copySurvey" href="#${en.id}" title="复制一份" data-toggle="tooltip" data-placement="top" ><i class="fa fa-files-o"></i></a>
											  <a class="btn btn-default deleteSurvey" href="${ctx}/design/my-report!delete.action?id=${en.id}" title="删除报告" data-toggle="tooltip" data-placement="top" ><i class="fa fa-trash-o fa-fw"></i></a>
											</div>&nbsp;
											<div class="btn-group" style="display: none;">
												<!-- <a class="btn btn-default" href="#"><i class="fa fa-eye"></i></a> -->
											    <a class="btn btn-default" href="#"><i class="fa fa-trash-o fa-fw"></i></a>
											</div>
										</td>
									</tr>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">

												<div style="padding: 60px;font-size: 22px;text-align: center;color: #b1aeae;">还没有数据！</div>

											</td>
										</tr>
									</c:otherwise>
									</c:choose>
								</table>
								<div style="padding-top: 15px;text-align: center;">
									<div class="btn-group">
										<c:if test="${page.pageNo > 1}">
											<a href="${ctx }/design/my-report.action?page.pageNo=${page.pageNo-1}" class="btn btn-default">&lt;</a>
										</c:if>
										<c:if test="${page.startpage > 1}">
											<a href="${ctx }/design/my-report.action?page.pageNo=1" class="btn btn-default">1</a>
											<c:if test="${page.startpage > 2 }">
												<span>...</span>
											</c:if>
										</c:if>
										<c:forEach begin="${page.startpage }" end="${page.endpage }" var="en">
											<c:choose>
												<c:when test="${page.pageNo eq en }"><a href="${ctx }/design/my-report.action?page.pageNo=${en }" class="btn btn-default" style="background: #D3DEED;">${en }</a></c:when>
												<c:otherwise><a href="${ctx }/design/my-report.action?page.pageNo=${en}" class="btn btn-default">${en }</a></c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${page.totalPage > (page.endpage)}">
											<c:if test="${page.totalPage > (page.endpage+1)}">
												<span>...</span>
											</c:if>
											<a href="${ctx }/design/my-report.action?page.pageNo=${page.totalPage}" class="btn btn-default">${page.totalPage }</a>
										</c:if>
										<c:if test="${page.totalPage > page.pageNo}">
											<a href="${ctx }/design/my-report.action?page.pageNo=${page.pageNo+1}" class="btn btn-default">&gt;</a>
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

	currentMenu("myreport");

	$("select[name='reportState']").val("${reportState}");

var options={
		animation:true,
		delay:100,
		container:"body",
		trigger:'hover' //触发tooltip的事件
	};
$('a[data-toggle=tooltip]').tooltip(options);

//delete
$(".deleteSurvey").click(function(){
	if(confirm("确认删除吗？")){
		var th=$(this);
		var url=$(this).attr("href");
		var data="";
		$.ajax({
			url:url,
			data:data,
			type:"post",
			success:function(msg){
				if(msg==="true"){
					th.parents("tr").hide("slow");
					th.parents("tr").remove();
				}else{
					alert("删除失败，未登录或没有权限！");
				}
			}
		});
	}
	return false;
});

$(".copySurvey").click(function(){

	var reportId=$(this).parents("tr").find("input[name='reportId']").val();
	var titleValue=$(this).parents("tr").find(".titleTag").text();
	var model_groupId1=$(this).parents("tr").find("input[name='groupId1']").val();
	var model_groupId2=$(this).parents("tr").find("input[name='groupId2']").val();

	$("body").append("<div id=\"myDialogRoot\"><div class='dialogMessage' style='padding-top:40px;margin-left:20px;padding-bottom:0px;'>"+
			"<div>复制标题：<input id='surTitleTemp' type='text' style='padding:3px;width:320px;color:rgb(14, 136, 158);' value=''></div></div></div>");

	var myDialog=$( "#myDialogRoot" ).dialog({
		width:500,
		height:220,
		autoOpen: true,
		modal:true,
		position:["center","center"],
		title:"复制报告、表单",
		resizable:false,
		draggable:false,
		closeOnEscape:false,
		show: {effect:"blind",direction:"up",duration: 500},
		hide: {effect:"blind",direction:"left",duration: 200},
		buttons: {
			"OK":{
				text: "确认复制",
				addClass:'dialogMessageButton dialogBtn1',
				click: function() {
					//执行发布
					var reportName=$("#surTitleTemp").val();
					reportName=optionValue=escape(encodeURIComponent(reportName));

					var params="reportName="+reportName;
					params+="&fromBankId="+reportId;
					window.location.href="${ctx}/design/my-report-design!copySurvey.action?"+params;
				}
			},
			"CENCEL":{
				text: "取消",
				addClass:"dialogBtn1 dialogBtn1Cencel",
				click: function() {
					$( this ).dialog( "close" );
				}
			}
		},
		open:function(event,ui){
			$(".ui-dialog-titlebar-close").hide();
			$("#surTitleTemp").val(titleValue+"－副本");
		},
		close:function(event,ui){
			$("#myDialogRoot").remove();
		}
	});
});

$("#reportAdd-a").click(function(){
	
	var reportId=$(this).parents("tr").find("input[name='reportId']").val();
	var titleValue=$(this).parents("tr").find(".titleTag").text();
	

	
	$("body").append("<div id=\"myDialogRoot\"><div class='dialogMessage' style='padding-top:40px;margin-left:20px;padding-bottom:0px;'>"+
			"<div>报告标题：<input id='surTitleTemp' type='text' style='padding:5px;width:320px;color:rgb(14, 136, 158);' value=''></div></div></div>");

	var myDialog=$( "#myDialogRoot" ).dialog({
		width:500,
		height:220,
		autoOpen: true,
		modal:true,
		position:["center","center"],
		title:"新建报告、表单",
		resizable:false,
		draggable:false,
		closeOnEscape:false,
		show: {effect:"blind",direction:"up",duration: 500},
		hide: {effect:"blind",direction:"left",duration: 200},
		buttons: {
			"OK":{
	            text: "确认新建",
	            addClass:'dialogMessageButton dialogBtn1',
	            click: function() {
	                //执行发布
	                var reportName=$("#surTitleTemp").val();
	                reportName=optionValue=escape(encodeURIComponent(reportName));

	                var params="reportName="+reportName;
	            	window.location.href="${ctx}/design/my-report-create!save.action?"+params;
	            }
			},
			"CENCEL":{
	            text: "取消",
	            addClass:"dialogBtn1 dialogBtn1Cencel",
	            click: function() {
	              $( this ).dialog( "close" );
	            }
			}
		},
		open:function(event,ui){
			$(".ui-dialog-titlebar-close").hide();
			$("#surTitleTemp").val(titleValue+"");
		},
		close:function(event,ui){
			$("#myDialogRoot").remove();
		}
	});
	return false;
});


	$(".attrSurvey").click(function(){

		var reportId=$(this).parents("tr").find("input[name='reportId']").val();
		var reportType = $(this).parents("tr").find("input[name='reportType']");
		var reportTypeValue=$(this).parents("tr").find("input[name='reportType']").val();
		var titleValue=$(this).parents("tr").find(".titleTag").text();
		var model_groupId1=$(this).parents("tr").find("input[name='groupId1']").val();
		var model_groupId2=$(this).parents("tr").find("input[name='groupId2']").val();

		var orderbyNum = $(this).parents("tr").find("input[name='orderbyNum']");
		var orderbyNumValue = orderbyNum.val();

		$("body").append("<div id=\"myDialogRoot\"><div class='dialogMessage' style='padding-top:40px;margin-left:20px;padding-bottom:0px;'>"+
				"<div>报告标题：<input id='surTitleTemp' type='text' style='padding:3px;width:320px;color:rgb(14, 136, 158);' value=''></div>" +
				"<div style='margin-top: 12px;'>排序编号：<input id='orderbyNumTemp' type='text' style='padding:3px;width:320px;color:rgb(14, 136, 158);' value=''></div>" +
				"<div style='margin-top: 12px;'>报告分类：<select id='reportTypeTemp'> <option>-请选择属属分类-</option>" +
				"<option value='1'>基础数据报告</option>" +
				"<option value='2'>学科报告</option>" +
				"<option value='3'>专题研究报告</option>" +
				"<option value='4'>综合评估报告</option>" +
				"<option value='5'>影响因素报告</option>" +
				"</select></div></div></div>");

		var myDialog=$( "#myDialogRoot" ).dialog({
			width:500,
			height:260,
			autoOpen: true,
			modal:true,
			position:["center","center"],
			title:"报告分类设置",
			resizable:false,
			draggable:false,
			closeOnEscape:false,
			show: {effect:"blind",direction:"up",duration: 500},
			hide: {effect:"blind",direction:"left",duration: 200},
			buttons: {
				"OK":{
					text: "确认",
					addClass:'dialogMessageButton dialogBtn1',
					click: function() {
						//执行发布
						var reportName=$("#surTitleTemp").val();
						reportName=optionValue=escape(encodeURIComponent(reportName));
						var reportTypeTemp = $("#reportTypeTemp").val();
						var orderbyNumTemp = $("#orderbyNumTemp").val();
						if(reportTypeTemp!=null && reportTypeTemp!=""){
							var params="reportName="+reportName;
							params+="&reportType="+reportTypeTemp;
							params+="&orderbyNum="+orderbyNumTemp;
							params+="&id="+reportId;
							//window.location.href="${ctx}/c/report!save.action?"+params;
							var url = "${ctx}/c/report!save.action";
							$.ajax({
								url:url,
								data:params,
								type:"post",
								success:function(msg){
									if(msg=="true"){
										reportType.val(reportTypeTemp);
										orderbyNum.val(orderbyNumTemp);
										$( "#myDialogRoot" ).dialog( "close" );
									}else{
										alert("保存失败！");
									}
								}
							});
						}else{
							alert("请选择分类");
						}
					}
				},
				"CENCEL":{
					text: "取消",
					addClass:"dialogBtn1 dialogBtn1Cencel",
					click: function() {
						$( this ).dialog( "close" );
					}
				}
			},
			open:function(event,ui){
				$(".ui-dialog-titlebar-close").hide();
				$("#surTitleTemp").val(titleValue);
				$("#reportTypeTemp").val(reportTypeValue);
				$("#orderbyNumTemp").val(orderbyNumValue);
			},
			close:function(event,ui){
				$("#myDialogRoot").remove();
			}
		});
	});

function setSelectText(el) {
    try {
        window.getSelection().selectAllChildren(el[0]); //全选
        window.getSelection().collapseToEnd(el[0]); //光标置后
    } catch (err) {
        //在此处理错误
    }
}


</script>
</body>
</html>