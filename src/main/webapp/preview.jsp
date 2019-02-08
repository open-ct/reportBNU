<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>预览报告</title>
    <link rel="icon" href="img/favicon.ico" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name=viewport content="width=device-width, initial-scale=1" />
    <link href="${ctx }/semantic/dist/semantic.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="${ctx }/css/main.css" rel="stylesheet" />
    <link href="${ctx }/plugins/datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/weather-icons/css/weather-icons-wind.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/weather-icons/css/weather-icons.min.css" rel="stylesheet" />
    <link href="${ctx }/plugins/chartist/chartist.min.css" rel="stylesheet" />
    <link href="${ctx }/css/chat-page.css" rel="stylesheet" />
    <link href="${ctx }/css/predisplay.css" rel="stylesheet" />
    <link rel="shortcut icon" href="${ctx }/img/favicon.ico" />
    
    <style id="tablesort">table.sortEnabled tr.firstRow th,table.sortEnabled tr.firstRow td{padding-right:20px;background-repeat: no-repeat;background-position: center right;   background-image:url(https://ueditor.baidu.com/ueditor/themes/default/images/sortable.png);}</style>
	<style id="table">.selectTdClass{background-color:#edf5fa !important}table.noBorderTable td,table.noBorderTable th,table.noBorderTable caption{border:1px dashed #ddd !important}table{margin-bottom:10px;border-collapse:collapse;display:table;}td,th{min-width:18px;}caption{border:1px dashed #DDD;border-bottom:0;padding:3px;text-align:center;}th{border-top:1px solid #BBB;background-color:#F7F7F7;}table tr.firstRow th{border-top-width:2px;}.ue-table-interlace-color-single{ background-color: #fcfcfc; } .ue-table-interlace-color-double{ background-color: #f7faff; }td p{margin:0;padding:0;}</style>
	<link href="${ctx }/js/plugs/font-awesome-4.2.0/css/font-awesome.css" rel="stylesheet">
</head>

<body>
            <!--maincontent-->
            	<!--Site Content-->
            	<div class="ui equal width left aligned padded grid stackable" >
                	<div class="row">
                    	<div class="sixteen wide column">
                			<div class="ui segments"  id="paper">
                				<table class="ui segment" id="father" style="word-wrap:break-word" border="0">
                					<tr style="height:72pt"><td style="width:90pt;" border="0"></td><td style="width:414pt" border="0"></td><td style="width:60pt" border="0"></td><td style="width:500pt" border="0"></td><td style="width:90pt;" border="0"></td></tr>
                				</table>
                				<div style="text-align: center">
                				<a class="ui green button" onclick="saveComment()" style="margin: 0 auto">
                        				确定
                        		</a>
                				</div>
                			</div>
                		</div>
                	</div>
                </div>
                <!--Site Content-->
            <!--maincontent-->
    <!--jquery-->
    <script src="${ctx }/js/jquery-2.1.4.min.js"></script>
    <!--jquery-->
    <!--semantic-->
    <script src="${ctx }/semantic/dist/semantic.min.js"></script>
    <!--semantic-->
    <!--counter number-->
    <script src="${ctx }/plugins/counterup/jquery.counterup.min.js"></script>
    <script src="${ctx }/plugins/counterup/waypoints.min.js"></script>
    <!--counter number-->
    <!--flot chart-->
    <script src="${ctx }/plugins/flot/jquery.flot.js"></script>
    <script src="${ctx }/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="${ctx }/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${ctx }/plugins/flot/curvedLines.js"></script>
    <script src="${ctx }/plugins/cookie/js.cookie.js"></script>
    <!--flot chart-->
    <!--chartjs chart-->
    <script src="${ctx }/plugins/chartjs/chart.min.js"></script>
    <!--chartjs chart-->

    <script src="${ctx }/plugins/nicescrool/jquery.nicescroll.min.js"></script>

    <script data-pace-options='{ "ajax": false }' src="${ctx }/plugins/pacejs/pace.js"></script>

    <script src="${ctx }/plugins/chartist/chartist.min.js"></script>

    <script src="${ctx }/js/dashboard2.js"></script>
    <script src="${ctx }/js/main.js"></script>
    
    <script type="text/javascript">
    	var jsonData="";
    
    	window.onload=function(){
    		var data="${data}".split(',');
    		//var jsonData="";
    		for(var i=0;i<data.length-1;i++) jsonData+=String.fromCharCode(data[i]);
    		jsonData=JSON.parse(jsonData);
    		var faza=document.getElementById("father");
    		var cnt=0;
    		for(i in jsonData){
    			cnt++;
    			
    			
    			//insert cells
    			var nrow=faza.insertRow(cnt);
    			var tfst=nrow.insertCell(0);
    			tfst.setAttribute("border","0");
    			var tcontent=nrow.insertCell(1);
    			tcontent.setAttribute("border","0");
    			var tlamp=nrow.insertCell(2);
    			tlamp.setAttribute("border","0");
    			var tcomment=nrow.insertCell(3);
    			tcomment.setAttribute("border","0");
    			var tbound=nrow.insertCell(4);
    			tbound.setAttribute("border","0");
    			
    			//set class(to get css)
    			tcomment.className="tc";
    			
    			//set innerHTML
    			tcontent.innerHTML=jsonData[i]["text"];
    			tcomment.innerHTML=`
    			<div class="ui fluid input"><input type="text" placeholder="输入修改意见"></div>
    			`;
    			
    			
    			
    			//$("#father").append(jsonData[i]["text"]);
    		}
    		cnt++;
    		var lstrow=faza.insertRow(cnt);
    		lstrow.style.height="72pt";
    	}
    	// href="${ctx }/design/my-report.action"
    	function saveComment(){
    		var paper=document.getElementById("father");
    		var rows=paper.children;
    		if(rows.length==1){
    			rows=rows[0].children;
    		}
    		for(var i=1;i<rows.length-1;i++){
    			var comment_cell=rows[i].children[3];
    			var comment_content=comment_cell.children[0].children[0].value;
    			jsonData[i-1].comment=comment_content;
    		}
    		var tmp=JSON.stringify(jsonData);
    		var res="";
    		for(var i=0;i<tmp.length;i++)
    			res+=tmp.charCodeAt(i)+",";
    		var temp = document.createElement("form");
		    temp.action = "${ctx }/design/my-report-design!reviewReport.action?reportId=${reportId}";
		    temp.method = "post";
		    temp.style.display = "none";
		    var opt = document.createElement("textarea");
		    opt.name = "data";
		    opt.value = res;
		    temp.appendChild(opt);
		    document.body.appendChild(temp);
		    temp.submit();
		    return temp;
    	}
    	
    </script>
</body>

</html>
