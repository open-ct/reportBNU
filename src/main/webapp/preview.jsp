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
	<style id="table">.selectTdClass{background-color:#edf5fa !important}table.noBorderTable td,table.noBorderTable th,table.noBorderTable caption{border:1px dashed #ddd !important}table{margin-bottom:10px;border-collapse:collapse;display:table;}td,th{padding: 5px 10px;border: 1px solid #DDD;}caption{border:1px dashed #DDD;border-bottom:0;padding:3px;text-align:center;}th{border-top:1px solid #BBB;background-color:#F7F7F7;}table tr.firstRow th{border-top-width:2px;}.ue-table-interlace-color-single{ background-color: #fcfcfc; } .ue-table-interlace-color-double{ background-color: #f7faff; }td p{margin:0;padding:0;}</style>
	
</head>

<body>
            <!--maincontent-->
            	<!--Site Content-->
            	<div class="ui equal width left aligned padded grid stackable" >
                	<div class="row">
                    	<div class="sixteen wide column">
                			<div class="ui segments"  id="paper">
                				<div class="ui segment" id="father" style="word-wrap:break-word">
                				</div>
                				<div style="text-align: center">
                				<a class="ui green button" href="${ctx }/design/my-report.action" style="margin: 0 auto">
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
    	window.onload=function(){
    		var data="${data}".split(',');
    		var jsonData="";
    		for(var i=0;i<data.length-1;i++) jsonData+=String.fromCharCode(data[i]);
    		console.log(jsonData);
    		jsonData=JSON.parse(jsonData);
    		var faza=document.getElementById("father");
    		for(i in jsonData){
    			if(jsonData[i]["type"]=="graph"){
    				var imghtml=jsonData[i]["text"];
    				var divnew=document.createElement("p");
    				divnew.className="preimage";
    				//divnew.id=new Date().getTime();
    				divnew.innerHTML='<img src='+imghtml+'>';
    				divnew.style.textAlign="center";
    				
    				faza.appendChild(divnew);
    			}
    			else if(jsonData[i]["type"]=="paging"){
    				var divnew=document.createElement("p");
    				divnew.className="pageBreak";
    				divnew.style.pageBreakBefore="left";
    				divnew.innerHTML='----分页符----';
    				divnew.style.textAlign="center";
    				faza.appendChild(divnew);
    			}
    			else if(jsonData[i]["type"]=="table"){
    				var divnew=document.createElement("table");
    				divnew.className="table";
    				divnew.style.margin="0 auto";
    				divnew.innerHTML=jsonData[i]["text"];
    				faza.appendChild(divnew);
    			}
    			else{
    				var textcontent=jsonData[i]["text"];
    				var texttype=jsonData[i]["type"];
    				var divnew=document.createElement("p");
    				divnew.className=texttype;
    				if(texttype=="texttitle1"){
    					divnew.style.textAlign="center";
    					divnew.style.fontFamily="SimHei";
    					divnew.style.fontSize="18pt";
    				}
    				if(texttype=="texttitle2"){
    					divnew.style.textAlign="left";
    					divnew.style.fontFamily="SimHei";
    					divnew.style.fontSize="16pt";
    				}
    				if(texttype=="texttitle3"){
    					divnew.style.fontFamily="SimHei";
    					divnew.style.fontSize="14pt";
    				}
    				if(texttype=="texttitle4"){
    					divnew.style.fontFamily="SimHei";
    					divnew.style.fontSize="12pt";
    				}
    				if(texttype=="textbody"){
    					divnew.style.textIndent="24pt";
    					divnew.style.fontFamily="FangSong";
    					divnew.style.fontSize="12pt";
    				}
    				if(texttype=="textnote"){
    					divnew.style.fontFamily="KaiTi";
    					divnew.style.fontSize="10.5pt";
    				}
    				if(texttype=="imagetitle"){
    					divnew.style.textAlign="center";
    					divnew.style.fontFamily="STXinwei";
    					divnew.style.fontSize="12pt";
    				}
    				
    				//divnew.id=new Date().getTime();
    				divnew.innerHTML=textcontent;
    				faza.appendChild(divnew);
    			}
    		}
    		
    		
    	}
    	
    	function getHtml(){
    		window.open('output.html');
    	}
    </script>
</body>

</html>
