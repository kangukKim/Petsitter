<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page import="bbs.BbsDAO"%>
	 <%@ page import = "java.sql.*"%>
	 

<!DOCTYPE html>
<style>
table {
	margin-top: 50px;
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-bottom: 50px;
}
th, td {
	height: 80px;
	border-top: 1px solid #444444;
	text-align: center;
}
#btn {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	width: 150px;
	border: #fbfbfb solid 4px;
	cursor: pointer;
	background-color: #F7D358;
	color: white;
	font-size: 24px;
	padding-top: 10px;
	padding-bottom: 10px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	margin-top: -4px;
	margin-left: 700px;
	font-weight: 700;
}
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>멍냥이 펫시터</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="home.jsp"><img src="assets/img/homeIcon.png" width="90px" height="80px" alt="" /></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				메뉴 <i class="fas fa-bars ml-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="recharge.jsp">충전하기</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="list.jsp">펫시터게시글</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="information.jsp">후원안내</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="Donate.jsp">후원하기</a></li>
                        
                        <%
						if (userID == null) {
					%>
					<li><a href="login.jsp">로그인</a></li>

					<li><a href="join.jsp">회원가입</a></li>

					<%
						} else {
					%>

					<li><a href="logoutAction.jsp">로그아웃</a></li>

					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<section class="page-section" id="contact">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">펫시터 목록</h2>
				<h3 class="section-subheading text-muted">마음껏 자신을 어필해주세요</h3>
			</div>
		</div>
	</section>
	
				<div class="container">
					<table class="table-striped">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">내용</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							</tr>
						</thead>
						<tbody>
							<%
							
							BbsDAO bbs=new BbsDAO();
							ResultSet rs = bbs.getBoard();
							while(rs.next()){
							%>
							
							<tr>
								<td><%= rs.getString("boardIdx")%></td>
								<td><a href="view.jsp?boardIdx=<%=rs.getString("boardIdx") %>"><%= rs.getString("boardTitle")%></a></td>
								<td><a href="view.jsp?boardIdx=<%=rs.getString("boardIdx") %>"><%= rs.getString("content") %></a></td>
								<td><%= rs.getString("userID") %></td>
								
								
							</tr>
<%} %>


						</tbody>
					</table>
				</div>


<button type="submit" id="btn" onclick="location.href='register.jsp'">글쓰기
</button>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>