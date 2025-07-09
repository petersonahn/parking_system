<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		width: 1200px;
		display: flex;
		flex-direction: column;
		margin: 150px auto;
		background-color: white;
		border-radius: 20px;
		box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
		padding: 80px 0 100px;
		position: relative; 
		width: 1200px;
	}

	.header {
		text-align: center;
		margin-bottom: 110px;
	}

	.header h1 {
		color: #a0a0a0;
		font-size: 48px;
		font-weight: 700;
		letter-spacing: 2px;
	}

	.body {
		display: flex;
		justify-content: center;
		gap: 80px;
		margin-bottom: 60px;
	}

	.body button {
		padding: 50px 30px;
		border: none;
		border-radius: 20px;
		background-color: #3498db;
		color: white;
		font-size: 26px;
		font-weight: bold;
		cursor: pointer;
		transition: background-color 0.3s ease, transform 0.2s ease;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
		width: 220px;
		height: 200px;
		text-align: center;
		line-height: 1.5;
		white-space: pre-line;
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
		font-size: 24px;
		width: 60px;
		height: 60px;
		border-radius: 50%;
		background-color: #3498db;
		color: white;
		border: none;
		cursor: pointer;
		transition: background-color 0.3s ease, transform 0.2s ease;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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

	<div class="main">
	
		<button class="settings-btn" onclick="location.href='manager_main.go'">⚙</button>
		<div class="header">
			<h1>주차 관제 시스템</h1>
		</div>

		<div class="body">
			<button onclick="location.href='came_in.go'">입 차</button>
			<button onclick="location.href='went_out.go'">출 차</button>
			<button onclick="location.href='search_car.go'">차 량<br>조 회</button>
			<button onclick="location.href='list_car.go'">차 량<br>리스트</button>
		</div>
		
	</div>

</body>
</html>
