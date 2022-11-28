<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	//전송 파라미터 인코딩 설정
 	request.setCharacterEncoding("UTF-8");
 
 	// 전송 피라미터 수신
 	String name = request.getParameter("name");
 	String birth = request.getParameter("birth");
 	String addr = request.getParameter("addr");
 	String gender = request.getParameter("gender");
 	String[] hobbies = request.getParameterValues("hobbies"); //같은 데이터가 여러개일때
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>회원가입 처리</h3>
		<p>
			이름 : <%= name %><br/>
			생년월일 : <%= birth %><br/>
			주소 : <%= addr %><br/>
			성별 : 
			<% 
				if(gender.equals("1")){
					out.print("남자");
				}else{
					out.print("여자");
				}
			%>
			<br/>
			취미 : 
			<%
				for(String hobby : hobbies){
					out.print(hobby + " ");
				}			
			%>
			<br/>
		</p>
		
		<a href="../1_request 객체.jsp">뒤로가기</a>
</body>
</html>