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
	
	String [] no = request.getParameterValues("no");
	
	PreparedStatement pstmt = null;
	
	%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container" align="center">
		<%
	
	try{
		
	for(int i =0; i < no.length; i++){
		 String sql = "delete from moneynote where no = '" + no[i] +"'";
		 pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
	}
	out.println("<h2 class='alert alert-danger'>정상적으로 삭제되었습니다.</h2>");
	}catch(SQLException ex){
		out.println(" <h2 class='alert alert-danger'>실패하셨습니다 " + "SQLException :" + ex.getMessage() + "</h2>");
		
		}
	finally{
		if(pstmt != null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
	</div>

</body>
</html>