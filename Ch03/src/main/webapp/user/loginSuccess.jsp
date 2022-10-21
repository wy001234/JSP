<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	//클라이언트 설정값 반환
	String uid	= (String)session.getAttribute("uid");

	if(uid == null){
		response.sendRedirect("../6_session.jsp");
		return; //처리 종료
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%=uid %>님 반갑습니다.
			<a href="./logout.jsp">로그아웃</a>
		</p>
	</body>
</html>