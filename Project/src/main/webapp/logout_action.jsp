<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
</head>
<body>
	<%
		session.invalidate(); //세션 청소
	%>
	<script>
		alert('로그아웃 성공')
		location.href='index.jsp';
	</script>
</body>
</html>