<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	//���� �Ķ���� ���ڵ� ����
 	request.setCharacterEncoding("UTF-8");
 
 	// ���� �Ƕ���� ����
 	String name = request.getParameter("name");
 	String birth = request.getParameter("birth");
 	String addr = request.getParameter("addr");
 	String gender = request.getParameter("gender");
 	String[] hobbies = request.getParameterValues("hobbies"); //���� �����Ͱ� �������϶�
 %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>ȸ������ ó��</h3>
		<p>
			�̸� : <%= name %><br/>
			������� : <%= birth %><br/>
			�ּ� : <%= addr %><br/>
			���� : 
			<% 
				if(gender.equals("1")){
					out.print("����");
				}else{
					out.print("����");
				}
			%>
			<br/>
			��� : 
			<%
				for(String hobby : hobbies){
					out.print(hobby + " ");
				}			
			%>
			<br/>
		</p>
		
		<a href="../1_request ��ü.jsp">�ڷΰ���</a>
</body>
</html>