<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	if(pw.equals("1234")){
		//회원이 맞음
		
		//자동로그인 유지처리
		if(auto != null){
			Cookie cookie = new Cookie("cid", id);
			cookie.setMaxAge(60*3); //3분
			
			response.addCookie(cookie);
			
		}
		
		//클라이언트 로그인 성공 상태정보 저장
		session.setAttribute("sessid", id);
		response.sendRedirect("./loginSuccess.jsp");
	}else{
		//회원이 아님
		response.sendRedirect("./login.jsp");
		
	}

%>