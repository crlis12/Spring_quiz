<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>asdasd</title>

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
		<h1>즐겨찾기 추가</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" class="form-group form-control" id="name">
		</div>
		<div class="form-group ">
			<label for="url">URL 주소</label><br>
			<div class="form-inline">
				<input type="text" class="form-control col-10" id="url" name="url">
				<button type="button" class="btn btn-info ml-3" id="checkDuplicationBin"> 중복 확인</button>
			</div>
				<small id="duplicationText" class="text-danger d-none">중복된 URL입니다.</small>
				<small id="availableUrlText" class="text-success d-none">저정 가능한 URL입니다.</small>
		</div>
		
		<button type="button" id="addFavoriteBtn" class="btn btn-success btn-block">추가</button>
		
	</div>
	
	<script>
		$(document).ready(function() {
				$('#addFavoriteBtn').on('click', function(){
					//alert("클릭")
					
					let name = $('#name').val().trim();
					let url = $('#url').val().trim();
					
					if(name.length < 1) {
						alert("제목을 입력하세요.")
						return;
					}
					
					if(url == ''){
						alert("주소를 입력하세요")
						$('#nameStatusArea').append('<span class="text-danger">주소를 입력하세요</span>')
						return;
					}
					
					if(url.startsWith("http") == false && url.startsWith("https") == false){
						alert("주소 형식이 잘못 되었습니다.")
						return;
					}
					$.ajax({
						//request
						//Json형태이지만 자바 스크립트의 객체이기 때문에 키값에 String으로 안바꿔줘도 된다.
						type:"post"
						, url:"/lesson06/quiz01/add_favorite"
						, data: {"name":name, "url":url}
					
						// response
						, success: function(data){ //url에서 리턴된 json String을 object로 변환해준다.(jquery ajax 함수가)
							if(data.result == "success") {
								location.href = "/lesson06/quiz01/favorite_list_view";
							}
						}
						, error: function(e){
							alert("에러")
						}
					});
					
				});
				
				// quiz02 중복확인
				$('#checkDuplicationBin').on('click', function(){
					// alert("클릭")
					
					let url = $('#url').val().trim();
					if(url == ''){
						alert("검사할 URL을 입력해주세요");
						return;
					}
					
					$.ajax({
						// request
						type: "post"
						, url: "/lesson06/quiz02/is_duplication"
						, data: {"url": url}
					
						//response
						// json 형태로 data를 받게 되면 json String을 파싱해서 object형으로 내려오게 된다. 
						, success: function(data){
							if(data.result){
								//중복일 떄 
								$('#duplicationText').removeClass('d-none')
								$('#availableUrlText').addClass('d-none')
							}else{
								//중복이 아닐 때 => 사용 가능
								$('#availableUrlText').removeClass('d-none')
								$('#duplicationText').addClass('d-none')
							}
							
						}
						, error: function(e)	{
							alert("중복확인에 실패했습니다. 관리자에게 문의해주세요");
						}
						
					});
					
				});
		});
	</script>
</body>
</html>