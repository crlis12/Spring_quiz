<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		<section class="mt-3">
			<h3 class="text-center font-weight-bold">예약 목록 보기</h3>
		</section>
		<section class="mt-3">
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${booking }" var="book">

						<tr>
							<td>${book.name}</td>
							<td><fmt:formatDate value="${book.date }" pattern="yyyy월 M월	dd일" /></td>
							<td>${book.day}</td>
							<td>${book.headcount}</td>
							<td>${book.phoneNumber}</td>
							<td>
								<c:choose>
									<c:when test="${book.state eq '확정'}">
										<span class="text-success">${book.state}</span>
									</c:when>
									<c:when test="${book.state eq '대기중'}">
										<span class="text-info">${book.state}</span>
									</c:when>
									<c:when test="${book.state eq '취소'}">
										<span class="text-danger">${book.state}</span>
									</c:when>
								</c:choose>
							</td>
							<td><button type="button"class="del-btn btn bg-danger text-white" data-reservation-id="${book.id}">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<footer>
			<hr>
			<small class="footer-font">제주특별자치도 제주시 애월읍<br>
			사업자 등록번호:111-2222-3333/농어촌민박사업자지정/대표:김통목<br>
			Copyright © chang 2022<br>
			</small>
		</footer>
	</div>

	<script>
		$(document).ready(function() {
			$('.del-btn').on('click', function() {
				let bookingid = $(this).data("reservation-id");

				$.ajax({
					//request					
					type : "DELETE", // 삭제로 들어오지 안흐염 실행되지 않는다
					url : "/lesson06/quiz03/delete_reservation",
					data : {"id" : bookingid},
					//response
					success : function(data) {
						if (data.result == 'success') {
							location.reload();
						} else {
							alert(data.errorMessage);
						}
					},
					error : function(e) {
						alert("삭제하는데 실패했습니다.");
					}
				});
			});

		});
	</script>
</body>
</html>