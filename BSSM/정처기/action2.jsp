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
	<%
	
	request.setCharacterEncoding("UTF-8");
	String resvno2 = request.getParameter("resvno2");
	
	//out.println(resvno2);
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		Statement stmt = con.createStatement();
		String sql = String.format("select te.empno,te.empname,tr.resvdate,tr.seatno,ts.office,ts.callno from tbl_emp_202108 te , tbl_seat_202108 ts , tbl_resv_202108 tr where te.empno = tr.empno and ts.seatno = tr.seatno and te.empno = '%s' group by tr.seatno,te.empno,te.empname,tr.resvdate,ts.office,ts.callno",resvno2);
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			%>
			<jsp:forward page="sucess.jsp">
				<jsp:param name="sql" value="<%=sql %>" />
				<jsp:param name="resvno" value="<%=resvno2 %>" />
			</jsp:forward>
			<%
		}else{
			%>
			<jsp:forward page="faild.jsp">
				<jsp:param name="sql" value="<%=sql %>" />
			</jsp:forward>
			<%
		}
		stmt.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>