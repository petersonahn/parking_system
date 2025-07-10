<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

	h2 {
		color: #2d6ac0;
		font-size: 28px;
		margin-top: 50px;
		font-weight: 700;
	}

	form {
		margin: 30px auto;
		text-align: center;
		background-color: white;
		padding: 20px 30px;
		border-radius: 12px;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
		display: inline-block;
	}

	select,
	input[type="text"],
	input[type="date"] {
		font-size: 16px;
		padding: 8px 12px;
		border: 1.5px solid #ccc;
		border-radius: 8px;
		margin: 0 5px;
		transition: border-color 0.3s ease, box-shadow 0.3s ease;
	}

	select:focus,
	input:focus {
		border-color: #3498db;
		outline: none;
		box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
	}

	input[type="submit"] {
		background-color: #3498db;
		color: white;
		border: none;
		padding: 10px 20px;
		border-radius: 8px;
		cursor: pointer;
		font-weight: 600;
		transition: background-color 0.3s ease, transform 0.2s ease;
		box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
	}

	input[type="submit"]:hover {
		background-color: #2874bd;
		transform: translateY(-2px);
	}

	table {
		width: 60%;
		margin: 20px auto;
		border-collapse: collapse;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		background-color: #fff;
		border-radius: 10px;
		overflow: hidden;
	}

	th, td {
		border: 1px solid #ddd;
		padding: 12px;
		text-align: center;
		font-size: 15px;
	}

	th {
		background-color: #3498db;
		color: white;
	}

	span {
		font-weight: bold;
	}

	h5 {
		color: #555;
		font-weight: 500;
	}

	h3 {
		color: #888;
	}

	.pagination {
		text-align: center;
		margin-top: 20px;
	}

	.pagination a {
		margin: 0 5px;
		text-decoration: none;
		color: #3498db;
		font-weight: 500;
		transition: color 0.2s ease;
	}

	.pagination a:hover {
		color: #2874bd;
	}

	.pagination .active {
		font-weight: bold;
		color: #2d6ac0;
	}
</style>

<script>
	const fieldSelect = document.querySelector('select[name="field"]');
	const textInput = document.getElementById("keywordInput");
	const dateInput = document.getElementById("dateInput");
	
	fieldSelect.addEventListener("change", function () {
		const value = this.value;
	
	    const isDate = value === "in_time";
	    const isParking = value === "parking";
	
	    // 1. 보여줄 인풋 설정
	    textInput.style.display = (!isDate && !isParking) ? "inline-block" : "none";
	    dateInput.style.display = isDate ? "inline-block" : "none";
	
	    // 2. name 속성 설정 → 서버로 keyword 1개만 전송되도록
	    textInput.name = (!isDate && !isParking) ? "keyword" : "temp";
	    dateInput.name = isDate ? "keyword" : "temp";
	});
</script>

<title>차량 리스트</title>
  
</head>
<body>

	<div align="center">
	  	<h2>주차 기록 조회</h2>
	  	<br>
	  
	   	<form method="post" action="<%=request.getContextPath() %>/carlist_search.go">
		   
			<select name="field">
		    	<option value="car_num">차량 번호</option>
		        <option value="in_time">입차 시간</option>
		        <option value="parking">주차중 차량</option>
		    </select>
		      
			<input type="text" name="keyword" id="keywordInput">
			<input type="date" name="temp" id="dateInput" style="display: none;"> <!-- 날짜 필드 -->
	
	  		&nbsp;&nbsp;&nbsp;
	  		<input type="submit" value="검색">
		</form>
	
		<br>
		<h5>차량 대수: ${paging.totalRecord }대</h5>
	
	  	<table border="1" width="30%">
		    <tr>
		    	<th>차량 번호</th>
		      	<th>입차 시간</th>
		      	<th>출차 시간</th>
		    </tr>
	
	      	<c:set var="list" value="${carList}" />
	      	
	      	<c:if test="${!empty list }">
		    	<c:forEach var="car" items="${list}">
					<tr>
						<td>${car.car_num}</td>
				        <td><fmt:formatDate value="${car.in_time}" pattern="yyyy-MM-dd HH:mm"/></td>
				        <td>
				        	<c:choose>
					        	<c:when test="${empty car.out_time}">
					            	<span style="color:red;">주차중</span>
					            </c:when>
					            
					            <c:otherwise>
					             	<fmt:formatDate value="${car.out_time}" pattern="yyyy-MM-dd HH:mm"/>
					            </c:otherwise>
					        </c:choose>
					 	</td>
					</tr>
		   		</c:forEach>
	    	</c:if>
	    
	    	<c:if test="${empty list }">
	        	<tr>
		            <td colspan="4" align="center">
		            	<h3>차량 리스트가 없습니다.....</h3>
		            </td>
	         	</tr>
		   	</c:if>
		 
		</table>
		<br>
	  
	  	<!-- 페이징 버튼 영역 -->
	  	<c:if test="${paging.page > paging.block }">
	  		<a href="list_car.go?page=1">[맨 처음]</a>
		    <a href="list_car.go?page=${paging.startBlock - 1 }">◀</a>
		</c:if>
		  
		<c:forEach begin="${paging.startBlock}" end="${paging.endBlock}" var="i">
	  		<c:if test="${i == paging.page}">
	    		<b><a href="list_car.go?page=${i}">[${i}]</a></b>
	  		</c:if>
	  		
	 		<c:if test="${i != paging.page}">
	    		<a href="list_car.go?page=${i}">[${i}]</a>
	  		</c:if>
		</c:forEach>
	
		<c:if test="${paging.endBlock < paging.allPage}">
	  		<a href="list_car.go?page=${paging.endBlock + 1}">▶</a>
	  		<a href="list_car.go?page=${paging.allPage}">[맨 마지막]</a>
		</c:if>
	
	</div>  

</body>
</html>
