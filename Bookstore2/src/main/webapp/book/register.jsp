<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>book::register</title>
	</head>
	<body>
		<h3>도서등록</h3>
		<a href="/Bookstore2/">처음으로</a>
		<a href="/Bookstore2/book/list.do">도서 목록</a>
		
		<form action="/Bookstore2/book/register.do" method="post">
			<table border="1">
				<tr>
					<td>도서번호</td>
				<td><input type="text" name="uid" placeholder="도서번호 입력"/></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="uid" placeholder="도서명 입력"/></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="name" placeholder="출판사입력"/></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="hp" placeholder="가격 입력"/></td>
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