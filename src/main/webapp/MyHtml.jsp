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

</head>

<body>

            <!--maincontent-->
            <div class="mainWrap navslide">
            <div id="father">
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
        	<div>
        	<div class="ui equal width left aligned padded grid stackable">
        		<div>
        			<button class="ui primary button saving" onclick="savereport()" >保存</button>
        		</div>
        	</div>
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
    		var data="${data}".split(',');
    		var jsonData="";
    		for(var i=0;i<data.length-1;i++) jsonData+=String.fromCharCode(data[i]);
    		jsonData=JSON.parse(jsonData);
    		var fa = document.getElementById("father");
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
		                                    		<div class="positive ui button" onclick="getgraph(this)">确定</div>
		                                    	</div>
		                               			
		                                    </div>
		                                    <div class="ui segment">
		                                    	<div class="mkgraph" display='none'></div>
		                                    	<img src="`+imghtml+`">
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
		                                	</div>
		                                	<div class="ui segment">
		                                		<div class="mktext" display='none'></div>
		                                        <div class="ui form">
		                                            <div class="field">
		                                                <textarea class="tinymceeditor"></textarea>
		                                            </div>
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
		    		var segs=divnew.children[0].children[0].children[0];
    				var configseg=segs.children[1];
    				var contentseg=segs.children[2];
    				contentseg.children[1].children[0].children[0].value=textcontent;
    				configseg.children[0].value=texttype;
    				fa.appendChild(divnew);
    			}
    		}
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
                                	</div>
                                	<div class="ui segment">
                                		<div class="mktext" display='none'></div>
                                        <div class="ui form">
                                            <div class="field">
                                                <textarea class="tinymceeditor"></textarea>
                                            </div>
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
	        return path;
    	}
    	
    	function getgraph(obj){
    		var bro=obj.previousElementSibling;
    		var tt=bro.value;
    		var imlink=getgraphbymark(tt);
    		var imghtml="<img src=../"+imlink+">";
    		var divnew=document.createElement("div");
    		divnew.className="ui segment";
    		divnew.innerHTML=`
    			<div class="mkgraph" display='none'></div>
            `+imghtml;
    		var parent=obj.parentNode;
    		var pparent=parent.parentNode;
    		pparent.after(divnew);
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
                                    		<option value="1">表类型一</option>
											<option value="2">表类型二</option>
											<option value="3">表类型三</option>
											<option value="4">表类型四</option>
											<option value="5">表类型五</option>
											<option value="6">表类型六</option>
                                    	</select>
                                    	输入列数：
                                    	<select name = "dbusing">
                                    		<option value="1">一年级</option>
											<option value="2">二年级</option>
											<option value="3">三年级</option>
											<option value="4">四年级</option>
											<option value="5">五年级</option>
											<option value="6">六年级</option>
											<option value="7">初一</option>
											<option value="8">初二</option>
											<option value="9">初三</option>
                                    	</select>
                                    	变量名：
                                    	<select name = "parameter">
                                    		<option value="1">变量名一</option>
											<option value="2">变量名二</option>
											<option value="3">变量名三</option>
											<option value="4">变量名四</option>
											<option value="5">变量名五</option>
											<option value="6">变量名六</option>
                                    	</select>
                                    	运算类型：
                                    	<select name = "opertype">
                                    		<option value="1">运算一</option>
											<option value="2">运算二</option>
											<option value="3">运算三</option>
											<option value="4">运算四</option>
											<option value="5">运算五</option>
											<option value="6">运算六</option>
                                    	</select>
                                    	<button class="positive ui button" onclick="gettable()">确定</button>
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
    		/*var doccontent="";
    		var parts=document.getElementById("father").children;
    		for(var i=1,len=parts.length;i<len;i++){
    			var segs=parts[i].children[0].children[0].children[0];
    			var configseg=segs.children[1];
    			var contentseg=segs.children[2];
    			var mark=contentseg.children[0];
    			if(mark.className=="mktext"){
    				var text=contentseg.children[1].children[0].children[0].value;
    				//alert(text);
    				var sele=configseg.children[0];
    				var index=sele.selectedIndex;
    				var texttype=sele.options[index].value;
    				//alert(texttype);
    				if(texttype=="title1"){
    					doccontent+="<h1>"+text+"</h1>";
    				}
    				else if(texttype=="title2"){
    					doccontent+="<h2>"+text+"</h2>";
    				}
    				else if(texttype=="title3"){
    					doccontent+="<h3>"+text+"</h3>";
    				}
    				else if(texttype=="title4"){
    					doccontent+="<h4>"+text+"</h4>";
    				}
    				else if(texttype=="body"){
    					doccontent+=text;
    				}
    				else if(texttype=="other"){
    					doccontent+=text;
    				}
    			}
    			else{
    				if(mark.className=="mkgraph"){
    					doccontent+=contentseg.innerHTML;
    				}
    				else{
    					doccontent+=("this is a table");
    				}
    			}
    		}
    		alert(doccontent);*/
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
    				_list[len].text=contentseg.children[1].children[0].children[0].value;
    				_list[len].type=sele.options[index].value
    				len++;
    			}
    			else if(mark.className=="mkgraph"){
    				_list[len]=new Object();
    				_list[len].type="graph";
    				_list[len].text=contentseg.children[1].getAttribute("src");
    				len++;
    			}
    			else if(mark.className=="pageBreak"){
    				_list[len]=new Object();
    				_list[len].type="paging";
    				_list[len].text="This is a paging mark.";
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
