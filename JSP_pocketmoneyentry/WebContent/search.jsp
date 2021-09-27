<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<meta charset="UTF-8">
<title>기록 조회</title>
<link rel="stylesheet" href="./resources/css/styles.css" />
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">검색</h1>
		</div>
	</div>
	<br>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3>Search</h3>
			<br>
			<form action="shownote.jsp"
				method="post">
				<div class="form-group row">
				<label> 수 입 / 지 출</label>
				
				<div>
				<br>
					 <input type="radio" name="in_out" value = "in"> 수 입
					 <input type="radio" name="in_out" value = "out">지 출
					 <input type="radio" name="in_out" value = "all" checked> 모 두
				</div>
				</div>
				<br>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">지출 날짜 범위</label>
					<br>
					<br>
					 <input type="text" name="yy1" maxlength="4" placeholder="년" size="6">.
					 <input type="text" name="mm1" maxlength="4" placeholder="월" size="3">.
					 <input type="text" name="dd1" maxlength="4" placeholder="일" size="3">.  ~ 
					 <input type="text" name="yy2" maxlength="4" placeholder="년" size="6">.
					 <input type="text" name="mm2" maxlength="4" placeholder="월" size="3">.
					 <input type="text" name="dd2" maxlength="4" placeholder="일" size="3">.
					 
				</div>
				<br>
				<div class="form-group">
					<label>검색어을 입력하세요</label>
					<br>					
					 <input type="text" class="form-control" placeholder="note" name="note">
				</div>
				<br>
				<div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">검색</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>