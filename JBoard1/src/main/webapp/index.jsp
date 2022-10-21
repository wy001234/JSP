<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//로그인 여부에 따라 페이지 처리 흐름
	if(true){
		//로그인을 안한경우
		pageContext.forward("./user/login.jsp");
	}else{
		//로그인을 한 경우
		pageContext.forward("./list.jsp");
	}

%>