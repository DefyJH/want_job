<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.UserDateDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
</head>
<body>
	<%
   	request.setCharacterEncoding("UTF-8");
   
   	Integer code = (Integer) session.getAttribute("user_code");
   	int user_code = code.intValue();
   
   	UserDateDAO udDAO = new UserDateDAO();
   	int result = udDAO.updateUserStatus(user_code);
   	
   	if(result > 0) { %>
		<script>
			alert('회원탈퇴 성공');
			
		<% //세션 청소
			session.invalidate(); %>
			location.href= " index.jsp ";
		</script>
		
	<% } else { %>

		<script>
			alert('회원탈퇴 실패');
			
			location.href = " myPage_userDelete.jsp ";
		</script>
   	
   <% } %>

</body>
</html>