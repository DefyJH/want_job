<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.signupDAO" %>
<%@ page import="userDB.dto.signupDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");  //문자인코딩 설정  한글깨짐 방지
		System.out.println(request.getParameter("user_name"));
		System.out.println(request.getParameter("user_id"));
		System.out.println(request.getParameter("user_pw"));
		System.out.println(request.getParameter("user_nickname"));
		System.out.println(request.getParameter("user_regno"));
		System.out.println(request.getParameter("user_tel"));
		System.out.println(request.getParameter("user_email"));
		System.out.println(request.getParameter("user_address"));
		
		
		String user_name = request.getParameter("user_name");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nickname = request.getParameter("user_nickname");
		String user_regno = request.getParameter("user_regno");
		String user_tel = request.getParameter("user_tel");
		String user_email = request.getParameter("user_email");
		String user_address = request.getParameter("user_address");
		

		signupDAO signupDAO = new signupDAO();
		
		//DTO객체로 감싸서 저장
		signupDTO signup = new signupDTO();
		signup.setUser_name(user_name);
		signup.setUser_id(user_id);
		signup.setUser_pw(user_pw);
		signup.setUser_nickname(user_nickname);
		signup.setUser_regno(user_regno);
		signup.setUser_tel(user_tel);
		signup.setUser_email(user_email);
		signup.setUser_address(user_address);
		
		int result = signupDAO.saveUsers(signup);
		
		if( result > 0){
	%>
	
		<script>
			alert('저장 성공');
			location.href = 'signup.jsp'; //
		</script>
	
	<%
		} else {
	%>
		<script>
			alert('저장 실패');
			history.back(); //뒤로가기
		</script>
		
	<%	
		}
	%>
</body>
</html>