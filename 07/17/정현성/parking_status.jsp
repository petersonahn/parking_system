<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
	  margin: 0;
	  padding: 40px;
	  background-color: #eaf3fb;
	  font-family: 'Segoe UI', '맑은 고딕', sans-serif;
	}
	
	h1 {
	  text-align: center;
	  color: #2d6ac0;
	  margin-top: 20px;
	  margin-bottom: 40px;
	  font-weight: 700;
	}
	
	.zone-wrapper {
	  display: flex;
	  justify-content: center;
	  gap: 80px;
	  margin-top: 30px;
	  flex-wrap: wrap;
	}
	
	.zone {
	  width: 550px;
	}
	
	.zone-title {
	  text-align: center;
	  color: #2d6ac0;
	  font-size: 20px;
	  font-weight: bold;
	  margin-bottom: 16px;
	}
	

	.parking-container {
	  display: grid;
	  grid-template-columns: repeat(5, 1fr); 
	  gap: 14px;
	  justify-items: center;
	}
	
	.parking-card {
	  background: white;
	  border-radius: 12px;
	  padding: 14px 0;
	  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
	  width: 100%;
	  text-align: center;
	  transition: transform 0.2s;
	}
	
	.parking-card.occupied {
	  background-color: #ffcccc;
	  color: #a10000;
	}
	
	.parking-card:hover {
	  transform: translateY(-4px);
	}
	
	.parking-id {
	  font-size: 17px;          
	  color: #007BFF;            
	  font-weight: 700;          
	  margin-bottom: 8px;
	  cursor: pointer;
	  transition : color 0.25;
	}
	
	.parking-id:hover {
	  text-decoration: underline;
	}
	
	.car-num {
	  font-size: 18px;
	  font-weight: bold;
	  color: #4a4a4a;
	}
	
	
	
	.empty {
	  font-size: 17px;
	  color: #bbb;
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



	#modal {
	  display: none;
	  position: fixed;
	  left: 0; top: 0;
	  width: 100%; height: 100%;
	  background: rgba(0, 0, 0, 0.3);  
	  z-index: 2000;
	}


	.modal-content {
	  background: #ffffff;
	  width: 520px;
	  max-height: 80%;
	  overflow-y: auto;
	  margin: 100px auto;
	  padding: 20px 28px;
	  border-radius: 16px;
	  box-shadow: 0 2px 10px rgba(0,0,0,0.15);
	  position: relative;
	  font-family: 'Segoe UI', '맑은 고딕', sans-serif;
	}


	.modal-content button {
	  position: absolute;
	  top: 14px;
	  right: 14px;
	  background: #2d6ac0;
	  color: white;
	  border: none;
	  padding: 6px 10px;
	  border-radius: 4px;
	  font-size: 13px;
	  cursor: pointer;
	  transition: background 0.3s;
	}
	
	.modal-content button:hover {
	  background: #1b4f99;
	}
	

	.modal-content h3 {
	  margin: 0 0 18px 0;
	  font-size: 20px;
	  color: #2d6ac0;
	  text-align: center;
	}
	
	
	.modal-content table {
	  width: 100%;
	  border-collapse: collapse;
	  font-size: 15px;
	  color: #333;
	}
	
	.modal-content th, .modal-content td {
	  border: 1px solid #ddd;
	  padding: 8px 6px;
	  text-align: center;
	}
	
	.modal-content th {
	  background-color: #f5f8fc;
	  font-weight: 600;
	}
	
	.modal-content td {
	  border: 1px solid #ddd;
	  padding: 8px 6px;
	  text-align: center;
	  white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis;
	}
	

	.modal-content td.in-time,
	.modal-content td.out-time {
	  white-space: normal;
	  word-break: break-word;
	  line-height: 1.4;
	}


</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- JS 데이터 전달 -->
<script>
	const records = [
		  <c:forEach var="r" items="${parkingRecords}" varStatus="vs">
		    {
		      parking_rec_num: ${r.parking_rec_num},
		      car_num: "${r.car_num}",
		      in_time: "<fmt:formatDate value='${r.in_time}' pattern='yyyy-MM-dd HH:mm:ss'/>",
		      out_time: "${r.out_time != null ? r.out_time : '출차 전'}",
		      user_id: "${fn:length(r.user_id) > 0 ? r.user_id : ''}",
		      fee_amount: ${r.fee_amount != null ? r.fee_amount : 0},
		      parking_id: "${r.parking_id}"
		    }<c:if test="${!vs.last}">,</c:if>
		  </c:forEach>
		];

 
	function showModal(parkingId) {
		  const filteredRecords = records.filter(r => String(r.parking_id) === String(parkingId))
		                                 .sort((a, b) => a.parking_rec_num - b.parking_rec_num);
		  
		  <%-- JSP에서 ${}는 JSTL과 겹치므로, JS 템플릿 리터럴에서 \${}로 이스케이프 해줘야 함. --%>

		  let html = `<table border="1" width="100%">
		                <tr>
			                <th style="width:15%;">주차구역</th>
			                <th style="width:18%;">차량번호</th>
			                <th style="width:20%;">입차</th>
			                <th style="width:20%;">출차</th>
			                <th style="width:13%;">회원ID</th>
			                <th style="width:15%;">요금</th
		                </tr>`;
	     	
		                
		  if (filteredRecords.length === 0) {
		    html += `<tr><td colspan="7" style="text-align:center;">해당 구역의 기록이 없습니다.</td></tr>`;
		  } else {
		    filteredRecords.forEach(r => {
		      const userId = (typeof r.user_id === 'string' && r.user_id.trim() !== '') ? r.user_id : '비회원';
		      
		      html += `<tr>
		        <td>\${r.parking_id}</td>
		        <td>\${r.car_num}</td>
		        <td>\${r.in_time.split(' ')[0]}<br>\${r.in_time.split(' ')[1]}</td>
		        <td>\${r.out_time === '출차 전' ? '출차 전' : r.out_time.split(' ')[0] + '<br>' + r.out_time.split(' ')[1]}</td>
		        <td>\${userId}</td>
		        <td>\${r.fee_amount}</td>
		      </tr>`;
		    });
		  }
			
		  html += `</table>`;
					
		  document.getElementById('recordTable').innerHTML = html;
		  document.getElementById('modal').style.display = 'block';
		}

		function hideModal() {
		  document.getElementById('modal').style.display = 'none';
		}
   
</script>
 
<title>주차 현황 조회</title>
	
</head>
<body>
	<h1>현재 주차 현황</h1>

	<div class="zone-wrapper">
	  <!-- A구역 -->
	  <div class="zone">
	    <div class="zone-title">A구역</div>
	    <div class="parking-container">
	      <c:forEach var="p" items="${parkingList}" varStatus="status">
	        <c:if test="${status.index < 50}">
	          <c:choose>
	            <c:when test="${p.car_num != null}">
	              <div id="parking_spot" class="parking-card occupied" data-parking-id="${p.parking_id }">
	                <div class="parking-id" onclick="showModal('${p.parking_id}')">${p.parking_id}</div>
	                <div class="car-num" >${p.car_num}</div>
	              </div>
	            </c:when>
	            <c:otherwise>
	              <div class="parking-card">
	                <div class="parking-id" onclick="showModal('${p.parking_id}')">${p.parking_id}</div>
	                <div class="empty">비어있음</div>
	              </div>
	            </c:otherwise>
	          </c:choose>
	        </c:if>
	      </c:forEach>
	    </div>
	  </div>
	
	  <!-- B구역 -->
	  <div class="zone">
	    <div class="zone-title">B구역</div>
	    <div class="parking-container">
	      <c:forEach var="p" items="${parkingList}" varStatus="status">
	        <c:if test="${status.index >= 50 && status.index < 100}">
	          <c:choose>
	            <c:when test="${p.car_num != null}">
	              <div class="parking-card occupied">
	                <div class="parking-id" onclick="showModal('${p.parking_id}')">${p.parking_id}</div>
	                <div class="car-num" >${p.car_num}</div>
	              </div>
	            </c:when>
	            <c:otherwise>
	              <div class="parking-card">
	                <div class="parking-id" onclick="showModal('${p.parking_id}')">${p.parking_id}</div>
	                <div class="empty">비어있음</div>
	              </div>
	            </c:otherwise>
	          </c:choose>
	        </c:if>
	      </c:forEach>
	    </div>
	  </div>
	</div>
	
	<div class="btn">
	  	<button class="home-btn" onclick="history.back()"> 
	    	<span style="font-size: 28px; color: white;">↩</span>
	  	</button>
	</div>

		
	<!-- 모달창 HTML  -->

	<div id="modal">
	  <div class="modal-content">
	    <button onclick="hideModal()">닫기</button>
	    <h3>차량 입출차 기록</h3>
	    <div id="recordTable"></div>
	  </div>
	</div>
			
</body>
</html>
