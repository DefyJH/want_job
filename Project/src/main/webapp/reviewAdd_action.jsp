<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.ReviewDAO"%>
<%@ page import="userDB.dto.ReviewDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");	//문자인코딩 설정 한글깨짐 방지
	
	int user_code = Integer.parseInt(request.getParameter("user_code"));
	int contents_id = Integer.parseInt(request.getParameter("contents_id"));
	
	
	if(request.getParameter("review_text") == "") { %>
			<script>
			alert('리뷰가 작성되지 않았습니다. 리뷰를 작성해주세요.');
			location.href = "detail.jsp?contentId="+<%=contents_id%>;
			</script>
		<% } else if(request.getParameter("review_rating") == "") {%>
			<script>
			alert('평점이 체크되지 않았습니다. 평점을 체크해주세요.');
			location.href = "detail.jsp?contentId="+<%=contents_id%>;
			</script>
		<% } else {
 		
		String review_text = request.getParameter("review_text");
		String review_image = request.getParameter("review_image");
		int review_rating = Integer.parseInt(request.getParameter("review_rating"));

	
		ReviewDAO reviewDAO = new ReviewDAO();
		int result = reviewDAO.saveReview(user_code, contents_id, review_text, review_image, review_rating);

		
		if(result > 0) { %>
		<script>
			alert('리뷰 저장 성공');
			location.href = "detail.jsp?contentId="+<%=contents_id%>;
		</script>
		
		<% } else { %>

		<script>
			alert('리뷰 저장 실패');
			location.href = "detail.jsp?contentId="+<%=contents_id%>;
		</script>
		
		<% }
		
		}%>
</body>
</html>