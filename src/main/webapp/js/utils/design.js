
var fa = document.getElementById("father");


var addbtns=`
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
       	<div class="ui purple labeled icon button" onclick="addreport(this)">
			嵌入报告
       		<i class="book icon"></i>
       	</div>
`;
    	
var addbar=`
   		<div>
   	`+addbtns+`
   		<button class="negative ui button" onclick="deleteseg(this)">删除</button>
    `+`
		</div>
`;

function load_text(loc,segdata){
	var divnew = document.createElement("div");
	var textcontent=segdata["text"];
	var texttype=segdata["type"];
	divnew.className = "ui equal width left aligned padded grid stackable";
	var newid=new Date().getMilliseconds();
	divnew.id = newid;
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
	`+addbar;
	divnew.children[0].children[0].children[0].children[2].id='cttseg'+newid;
	if(loc===null){
		fa.appendChild(divnew);
	}
	else{
		loc.after(divnew);
	}
	var divscript = document.createElement("script");
	divscript.id='container'+newid;
	divscript.type="text/plain";
	var cttseg=document.getElementById('cttseg'+newid);
	cttseg.appendChild(divscript);
	var ue = UE.getEditor('container'+newid,{
		toolbars:[
		['source','bold','italic','underline','strikethrough','subscript','superscript','fontborder','horizontal','fontfamily','fontsize','spechars','searchreplace','justifyleft','justifyright','justifycenter','justifyjustify','forecolor','backcolor','lineheight']
		]
	});
	var inhtml=document.getElementById('container'+newid).children[0].children[1].children[0];
	window.frames[inhtml.id].contentDocument.body.innerHTML=segdata["text"];
}

function load_graph(loc,segdata){
	var divnew = document.createElement("div");
	divnew.className = "ui equal width left aligned padded grid stackable";
	var newid=new Date().getMilliseconds();
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
                
	`+addbar;
	divnew.children[0].children[0].children[0].children[2].id='cttseg'+newid;
	if(loc===null){
		fa.appendChild(divnew);
	}
	else{
		loc.after(divnew);
	}
	var divscript = document.createElement("script");
	divscript.id='container'+newid;
	divscript.type="text/plain";
	var cttseg=document.getElementById('cttseg'+newid);
	cttseg.appendChild(divscript);
	var ue = UE.getEditor('container'+newid,{
		toolbars:[
		['source']
		]
	});
	var inhtml=document.getElementById('container'+newid).children[0].children[1].children[0];
	window.frames[inhtml.id].contentDocument.body.innerHTML=segdata["text"];
}

function load_table(loc,segdata){
	var divnew = document.createElement("div");
	divnew.className = "ui equal width left aligned padded grid stackable";
	var newid=new Date().getMilliseconds();
	divnew.id=newid;
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
                            		<div class="positive ui button" onclick="filltable(this)">填入数据（填入后请勿改变表格结构，如合并单元格、增删行列）</div>
                            	</div>
                            	<div style="display:none"></div>
                            </div>
                            <div class="ui segment">
                            	<div class="mktable" display="none"></div>
                            </div>
                        </div>
                    </div>
                </div>
	`+addbar;
	divnew.children[0].children[0].children[0].children[2].id='cttseg'+newid;
	divnew.children[0].children[0].children[0].children[1].children[4].innerHTML=segdata["config"];
	if(loc===null){
		fa.appendChild(divnew);
	}
	else{
		loc.after(divnew);
	}
	var divscript = document.createElement("script");
	divscript.id='container'+newid;
	divscript.type="text/plain";
	var cttseg=document.getElementById('cttseg'+newid);
	cttseg.appendChild(divscript);
	var ue = UE.getEditor('container'+newid,{
		toolbars:[
		['mergecells','bold','italic','underline','fontfamily','fontsize','justifyleft','justifycenter','justifyright','strikethrough','fontborder','insertrow','insertcol','deleterow','deletecol','splittocells','source']
		]
	});
	var inhtml=document.getElementById('container'+newid).children[0].children[1].children[0];
	window.frames[inhtml.id].contentDocument.body.innerHTML=segdata["text"];
}

function load_paging(loc,segdata){
	var divnew = document.createElement("div");
	divnew.className = "ui equal width left aligned padded grid stackable";
	var newid=new Date().getMilliseconds();
	divnew.id = newid;
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
	`+addbar;
	if(loc===null){
		fa.appendChild(divnew);
		return divnew;
	}
	else{
		loc.after(divnew);
		return divnew;
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
	`+addbar;
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
	`+addbar;
	var ff=obj.parentNode;
	var fff=ff.parentNode;
	fff.after(divnew);
}



function getgraph(obj){
	obj.style.display='none';
	var bro=obj.previousElementSibling;
	var tt=bro.value;
	var imlink=getgraphbymark(tt);
	var imghtml="<p><img src="+imlink+"></p>";
	
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
                            		<div class="positive ui button" onclick="filltable(this)">填入数据（填入后请勿改变表格结构，如合并单元格、增删行列）</div>
                            	</div>
                            	<div style="display:none"></div>
                            </div>
                        </div>
                    </div>
                </div>
	`+addbar;
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
		['mergecells','bold','italic','underline','fontfamily','fontsize','justifyleft','justifycenter','justifyright','strikethrough','fontborder','insertrow','insertcol','deleterow','deletecol','splittocells','source']
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
	`+addbar;
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



