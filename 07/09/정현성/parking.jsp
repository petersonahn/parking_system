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

    h1, h2 {
        text-align: center;
        color: #2d6ac0;
        margin-top: 30px;
        font-weight: 700;
    }

    h2 {
        font-size: 20px;
        color: #555;
    }

    .list {
        display: flex;
        justify-content: center;
        gap: 20px;
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

    .empty {
        background-color: #d4edda;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .empty:hover {
        background-color: #c3e6cb;
    }

    .full {
        background-color: #f8d7da;
        color: #aaa;
        cursor: not-allowed;
    }
    
    .list {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	gap: 40px;
	padding: 40px 20px;
	}
	
	.zone {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		gap: 20px;
	}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		$(".empty").click(function() {
		    const parking_id = $(this).find(".val").val();
		    const car_num = $(".car_num").val();

		    if (confirm("'" + car_num + "' 차량을 '" + parking_id + "' 구역에 주차 하시겠습니까?")) {
		    	location.href='parking_ok.go?parking_id='+parking_id+'&car_num='+car_num;
		        
		    } else {
		        return;
		    }
		});

		
		$(".full").click(function() {
			alert("이미 주차되어 있는 공간입니다.");
			return;
		});
		
	});
	
</script>
<title>Insert title here</title>
</head>
<body>

	<div>
		<h2>차량 번호 : ${param.car_num }</h2>
		<input type="hidden" class="car_num" value="${param.car_num }">
		<h1>주차 구역 선택</h1>
	</div>
	
	<div class="list">
		
		<c:set var="List" value="${plist }" />
		<c:set var="groupSize" value="10" />
		
		<div class="list">
	
	<div class="zone">
		<c:forEach var="groupIndex" begin="0" end="4">
			<div>
				<table>
				    <c:forEach var="list" items="${plist}" varStatus="status">
				    	<c:if test="${status.index >= groupIndex * groupSize && status.index < (groupIndex + 1) * groupSize}">
				    		<tr>
						    	<td>${list.parking_id}</td>
						    	<c:choose>
									<c:when test="${list.car_num == null}">
										<td class="empty">
											<input type="hidden" class="val" value="${list.parking_id}"/>
											&nbsp;
										</td>
									</c:when>
									<c:otherwise>
										<td class="full">&nbsp;</td>
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
				<table>
				    <c:forEach var="list" items="${plist}" varStatus="status">
				    	<c:if test="${status.index >= groupIndex * groupSize && status.index < (groupIndex + 1) * groupSize}">
				    		<tr>
						    	<td>${list.parking_id}</td>
						    	<c:choose>
									<c:when test="${list.car_num == null}">
										<td class="empty">
											<input type="hidden" class="val" value="${list.parking_id}"/>
											&nbsp;
										</td>
									</c:when>
									<c:otherwise>
										<td class="full">&nbsp;</td>
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
	
	<%-- 주차 가능 구역 코드 시작 --%>
	<style>
    .footer {
        position: fixed;
        top: 16px;
        right: 480px;
        z-index: 1000;
    }

    .footer table {
        border-collapse: collapse;
        font-family: 'Segoe UI', '맑은 고딕', sans-serif;
        font-weight: bold;
        font-size: 20px;
        color: #333;
        background-color: transparent;
    }

    .footer th, .footer td {
        padding: 4px 20px;
        text-align: center;
        border: 1px solid #ccc; 
        background-color: white;
    }

    .footer th[colspan="2"] {
        font-size: 24px;
        color: #333;
        border-bottom: 1px solid #ccc;
    }

    .footer td {
        font-size: 36px; 
        color: #333;
    }
	</style>
	
	<div class="footer">
	    <table>
	        <thead>
	            <tr>
	                <th colspan="2">주차 가능 구역</th>
	            </tr>
	            <tr>
	                <th>A구역</th>
	                <th>B구역</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td>${A_count}</td>
	                <td>${B_count}</td>
	            </tr>
	        </tbody>
	    </table>
	</div>
	


	
</body>
</html>
