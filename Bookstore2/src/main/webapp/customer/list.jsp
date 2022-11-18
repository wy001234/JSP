<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>customer::list</title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="/Bookstore2/">처음으로</a>
		<a href="/Bookstore2/customer/register.do">고객 등록</a>
		<table border="1">
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<c:forEach var="customer" items="${customers}">
				<tr>
					<td>${customer.getCustId()}</td>
					<td>${customer.getName()}</td>
					<td>${customer.getAddress()}</td>
					<td>${customer.getPhone()}</td>
					<td>
						<a href="/Bookstore2/customer/modify.do?custId=${customer.custId}">수정</a>
						<a href="/Bookstore2/customer/delete.do?custId=${customer.custId}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>		
	</body>
</html>

