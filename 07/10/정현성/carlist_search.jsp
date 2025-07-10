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
		text-align: center;
	}

	h2 {
		color: #2d6ac0;
		font-size: 28px;
		margin-top: 50px;
		font-weight: 700;
	}

	form {
		background-color: #ffffff;
		display: inline-block;
		padding: 25px 35px;
		border-radius: 12px;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
		margin-bottom: 30px;
	}

	select,
	input[type="text"],
	input[type="date"] {
		font-size: 16px;
		padding: 8px 12px;
		border: 1.5px solid #ccc;
		border-radius: 8px;
		margin: 0 5px;
		transition: all 0.3s ease;
	}

	select:focus,
	input:focus {
		border-color: #3498db;
		outline: none;
		box-shadow: 0 0 5px rgba(52, 152, 219, 0.4);
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
		margin: 0 auto 30px;
		border-collapse: collapse;
		background-color: #ffffff;
		box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
		overflow: hidden;
	}

	th, td {
		border: 1px solid #ddd;
		padding: 12px;
		font-size: 15px;
		text-align: center;
	}

	th {
		background-color: #3498db;
		color: white;
	}

	h5 {
		color: #555;
		font-weight: 500;
		margin-bottom: 10px;
	}

	h3 {
		color: #888;
	}

	span {
		font-weight: bold;
	}

	.pagination {
		text-align: center;
		margin-bottom: 40px;
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
	
	.back-btn {
		background-color: #3498db;
		color: white;
		border: none;
		padding: 12px 24px;
		border-radius: 8px;
		font-size: 16px;
		cursor: pointer;
		font-weight: 600;
		box-shadow: 0 4px 10px rgba(52, 152, 219, 0.3);
		transition: background-color 0.3s ease, transform 0.2s ease;
		margin-top: 30px;
		display: block;
	}
	
	.back-btn:hover {
		background-color: #2874bd;
		transform: translateY(-2px);
	}
</style>

<title>Insert title here</title>
</head>
<body>

	<c:set var="paging" value="${paging }" /> 
	
	<div align="center">
	  	<h2>검색 차량 리스트</h2>
	  	<br>
	  	<h5>검색된 차량 대수 : ${paging.totalRecord }대</h5>
	
	  	<table border="1" width="30%">
		    <tr>
		      	<th>차량번호</th>
		      	<th>입차시간</th>
		      	<th>출차시간</th>
		    </tr>
	
	      	<c:set var="list" value="${SearchList}" />
	      
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
		  	<a href="<%=request.getContextPath() %>/carlist_search.go?page=1&field=${paging.field}&keyword=${paging.keyword}">[맨 처음]</a>
		    <a href="<%=request.getContextPath() %>/carlist_search.go?page=${paging.startBlock - 1 }&field=${paging.field}&keyword=${paging.keyword}">◀</a>
		</c:if>
		  
		<c:forEach begin="${paging.startBlock}" end="${paging.endBlock}" var="i">
	  		<c:if test="${i == paging.page}">
	    		<b><a href="<%=request.getContextPath() %>/carlist_search.go?page=${i}&field=${paging.field}&keyword=${paging.keyword}">[${i}]</a></b>
	  		</c:if>
	  		
	  		<c:if test="${i != paging.page}">
	    		<a href="<%=request.getContextPath() %>/carlist_search.go?page=${i}&field=${paging.field}&keyword=${paging.keyword}">[${i}]</a>
	  		</c:if>
		</c:forEach>
	
		<c:if test="${paging.endBlock < paging.allPage}">
	  		<a href="<%=request.getContextPath() %>/carlist_search.go?page=${paging.endBlock + 1}&field=${paging.field}&keyword=${paging.keyword}">▶</a>
	  		<a href="<%=request.getContextPath() %>/carlist_search.go?page=${paging.allPage}&field=${paging.field}&keyword=${paging.keyword}">[맨 마지막]</a>
		</c:if>
	
			<button class="back-btn" onclick="location.href='list_car.go'">← 돌아가기</button>
	
	</div> 


</body>
</html>
