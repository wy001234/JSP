<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서등록</title>
	</head>
	<body>
		<h3>도서 등록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서목록</a>
		
		<form action="./registerProc.jsp">
			<table border ='1'>
				<tr>
					<td>도서번호</td>
					<td><input type="text" name="bookId" placeholder="도서명"/></td>	 	
		 		</tr>
		 		<tr>
					<td>아이디</td>
					<td><input type="text" name="bookName" placeholder="도서명"/></td>	 	
		 		</tr>
		 		<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" placeholder="출판사"/></td>	 	
		 		</tr>
		 		<tr>
					<td>가격</td>
					<td><input type="text" name="price" placeholder="가격"/></td>	 	
		 		</tr>
		 		<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록하기"/>
					</td>
				</tr>		
			</table>
		</form>
	</body>
</html>