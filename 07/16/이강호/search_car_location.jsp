// search_car_location.jsp

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
	function resizeLayout() {
		const wrapper = document.querySelector(".scale-wrapper");
		const screenW = window.innerWidth;
		const screenH = window.innerHeight;

		// 기준 너비/높이 (디자인 기준)
		const baseWidth = 1200;   // 전체 .list 가로 기준
		const baseHeight = 800;   // 전체 높이 감안 (예상 높이)

		const scaleW = screenW / baseWidth;
		const scaleH = screenH / baseHeight;
		const scale = Math.min(scaleW, scaleH, 1); // 최대 1배까지 (확대는 안함)

		const list = document.querySelector('.list');
		const scale = Math.min(scaleW, scaleH, 1);
		
		wrapper.style.transform = `scale(${scale})`;

		list.style.transform = `scale(${scale})`;
		list.style.transformOrigin = "top left";
	}

	window.addEventListener("resize", resizeLayout);
	window.addEventListener("DOMContentLoaded", resizeLayout);
	
	

</script>



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
		flex-wrap: nowrap; 
		overflow-x: auto;  
		transform: scale(0.9);
	    transform-origin: top center; 
	    height: auto;  
	}
	
	.scale-wrapper {
	  transform-origin: top left;
	  transition: transform 0.3s ease;
	}
	
	
	

	.zone {
		display: flex;
		flex-direction: row;
		flex-wrap: nowrap;
		gap: 20px;
		height: auto;
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
<title>주차 관제 시스템</title>
</head>
<body>

	<c:set var="car_location" value="${parking_id }" />
	<c:set var="List" value="${plist }" />
	<c:set var="groupSize" value="10" />

	<div>
		<h1>조회된 '${car_num }' 차량의 위치는 '${car_location }' 입니다.</h1>
	</div>
<div class="scale-wrapper">
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
												<input type="hidden" class="val" value="${list.parking_id}"/>&nbsp;
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
