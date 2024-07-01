<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.ReviewDAO"%>
<%@ page import="userDB.dto.ReviewDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

 		int user_code = Integer.parseInt(request.getParameter("user_code"));
		int contents_id = Integer.parseInt(request.getParameter("contents_id"));
		String review_text = request.getParameter("review_text");
		String review_image = request.getParameter("review_image");
		int review_rating = Integer.parseInt(request.getParameter("review_rating"));

	
		ReviewDAO reviewDAO = new ReviewDAO();
		int result = reviewDAO.saveReview(user_code, contents_id, review_text, review_image, review_rating);

		
		if(result > 0) { %>
		<script>
			alert('리뷰 저장 성공');
			window.history.back();
		</script>
		
		<% } else { %>

		<script>
			alert('리뷰 저장 실패');
			window.history.back();
			</script>
		
		<% } %>
</body>
</html>