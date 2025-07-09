<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style type="text/css">
    body {
        background-color: #eaf3fb;
        font-family: 'Segoe UI', '맑은 고딕', sans-serif;
    }

    .main {
        width: 500px;
        margin: 100px auto;
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        padding: 40px 30px 60px;
    }

    .header {
        text-align: center;
        margin-bottom: 30px;
        color: #a0a0a0;
        font-size: 24px;
        font-weight: bold;
        letter-spacing: 1px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-size: 16px;
        margin-bottom: 6px;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 8px 12px; 
        font-size: 16px;
        border-radius: 8px;
        box-sizing: border-box;
        border: 1.5px solid #ccc;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #3498db;
        outline: none;
        box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
    }

    .btn-login {
        width: 100%;
        padding: 14px 15px;
        font-size: 16px;
        border-radius: 8px;
        background-color: #3498db;
        color: white;
        border: none;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
        box-shadow: 0 4px 10px rgba(52, 152, 219, 0.5);
        margin-top: 10px;
        box-sizing: border-box;
    }

    .btn-login:hover {
        background-color: #2980b9;
        transform: translateY(-2px);
    }
</style>
</head>
<body>

    <div class="main">
        <div class="header">관리자 로그인</div>

        <form action="login_ok" method="post">
            <div class="form-group">
                <label for="manager_id">ID</label>
                <input type="text" name="manager_id" id="manager_id" required>
            </div>

            <div class="form-group">
                <label for="manager_pwd">Password</label>
                <input type="password" name="manager_pwd" id="manager_pwd" required>
            </div>

            <button type="submit" class="btn-login">로그인</button>
        </form>
    </div>

</body>
</html>
