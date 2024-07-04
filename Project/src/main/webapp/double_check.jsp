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
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8"); // 문자 인코딩 설정 한글깨짐 방지
    
    String inputId = request.getParameter("inputId");
    
    UserDateDAO uDAO = new UserDateDAO();
    List<UserDateDTO> uList = uDAO.getUserDataList();
    
    boolean isAvailable = true;
    for(UserDateDTO u : uList) {
        if(u.getUser_id().equals(inputId)) {
            isAvailable = false;
            break;
        }
    }
    
    if(isAvailable) {
%>
    <script>
        alert('사용 가능한 아이디입니다.');
        window.history.back(); // 사용 가능할 때의 이동할 URL 설정
    </script>
<%
    } else {
%>
    <script>
        alert('사용할 수 없는 아이디입니다. 다시 입력해주세요.');
        window.history.back();
    </script>
<%
    }
%>

</body>
</html>