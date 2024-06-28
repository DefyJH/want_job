<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <%
    // 세션에서 닉네임과 코드 가져오기
    String nickname = (String) session.getAttribute("user_nickname");
    Integer code = (Integer) session.getAttribute("user_code");
    
    if (nickname != null && code != null) {
    %>
        <h2><%= nickname %>님 환영합니다!</h2>
        <h3>코드: <%= code %></h3>
    <%
    } else if (nickname != null) {
    %>
        <h2><%= nickname %>님 환영합니다!</h2>
        <h3>코드 정보가 없습니다.</h3>
    <%
    } else {
    %>
        <h2>로그인 상태가 아닙니다.</h2>
    <%
    }
    %>
    
</body>
</html>