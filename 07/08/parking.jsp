<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.list{
		display : flex;
	}
	
	.list td{
		width : 40px;
		text-align : center;
	}
	
	.empty{
		background-color: green;
	}
	
	.full{
		background-color: red;
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
		
		<div>
			<table border="1">
				<c:set var="List" value="${plist }" />
			    <c:forEach var="list" items="${List }" varStatus="status">
			    	<c:if test="${status.index < 10}">
			    		<tr>
					    	<td>${list.getParking_id() }</td>
					    	
					    	<c:if test="${list.getCar_num() == null}">
						    	<td class="empty">
						    		<input type="hidden" class="val" value="${list.getParking_id() }"/>
						    		&nbsp;
						    	</td>
						    </c:if>
						    
						    <c:if test="${list.getCar_num() != null}">
						    	<td class="full">&nbsp;</td>
						    </c:if>
						</tr>
				    </c:if>
			    </c:forEach> 
			</table>
		</div>
		
		&nbsp;&nbsp;&nbsp;
		<div>
			<table border="1">
				<c:set var="List" value="${plist }" />
			    <c:forEach var="list" items="${List }" varStatus="status">
			    	<c:if test="${status.index > 9 and status.index < 20}">
			    		<tr>
					    	<td>${list.getParking_id() }</td>
					    	
					    	<c:if test="${list.getCar_num() == null}">
						    	<td class="empty">
									<input type="hidden" class="val" value="${list.getParking_id() }"/>
						    		&nbsp;
								</td>
						    </c:if>
						    
						    <c:if test="${list.getCar_num() != null}">
						    	<td class="full">&nbsp;</td>
						    </c:if>
						</tr>
				    </c:if>
			    </c:forEach> 
			</table>
		</div>
		
		&nbsp;&nbsp;&nbsp;
		<div>
			<table border="1">
				<c:set var="List" value="${plist }" />
			    <c:forEach var="list" items="${List }" varStatus="status">
			    	<c:if test="${status.index > 19 and status.index < 30}">
			    		<tr>
					    	<td>${list.getParking_id() }</td>
					    	
					    	<c:if test="${list.getCar_num() == null}">
						    	<td class="empty">
									<input type="hidden" class="val" value="${list.getParking_id() }"/>
						    		&nbsp;
								</td>
						    </c:if>
						    
						    <c:if test="${list.getCar_num() != null}">
						    	<td class="full">&nbsp;</td>
						    </c:if>
						</tr>
				    </c:if>
			    </c:forEach> 
			</table>
		</div>
		
		&nbsp;&nbsp;&nbsp;
		<div>
			<table border="1">
				<c:set var="List" value="${plist }" />
			    <c:forEach var="list" items="${List }" varStatus="status">
			    	<c:if test="${status.index > 29 and status.index < 40}">
			    		<tr>
					    	<td>${list.getParking_id() }</td>
					    	
					    	<c:if test="${list.getCar_num() == null}">
						    	<td class="empty">
									<input type="hidden" class="val" value="${list.getParking_id() }"/>
						    		&nbsp;
								</td>
						    </c:if>
						    
						    <c:if test="${list.getCar_num() != null}">
						    	<td class="full">&nbsp;</td>
						    </c:if>
						</tr>
				    </c:if>
			    </c:forEach> 
			</table>
		</div>
		
		&nbsp;&nbsp;&nbsp;
		<div>
			<table border="1">
				<c:set var="List" value="${plist }" />
			    <c:forEach var="list" items="${List }" varStatus="status">
			    	<c:if test="${status.index > 39 and status.index < 50}">
			    		<tr>
					    	<td>${list.getParking_id() }</td>
					    	
					    	<c:if test="${list.getCar_num() == null}">
						    	<td class="empty">
									<input type="hidden" class="val" value="${list.getParking_id() }"/>
						    		&nbsp;
								</td>
						    </c:if>
						    
						    <c:if test="${list.getCar_num() != null}">
						    	<td class="full">&nbsp;</td>
						    </c:if>
						</tr>
				    </c:if>
			    </c:forEach> 
			</table>
		</div>
		
	</div>
	
</body>
</html>