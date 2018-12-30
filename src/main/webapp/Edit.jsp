<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>修改报告</title>
    <link rel="icon" href="img/favicon.ico" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name=viewport content="width=device-width, initial-scale=1" />
    <link href="semantic/dist/semantic.min.css" rel="stylesheet" />
    <link href="plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="plugins/datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" />
    <link href="plugins/weather-icons/css/weather-icons-wind.min.css" rel="stylesheet" />
    <link href="plugins/weather-icons/css/weather-icons.min.css" rel="stylesheet" />
    <link href="plugins/chartist/chartist.min.css" rel="stylesheet" />
    <link href="css/chat-page.css" rel="stylesheet" />
    <link href="css/predisplay.css" rel="stylesheet" />
    <link rel="shortcut icon" href="img/favicon.ico" />
    
    
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="js/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>

</head>

<body>
    <div style="float:left;width:40%">
    <div class="ui segments">
    	<div class="ui segment" style="text-align:center">草稿区</div>
    </div>
    <div class="ui segments">
    	<div class="ui segment"><div class="ui header">关键字</div></div>
    	<div class="ui segment">
    	书签名称（格式：地区代码_书签）：
		<div class="ui fluid action input">
		    <input type="text" placeholder="输入书签" />
		    <div class="positive ui button" onclick="settext(this)">确定</div>
		</div>
		</div>
		<div class="ui segment">这是文本</div>
    </div>
    <div class="ui segments">
    	<div class="ui segment"><div class="ui header">表格</div></div>
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
                 <div class="positive ui button" onclick="filltable(this)">填入数据</div>
        </div>
    </div>
    </div>
    <div class="ui segments">
    	<div class="ui segment"><div class="ui header">图片</div></div>
    	<div class="ui segment">
    	书签名称（格式：地区代码_书签）：
		<div class="ui fluid action input">
		    <input type="text" placeholder="输入书签" />
		    <div class="positive ui button" onclick="setgraph(this)">确定</div>
		</div>
		</div>
		<div class="ui segment">
			<img src="images/logo/logo-xt.png">
        </div>
    </div>
    </div>
    <div id="container" style="float:left;width:60%">
    <div id="paper">
        <script id="editor" type="text/plain" ></script>
    </div>
    <div class="ui segments">
        <div class="positive ui button" onclick="download()">导出</div>
    </div>
    </div>
    
    <!--jquery-->
    <script src="js/jquery-2.1.4.min.js"></script>
    <!--jquery-->
    <!--semantic-->
    <script src="semantic/dist/semantic.min.js"></script>
    <!--semantic-->
    <!--counter number-->
    <script src="plugins/counterup/jquery.counterup.min.js"></script>
    <script src="plugins/counterup/waypoints.min.js"></script>
    <!--counter number-->
    <!--flot chart-->
    <script src="plugins/flot/jquery.flot.js"></script>
    <script src="plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="plugins/flot/curvedLines.js"></script>
    <script src="plugins/cookie/js.cookie.js"></script>
    <!--flot chart-->
    <!--chartjs chart-->
    <script src="plugins/chartjs/chart.min.js"></script>
    <!--chartjs chart-->

    <script src="plugins/nicescrool/jquery.nicescroll.min.js"></script>

    <script data-pace-options='{ "ajax": false }' src="plugins/pacejs/pace.js"></script>

    <script src="plugins/chartist/chartist.min.js"></script>

    <script src="js/dashboard2.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
    	var ue = UE.getEditor('editor');
    	
    	
    	function download(){
    		
    		console.log(ue.getContent());
    		
    	}
    	
    	function gettextbymark(mark){
    		return "这才是文本";
    	}
    	
    	function settext(obj){
    		var fa=obj.parentNode;
    		var fafa=fa.parentNode;
    		var textSeg=fafa.nextElementSibling;
    		var bro=obj.previousElementSibling;
    		var tt=bro.value;
    		var text=gettextbymark(tt);
    		textSeg.innerHTML=text;
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
    		var fa=obj.parentNode;
    		var fafa=fa.parentNode;
    		while(fa.nextSibling!=null){
    			fafa.removeChild(fa.nextSibling);
    		}
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
    		var fa=obj.parentNode;
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
    	}
    	
    	function filltablebymark(mark){
    		return "[[2.2, 6.9, 14.6], [8.9, 20.3, 39.6], [2.2, 3.8, 6.9], [86.7, 69.0, 38.9]]";
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
    		for(var i=0;i<tbody.childElementCount;i++){//定位光标
    			for(var j=0;j<tbody.children[i].childElementCount;j++){
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
		    			}
	    			}
	    			else{
	    				tbody.children[mkx].children[mky+i].innerHTML=fillarr[i];
	    			}
	    		}
    		}
    		else{
    			tbody.children[mkx].children[mky].innerHTML=fillarr;
    		}
    	}
    	
    	function getgraphbymark(mark){
    		return "http://files.57gif.com/webgif/0/4/84/bcd4b2814bbf8341e94a71ef35593.gif";
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
    	
    	function setgraph(obj){
    		var fa=obj.parentNode;
    		var fafa=fa.parentNode;
    		var imgSeg=fafa.nextElementSibling;
    		var imgdiv=imgSeg.firstElementChild;
    		var bro=obj.previousElementSibling;
    		var tt=bro.value;
    		var imlink=getgraphbymark(tt);
    		imgdiv.src=imlink;
    	}
    </script>
</body>

</html>
