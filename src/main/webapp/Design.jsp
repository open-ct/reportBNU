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
    <link href="${ctx }/css/design.css" rel="stylesheet" />
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

                <div id="first_addbar">
                </div>
            	</div>
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
    <script src="${ctx }/js/utils/design.js"></script>
    
    
    <script type="text/javascript">
    	
    	
    	
    	window.onload=function(){
    		var first_addbar=document.getElementById("first_addbar");
    		first_addbar.innerHTML=addbtns;
    		var height_tmp=window.innerHeight-$("#header").height()-$("#savediv").height()-$(".dw_foot").height()-30;
    		$("#father").height(height_tmp);
    		var data="${data}".split(',');
    		var jsonData="";
    		for(var i=0;i<data.length-1;i++) jsonData+=String.fromCharCode(data[i]);
    		jsonData=JSON.parse(jsonData);
    		
    		for(i in jsonData){
    			if(jsonData[i]["type"]=="graph"){
    				load_graph(null,jsonData[i]);
    			}
    			else if(jsonData[i]["type"]=="table"){
		    		load_table(null,jsonData[i]);
    			}
    			else if(jsonData[i]["type"]=="paging"){
		    		load_paging(null,jsonData[i]);
    			}
    			else{
    				load_text(null,jsonData[i]);
    			}
    			var comment_content=jsonData[i]["comment"];
    			if(comment_content!=""&&comment_content!=null&&typeof(comment_content)!=undefined){
    			var headseg=fa.lastElementChild.getElementsByClassName("ui segment")[0];
    			var div_comment=document.createElement("div");
    			div_comment.className="comment_text";
    			div_comment.innerHTML=comment_content;
    			headseg.appendChild(div_comment);
    			}
    		}
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

	function addreport(obj){
		var divnew = document.createElement("div");
		divnew.className = "ui equal width left aligned padded grid stackable";
		divnew.id = new Date().getTime();
		divnew.innerHTML = `
                    <div class="row">
                    <div class="sixteen wide column">
                        <div class="ui segments">
                        	<div class="ui segment">
                                <h5 class="ui header">
                                    嵌入报告
                                </h5>
                            </div>
                            <div class="ui segment">
                            	选择要嵌入的报告：
                            	<select name = "select_report">
                            		<option value="not_selected">--</option>
                            	</select>
                           		<div class="ui checkbox">
                           		<input type="checkbox" name="degrade">
                           		<label>
                           		报告降级
                           		</label>
                           		</div> 
                            	<button class="positive ui button" onclick="import_report(this)">确定</button>
                            </div>
                        </div>
                    </div>
                </div>
		`+addbar;
		$.ajax({
        	type:"post",
        	url:"${ctx}/design/my-report-design!listReport.action",
        	async: false,
        	success:function(msg) {
            	var reportlist=msg;
            	reportlist=JSON.parse(reportlist);
            	for(i in reportlist){
            		var findselect=divnew.children[0].children[0].children[0].children[1].children[0];
            		
            		findselect.options.add(new Option(reportlist[i]["name"],reportlist[i]["id"]));
            	}
        	},
        	error:function(msg) {
            	console.log(msg);
        	}
    	});
		var ff=obj.parentNode;
		var fff=ff.parentNode;
		fff.after(divnew);
		
	}

	function import_report(obj){
		var report_content="";
		var sele=obj.parentNode.children[0];
		var tmpid=sele.value;
		var data;
		$.ajax({
        	type:"get",
        	url:"${ctx}/design/my-report-design!importReport.action",
        	data:{"id":tmpid},
        	async: false,
        	success:function(msg) {
            	data=msg;
        	},
        	error:function(msg) {
            	console.log(msg);
        	}
    	});
    	var data=data.split(',');
    	for(var i=0;i<data.length-1;i++) report_content+=String.fromCharCode(data[i]);
    	var head=obj.parentNode.parentNode.parentNode.parentNode.parentNode;
    	var checkbox=obj.parentNode.children[1].children[0];
    	var downgrade=checkbox.checked;
    	report_content=JSON.parse(report_content);
    	var _list=new Array();
    	for(i in report_content){
    		_list.push(report_content[i]);
    	}
    	for(var i=_list.length-1;i>=0;i--){
    		if(_list[i]["type"]=="graph"){
    			load_graph(head,_list[i]);
    		}
    		else if(_list[i]["type"]=="table"){
	    		load_table(head,_list[i]);
    		}
    		else if(_list[i]["type"]=="paging"){
	    		load_paging(head,_list[i]);
   			}
   			else{
   				load_text(head,_list[i]);
    		}
    	}
    	/* for(i in jsonData){
    			
    		}
    	} */
	}
	
	
	function savereport(){
	var _list = {};
	var len = 0;
	var parts=document.getElementById("father").children;
	for(var i=1;i<parts.length;i++){
		var segs=parts[i].children[0].children[0].children[0];
		var configseg=segs.children[1];
		if(segs.childElementCount<3)continue;
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
			_list[len].text=`
			<p style="page-break-before:left;text-align:center">
			----分页符----
			</p>
			`;
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
