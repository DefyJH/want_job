<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/my_page.css">
</head>
<body>
	<div>
      <h1>
      	<a id="gotoMain" href="index.jsp">메인<br/>화면</a>
      	<br/>
      	<br/>
         <a href="my_page.jsp">MY PAGE</a>
      </h1>
   </div>
   <div class="sidebar">
      <ul>
			<li><a href="my_page_user_updaet.jsp">회원정보수정</a></li>
			<li><a href="my_page_user_delete.jsp">회원탈퇴</a></li>
			<li><a href="my_page_user_review.jsp">나의 리뷰관리</a></li>
      </ul>
   </div>
   <div id="main-content">
   </div>
	
</body>
</html>