<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginTest</title>
	</head>
	<body>
		<h3>login Test</h3>
		
		<form action="./loginProcTest.jsp" method="post">
		<input type="text" name="id" placeholder="아이디 입력"> <br/>
		<input type="password" name="password" placeholder="비밀번호 입력"> <br/>
		<input type="checkbox" name = "auto" value="1"> 자동로그인 <br/>
		<input type="submit" value="로그인">
		</form>
	</body>
</html>