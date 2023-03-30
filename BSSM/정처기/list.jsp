<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>좌석예약조회</h2>
		<form action="action2.jsp" name="frm2" method="post">
		<table border=1>
			<tr>
				<td>사원번호를 입력하시오.</td>
				<td><input type="text" name="resvno2"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="좌석예약조회" onclick="return check()">
					<input type="submit" value="홈으로" onclick="reset()">
				</td>
			</tr>
		</table>
		
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>