<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>

<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- 원본 제이쿼리 스크립트 가져온다(슬림 x) -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
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

<link rel="stylesheet" href="/css/reservation.css" type="text/css">


</head>
<body>
	<div class="container">
		<header>
			<h1 class="text-center mt-3">통나무 펜션</h1>
		</header>
		<nav class="bg-info">
			<ul class="nav nav-fill">
				<!-- nav nav-fill 세트. 메뉴를 nav에 가득 채운다. -->
				<li class="nav-item"><a href="#" class="nav-link text-white">펜션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">객실보기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">예약하기</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white">예약목록</a></li>
			</ul>
		</nav>
		<section><h3 class="font-weight-bold text-center mt-3">예약 하기</h3></section>
		<section>
			<div class="d-flex justify-content-center">
				<div class="">
					<b>이름</b>
					<input type="text" name="name" class="form-control">
					<b>예약날짜</b>
					<input type="text" name="date" class="form-control ">
					<b>숙박일수</b>
					<input type="text" name="day" class="form-control ">
					<b>숙박인원</b>
					<input type="text" name="headcount" class="form-control  ">
					<b>전화번호</b>
					<input type="text" name="phoneNumber" class="form-control">
					<button type="button" class="reservationBtn btn btn-warning mt-3 btn-block">예약하기</button>
				</div>
			</div>
			<footer>
				<hr>
				<small class="footer-font">제주특별자치도 제주시 애월읍<br>
				사업자 등록번호:111-2222-3333/농어촌민박사업자지정/대표:김통목<br>
				Copyright © chang 2022<br>
				</small>
			</footer>
			
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			$('input[name=date]').datepicker({
				minDate:0 // 오늘 부터 그 뒤 선택
				, dateFormat: "yy-mm-dd"
				
			});
			
			$('.reservationBtn').on('click', function(){
				let name = $('input[name=name]').val().trim();
				let date = $('input[name=date]').val().trim();
				let day = $('input[name=day]').val().trim();
				let headcount = $('input[name=headcount]').val().trim();
				let phoneNumber = $('input[name=phoneNumber]').val().trim();
				
				if(name ==''){
					alert("이름을 입력하세요")
					return;
				}
				if(date ==''){
					alert("날짜를 입력하세요")
					return;
				}
				if(day ==''){
					alert("숙박일을 입력하세요")
					return;
				}
				if(isNaN(day)){
					alert("숙박일은 숫자만 입력 가능합니다.")
					return;
				}
				if(headcount ==''){
					alert("숙박인원을 입력하세요")
					return;
				}
				if(isNaN(headcount)){
					alert("숙박인원은 숫자만 입력 가능합니다.")
					return;
				}
				if(phoneNumber ==''){
					alert("전화번호를 입력하세요")
					return;
				}
				
				$.ajax({
					type:"post"
					, url: "/lesson06/quiz03/add_reservation"
					, data: {"name": name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
					
					//response
					, success: function(data){
						if(data.result == 'success'){
							alert("예약 되었습니다.")
							location.href="/lesson06/quiz03/1";
						}else{
							alert(data.error_message)
						}
					}
					, error: function(e){
						alert("예약에 실패했습니다. 관리자에게 문의해주세요")
					}
				});
			});
		});
	</script>
</body>
</html>