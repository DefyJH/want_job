<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="travelDB.dao.LocalCodeDAO"%>
<%@ page import="travelDB.dao.TravelDestinationDAO"%>
<%@ page import="travelDB.dto.LocalCodeDTO"%>
<%@ page import="travelDB.dto.TravelDestinationDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<%
	//Local DB 적용하면 됨
	LocalCodeDAO localCodeDAO = new LocalCodeDAO();
	List<LocalCodeDTO> localList = localCodeDAO.getLocalCodeList();

	TravelDestinationDAO tdDAO = new TravelDestinationDAO();
	List<TravelDestinationDTO> tdList = tdDAO.findTravelDestinationByAreacode(1);
	%>


	<div id="topNav">
		<div id=login>

			<a href="">로그인</a> <a href="">회원가입</a> <a href="">마이페이지</a>
		</div>
	</div>

	<div>
		<div id="localSelectBar" class="selectbar">
			<button type="submit" class="selectlocal" value="0">전체</button>
			<% for (LocalCodeDTO lc : localList) { %>
			<button type="submit" class="selectlocal" value="<%=lc.getCode()%>"><%=lc.getName()%></button>
			<% } %>
		</div>
	</div>
	

	<script>
		
		//selectBar 클릭시 해당 areacode를 가진 tripbox를 보여줌
		let selectedLocal = document.querySelectorAll('.selectlocal');
		
		for(let sl of selectedLocal) {
			sl.addEventListener('click', ()=>{
				//해당 버튼의 value값을 받아서 전달
				location.href = "tripView.jsp?areaCode="+sl.value+"&viewList="+20;
			});
		}
	</script>
</body>
</html>