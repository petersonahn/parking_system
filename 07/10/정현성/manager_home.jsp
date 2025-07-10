<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	* {
		box-sizing: border-box;
		font-family: 'Segoe UI', '맑은 고딕', sans-serif;
		margin: 0;
		padding: 0;
	}

	body {
		background-color: #eaf3fb;
	}

	.main {
		width: 1000px;
		display: flex;
		flex-direction: column;
		margin: 120px auto;
		background-color: white;
		border-radius: 20px;
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
		padding: 60px 0 80px;
	}

	.header {
		text-align: center;
		margin-bottom: 40px;
	}

	.header h1 {
		color: #a0a0a0;
		font-size: 42px;
		font-weight: 700;
		letter-spacing: 2px;
	}
	
	.header h2 {
		color: #a0a0a0;
		font-size: 25px;
		font-weight: 700;
		letter-spacing: 2px;
		margin-top: 20px;
	}

	.body {
		display: flex;
		justify-content: center;
		gap: 60px;
	}

	.body button {
		padding: 40px 20px;
		border: none;
		border-radius: 15px;
		background-color: #bbe7bb;
		color: white;
		font-size: 22px;
		font-weight: bold;
		cursor: pointer;
		transition: background-color 0.3s ease, transform 0.2s ease;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
		width: 180px;
		height: 160px;
		text-align: center;
		line-height: 1.5;
		white-space: pre-line;
	}

	.body button:hover {
		background-color: #91d391;
		transform: translateY(-4px);
	}
	
	.main-btn {
		background-color: #bbe7bb;
		color: white;
		border: none;
		padding: 14px 24px;
		border-radius: 8px;
		font-size: 16px;
		cursor: pointer;
		font-weight: 600;
		box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
		transition: background-color 0.3s ease, transform 0.2s ease;
		margin-top: 100px;
		display: block;
		margin: 80px auto 0;
	}
	
	.main-btn:hover {
		background-color: #91d391;
		transform: translateY(-2px);
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<div class="main">
		<div class="header">
			<h1>주차 관제 시스템</h1>
			<h2>관리자 페이지</h2>
		</div>
	
		<div class="body">
			<button onclick="location.href='manager_detail.go'">주차 현황</button>
			<button onclick="location.href='list_car.go'">주차 기록</button>
			<button onclick="location.href='#'">요금 변경</button>
			<button onclick="location.href='user_management.go'">회원 관리</button>
		</div>
		
		<div style="text-align: center;">
			<button class="main-btn" onclick="location.href='/'">← 돌아가기</button>
		</div>
	</div>
</body>
</html>
