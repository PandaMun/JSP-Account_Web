<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>menu</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm"
		id="mainNav">
		<div class="container px-5">
			<a class="navbar-brand fw-bold" href="./index.jsp">MoneyWeb</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="bi-list"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">

					<li class="nav-item"><a class="nav-link"
						onclick="return checkForm();"
						href="<c:url value="/search.jsp"/>">용돈 기록 조회</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="return checkForm();"
						href="<c:url value="/writenote.html"/>">수입지출기록</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="return checkForm();"
						href="<c:url value="confirmnote.jsp"/>">기록 확정</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="return checkForm();"
						href="<c:url value="/modnote.jsp"/>">기록 변경 </a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="return checkForm();"
						href="<c:url value="/delnote.jsp"/>">기록 삭제 </a></li>

					<c:choose>
						<c:when test="${empty sessionId}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/loginMember.jsp"/>">로그인 </a></li>
							<li class="nav-item"><a class="nav-link"
								href='<c:url value="/addMember.jsp"/>'>회원 가입</a></li>
						</c:when>
						<c:otherwise>
							<li style="padding-top: 7px; color: white">[<%=sessionId%>님]
							</li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/logoutMember.jsp"/>">로그아웃 </a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/updateMember.jsp"/>">회원 수정</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
