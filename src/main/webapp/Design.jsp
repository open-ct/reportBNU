<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <title>录入报告</title>
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
    <link rel="shortcut icon" href="img/favicon.ico" />
    
    
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx }/js/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ctx }/lang/zh-cn/zh-cn.js"></script>

</head>

<body>

            <!--maincontent-->
            
            <div id="father" style="overflow:auto">
            <div class="ui equal width left aligned padded grid stackable">
                <!--Site Content-->

                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" >
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="paging(this)" >
                        		分页
                                            <i class="add icon"></i>
                        </div>
                        </div>
            </div>
                <!--Site Content-->
        	</div>
        	<div id="savediv" class="ui equal width left aligned padded grid stackable">
        		<div>
        			<button class="ui primary button saving" onclick="savereport()" >保存</button>
        		</div>
        	</div>
        	
        
           

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
    		var fa = document.getElementById("father");
    		var height_tmp=window.innerHeight-$("#header").height()-$("#savediv").height()-$(".dw_foot").height()-30;
    		$("#father").height(height_tmp);
    		var data="${data}".split(',');
    		var jsonData="";
    		for(var i=0;i<data.length-1;i++) jsonData+=String.fromCharCode(data[i]);
    		jsonData=JSON.parse(jsonData);
    		
    		
    		//var texttmp={};
    		//var textcnt=0;
    		for(i in jsonData){
    			if(jsonData[i]["type"]=="graph"){
    				var imghtml=jsonData[i]["text"];
    				var divnew = document.createElement("div");
		    		divnew.className = "ui equal width left aligned padded grid stackable";
		    		divnew.id = new Date().getTime();
		    		divnew.innerHTML = `
		                            <div class="row">
		                            <div class="sixteen wide column">
		                                <div class="ui segments">
		                                	<div class="ui segment">
		                                        <h5 class="ui header">
		                                            添加图
		                                        </h5>
		                                    </div>
		                                    <div class="ui segment">
		                                    	书签名称（格式：地区代码_书签）：
		                                    	<div class="ui fluid action input">
		                                    		<input type="text" placeholder="输入书签" />
		                                    		<div class="positive ui button" onclick="getgraph(this)" style="display:none">确定</div>
		                                    	</div>
		                               			
		                                    </div>
		                                    <div class="ui segment">
		                                    	<div class="mkgraph" display='none'></div>
		                                    	
                                    		</div>
		                                </div>
		                            </div>
		                        </div>
		                        <div>
		                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
		                        		添加文字
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
		                        		添加图
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
		                        		添加表
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="paging(this)" >
                        				分页
                                            		<i class="add icon"></i>
                        		</div>
		                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
		                        </div>
		    		`;
		    		var newid=new Date().getTime();
		    		divnew.children[0].children[0].children[0].children[2].id=newid;
		    		fa.appendChild(divnew);
		    		var divscript = document.createElement("script");
		    		divscript.id='container'+newid;
		    		divscript.type="text/plain";
		    		fa.lastElementChild.children[0].children[0].children[0].children[2].appendChild(divscript);
		    		var ue = UE.getEditor('container'+newid,{
		    			toolbars:[
		    			['source']
		    			]
		    		});
		    		//ue.addListener("ready", function () {
					//	ue.setContent(jsonData[i]["text"],false);
					//});
					var inhtml=document.getElementById('container'+newid).children[0].children[1].children[0];
					window.frames[inhtml.id].contentDocument.body.innerHTML=jsonData[i]["text"];
    			}
    			else if(jsonData[i]["type"]=="table"){
   					var divnew = document.createElement("div");
		    		divnew.className = "ui equal width left aligned padded grid stackable";
		    		divnew.innerHTML = `
		                            <div class="row">
		                            <div class="sixteen wide column">
		                                <div class="ui segments">
		                                	<div class="ui segment">
		                                        <h5 class="ui header">
		                                            添加表
		                                        </h5>
		                                    </div>
		                                    <div class="ui segment">
		                                    	输入行数：
		                                    	<select name = "rownumber">
		                                    		<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
		                                    	</select>
		                                    	输入列数：
		                                    	<select name = "colnumber">
		                                    		<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
		                                    	</select>
		                                    	<button class="positive ui button" onclick="gettable(this)" style="display:none">生成表格</button>
		                                    	书签名称（格式：地区代码_书签）：
		                                    	<div class="ui fluid action input">
		                                    		<input type="text" placeholder="输入书签" />
		                                    		<div class="positive ui button" onclick="filltable(this)">填入数据（填入前请确保已完成所有合并单元格操作）</div>
		                                    	</div>
		                                    	<div style="display:none"></div>
		                                    </div>
		                                    <div class="ui segment">
		                                    	<div class="mktable" display="none"></div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div>
		                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
		                        		添加文字
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
		                        		添加图
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
		                        		添加表
		                                            <i class="add icon"></i>
		                        </div>
				                <div class="ui teal labeled icon button" onclick="paging(this)" >
		                        		分页
		                                            <i class="add icon"></i>
		                        </div>
		                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
		                        </div>
		    		`;
		    		var newid=new Date().getTime();
		    		divnew.children[0].children[0].children[0].children[2].id=newid;
		    		divnew.children[0].children[0].children[0].children[1].children[4].innerHTML=jsonData[i]["config"];
		    		fa.appendChild(divnew);
		    		var divscript = document.createElement("script");
		    		divscript.id='container'+newid;
		    		divscript.type="text/plain";
		    		fa.lastElementChild.children[0].children[0].children[0].children[2].appendChild(divscript);
		    		var ue = UE.getEditor('container'+newid,{
		    			toolbars:[
		    			['mergecells','source']
		    			]
		    		});
		    		//ue.addListener("ready", function () {
					//	ue.setContent(jsonData[i]["text"],false);
					//});
					var inhtml=document.getElementById('container'+newid).children[0].children[1].children[0];
					window.frames[inhtml.id].contentDocument.body.innerHTML=jsonData[i]["text"];
    			}
    			else if(jsonData[i]["type"]=="paging"){
    				var divnew = document.createElement("div");
		    		divnew.className = "ui equal width left aligned padded grid stackable";
		    		divnew.id = new Date().getTime();
		    		divnew.innerHTML = `
		                            <div class="row">
		                            <div class="sixteen wide column">
		                                <div class="ui segments">
		                                	<div class="ui segment">
		                                        <h5 class="ui header">
		                                            我是分页标记^_^
		                                        </h5>
		                                    </div>
		                                	<div display='none'></div>
		                                	<div display='none'>
		                                		<div class="pageBreak" display='none'></div>
		                                	</div>
		                            	</div>
		                            </div>
		                        </div>
		                        <div>
		                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
		                        		添加文字
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
		                        		添加图
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
		                        		添加表
		                                            <i class="add icon"></i>
		                        </div>
				                <div class="ui teal labeled icon button" onclick="paging(this)" >
		                        		分页
		                                            <i class="add icon"></i>
		                        </div>
		                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
		                        </div>
		                        
    				`;
    				fa.appendChild(divnew);
    			}
    			else{
    				var textcontent=jsonData[i]["text"];
    				var texttype=jsonData[i]["type"];
    				var divnew = document.createElement("div");
		    		divnew.className = "ui equal width left aligned padded grid stackable";
		    		divnew.id = new Date().getTime();
		    		divnew.innerHTML = `
		                            <div class="row">
		                            <div class="sixteen wide column">
		                                <div class="ui segments">
		                                	<div class="ui segment">
		                                        <h5 class="ui header">
		                                            添加文字
		                                        </h5>
		                                    </div>
		                                	<div class="ui segment">
		                                    	文字级别：
		                                    	<select name = "texttype">
		                                    		<option value="texttitle1">一级标题</option>
													<option value="texttitle2">二级标题</option>
													<option value="texttitle3">三级标题</option>
													<option value="texttitle4">四级标题</option>
													<option value="textbody">正文</option>
													<option value="imagetitle">图表标题</option>
													<option value="textnote">注释</option>
		                                    	</select>
		                                    	<button class="positive ui button" onclick="gettext(this)" style="display:none">确定</button>
		                                	</div>
		                                	<div class="ui segment">
		                                		<div class="mktext" display='none'></div>
		                                        
		                                	</div>
		                            	</div>
		                            </div>
		                        </div>
		                        <div>
		                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
		                        		添加文字
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
		                        		添加图
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
		                        		添加表
		                                            <i class="add icon"></i>
		                        </div>
		                        <div class="ui teal labeled icon button" onclick="paging(this)" >
                        				分页
                                            		<i class="add icon"></i>
                        		</div>
		                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
		                        </div>
		                        
		    		`;
		    		var newid=new Date().getTime();
		    		divnew.children[0].children[0].children[0].children[2].id=newid;
		    		fa.appendChild(divnew);
		    		var divscript = document.createElement("script");
		    		divscript.id='container'+newid;
		    		divscript.type="text/plain";
		    		fa.lastElementChild.children[0].children[0].children[0].children[2].appendChild(divscript);
		    		var ue = UE.getEditor('container'+newid,{
		    			toolbars:[
		    			['source','bold','italic','underline','strikethrough','subscript','superscript','fontborder','horizontal','fontfamily','fontsize','spechars','searchreplace','justifyleft','justifyright','justifycenter','justifyjustify','forecolor','backcolor','lineheight']
		    			]
		    		});
		    		//texttmp[textcnt]=new Object();
		    		//texttmp[textcnt].text=jsonData[i]["text"];
		    		//texttmp[textcnt].id='container'+newid;
		    		//textcnt++;
		    		//ue.addListener("ready", function () {
					//	ue.setContent(jsonData[i]["text"],false);
					//});
					var inhtml=document.getElementById('container'+newid).children[0].children[1].children[0];
					window.frames[inhtml.id].contentDocument.body.innerHTML=jsonData[i]["text"];
    			}
    		}
    		//for(i in texttmp){
    		//	var ue=UE.getEditor(texttmp[i]["id"]);
    		//	alert(texttmp[i]["text"]);
    		//	ue.addListener("ready",function(){ue.setContent(texttmp[i]["text"],false);})
    		//}
    	}
    	
    	function addtext(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            添加文字
                                        </h5>
                                    </div>
                                	<div class="ui segment">
                                    	请选择文字类别：
                                    	<select name = "texttype">
                                    		<option value="texttitle1">一级标题</option>
											<option value="texttitle2">二级标题</option>
											<option value="texttitle3">三级标题</option>
											<option value="texttitle4">四级标题</option>
											<option value="textbody">正文</option>
											<option value="imagetitle">图表标题</option>
											<option value="textnote">注释</option>
                                    	</select>
                                    	<button class="positive ui button" onclick="gettext(this)">确定</button>
                                	</div>
                                	
                            	</div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
		                <div class="ui teal labeled icon button" onclick="paging(this)" >
                        		分页
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
                        
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	function gettext(obj){
    		obj.style.display='none';
    		var bro=obj.previousElementSibling;
    		var texttype=bro.value;
    		var divnew = document.createElement("div");
    		divnew.className = "ui segment";
    		var newid = new Date().getTime();
    		divnew.id = newid;
    		var divmk = document.createElement("div");
    		divmk.className = "mktext";
    		divmk.display = "none";
    		divnew.appendChild(divmk);
    		var contain = document.createElement("script");
    		contain.id = 'container'+newid;
    		contain.type = "text/plain";
    		divnew.appendChild(contain);
    		var fa = obj.parentNode;
    		fa.after(divnew);
    		var ue = UE.getEditor('container'+newid,{
    			toolbars:[
    			['source','bold','italic','underline','strikethrough','subscript','superscript','fontborder','horizontal','fontfamily','fontsize','spechars','searchreplace','justifyleft','justifyright','justifycenter','justifyjustify','forecolor','backcolor','lineheight']
    			]
    		});
    		ue.addListener("ready", function () {
				if(texttype=="texttitle1"){
					ue.execCommand('justify', 'center');
					ue.execCommand('fontfamily', 'SimHei');
					ue.execCommand('fontsize', '18pt')
				}
				else if(texttype=="texttitle2"){
    				ue.execCommand('fontfamily', 'SimHei');
					ue.execCommand('fontsize', '16pt');
				}
				else if(texttype=="texttitle3"){
					ue.execCommand('fontfamily', 'SimHei');
					ue.execCommand('fontsize', '14pt');
				}
				else if(texttype=="texttitle4"){
					ue.execCommand('fontfamily', 'SimHei');
					ue.execCommand('fontsize', '12pt');
				}
				else if(texttype=="textbody"){
					ue.execCommand('fontfamily', '华文仿宋');
					ue.execCommand('fontsize', '12pt');
				}
				else if(texttype=="imagetitle"){
					ue.execCommand('justify', 'center');
					ue.execCommand('fontfamily', 'STXinwei');
					ue.execCommand('fontsize', '12pt');
				}
				else if(texttype=="textnote"){
					ue.execCommand('fontfamily', 'KaiTi');
					ue.execCommand('fontsize', '10.5pt');
				}
				
			});
    	}
    	
    	function addgraph(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            添加图
                                        </h5>
                                    </div>
                                    <div class="ui segment">
                                    	书签名称（格式：地区代码_书签）：
                                    	<div class="ui fluid action input">
                                    		<input type="text" placeholder="输入书签" />
                                    		<div class="positive ui button" onclick="getgraph(this)">确定</div>
                                    	</div>
                               			
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
		                <div class="ui teal labeled icon button" onclick="paging(this)" >
                   				分页
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	function getgraphbymark(mark){
    		//return "http://files.57gif.com/webgif/0/4/84/bcd4b2814bbf8341e94a71ef35593.gif";
    		var path = "";
    		$.ajax({
	            type:"post",
	            url:"${ctx}/draw-graph.action",
	            data:{"data":mark},
	            async: false,
	            success:function(msg) {
	                data=msg.split('&');
	                path="files/graph/"+data[0]+".png";
	            },
	            error:function(msg) {
	                console.log(msg);
	            }
	        });
	        return "../"+path;
    	}
    	
    	function getgraph(obj){
    		obj.style.display='none';
    		var bro=obj.previousElementSibling;
    		var tt=bro.value;
    		var imlink=getgraphbymark(tt);
    		var imghtml="<p><img src="+imlink+"></p>";
    		//var divnew=document.createElement("div");
    		//divnew.className="ui segment";
    		//divnew.innerHTML=`
    		//	<div class="mkgraph" display='none'></div>
            //`+imghtml;
    		//var parent=obj.parentNode;
    		//var pparent=parent.parentNode;
    		//pparent.after(divnew);
    		
    		
    		var divnew = document.createElement("div");
    		divnew.className = "ui segment";
    		var newid = new Date().getTime();
    		divnew.id = newid;
    		var divmk = document.createElement("div");
    		divmk.className = "mkgraph";
    		divmk.display = "none";
    		divnew.appendChild(divmk);
    		var contain = document.createElement("script");
    		contain.id = 'container'+newid;
    		contain.type = "text/plain";
    		divnew.appendChild(contain);
    		var fa = obj.parentNode;
    		var fafa=fa.parentNode;
    		fafa.after(divnew);
    		var ue = UE.getEditor('container'+newid,{
    			toolbars:[
    			['source']
    			]
    		});
    		ue.addListener("ready", function () {
				ue.setContent(imghtml,false);
				ue.execCommand('justify', 'center');
			});
    	}
    	
    	
    	
    	function addtable(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            添加表
                                        </h5>
                                    </div>
                                    <div class="ui segment">
                                    	输入行数：
                                    	<select name = "rownumber">
                                    		<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
                                    	</select>
                                    	输入列数：
                                    	<select name = "colnumber">
                                    		<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
                                    	</select>
                                    	<button class="positive ui button" onclick="gettable(this)">生成表格</button>
                                    	书签名称（格式：地区代码_书签）：
                                    	<div class="ui fluid action input">
                                    		<input type="text" placeholder="输入书签" />
                                    		<div class="positive ui button" onclick="filltable(this)">填入数据（填入前请确保已完成所有合并单元格操作）</div>
                                    	</div>
                                    	<div style="display:none"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
		                <div class="ui teal labeled icon button" onclick="paging(this)" >
                        		分页
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	function createtablebysize(sizerow,sizecol){
    		var rowhtml="<tr>";
    		for(var i=0;i<sizecol;i++)rowhtml+=`<td style="border: 1px solid windowtext;"></td>`;
    		rowhtml+="</tr>";
    		var tbhtml="<table><tbody>";
    		for(var i=0;i<sizerow;i++)tbhtml+=rowhtml;
    		tbhtml+="</tbody></table>";
    		return tbhtml;
    	}
    	
    	function gettable(obj){
    		obj.style.display='none';
    		var divnew = document.createElement("div");
    		divnew.className = "ui segment";
    		var newid = new Date().getTime();
    		divnew.id = newid;
    		var divnow = document.createElement("div");
    		divnow.className = "mktable";
    		divnow.display = "none";
    		divnew.appendChild(divnow);
    		var contain = document.createElement("script");
    		contain.id = 'container'+newid;
    		contain.type = "text/plain";
    		divnew.appendChild(contain);
    		var fa = obj.parentNode;
    		fa.after(divnew);
    		var bro = obj.previousElementSibling;
    		var bbro = bro.previousElementSibling;
    		var r = bbro.value;
    		var c = bro.value;
    		var tablehtml = createtablebysize(r,c);
    		var ue = UE.getEditor('container'+newid,{
    			toolbars:[
    			['mergecells','source']
    			]
    		});
    		ue.addListener("ready", function () {
				ue.setContent(tablehtml,false);
			});
			
			
			//在configseg中记录单元格坐标信息
			var configtable=fa.children[4];
			for(var i=0;i<r;i++){
				var divtr=document.createElement("div");
				for(var j=0;j<c;j++){
					var divtd=document.createElement("div");
					divtd.innerHTML="clear";
					divtr.appendChild(divtd);
				}
				configtable.appendChild(divtr);
			}
			
    	}
    	
    	function filltablebymark(mark){
    		//return "[[2.2, 6.9, 14.6], [8.9, 20.3, 39.6], [2.2, 3.8, 6.9], [86.7, 69.0, 38.9]]";
    		var path = "";
    		$.ajax({
	            type:"post",
	            url:"${ctx}/draw-graph.action",
	            data:{"data":mark},
	            async: false,
	            success:function(msg) {
	                path=msg;
	            },
	            error:function(msg) {
	                console.log(msg);
	            }
	        });
	        return path;
    	}
    	
    	function filltable(obj){
    		var bro=obj.previousElementSibling;
    		var tt=bro.value;
    		var fillstr=filltablebymark(tt);
    		var fillarr = eval(fillstr);
    		var fa=obj.parentNode;
    		fa=fa.parentNode;
    		var uncle=fa.nextElementSibling;
    		var uid=uncle.id;
    		var ue=UE.getEditor('container'+uid);
    		ue.execCommand('insertHTML','undefined');
    		var inframe=uncle.children[1].children[0].children[1].children[0];
    		var tbody=window.frames[inframe.id].contentDocument.body.children[0].children[0];
    		var mkx=0;
    		var mky=0;
    		var configtable=obj.parentNode.nextElementSibling;
    		//var r=configtable.childElementCount;
    		//var c=configtable.children[0].childElementCount;
    		for(var i=0;i<tbody.childElementCount;i++){//定位光标
    			for(var j=0;j<tbody.children[i].childElementCount;j++){
    				//var rspan=tbody.children[i].children[j].getAttribute("rowspan");
    				//var cspan=tbody.children[i].children[j].getAttribute("colspan");
    				if(tbody.children[i].children[j].innerHTML=='undefined'){
    					mkx=i;
    					mky=j;
    				}
    			}
    		}
    		
    		//填充表格
    		if(typeof(fillarr)=="object"){
	    		for(var i=0;i<fillarr.length;i++){
	    			if(typeof(fillarr[i])=="object"){
		    			for(var j=0;j<fillarr[i].length;j++){
		    				tbody.children[mkx+i].children[mky+j].innerHTML=fillarr[i][j];
		    				configtable.children[mkx+i].children[mky+j].innerHTML="filled";
		    			}
	    			}
	    			else{
	    				tbody.children[mkx].children[mky+i].innerHTML=fillarr[i];
	    				configtable.children[mkx].children[mky+i].innerHTML="filled";
	    			}
	    		}
    		}
    		else{
    			tbody.children[mkx].children[mky].innerHTML=fillarr;
    			configtable.children[mkx].children[mky].innerHTML="filled";
    		}
    		configtable.children[mkx].children[mky].innerHTML=tt;
    	}
    	
    	function paging(obj){
    		var divnew = document.createElement("div");
    		divnew.className = "ui equal width left aligned padded grid stackable";
    		divnew.id = new Date().getTime();
    		divnew.innerHTML = `
                            <div class="row">
                            <div class="sixteen wide column">
                                <div class="ui segments">
                                	<div class="ui segment">
                                        <h5 class="ui header">
                                            我是分页标记^_^
                                        </h5>
                                    </div>
                                	<div display='none'></div>
                                	<div display='none'>
                                		<div class="pageBreak" display='none'></div>
                                	</div>
                            	</div>
                            </div>
                        </div>
                        <div>
                        <div class="ui teal labeled icon button" onclick="addtext(this)" id="0">
                        		添加文字
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addgraph(this)" >
                        		添加图
                                            <i class="add icon"></i>
                        </div>
                        <div class="ui teal labeled icon button" onclick="addtable(this)" >
                        		添加表
                                            <i class="add icon"></i>
                        </div>
		                <div class="ui teal labeled icon button" onclick="paging(this)" >
                        		分页
                                            <i class="add icon"></i>
                        </div>
                        <button class="negative ui button" onclick="deleteseg(this)">删除</button>
                        </div>
                        
    		`;
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.after(divnew);
    	}
    	
    	
    	
    	function hideseg(obj){
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		fff.style.display='none';
    	}
    	
    	function deleteseg(obj){
    		var ff=obj.parentNode;
    		var fff=ff.parentNode;
    		var ffff=fff.parentNode;
    		ffff.removeChild(fff);
    	}
    	
    	
    	
    	function savereport(){
    		var _list = {};
    		var len = 0;
    		var parts=document.getElementById("father").children;
    		for(var i=1;i<parts.length;i++){
    			var segs=parts[i].children[0].children[0].children[0];
    			var configseg=segs.children[1];
    			var contentseg=segs.children[2];
    			var mark=contentseg.children[0];
    			
    			if(mark.className=="mktext"){
    				var sele=configseg.children[0];
    				var index=sele.selectedIndex;
    				_list[len]=new Object();
    				//_list[len].text=contentseg.children[1].children[0].children[0].value;
    				var editor_parts=contentseg.children[1].children[0].children;
    				var mk=0;
    				for(var j=0;j<editor_parts.length;j++){
    					if(editor_parts[j].className=="");
    					else mk++;
    					if(mk==2){
    						var inhtml = editor_parts[j].children[0];
    						_list[len].text=window.frames[inhtml.id].contentDocument.body.innerHTML;
    						_list[len].type=sele.options[index].value;
    						len++;
    					}
    				}
    			}
    			else if(mark.className=="mkgraph"){
    				_list[len]=new Object();
    				_list[len].type="graph";
    				//_list[len].text=contentseg.children[1].getAttribute("src");
    				var editor_parts=contentseg.children[1].children[0].children;
    				var mk=0;
    				for(var j=0;j<editor_parts.length;j++){
    					if(editor_parts[j].className=="");
    					else mk++;
    					if(mk==2){
    						var inhtml = editor_parts[j].children[0];
    						_list[len].text=window.frames[inhtml.id].contentDocument.body.innerHTML;
    						_list[len].bookmark=configseg.children[0].children[0].value;
    						len++;
    					}
    				}
    			}
    			else if(mark.className=="mktable"){
    				_list[len]=new Object();
    				_list[len].type="table";
    				var editor_parts=contentseg.children[1].children[0].children;
    				var mk=0;
    				for (var j = 0; j < editor_parts.length; j++) {
    					if (editor_parts[j].className == "")
    						;
    					else mk++;
    					if (mk == 2) {
    						var inhtml = editor_parts[j].children[0];
    						_list[len].text = window.frames[inhtml.id].contentDocument.body.innerHTML;
    						var tbody = window.frames[inhtml.id].contentDocument.body.children[0].children[0];
    						var configtable = configseg.children[4];
    						_list[len].config = configtable.innerHTML;
    						var __list = {};
    						var __len = 0;
    						for (var r = 0; r < tbody.childElementCount; r++) {
    							for (var c = 0; c < tbody.children[r].childElementCount; c++) {
    								var td = tbody.children[r].children[c];
    								var configtd = configtable.children[r].children[c].innerHTML;
    								if (configtd == "filled") continue;
    								__list[__len] = new Object();
    								__list[__len].row = r;
    								__list[__len].col = c;
    								if (configtd == "clear") {
    									var rspan = td.getAttribute("rowspan");
    									if (rspan == null || rspan == "")
    										rspan = "1";
    									var cspan = td.getAttribute("colspan");
    									if (cspan == null || cspan == "")
    										cspan = "1";
    									__list[__len].type = rspan + "*" + cspan;
    									__list[__len].text = td.innerHTML;
    								} else {
    									__list[__len].type = "bookmark";
    									__list[__len].text = configtd;
    								}
    								__len++;
    							}
    						}
    						_list[len].bookmark = JSON.stringify(__list);
    						len++;
    					}
    				}
    			}
    			else if(mark.className=="pageBreak"){
    				_list[len]=new Object();
    				_list[len].type="paging";
    				_list[len].text=`<p style="page-break-before:left;text-align:center">
    				----分页符----
    				</p>`;
    				len++;
    			}
    		}
    		var tmp=JSON.stringify(_list);
    		var res="";
    		for(var i=0;i<tmp.length;i++)
    			res+=tmp.charCodeAt(i)+",";
    		var temp = document.createElement("form");
		    temp.action = "${ctx}/design/save-html.action?reportId=${report.id}";
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
