<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_include 태그</title>
		<!-- 
			날짜 : 2022/10/07
			이름 : 설우영
			내용 : JSP include 액션태그 실습하기	
			
			include 액션태그
			- 일반적으로 UI 모듈, 공통 전역 파일을 삽입할 때 사용하는 지시자
			- 동적 타입에 삽입
		 -->
	</head>
	<body>
		<h3>include 액션 태그</h3>
		
		<h4>include 지시자</h4>
		<%@ include file = /inc/_header.jsp %>
		<%@ include file = /inc/_header.jsp %>
		
		<h4>include 태그</h4>
		
		<h4>include 메서드</h4>
		<%
			p
		%>
	</body>
</html>