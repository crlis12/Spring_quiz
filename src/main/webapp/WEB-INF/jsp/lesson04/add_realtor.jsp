<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사</title>


<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>
<body>

	<div class="container">
		<h1>공인중개사 추가</h1>
		<form method="post" action="/lesson04/quiz02/add_realtor">
		<div class="form-group">
			<label for="office"><b>상호명</b></label>
			<input type="text" class="form-control col-4" name="office" placeholder="상호명을 입력하세요">
		</div>
		<div class="form-group">
			<label for="phoneNumber"><b>전화번호</b></label>
			<input type="text" class="form-control col-4" name="phoneNumber" >
		</div>
		<div class="form-group">
			<label for="address"><b>주소</b></label>
			<input type="text" class="form-control col-6" name="address" >
		</div>
		<div class="form-group">
			<label for="grade"><b>등급</b></label>
			<input type="text" class="form-control col-4" name="grade">
		</div>
		<button type="submit" class="btn btn-success">추가</button>
		</form>
	</div>

</body>
</html>