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
		margin: 30px auto 10px;
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
		table-layout: fixed;
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


	h5 {
		color: #555;
		font-weight: 500;
	}
	
	.info-container {
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 350px;
		margin: 0px auto;
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
	
	.btn {
		position: fixed;
		bottom: 40px;
		right: 40px;
		z-index: 1000;
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
	
	.in_time_list, .out_time_list {
	  position: relative;
	  text-align: center;
	  vertical-align: middle;
	}
	
	.sort-controls {
	  position: absolute;
	  top: 8px;
	  right: 8px;
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	}
	
	.sort-btn {
	  background: none;
	  border: none;
	  cursor: pointer;
	  font-size: 11px;
	  padding: 0px;
	  color: white;
	  transition: transform 0.2s ease;
	}
	
	.sort-btn:hover {
	  transform: scale(1.1);
	  color: lightgray;
	}
			
	td:nth-child(1), th:nth-child(1) {
	width: 130px;
	white-space: nowrap;
	}

	td:nth-child(2), th:nth-child(2) {
	width: 180px;
	white-space: nowrap;
	}
	
	td:nth-child(3), th:nth-child(3) {
    width: 180px;  
    white-space: nowrap; 
	}
	
	td:nth-child(4), th:nth-child(4) {
    width: 60px;
    white-space: nowrap;
	}

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$("#inSortAsc").click(function() {
			window.location.href="parking_record_list.go?list_sort=in_asc";
		});
		
		$("#inSortDesc").click(function() {
			window.location.href="parking_record_list.go?list_sort=in_desc";
		});
		
		$("#outSortAsc").click(function() {
			window.location.href="parking_record_list.go?list_sort=out_asc";
		});
		
		$("#outSortDesc").click(function() {
			window.location.href="parking_record_list.go?list_sort=out_desc";
		});
		
	});
	
</script>

<title>주차 기록 조회</title>
  
</head>
<body>

	<div align="center">
	  	<h2>주차 기록 조회</h2>
	  	<br>
	  
	   	<form method="post" action="<%=request.getContextPath() %>/parking_record_search.go">
		   
			<select name="field">
		    	<option value="car_num">차량 번호</option>
		        <option value="in_time">입차 시간</option>
		        <option value="out_time">출차 시간</option>
		    </select>
		      
			<input type="text" name="keyword" id="keywordInput">
			<input type="text" name="temp" id="dateInput" placeholder="예:2025-07또는2025-07-11" style="display: none;">
	
	  		&nbsp;&nbsp;&nbsp;
	  		<input type="submit" value="검색">
		</form>
		
		<script>
			const fieldSelect = document.querySelector('select[name="field"]');
			const textInput = document.getElementById("keywordInput");
			const dateInput = document.getElementById("dateInput");
			
			fieldSelect.addEventListener("change", function () {
				const value = this.value;
		
			    const isInDate = value === "in_time";
			    const isOutDate = value === "out_time";
			
			    // 1. 보여줄 인풋 설정
			    textInput.style.display = (!isInDate && !isOutDate) ? "inline-block" : "none";
			    dateInput.style.display = (isInDate || isOutDate) ? "inline-block" : "none";
			
			    // 2. name 속성 설정 → 서버로 keyword 1개만 전송되도록
			    textInput.name = (!isInDate && !isOutDate) ? "keyword" : "temp";
			    dateInput.name = (isInDate || isOutDate) ? "keyword" : "temp";
			});
		</script>
	
		<br>
		<div class="info-container">
			<h5>전체 주차 기록 : ${paging.totalRecord } 건</h5>
			<h5>수익 총액 : <fmt:formatNumber value="${amountfee}" type="number"/> 원</h5>
		</div>
		
	  	<table border="1" width="30%">
		    <tr>
		    	<th>차량 번호</th>
		      	<th class="in_time_list" style="position: relative;">
				  	입차 시간
				  	<div class="sort-controls">
				    	<button type="button" class="sort-btn" id="inSortAsc" title="오름차순 정렬">▲</button>
				    	<button type="button" class="sort-btn" id="inSortDesc" title="내림차순 정렬">▼</button>
				  	</div>
				</th>
		      	<th class="out_time_list" style="position: relative;">
		      		출차 시간
		      		<div class="sort-controls">
				    	<button type="button" class="sort-btn" id="outSortAsc" title="오름차순 정렬">▲</button>
				    	<button type="button" class="sort-btn" id="outSortDesc" title="내림차순 정렬">▼</button>
				  	</div>
		      	</th>
		      	<th>
		      		주차 구역
		      	</th>
		    </tr>
	
			<c:set var="list" value="${carList}" />
	
	      	<c:if test="${!empty list }">
		    	<c:forEach var="record" items="${list}">
					<tr>
						<td>${record.car_num}</td>
				        <td><fmt:formatDate value="${record.in_time}" pattern="yyyy-MM-dd HH:mm"/></td>
				        <td>
				        	<c:choose>
					        	<c:when test="${empty record.out_time}">
					            	<span style="color:red;">주차중</span>
					            </c:when>
					            
					            <c:otherwise>
					             	<fmt:formatDate value="${record.out_time}" pattern="yyyy-MM-dd HH:mm"/>
					            </c:otherwise>
					        </c:choose>
					 	</td>
					 	<td>${record.parking_id }</td>
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
	  	<div class="pagination">
		  	<c:if test="${paging.page > paging.block }">
		  		<a href="parking_record_list.go?list_sort=${list_sort }&page=1">[맨 처음]</a>
			    <a href="parking_record_list.go?list_sort=${list_sort }&page=${paging.startBlock - 1 }">◀</a>
			</c:if>
			  
			<c:forEach begin="${paging.startBlock}" end="${paging.endBlock}" var="i">
		  		<c:if test="${i == paging.page}">
		    		<b><a href="parking_record_list.go?list_sort=${list_sort }&page=${i}">[${i}]</a></b>
		  		</c:if>
		  		
		 		<c:if test="${i != paging.page}">
		    		<a href="parking_record_list.go?list_sort=${list_sort }&page=${i}">[${i}]</a>
		  		</c:if>
			</c:forEach>
		
			<c:if test="${paging.endBlock < paging.allPage}">
		  		<a href="parking_record_list.go?list_sort=${list_sort }&page=${paging.endBlock + 1}">▶</a>
		  		<a href="parking_record_list.go?list_sort=${list_sort }&page=${paging.allPage}">[맨 마지막]</a>
			</c:if>
		</div>
	
		<div class="btn">
		  <button class="home-btn" onclick="location.href='manager_main.go'"> 
		    <span style="font-size: 28px; color: white;">↩</span>
		  </button>
		</div>
	
	</div>

</body>
</html>
