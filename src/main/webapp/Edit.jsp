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
    <div id="paper">
        <script id="editor" type="text/plain" ></script>
    </div>
    <div class="ui segments">
        <div class="positive ui button" onclick="download()">导出</div>
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
    		;
    	}
    </script>
</body>

</html>
