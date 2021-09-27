<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String email = request.getParameter("email");
	String money = request.getParameter("money");
	String in_out = request.getParameter("in_out");
	String date1 = request.getParameter("yy");
	String date2 = request.getParameter("mm");
	String date3 = request.getParameter("dd");
	String iodate = date1 + "." + date2 + "." + date3;
	String note = request.getParameter("note");
	String memo = request.getParameter("memo");
	
	PreparedStatement pstmt = null;
	String sql = "update moneynote set email = ? , money = ? , " +
			"in_out = ?, note = ? ,iodate=?, memo=? where no = '"+ no +"'";
		
	%>
	<br>
	<br>
	<br>
	<br>
	<div class="container" align="center">
	<%
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,email);
		pstmt.setString(2, money);
		pstmt.setString(3, in_out);
		pstmt.setString(4, note);
		pstmt.setString(5, iodate);
		pstmt.setString(6, memo);
		pstmt.executeUpdate();
		out.println("<h2 class='alert alert-danger'>정상적으로 수정되었습니다.</h2>");
	}catch(SQLException ex){
		out.println(" <h2 class='alert alert-danger'>실패하셨습니다 " + "SQLException :" + ex.getMessage() + "</h2>");
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
</div>	
	
	%>
</body>
</html>