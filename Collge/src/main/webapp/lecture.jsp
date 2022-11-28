<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.Collge.bean.lectureBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.Collge.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>


<% 
	List<lectureBean> lectures = null;

	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `lecture`";
		ResultSet rs = stmt.executeQuery(sql);
		
		lectures = new ArrayList<>();
		
		while(rs.next()){
			lectureBean lb = new lectureBean();
			lb.setLecNo(rs.getInt(1));
			lb.setLecName(rs.getString(2));
			lb.setLecCredit(rs.getInt(3));
			lb.setLecTime(rs.getInt(4));
			lb.setLecClass(rs.getString(5));
			lectures.add(lb);
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
		<title>강좌목록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				
				$('.btnLecture').click(function(){
					$('section').show();
				})
				
				$('.btnClose').click(function(){
					$('section').hide();
				})
			
				//주문 추가하기
				$('input[type=submit]').click(function(){
					
					let lecNo = $('input[name=lecNo]').val();
					let lecName = $('input[name=lecName]').val();
					let lecCredit = $('input[name=lecCredit]').val();
					let lecTime = $('input[name=lecTime]').val();
					let lecClass = $('input[name=lecClass]').val();
				
					let jsonData = {
						"lecNo":lecNo,
						"lecName":lecName,
						"lecCredit":lecCredit,
						"lecTime":lecTime,
						"lecClass":lecClass
					}
					
					
					$.ajax({
						url:'/Collge/proc/lectureProc.jsp',
						type:'POST',
						data:jsonData,
						dataType:'json',
						success:function(data){
							if(data.result==1){
								alert('추가성공');
							}else{
								alert('추가실패!');
							}	
						}
					})
					
				});
			
			
			
			})
		</script>
	</head>
	<body>
		<h3>강좌목록</h3>
		
		<a href="/Collge/lecture.jsp">강좌관리</a>
		<a href="/Collge/register.jsp">수강관리</a>
		<a href="/Collge/student.jsp">학생관리</a>
		
		<table border = "1">
			<tr>
				<th>번호</th>
				<th>강좌명</th>
				<th>학점</th>
				<th>시간</th>
				<th>강의장</th>
			</tr>
		<% for(lectureBean lb : lectures){ %>			
			<tr>
				<td><%= lb.getLecNo() %></td>
				<td><%= lb.getLecName() %></td>
				<td><%= lb.getLecCredit() %></td>
				<td><%= lb.getLecTime() %></td>			
				<td><%= lb.getLecClass()%></td>			
			</tr>
			<% } %>
		</table>
		<br/>
		<button class = "btnLecture">강좌등록</button>
		<section  style = "display: none">
			<h4>주문하기</h4>
			<button class = "btnClose">닫기</button>	
			<table border ='1'>
				<tr>
					<td>번호</td>
					<td><input type="text" name="lecNo" value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>강좌명</td>
					<td><input type="text" name="lecName" value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>학점</td>
					<td><input type="text" name="lecCredit" value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>시간</td>
					<td><input type="text" name="lecTime" /></td>	 	
			 	</tr>
			 	<tr>
					<td>강의장</td>
					<td><input type="text" name="lecClass"/></td>	 	
			 	</tr>
					<td colspan="2" align="right">
						<input type="submit" value="추가"/>
					</td>
				</tr>		
			</table>
		</section>
	</body>
</html>