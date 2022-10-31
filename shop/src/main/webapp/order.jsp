<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.shop.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.shop.bean.orderBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<orderBean> orders = new ArrayList<>();


	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql  = "SELECT a.*, b.`name`, c.`prodName` FROM `order` AS a ";
		  		 sql += "JOIN `customer` AS b ON a.orderId = b.custId ";
		  		 sql += "JOIN `product` AS c ON a.orderProduct = c.prodNo";
		ResultSet rs = stmt.executeQuery(sql);
		
		
		while(rs.next()){
			orderBean ob = new orderBean();
			ob.setOrderNo(rs.getInt(1));
			ob.setOrderId(rs.getString(2));
			ob.setOrderProduct(rs.getInt(3));
			ob.setOrderCount(rs.getInt(4));
			ob.setOrderDate(rs.getString(5));
			ob.setName(rs.getString(6));
			ob.setProdName(rs.getString(7));
			orders.add(ob);
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
		<title>고객목록</title>
	</head>
	<body>
		<h3>주문목록</h3>
		
		<a href="/shop/customer.jsp">고객목록</a>
		<a href="/shop/order.jsp">주문목록</a>
		<a href="/shop/product.jsp">상품목록</a>
		
		<table border = "1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>
			</tr>
		<% for(orderBean ob : orders){ %>
			<tr>
				<td><%= ob.getOrderNo() %></td>
				<td><%= ob.getName() %></td>
				<td><%= ob.getProdName() %></td>
				<td><%= ob.getOrderCount() %></td>
				<td><%= ob.getOrderDate().substring(0, 16) %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>