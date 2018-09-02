<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
    $("#btn_log").click(function() {
        $.ajax({
            type:"get",
            url:"servlet/DrawGraph",
            data:"13102_区依附各区单科得分盒式图_01_4_uVREP",
            dataType:"text",
            success:function(data) {
                alert(data);
            },
            error:function(msg) {
                cosole.log(msg);
            }
        });
    });
    
});
</script>
</head>
<body>
      <a id="btn_log" href="#">提交</a>
</body>
</html>