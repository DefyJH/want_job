<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="travelDB.dao.LocalCodeDAO"%>
<%@ page import="travelDB.dao.TravelDestinationDAO"%>
<%@ page import="travelDB.dao.ContentTypeDAO"%>
<%@ page import="travelDB.dao.TravelDetailDAO"%>
<%@ page import="travelDB.dao.DisabilityInfoDAO"%>
<%@ page import="userDB.dao.ReviewDAO"%>
<%@ page import="userDB.dao.UserDateDAO"%>


<%@ page import="travelDB.dto.LocalCodeDTO"%>
<%@ page import="travelDB.dto.TravelDestinationDTO"%>
<%@ page import="travelDB.dto.ContentTypeDTO"%>
<%@ page import="travelDB.dto.TravelDetailDTO"%>
<%@ page import="travelDB.dto.DisabilityInfoDTO"%>
<%@ page import="userDB.dto.ReviewDTO"%>
<%@ page import="userDB.dto.UserDateDTO"%>

<%@ page import="travelDB.util.ConvertDateUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
<link rel="stylesheet" type="text/css" href="./css/my_page.css">
</head>
<body>
	<% 
	Integer code = (Integer) session.getAttribute("user_code");
	int user_code = code;
	
	UserDateDAO uDAO = new UserDateDAO();
	UserDateDTO ud = uDAO.findUserDataByUserCode(user_code);
	
	%>
	<div>
		<h1>
			<a id="gotoMain" href="index.jsp">Travel<br />For All
			</a> <br /> <br /> <a href="my_page.jsp">MY PAGE</a>
		</h1>
	</div>
	<div class="sidebar">
		<ul>
			<li><a href="my_page_user_data.jsp">회원정보확인</a></li>
			<li><a href="my_page_user_updaet.jsp">회원정보수정</a></li>
			<li><a href="my_page_user_delete.jsp">회원탈퇴</a></li>
			<li><a href="my_page_user_review.jsp">나의 리뷰관리</a></li>
		</ul>
	</div>
	<div id="main-content">
		<div id="frm_deleteAccount">
			<div id="deleteUser">
				<h2>회원탈퇴</h2>
				<label> 비밀번호 : <input type="text" id="input_pw">
				</label>
				<button onclick="deleteButton()">탈퇴하기</button>
			</div>
		</div>
	</div>
	<script>

		let userPW = '<%=ud.getUser_pw()%>';

		function deleteButton() {
			if(document.querySelector('#input_pw').value == userPW) {
				location.href = "delete_user.jsp";
			} else {
				alert("비밀번호가 맞지 않습니다. 다시 입력해주세요.");
			}
		}
		
	</script>
</body>
</html>