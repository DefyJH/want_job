<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.UserDateDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
   		request.setCharacterEncoding("UTF-8");	//문자인코딩 설정 한글깨짐 방지
   		
   		Integer code = (Integer) session.getAttribute("user_code");
   		int user_code = code;
   		
   		String user_nickname = request.getParameter("user_nickname");
   		String user_name = request.getParameter("user_name");
   		String user_tel = request.getParameter("user_tel");
   		String user_email = request.getParameter("user_email");
   		String user_address = request.getParameter("user_address");
   		String user_pw = request.getParameter("user_pw");
   		
   		UserDateDAO udDAO = new UserDateDAO();
   		int result = udDAO.updateUserInfo(user_nickname, user_name, user_tel, user_email, user_address, user_pw, user_code);
   		
   		if(result > 0) { %>
   		
		<script>
			alert('회원정보 업데이트 성공');
			location.href = "myPage_userUpdaet.jsp";
		</script>

	<% } else { %>

		<script>
			alert('회원정보 업데이트 실패');
			location.href = "myPage_userUpdaet.jsp";
			
			console.log(<%=user_code%>)
		</script>

	<% } %>

</body>
</html>