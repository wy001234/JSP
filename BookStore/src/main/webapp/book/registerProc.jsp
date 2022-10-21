<%@page import="db.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송데이터 수신
	request.setCharacterEncoding("utf-8");

	String bookId = request.getParameter("bookId");
	String bookName = request.getParameter("bookName");
	String publisher = request.getParameter("publisher");
	String price = request.getParameter("price");
	

	// 데이터베이스 처리
		
	try{
		Connection conn = DBCP.getConnection();	
		
		// 3단계
		String sql = "INSERT INTO `book` VALUES(?,?,?,?)";
		PreparedStatement psmt= conn.prepareStatement(sql);
		psmt.setString(1, bookId);
		psmt.setString(2, bookName);
		psmt.setString(3, publisher);
		psmt.setString(4, price);
		
		psmt.executeUpdate();

		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//리다이렉트
	response.sendRedirect("./register.jsp");


%>