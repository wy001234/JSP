<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.Collge.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.Collge.bean.registerBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<registerBean> registers = null;
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT a.*, b.stdName, c.lecName FROM `register` AS a JOIN `student` AS b on a.`regStdNo` = b.`stdNo` JOIN `lecture` AS c ON a.regLecNo = c.lecNo ";
		ResultSet rs = stmt.executeQuery(sql);
		
		registers = new ArrayList<>();
		
		while(rs.next()){
			registerBean rb = new registerBean();
			rb.setRegStdNo(rs.getString(1));
			rb.setRegLecNo(rs.getInt(2));
			rb.setRegMidScore(rs.getInt(3));
			rb.setRegFinalScore(rs.getInt(4));
			rb.setRegTotalScore(rs.getInt(5));
			rb.setRegGrade(rs.getString(6));
			rb.setStdName(rs.getString(7));
			rb.setLecName(rs.getString(8));
			registers.add(rb);
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
		<title>수강관리</title>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(function(){
				
				$('.btnLecture').click(function(){
					$('section').show();
				})
				
				$('.btnClose').click(function(){
					$('section').hide();
				})
		
			})
		</script>
	</head>
	<body>
		<h3>수강관리</h3>
		
		<a href="/Collge/lecture.jsp">강좌관리</a>
		<a href="/Collge/register.jsp">수강관리</a>
		<a href="/Collge/student.jsp">학생관리</a>
		<input type = text>		
		<button class = "btn1">검색</button>	
		<button class = "btnRsgister">수강신청</button>	
		<table border = "1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
			</tr>
		<% for(registerBean rb : registers){ %>			
			<tr>
				<td><%= rb.getRegStdNo()%></td>
				<td><%= rb.getStdName() %></td>
				<td><%= rb.getLecName() %></td>
				<td><%= rb.getRegLecNo()%></td>			
				<td><%= rb.getRegMidScore()%></td>			
				<td><%= rb.getRegFinalScore()%></td>		
				<td><%= rb.getRegTotalScore()%></td>		
				<td><%= rb.getRegGrade()%></td>		
			</tr>
			<% } %>
		</table>
		<br>
		<section style = "display: block">
			<h4>수강신청</h4>
			<table border ='1'>
				<tr>
					<td>학번</td>
					<td><input type="text" name="regStdNo" readonly  value=""/></td>	 	
			 	</tr>
			 	<tr>
					<td>이름</td>
					<td><input type="text" name="regStdName" /></td>	 	
			 	</tr>
			 	<tr>
					<td>신청강좌</td>
					<td>
						<select id ="select">
							<option value ="운영체제론">운영체제론</option>
							<option value ="무역영문">무역영문</option>
							<option value ="세법개론">세법개론</option>
							<option value ="빅데이터 개론">빅데이터 개론</option>
							<option value ="컴퓨팅사고와 코딩">컴퓨팅사고와 코딩</option>
							<option value ="사회복지 마케팅">사회복지 마케팅</option>
							<option value ="컴퓨터 구조론">컴퓨터 구조론</option>
						</select>
					</td>
			 	</tr>
					<td colspan="2" align="right">
						<input type="submit" value="신청"/>
					</td>
				</tr>		
			</table>
			<button class = "btnClose">닫기</button>
		</section>
	</body>
</html>