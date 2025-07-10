<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
	background-color: #eaf3fb;
	font-family: 'Segoe UI', '맑은 고딕', sans-serif;
	margin: 0;
	padding: 0;
	}
	
	h1 {
		text-align: center;
		color: #2d6ac0;
		margin-top: 60px;
		margin-bottom: 40px;
		font-weight: 700;
	}
	
	.list {
		display: flex;
		justify-content: center;
		gap: 30px;
		padding: 40px 20px;
		flex-wrap: wrap;
	}
	
	.zone {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		gap: 20px;
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
		background-color: skyblue;
		color: #000;
		border: 2px solid #3498db;
		box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
	}
	
	.off {
		background-color: #f1f1f1;
		color: #aaa;
	}
	
	.btn {
		display: flex;
		justify-content: center;
		margin-bottom: 40px;
	}
	
	.btn button.home-btn {
		background-color: #3498db;
		border: none;
		border-radius: 50%;
		width: 70px;
		height: 70px;
		cursor: pointer;
		transition: background-color 0.3s ease, transform 0.2s ease;
		display: flex;
		align-items: center;
		justify-content: center;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	}
	
	.btn button.home-btn:hover {
		background-color: #2874bd;
		transform: scale(1.1);
	}
	

		
</style>
<title>Insert title here</title>
</head>
<body>

	<c:set var="car_location" value="${parking_id }" />
	<c:set var="List" value="${plist }" />
	<c:set var="groupSize" value="10" />

	<div>
		<h1>조회된 차량의 위치는 '${car_location }' 입니다.</h1>
	</div>

	<div class="list">
		
		<div class="zone">
			<c:forEach var="groupIndex" begin="0" end="4">
				<div>
					<table border="1">
						
					    <c:forEach var="list" items="${List }" varStatus="status">
					    	<c:if test="${status.index >= groupIndex * groupSize && status.index < (groupIndex + 1) * groupSize}">
					    		<tr>
							    	<td>${list.parking_id}</td>
							    	<c:choose>
										<c:when test="${list.getParking_id() != car_location}">
											<td class="off">
												<input type="hidden" class="val" value="${list.parking_id}"/>
												&nbsp;
											</td>
										</c:when>
										<c:otherwise>
											<td class="on">&nbsp;</td>
										</c:otherwise>
									</c:choose>
								</tr>
					    	</c:if>
					    </c:forEach>
					</table>
				</div>
			</c:forEach>
		</div>
		
		<div style="width: 20px;"></div>
	
		<div class="zone">
			<c:forEach var="groupIndex" begin="5" end="9">
				<div>
					<table border="1">
						
					    <c:forEach var="list" items="${List }" varStatus="status">
					    	<c:if test="${status.index >= groupIndex * groupSize && status.index < (groupIndex + 1) * groupSize}">
					    		<tr>
							    	<td>${list.parking_id}</td>
							    	<c:choose>
										<c:when test="${list.getParking_id() != car_location}">
											<td class="off">
												<input type="hidden" class="val" value="${list.parking_id}"/>
												&nbsp;
											</td>
										</c:when>
										<c:otherwise>
											<td class="on">&nbsp;</td>
										</c:otherwise>
									</c:choose>
								</tr>
					    	</c:if>
					    </c:forEach>
					</table>
				</div>
			</c:forEach>
		</div>
		
	</div>
	<br>
	
	<div class="btn">
		<button class="home-btn" onclick="location.href='/'"> 
		  <svg width="32" height="32" fill="white" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg">
		    <path d="M32 12 L12 32 H20 V52 H28 V40 H36 V52 H44 V32 H52 Z"/>
		  </svg>
		</button>
	</div>

</body>
</html>
