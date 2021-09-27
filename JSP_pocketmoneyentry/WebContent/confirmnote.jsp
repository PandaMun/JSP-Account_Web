<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="./resources/css/styles.css" rel="stylesheet" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<%@ include file="dbconn.jsp"%>
	<br>
	<br>
	<br>
	<form action="confirmnoteproc.jsp" method="post">
		<div style="padding-top: 50px">
			<table class="table" width="600" >
				<tr>
					<th></th>
					<th>확정</th>
					<th>이메일</th>
					<th>용돈</th>
					<th>수입/지출</th>
					<th>내용</th>
					<th>수입지출일</th>
					<th>메모</th>
					<th>변경가능여부</th>
				</tr>
				<%
					ResultSet rs = null;
				Statement stmt = null;
				String sql = "select * from moneynote where confirm = 'Y'";
				try {
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);

					while (rs.next()) {
						int no = rs.getInt("no");
						String email = rs.getString("email");
						int money = rs.getInt("money");
						String in_out = rs.getString("in_out");
						String note = rs.getString("note");
						String io_date = rs.getString("iodate");
						String memo = rs.getString("memo");
						String confirm = rs.getString("confirm");
				%>

				<tr>
				<td></td>
					<td><input type="checkbox" name="no" value="<%= no%>" /></td>
					<td><%=email%></td>
					<td><%=money%></aatd>
					<td><%=in_out%></td>
					<td><%=note%></td>
					<td><%=io_date%></td>
					<td><%=memo%></td>
					<td><%=confirm%></td>
				</tr>


				<%
					}
				%>
			</table>
		</div>
		<br>
		<div style="text-align: center;">
			<button class="btn btn btn-lg btn-info btn-block" type="submit">확인</button>
		</div>
	</form>
	<%
		} catch (SQLException ex) {
	out.println("moneynote 테이블 호출이 실패했습니다.<br>");
	out.println("SQLException: " + ex.getMessage());
	} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
	if (conn != null)
		conn.close();
	}
	%>

</body>
</html>