<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>

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


</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
	
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${favorites}" var="favorite">
				<tr>
					<td>${favorite.id}</td>
					<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td><button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}" >삭제</button> 
				</tr>
			</c:forEach>
			</tbody>
			
		</table>
		
	 </div>
	 
	 <script>
	 // value="${favorite.id}""
	 $(document).ready(function(){
		 $('.del-btn').on('click', function(){
			 // 태그:data-fav
			 let id = $(this).data("favorite-id");
		 
		 
		 	$.ajax({
			 	type: "post"
			 	, url: "/lesson06/quiz02/delete_favorite"
			 	, data: {"id": id}
			 	, success: function(data){
						if(data.result == 'success'){
						location.reload();
						}else{
							alert(data.errorMessage);
							}
						}
			 	,error : function(e) {
						alert("삭제하는데 실패했습니다.");
						}
					});
				});
			});
		</script>
</body>
</html>