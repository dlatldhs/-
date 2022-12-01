<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>근무좌석예약</h2>
		<form name="frm">
			<table border=1>
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>부서명</td>
					<td>근무일수</td>
				</tr>
				<%
					try{
						Class.forName("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("select te.empno,te.empname,te.deptcode,count(tr.resvdate) from tbl_emp_202108 te , tbl_resv_202108 tr where te.empno = tr.empno group by te.empno,te.empname,te.deptcode");
						while(rs.next()){
							String deptcode = rs.getString(3);
							String deptname ="";
							switch(deptcode){
							case "10":
								deptname="영업팀";
								break;
							case "20":
								deptname="총무팀";
								break;
							case "30":
								deptname="구매팀";
								break;
							}
							
							%>
							<tr>
								<td><%= rs.getString(1) %></td>
								<td><%= rs.getString(2) %></td>
								<td><%= deptname %></td>
								<td><%= rs.getString(4) %></td>
							</tr>
							<%
						}
						stmt.close();
						con.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>