<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날 씨</title>


<link rel="stylesheet" href="/css/quiz05.css" type="text/css">

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



</head>
<body>
	<div class="container">
		<div class="d-flex">
			<aside class="bg-info col-2">
				<div>
					<img alt="logo" src="/image/logo.jpg" width="150px" height="50px">
				</div>
				<ul class="nav  flex-column">
					<li class="font-weight-bold text-white mt-2">날씨</li>
					<li class="font-weight-bold text-white mt-2">날씨 입력</li>
					<li class="font-weight-bold text-white mt-2">테마 날씨</li>
					<li class="font-weight-bold text-white mt-2">관측 기후</li>
				</ul>
			</aside>
			<section class="bg-warning col-10">
				<div>
					<h1>과거 날씨</h1>
					<table class="table text-center">
						<thead>
							<tr>
								<th>날짜</th>
								<th>날씨</th>
								<th>기온</th>
								<th>강수량</th>
								<th>미세먼지</th>
								<th>풍속</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${weatherHistory}" var="weather">
							<tr>
								<td>${weather.date}</td>
							<c:choose>
								<c:when test="${weather.weather eq '맑음' }">
									<td><img src="/image/sunny.jpg" alt="맑음"></td>
								</c:when>
								<c:when test="${weather.weather eq '구름조금' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg" alt="맑음"></td>
								</c:when>
								<c:when test="${weather.weather eq '흐림' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg" alt="맑음"></td>
								</c:when>
								<c:when test="${weather.weather eq '비' }">
									<td><img src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg" alt="맑음"></td>
								</c:when>
							</c:choose>
								<td>${weather.temperatures}</td>
								<td>${weather.precipitation}</td>
								<td>${weather.microDust}</td>
								<td>${weather.windSpeed}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>
	</div>
	
</body>
</html>