<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="/css/quiz06.css" type="text/css">


</head>
<body>
	
	<div class="wrap">
		<header class="bg-info text-center"><h1 class="text-white">배탈의 민족</h1></header>
		<h1>${mystore.name }- 리뷰</h1>
		
		<c:forEach items="${review}" var="review">
			<c:choose>
				<c:when test="${mystore.id eq review.storeId }">
					<div class="reviewList mt-3 font-weight-bold">
						${review.userName}
						<img alt="별" src="http://marondal.com/material/images/dulumary/web/jstl/star_fill.png" width="20px" height="20px" class="mb-2"><br> 
						<span class="font_date"><fmt:formatDate value="${review.createdAt}" pattern="yyyy년 M월 d일"/></span><br>
						${review.review }<br>					
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
		<footer>
			<hr>
			<h3>(주)우와한	형제</h3>
			<h4 class="font_date">고객센터:1500-1500</h4>
		</footer>
	</div>
</body>
</html>