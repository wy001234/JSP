<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//forward는 서버 자원내에서 이동하므로 타 서버 차원으로 forward이 안됨
	pageContext.forward("https://naver.com");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>forward2 페이지</h3>
	</body>
</html>