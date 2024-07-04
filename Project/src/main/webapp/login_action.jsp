<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.loginDAO"%>
<%@ page import="userDB.dto.loginDTO"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");

    String user_id = request.getParameter("user_id");
    String user_pw = request.getParameter("user_pw");

    loginDAO loginDAO = new loginDAO();
    loginDTO login = new loginDTO();

    login.setUser_id(user_id);
    login.setUser_pw(user_pw);

    String[] userInfo = loginDAO.loginMove(user_id, user_pw);

    if (userInfo != null) {
        String nickname = userInfo[0];
        Integer code = Integer.parseInt(userInfo[1]);
        session.setAttribute("user_nickname", nickname);
        session.setAttribute("user_code", code);
        %>
        <script>
            alert('로그인 성공');
            location.href = "index.jsp";
        </script>
        <%
    } else {
        %>
        <script>
            alert('로그인 실패: 아이디 또는 비밀번호를 확인하세요.');
            location.href = "login.jsp";
        </script>
        <%
    }
    %>
</body>
</html>