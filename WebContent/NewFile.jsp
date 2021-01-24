<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/jquery-1.11.2.min.js" type="text/javascript">
	$("#id").blur(function() {
		$("#idchk").html('<p style="color:blue">사용가능</p>');
		
	});
</script>
</head>
<body>
<div>아이디</div>
<div><input type="text" name="id" id="id">
<span id="idchk"></span>
</div>
</body>
</html>