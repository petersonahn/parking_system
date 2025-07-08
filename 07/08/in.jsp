<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
	body {
  	background-color: #eaf3fb;
	}
	.main {
	width: 800px;
	display: flex;
	flex-direction: column;
	margin: 80px auto;
	border-radius: 12px;
	padding: 40px 30px 60px;
	background-color: #ffffff;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
	}
	
	.header {
		margin: 40px auto;
		text-align: center;
		color: #a0a0a0;
		font-weight: 700;
		font-size: 20px;
		letter-spacing: 1px;
	}
	
	.body {
		display: flex;
		justify-content: center;
	}
	
	.body form {
		display: flex;
		margin: auto;
		gap: 30px;
	}
	
	.body input {
		font-size: 18px;
		padding: 10px 15px;
		text-align: center;
		border: 1.5px solid #ccc;
		border-radius: 8px;
		transition: border-color 0.3s ease;
	}
	
	.body input:focus {
		border-color: #3498db;
		outline: none;
		box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
	}
	
	.body button {
		padding: 15px 40px;
		border: none;
		border-radius: 10px;
		background-color: #3498db;
		color: white;
		font-weight: 600;
		font-size: 18px;
		cursor: pointer;
		transition: background-color 0.3s ease, transform 0.2s ease;
		box-shadow: 0 4px 10px rgba(52, 152, 219, 0.5);
	}
	
	.body button:hover {
		background-color: #2980b9;
		transform: translateY(-3px);
	}
		
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$(".car_num_input").click(function() {
			
			const koreanChars = [
                "가", "나", "다", "라", "마", "거", "너", "더", "러", "머",
                "버", "서", "어", "저", "고", "노", "도", "로", "모", "보",
                "소", "오", "조", "구", "누", "두", "루", "무", "부", "수",
                "우", "주", "아", "바", "사", "자", "배", "허", "하", "호"
            ];

            const firstNumber = Math.floor(Math.random() * 90) + 10;   // 10 ~ 99
            const koreanChar = koreanChars[Math.floor(Math.random() * koreanChars.length)];
            const lastNumber = Math.floor(Math.random() * 9000) + 1000; // 1000 ~ 9999

            const carNum = firstNumber + koreanChar + lastNumber;
		    
	        $(".car_num_input").val(carNum);
		});
	});

</script>

<title>Insert title here</title>
</head>
	<body>
		
		<div class="main">
		<div class="header">
			<h1>입차할 차량 번호 입력</h1>
		</div>
		
		<div class="body">
			<form method="post" action="parking.go">
				<input class="car_num_input" name="car_num" value="" placeholder="차량 번호를 입력하세요" maxlength="10" required>
				<button type="submit">입력</button>
			</form>	
		</div>
	</div>

</body>
</html>

