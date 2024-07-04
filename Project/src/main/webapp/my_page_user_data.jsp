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
	
	//유저 핸드폰번호, 생년월일, 성별 가져오기
	UserDateDTO udo = uDAO.findOtherDataByUserCode(user_code);
	
	String userGender = "성별없음";
	
	if (udo.getUser_gender() == 1 || udo.getUser_gender() == 3 ) {
		userGender = "남성";
	} else if(udo.getUser_gender() == 2 || udo.getUser_gender() == 4) {
		userGender = "여성";
	}
	
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
			<div id="FindUserDate">
				<h2>회원정보조회</h2>
				<p>
					닉네임 :
					<span><%=ud.getUser_nickname()%></span>
				</p>
				<p>
					이름 :
					<span><%=ud.getUser_name()%></span>
				</p>

				<p>
					생년월일 :
					<span><%=udo.getUser_birthdate()%></span>
				</p>
				<p>
					성별 :
					<span><%=userGender %></span>
				</p>
				
				<p>
					전화번호 :
					<span><%=udo.getPhone_num()%></span>
				</p>
				<p>
					이메일 :
					<span><%=ud.getUser_email()%></span>
				</p>
				<p>
					주소 :
					<span><%=ud.getUser_address()%></span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>