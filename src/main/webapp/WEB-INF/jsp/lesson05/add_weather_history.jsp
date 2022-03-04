<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날 씨 추 가</title>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
	<!-- datepicker 라이브러리 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/quiz05.css" type="text/css">

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
			<section class="col-10">
				<h3>날씨 입력</h3>
				<form method="post" action="/lesson05/add_weather">
					<div class="d-flex justify-content-between mt-5">
						<div class="d-flex align-items-center">
							<div class="input-label"> 날짜</div>
							<input type="text" class="form-control" id="date" name="date">						
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label">날씨</div>
							<Select class="form-control" name="weather">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</Select>
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label ">미세먼지</div>
							<Select class="form-control" name="microDust">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</Select>
						</div>
					</div>
					<div class="d-flex justify-content-between mt-5">
						<div class="d-flex align-items-center">
							<div class="input-label"> 기온</div>
							<input type="text" class="form-control" id="temperatures" name="temperatures">						
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label"> 강수량</div>
							<input type="text" class="form-control" id="precipitation" name="precipitation">						
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label"> 풍속</div>
							<input type="text" class="form-control" id="WindSpeed" name="WindSpeed">						
						</div>
					</div>
					
					<button type="submit" class="btn btn-success">저장</button>
				</form>
			</section>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#date').datepicker({
				dateFormat: "yy-mm-dd"	//표시 포맷
				, changeYear: true	//년 셀렉트
				, changeMonth: true //월 셀렉트
			});
		});
	</script>
</body>
</html>