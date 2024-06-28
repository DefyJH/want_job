<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Star Rating Example</title>
<style>
    .stars {
        display: inline-block;
        font-size: 24px;
        cursor: pointer;
    }
    .stars span {
        color: gray;
    }
    .stars span:hover,
    .stars span.active {
        color: gold;
    }
</style>
</head>
<body>
    <h2>Rate this item:</h2>
    <div class="stars">
        <span onclick="rate(1)" id="star1">&#9733;</span>
        <span onclick="rate(2)" id="star2">&#9733;</span>
        <span onclick="rate(3)" id="star3">&#9733;</span>
        <span onclick="rate(4)" id="star4">&#9733;</span>
        <span onclick="rate(5)" id="star5">&#9733;</span>
    </div>
    
    <script>
        function rate(stars) {
            // AJAX request to send the rating to the server
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    // Optional: Update UI based on server response
                    alert("Rating submitted successfully!");
                }
            };
            xhttp.open("POST", "rateItem.jsp", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("rating=" + stars);
        }
    </script>
</body>
</html>