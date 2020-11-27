<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<style>
body {
	background-size: cover
}
#btn {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	float: left; /* 플롯 중요(::after 가상요소 이용)*/
	width: 100%;
	border: #fbfbfb solid 4px;
	cursor: pointer;
	background-color: #F7D358;
	color: white;
	font-size: 24px;
	padding-top: 22px;
	padding-bottom: 22px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	margin-top: -4px;
	font-weight: 700;
}

#button-yellow:hover {
	background-color: rgba(0, 0, 0, 0);
	color: #F7D358;
}
</style>

<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>멍냥이 펫시터</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
	<body background="https://images.mypetlife.co.kr/content/uploads/2019/09/04222847/dog-panting-1024x683.jpg">
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="assets/img/homeIcon.png" width="90px" height="80px" alt="" /></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    메뉴
                    <i class="fas fa-bars ml-1"></i>
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
			
			<header class="masthead">
            <div class="container">
                <div class="masthead-subheading">잠시 집을 비울 때 반려동물이 걱정되시나요?</div>
                <div class="masthead-heading text-uppercase">멍냥이 펫시터를 이용해보세요!</div>
             	<%
			if (userID == null) {
				%>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" onclick="location.href='join.jsp'">회원가입 하기</a>
				<!-- <input type="button" value="Join us" id="button-yellow"
				onclick="location.href='join.jsp'">
				-->
				<%
					}
				%>   
            </div>
            
        </header>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>