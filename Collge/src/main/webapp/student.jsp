<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.Collge.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.Collge.bean.studentBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	List<studentBean> students = null;
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `student`";
		ResultSet rs = stmt.executeQuery(sql);
		
		students = new ArrayList<>();
		
		while(rs.next()){
			studentBean sb = new studentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			students.add(sb);
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
		<title>학생관리</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				$('.btnStudent').click(function(){
					$('section').show();
				})
				
				$('.btnClose').click(function(){
					$('section').hide();
				})
				
				//주문 추가하기
				$('input[type=submit]').click(function(){
					
					let stdNo = $('input[name=stdNo]').val();
					let stdName = $('input[name=stdName]').val();
					let stdHp = $('input[name=stdHp]').val();
					let stdYear = $('#select option:selected').val();
					let stdAddress = $('input[name=stdAddress]').val();
				
					let jsonData = {
						"stdNo":stdNo,
						"stdName":stdName,
						"stdHp":stdHp,
						"stdYear":stdYear,
						"stdAddress":stdAddress
					}
					
					
					$.ajax({
						url:'/Collge/proc/studentProc.jsp',
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
		<h3>학생관리</h3>
		
		<a href="/Collge/lecture.jsp">강좌관리</a>
		<a href="/Collge/register.jsp">수강관리</a>
		<a href="/Collge/student.jsp">학생관리</a>
		
		<table border = "1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
			</tr>
		<% for(studentBean sb : students){ %>			
			<tr>
				<td><%= sb.getStdNo()  %></td>
				<td><%= sb.getStdName() %></td>
				<td><%= sb.getStdHp() %></td>
				<td><%= sb.getStdYear() %></td>			
				<td><%= sb.getStdAddress()%></td>			
			</tr>
			<% } %>
		</table>
		<br/>
		<button class = "btnStudent">학생등록</button>
		<section  style = "display: none">
			<h4>학생등록</h4>
			<button class = "btnClose">닫기</button>	
			<table border ='1'>
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo" value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>이름</td>
					<td><input type="text" name="stdName" value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp" value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>학년</td>
					<td>
					<select id ="select">
						<option value ="1">1학년</option>
						<option value ="2">2학년</option>
						<option value ="3">3학년</option>
					</select>
					</td>	 	
			 	</tr>
			 	<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress"/></td>	 	
			 	</tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록"/>
					</td>
				</tr>		
			</table>
		</section>
	</body>
</html>