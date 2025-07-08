<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 위치 확인</title>
<style>
	body {
		background-color: #eaf3fb;
		font-family: 'Segoe UI', '맑은 고딕', sans-serif;
		margin: 0;
		padding: 0;
	}

	.car-num-box {
		margin: 30px auto 10px;
		padding: 15px 25px;
		font-size: 24px;
		font-weight: bold;
		color: #222;
		background-color: #fff;
		border: 2px solid #3498db;
		border-radius: 10px;
		box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
		width: fit-content;
		text-align: center;
	}

	h1 {
		text-align: center;
		color: #2d6ac0;
		margin-top: 20px;
		font-weight: 700;
	}

	.list {
		display: flex;
		justify-content: center;
		gap: 30px;
		padding: 40px 20px;
		flex-wrap: wrap;
	}

	table {
		border-collapse: collapse;
		border: 1px solid #ccc;
		border-radius: 10px;
		overflow: hidden;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		background-color: #fff;
	}

	td {
		width: 60px;
		height: 50px;
		text-align: center;
		font-weight: bold;
		font-size: 15px;
		border: 1px solid #ddd;
	}

	.on {
		background-color: #ffffff;
		color: #000;
		border: 2px solid #3498db;
		box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
	}

	.off {
		background-color: #f1f1f1;
		color: #aaa;
	}
</style>
</head>
<body>

	<div class="car-num-box">
		차량 번호 : ${param.car_num}
	</div>

	<h1>🚘 차량 현재 위치</h1>

	<div class="list">
		<c:set var="List" value="${plist }" />
		<c:set var="car_location" value="${parking_id }" />

		<c:forEach begin="0" end="4" var="col">
			<table>
				<c:forEach var="list" items="${List }" varStatus="status">
					<c:if test="${status.index >= col * 10 && status.index < (col + 1) * 10}">
						<tr>
							<td>${list.parking_id}</td>
							<c:choose>
								<c:when test="${list.parking_id == car_location}">
									<td class="on">🚘</td>
								</c:when>
								<c:otherwise>
									<td class="off">&nbsp;</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</c:forEach>
	</div>

</body>
</html>
