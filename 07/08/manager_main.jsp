<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>관리자 로그인</h2>
		
		<form action="login_ok" method="post">
		
			<table>
				<tr>
					<td>ID:</td>
					<td><input type="text" name="manager_id"></td>
				</tr>
				
				<tr>
					<td>password</td>
					<td><input type="password" name="manager_pwd"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인" >
					</td>
				</tr>	
		
			</table>		
		</form>

</body>
</html>