<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script>
	$(document).ready(function(){
		// 배너 움직이기
		let bannerList = ["/image/banner1.jpg", "/image/banner2.jpg", "/image/banner3.jpg", "/image/banner4.jpg", ]
		let currentIndex = 1;
		setInterval(function() {
			$("#bannerImage").attr("src", bannerList[currentIndex]);
			currentIndex ++;
			
			if(currentIndex > bannerList.length){
				currentIndex = 0;
			}
		}, 3000);
		
		
		$('#search').on('click'),function()	{
			// alert("클릭");
			let name = $('#name')val().trim();
			let phoneNumber = $('#phoneNumber')val().trim();
			
			if(name == ''){
				alert("이름을 입력하세요");
			}
			if(phoneNumber==''){
				alert("전화번호를 입력하세요");
				return;
			}
			if(phoneNumber.startsWith("010") == false){
				alert("전화번호는 010으로 시작하는 번호만 입력 가능합니다.")
				return;
			}
			
			$.ajax({
				type:"POST"
				, url: "/lesson06/quiz03/search_reservation"
				, data: {"name":name, "phoneNumber":phoneNumber}
				, success: function(data) {
					if(data.result == "successs") {
						alert("이름:" + data.booking.name	 
								+ "\n날짜: " + data.booking.date.slice(0, 10)	// 2022-03-14
								+ "\n인원: " + data.booking.headcount
								+ "\n상태: " + data.booking.state
								
						);
					}else{
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("조회에 실패했습니다. 관리자에게 문의해 주세요")
				}
				
				
			});
		}
		
	});

</script>
</body>
</html>