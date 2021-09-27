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
	%>
	<form action="resultmodnote.jsp" method="post">
	<select name ="no" size="1">
	<option value = <%=no %>></option>
	</select>
	
	<br>
	<br>
	<br>
	<br>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3>변 경</h3>
		<br>
		<div class="form-group">
			<label>e-mail</label> <br> <input type="text" class="form-control"
				placeholder="email" name="email">
		</div>
		<br>
		<div class="form-group">
			<label>용 돈</label> <br> <input type="text" class="form-control"
				placeholder="money" name="money">
		</div>
		<br>
		<div class="form-group row">
			<label> 수 입 / 지 출</label>

			<div>
				<br> <input type="radio" name="in_out" value="in"> 수 입
				<input type="radio" name="in_out" value="out" checked>지 출
			</div>
		</div>
		<br>
		<div class="form-group">
			<label>내 용</label> <br> <input type="text" class="form-control"
				placeholder="note" name="note">
		</div>
		<br>

		<div class="form-group">
			<label for="inputPassword" class="sr-only">지출 날짜</label> <br> <br>
			<input type="text" name="yy" maxlength="4" placeholder="년" size="6">.
			<input type="text" name="mm" maxlength="4" placeholder="월" size="3">.
			<input type="text" name="dd" maxlength="4" placeholder="일" size="3">.

		</div>
		<br>
		<div class="form-group">
			<label>용 돈</label> 
			<br> 
			<input type="text" class="form-control" placeholder="memo" name="memo">
		</div>
		<br>
		<div>
			<button class="btn btn btn-lg btn-success btn-block" type="submit">변 경</button>
		</div>
	</div>
	</div>
	</form>
	

</body>
</html>