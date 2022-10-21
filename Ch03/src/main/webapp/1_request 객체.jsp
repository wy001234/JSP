<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 
			날짜 : 2022/10/05
			이름 : 설우영
			내용 : JSP request 내장객체 실습하기
			
			request 내장객체
			- 클라이언트 요청 정보를 갖는 객체
			- 클라이언트의 전송 데이터(Parameter)를 수신하는 기능을 제공
			
			Get 요청방식
			- 기본 데이터 전송 방식
			- 서버에 페이지나 데이터를 요청하는 전송방식
			- 전송 데이터가 주소에 노출
			
			Post 요청방식
			- 서버에 데이터를 전송하면서 처리를 요청하는 전송방식
			- 전송데이터가 요청 body에 캡슐화 되어 전송, 데이터 노출이 안됨
		 -->
	</head>
	<body>
		
		<h4>Client 정보 확인</h4>
		<p>
			헤더정보 : <%= request.getHeader("User-Agent") %> <br>
			프로토콜 : <%= request.getProtocol() %> <br>
			서버이름 : <%= request.getServerName() %> <br>
			요청주소 : <%= request.getRequestURI() %> <br>
			요청경로 : <%= request.getRequestURI() %> <br>
			클라이언트 IP주소 : <%= request.getRemoteAddr() %> <br>
		
	</body>
</html>