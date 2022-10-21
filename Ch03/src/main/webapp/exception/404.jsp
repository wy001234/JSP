<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>요청하신 페이지를 찾을 수 없습니다. 다시 한번 확인 하십시요.</h3>
		<p>
	
			에러타입 : <%= exception.getClass().getName()%> <br/>
			에러내용 : <%= exception.getMessage() %> <br/>
		
		</p>
		<a href="../8_exception.jsp">뒤로가기</a>
	</body>
</html>