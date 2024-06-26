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
	request.setCharacterEncoding("UTF-8"); //문자인코딩 설정 한글깨짐 방지

	int areaCode = Integer.parseInt(request.getParameter("areaCode"));
	int viewList = Integer.parseInt(request.getParameter("viewList"));

	//Local DB 적용하면 됨
	LocalCodeDAO localCodeDAO = new LocalCodeDAO();
	List<LocalCodeDTO> localList = localCodeDAO.getLocalCodeList();

	TravelDestinationDAO tdDAO = new TravelDestinationDAO();
	List<TravelDestinationDTO> tdList = null;
	if (areaCode > 0) {
		tdList = tdDAO.findTravelDestinationByAreacode(areaCode);
	} else {
		tdList = tdDAO.getTravelDestinationList();
	}
	%>


	<div id="topNav">
		<div id=login>
			<a href="">로그인</a> <a href="">회원가입</a> <a href="">마이페이지</a>
		</div>
	</div>

	<div>
		<div id="localSelectBar" class="selectbar">
			<button type="submit" class="selectlocal" value="0">전체</button>
			<%
			for (LocalCodeDTO lc : localList) {
			%>
			<button type="submit" class="selectlocal" value="<%=lc.getCode()%>"><%=lc.getName()%></button>
			<%
			}
			%>
		</div>
	</div>

	<div id="tripView">
		<%
		for (int i = 0; i < viewList; i++) {
			//where = 지역코드에 해당하는 여행지 size()로 반복
		%>
		<button class="tripbox" value="">
			<div class="img" style="background-image:url('<%=tdList.get(i).getFirstimage()%>')"></div>
			<%-- <p><%=localList.get(areaCode-1).getName() %></p> --%>
			<div id="tripTitle">
				<h3><%=tdList.get(i).getTitle()%></h3>
			</div>
		</button>
		<%
		}
		%>

		<button id="add" onclick="addList()">더보기 +</button>

	</div>

	<script>
		//selectBar 클릭시 해당 areacode를 가진 tripbox를 보여줌
		let selectedLocal = document.querySelectorAll('.selectlocal');
		
		for(let sl of selectedLocal) {
			sl.addEventListener('click', ()=>{
				location.href = "tripView.jsp?areaCode="+sl.value+"&viewList="+20;
			});
		}
		
		//.tripbox 클릭 시 해당 detail 페이지로 이동
		let tripbox = document.querySelectorAll('.tripbox');
		
		for(let tb of tripbox) {
			tb.addEventListener('click', ()=>{
				location.href = "detail.jsp";
			});
		}
		
		
		//더보기 클릭 시 파라미터로 viewList 값 변경해서 목록 더 보여주기
		function addList() {
			location.href = "tripView.jsp?areaCode="+<%=areaCode%>+"&viewList="+<%=viewList+20%>;
		}
		
		//ajax 활용해서 더보기 클릭시 목록 더 보여주기
		//보류
		
		
	</script>

</body>
</html>