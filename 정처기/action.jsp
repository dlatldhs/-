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
	String mode = request.getParameter("mode");
	// 근무 좌석 예약 request
	String resvno = request.getParameter("resvno");
	String empno = request.getParameter("empno");
	String resvdate = request.getParameter("resvdate");
	String seatno = request.getParameter("seatno");
	
	// 좌석 예약 조회 request
	String resvno2 = request.getParameter("resvno2");
	
	// out.println(resvno);
	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		Statement stmt = con.createStatement();
		String sql ="";
		switch(mode){
		case "insert":
			sql = String.format("insert into tbl_resv_202108 values('%s','%s','%s','%s')",resvno,empno,resvdate,seatno);
			int r2 = stmt.executeUpdate(sql);
			%>
			<jsp:forward page="insert.jsp"></jsp:forward>
			<%
			break;
		}
		stmt.close();
		con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>