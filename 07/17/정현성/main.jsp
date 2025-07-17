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
		height: 100%;
	}

	html {
		height: 100%;
	}

	.top-banner {
		width: 100%;
		height: 38vh;
		background: #eaf3fb url('/banner_20250711.gif') no-repeat center center;
		background-size: 1200px auto;
	}
	
	.wrapper {
	width: 100vw;
	height: calc(100vh - 38vh); /* 배너 높이를 뺌 */
	display: flex;
	justify-content: center;
	align-items: flex-start;
	overflow: hidden;
	}

	.main {
		width: 1200px;
		margin: 10px auto 50px;
		background-color: white;
		border-radius: 20px;
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
		padding: 50px 0 80px;
		position: relative;
		height: 55vh;
		display: flex;
		flex-direction: column;
		align-items: center;
		transform-origin: top center;
		transform: scale(calc(min(100vw / 1200, 100vh / 800)));
	}

	.header {
		margin-bottom: 70px;
		text-align: center;
	}

	.header h1 {
		color: #a0a0a0;
		font-size: 48px;
		font-weight: 700;
	}

	.body {
		display: flex;
		justify-content: center;
		gap: 80px;
		margin-bottom: 30px;
	}

	.body button {
		padding: 50px 30px;
		width: 220px;
		height: 200px;
		border: none;
		border-radius: 20px;
		background-color: #3498db;
		color: white;
		font-size: 26px;
		font-weight: bold;
		cursor: pointer;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
		text-align: center;
		line-height: 1.5;
		transition: background-color 0.3s ease, transform 0.2s ease;
	}

	.body button:hover {
		background-color: #2874bd;
		transform: translateY(-5px);
	}

	.footer {
		display: flex;
		justify-content: center;
	}

	.footer button {
		width: 60px;
		height: 60px;
		border-radius: 50%;
		background-color: #3498db;
		color: white;
		border: none;
		cursor: pointer;
		font-size: 24px;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		transition: background-color 0.3s ease, transform 0.2s ease;
	}

	.footer button:hover {
		background-color: #2874bd;
		transform: rotate(20deg);
	}

	.settings-btn {
		position: absolute;
		top: 30px;
		right: 30px;
		width: 80px;
		height: 80px;
		font-size: 36px;
		border-radius: 50%;
		background-color: #3498db;
		color: white;
		border: none;
		cursor: pointer;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
		transition: background-color 0.3s ease, transform 0.2s ease;
	}

	.settings-btn:hover {
		background-color: #2874bd;
		transform: rotate(20deg);
	}
</style>
<title>주차 관제 시스템</title>
</head>
<body>

	<!-- 상단 배너 이미지 -->
	<div class="top-banner"></div>
	<div class="wrapper">
	<div class="main">
	
		<!-- 설정 버튼 -->
		<button class="settings-btn" onclick="location.href='manager_login.go'">⚙</button>

		<!-- 제목 -->
		<div class="header">
			<h1>주차 관제 시스템</h1>
		</div>

		<!-- 주요 버튼 -->
		<div class="body">
			<button onclick="location.href='parking_in.go'">입 차</button>
			<button onclick="location.href='parking_out.go'">출 차</button>
			<button onclick="location.href='search_car.go'">차 량<br>조 회</button>
		</div>
	  </div>	
	</div>

</body>
</html>
