<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<%
	List<CustomerBean> customers = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `customer`";
		ResultSet rs = stmt.executeQuery(sql);
		
		customers = new ArrayList<>();
		
		while(rs.next()){
			CustomerBean cb = new CustomerBean();
			cb.setCustId(rs.getInt(1));
			cb.setName(rs.getString(1));
			cb.setAddress(rs.getString(1));
			cb.setPhone(rs.getString(1));
			customers.add(cb);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객 목록</title>
	</head>
	<body>
		<h3>고객목록</h3>
		
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">고객등록</a>
		<table border ='1'>
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<% for(CustomerBean cb : customers){ %>
			<tr>
				<td><%= cb.getCustId() %></td>
				<td><%= cb.getName() %></td>
				<td><%= cb.getAddress() %></td>
				<td><%= cb.getPhone() %></td>
				<td>
					<a href="./modify.jsp?bookId=<%= cb.getCustId() %>">수정</a>	
					<a href="./delete.jsp?bookId=<%= cb.getCustId() %>">삭제</a>	
				</td>
			</tr>
			<% } %>
		</table>

	</body>
</html>