<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_Cookie</title>
		<!-- 
		
		
		cookie
		- 클라이언트와 서버간의 색별을 위해 사용되는 조각파일
		- 쿠키는 서버에서 생성해서 클라이언트 전송/저장
		- 클라이언트는 저장된 쿠키를 보관 해당 서버로 다시 요쳥항 때 전송
		 -->
	</head>
	<body>
		<h3>Cookie 실습</h3>
		
		<form action="./proc/cookieProc.jsp" method="post">
			<input type="text">
			<input type="password">
			<input type="submit">
		</form>
	</body>
</html>