<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
    * {
        box-sizing: border-box;
        font-family: 'Segoe UI', '맑은 고딕', sans-serif;
        margin: 0;
        padding: 0;
    }

    body {
        background-color:#eaf3fb;
    }

    .main {
        width: 1200px;
        margin: 100px auto;
        background-color: white;
        border-radius: 20px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        padding: 60px 80px;
    }

    .header {
        text-align: center;
        margin-bottom: 50px;
    }

    .header h2 {
        font-size: 42px;
        color: #a0a0a0;
        font-weight: 700;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 40px;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th {
        background-color: #3498db;
        color: white;
    }

    tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    .button {
        text-align: center;
        margin-top: 20px;
    }

    .button button {
        padding: 14px 28px;
        margin: 0 10px;
        border: none;
        border-radius: 8px;
        font-size: 18px;
        font-weight: bold;
        background-color: #3498db;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .button button:hover {
        background-color: #2874bd;
        transform: translateY(-3px);
    }

    /* 모달 스타일 */
    #modal, #modModal, #userRegModal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
    }

    #user_content, #user_modify, #user_reg {
        background-color: white;
        margin: 8% auto;
        padding: 30px;
        border-radius: 16px;
        width: 500px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        position: relative;
    }

    #user_content h2, #user_modify h2, #user_reg h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #a0a0a0;
    }

    #user_content table, #user_modify table, #user_reg table {
        width: 100%;
        border-collapse: collapse;
    }

    #user_content th, #user_modify th, #user_reg th {
        width: 30%;
        background-color: #3498db;
        padding: 10px;
        text-align: left;
       
        
        
    }

    #user_content td, #user_modify td, #user_reg td {
        padding: 10px;
    }

    input[type="text"], input[type="tel"] {
        width: 100%;
        padding: 8px 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 6px;
    }

    .close_btn {
        position: absolute;
        top: 15px;
        right: 20px;
        font-size: 24px;
        cursor: pointer;
        color: #888;
    }

    .close_btn:hover {
        color: #000;
    }

</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $(".user_button").click(function () {
            const user_id = $(this).data("userId");
            const user_car_num = $(this).data("userCarNum");
            const user_name = $(this).data("userName");
            const user_phone = $(this).data("userPhone");

            let user_html = `
                <h2>회원 정보 관리</h2>
                <table>
                    <tr><th>회원 아이디</th><td>${user_id}</td></tr>
                    <tr><th>차량 번호</th><td>${user_car_num}</td></tr>
                    <tr><th>회원 이름</th><td>${user_name}</td></tr>
                    <tr><th>회원 연락처</th><td>${user_phone}</td></tr>
                </table>
                <div class="button">
                    <button onclick="modify('${user_id}', '${user_car_num}', '${user_name}', '${user_phone}')">수정</button>
                    <button onclick="if(confirm('회원 정보를 정말 삭제하시겠습니까?')) location.href='user_delete.go?user_car_num=${user_car_num}'">삭제</button>
                </div>
                <span class='close_btn' onclick='closeModal()'>&times;</span>
            `;

            $("#user_content").html(user_html);
            $("#modal").fadeIn();
        });
    });

    function modify(user_id, user_car_num, user_name, user_phone) {
        let mod_html = `
            <h2>회원 정보 수정</h2>
            <form method='post' action='user_modify.go'>
                <table>
                    <tr><th>회원 아이디</th><td><input name='user_id' value='${user_id}' readOnly></td></tr>
                    <tr><th>차량 번호</th><td><input name='user_car_num' value='${user_car_num}' readOnly></td></tr>
                    <tr><th>회원 이름</th><td><input name='user_name' value='${user_name}'></td></tr>
                    <tr><th>회원 연락처</th><td><input name='user_phone' value='${user_phone}'></td></tr>
                </table>
                <div class="button">
                    <button type='submit'>수정</button>
                </div>
            </form>
            <span class='close_btn' onclick='closeModModal()'>&times;</span>
        `;

        $("#user_modify").html(mod_html);
        closeModal();
        $("#modModal").fadeIn();
    }

    function showUserRegModal() {
        $("#userRegModal").fadeIn();
    }

    function closeUserRegModal() {
        $("#userRegModal").fadeOut();
    }

    function closeModal() {
        $("#modal").fadeOut();
    }

    function closeModModal() {
        $("#modModal").fadeOut();
    }
</script>
</head>

<body>

<div class="main">
    <div class="header">
        <h2>회원 관리</h2>
    </div>

    <c:set var="uList" value="${userList}" />

    <table>
        <tr>
            <th>회원 아이디</th>
            <th>차량 번호</th>
            <th>회원 이름</th>
            <th>회원 연락처</th>
        </tr>
        <c:forEach var="user" items="${uList}">
            <tr class="user_button"
                data-user-id="${user.user_id}"
                data-user-car-num="${user.user_car_num}"
                data-user-name="${user.user_name}"
                data-user-phone="${user.user_phone}">
                <td>${user.user_id}</td>
                <td>${user.user_car_num}</td>
                <td>${user.user_name}</td>
                <td>${user.user_phone}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="button">
        <button onclick="showUserRegModal()">회원 등록</button>
        <button onclick="location.href='manager_home.go'">관리자 홈</button>
    </div>
</div>

<!-- 회원 등록 모달 -->
<div id="userRegModal">
    <div id="user_reg">
        <h2>회원 등록</h2>
        <form method="post" action="<%=request.getContextPath() %>/user_registration_ok.go">
            <table>
                <tr><th>차량 번호</th><td><input name="user_car_num"></td></tr>
                <tr><th>회원 아이디</th><td><input name="user_id"></td></tr>
                <tr><th>회원 이름</th><td><input name="user_name"></td></tr>
                <tr><th>회원 연락처</th><td><input name="user_phone"></td></tr>
            </table>
            <div class="button">
                <button type="submit">등록</button>
                <button type="reset" onclick="closeUserRegModal()">취소</button>
            </div>
        </form>
        <span class="close_btn" onclick="closeUserRegModal()">&times;</span>
    </div>
</div>

<!-- 회원 정보 모달 -->
<div id="modal">
    <div id="user_content"></div>
</div>

<!-- 회원 수정 모달 -->
<div id="modModal">
    <div id="user_modify"></div>
</div>

</body>
</html>
