<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차 구역 선택</title>
<style>
	.car-num-box {
    margin: 30px auto 10px;
    padding: 15px 25px;
    font-size: 24px;
    font-weight: bold;
    color: #2d6ac0;
    background-color: #fff;
    border: 2px solid #3498db;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    width: fit-content;
    text-align: center;
	}
	
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

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $(".empty").click(function () {
            const parking_id = $(this).find(".val").val();
            const car_num = $(".car_num").val();

            if (confirm("'" + car_num + "' 차량을 '" + parking_id + "' 구역에 주차 하시겠습니까?")) {
                location.href = 'parking_ok.go?parking_id=' + parking_id + '&car_num=' + car_num;
            }
        });

        $(".full").click(function () {
            alert("이미 주차되어 있는 공간입니다.");
        });
    });
</script>
</head>
<body>

    <div class="car-num-box">
    차량 번호 : ${param.car_num}
	</div>
	<input type="hidden" class="car_num" value="${param.car_num}">
	<h1>🅿️ 주차 구역 선택</h1>

    <div class="list">
        <c:set var="List" value="${plist }" />
        <c:forEach begin="0" end="4" var="col">
            <table>
                <c:forEach var="list" items="${List}" varStatus="status">
                    <c:if test="${status.index >= (col*10) && status.index < ((col+1)*10)}">
                        <tr>
                            <td>${list.parking_id}</td>
                            <c:choose>
                                <c:when test="${list.car_num == null}">
                                    <td class="empty">
                                        <input type="hidden" class="val" value="${list.parking_id}" />
                                        🟩
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td class="full">🟥</td>
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
