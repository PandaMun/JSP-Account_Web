<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./resources/css/styles.css" />
<head>
<meta charset="UTF-8">
<title>shownote</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");

	String inout = request.getParameter("in_out");
	String date1 = request.getParameter("yy1");
	String date2 = request.getParameter("mm1");
	String date3 = request.getParameter("dd1");
	String iodate = date1 + date2 + date3;
	String date4 = request.getParameter("yy2");
	String date5 = request.getParameter("mm2");
	String date6 = request.getParameter("dd2");
	String text = request.getParameter("note");
	%>
	<br>
	<br>
	<br>

	<table class="table" width="1000">
		<tr>
		<th></th>
			<th>번호</th>
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
		String sql= null;

		if (inout.equals("in")) {
			if (text != "" && iodate != "") {
				sql = "select * from moneynote where (in_out = 'in') AND (note LIKE '%" + text + "%') AND" + "(iodate BETWEEN '"
						+ date1 + "." + date2 + "." + date3 + "' AND '" + date4 + "." + date5 + "." + date6 + "')";
			}
			else if (text == "" && iodate != "") {
				sql = "select * from moneynote where ( in_out = 'in') AND (iodate BETWEEN '" + date1 + "." + date2 + "." + date3 + "' AND '" + date4 + "." + date5 + "." + date6
				+ "')";
			}
			else if (text != "" && iodate == "") {
				sql = "select * from moneynote where( in_out = 'in') AND( note LIKE '%" + text + "%')";
			} 
			else {
				sql = "select * from moneynote where in_out = 'in'";
			}
		} 
		else if (inout.equals("out")) {
			if (text != "" && iodate != "") {
				sql = "select * from moneynote where (in_out = 'out') AND (note LIKE '%" + text + "%') AND" + "(iodate BETWEEN '"
						+ date1 + "." + date2 + "." + date3 + "' AND '" + date4 + "." + date5 + "." + date6 + "')";
			} 
			else if (text == "" && iodate!= "") {
				sql = "select * from moneynote ( where in_out = 'out') AND (iodate BETWEEN '" + date1 + "." + date2 + "." + date3 + "' AND '" + date4 + "." + date5 + "." + date6
				+ "')";
			} 
			else if (text != "" && iodate != "") {
				sql = "select * from moneynote where( in_out = 'out' )AND( note LIKE '%" + text + "%')";
			} 
			else {
				sql = "select * from moneynote where in_out = 'out'";
			}
		} 
		else {
			if (text != "" && iodate != ""){
				sql = "select * from moneynote where (note LIKE '%" + text + "%') AND" + "(iodate BETWEEN '"
						+ date1 + "." + date2 + "." + date3 + "' AND '" + date4 + "." + date5 + "." + date6 + "')";
			}
			else if(text !="" && iodate==""){
				sql = "select * from moneynote where (note LIKE '%" + text + "%')";
			}
			else if(text != "" && iodate != ""){
				sql = "select * from moneynote  where (iodate BETWEEN '" + date1 + "." + date2 + "." + date3 + "' AND '" + date4 + "." + date5 + "." + date6
						+ "')";
			}
			else{
				
				sql = "select * from moneynote";
			}
				
			}
		

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
				String confirm= rs.getString("confirm");
		%>
		<tr>
		<td></td>
			<td><%=no%></td>
			<td><%=email%></td>
			<td><%=money%></td>
			<td><%=in_out%></td>
			<td><%=note%></td>
			<td><%=io_date%></td>
			<td><%=memo%></td>
			<td><%=confirm%></td>
		</tr>
		<%
			}
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
	</table>

</body>
</html>