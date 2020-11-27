<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.btn1 {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	width: 200px;
	border: #F7D358 solid 4px;
	border-radius: 20px;
	cursor: pointer;
	background-color: #F7D358;
	color: white;
	font-size: 24px;
	padding-top: 22px;
	padding-bottom: 22px;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	font-weight: 700;
}
</style>
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
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    메뉴
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ml-auto">
                        <li class="nav-item" style= "font-color: black"><a class="nav-link js-scroll-trigger" href="recharge.jsp">충전하기</a></li>
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
                    <h2 class="section-heading text-uppercase">About</h2>
                    <h3 class="section-subheading text-muted">멍냥이 펫시터가 후원하는 라온보호소에 대해 알려드릴게요.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/1.png" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>위치</h4>
                                <h4 class="subheading">인천 남동구 논현동 671-1</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">소래포구역 2번출구에서 도보 3분</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.png" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>운영시간</h4>
                                <h4 class="subheading">PM 12:00 - PM 21:00</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">연중무휴</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.png" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>전화번호</h4>
                                <h4 class="subheading">070-4349-5575</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">후원에 대해 문의사항이 있으면 <br> 언제든 연락주세요!</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/4.png" alt="" /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>사이트</h4>
                                <h4 class="subheading"><a href="https://laonshelter.co.kr/">https://laonshelter.co.kr/</a></h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">라온보호소 사이트에서 더 많은 정보를 <br> 구경해보세요.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                <a class="btn1" onclick="location.href='Donate.jsp'"><br>후원하기</a>
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
    
	
    <!-- <input type="button" value="후원하기" id="button-yellow" onclick="location.href='Donate.jsp'">  -->
    
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