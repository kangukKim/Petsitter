<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#form-div {
	background-color: rgba(93, 93, 93, 0.4);
	padding: 50px 35px 50px 35px; /*위 왼쪽 아래 오른쪽*/
	width: 100%;
	left: 28%;
	position: absolute;
	margin-top: 100px;
	margin-left: -260px;
	-moz-border-radius: 7px;
	-webkit-border-radius: 7px;
}

.feedback-input {
	color: #3c3c3c;
	font-family: Helvetica, Arial, sans-serif;
	font-weight: 500;
	font-size: 18px;
	border-radius: 0;
	line-height: 22px;
	background-color: #ffffff;
	padding: 13px 13px 13px 54px;
	margin-bottom: 10px;
	width: 100%;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	-ms-box-sizing: border-box;
	box-sizing: border-box;
	border: 3px solid rgba(0, 0, 0, 0);
}

.feedback-input:focus {
	background: #fff;
	box-shadow: 0;
	/*border: 3px solid #3498db;*/
	border-color: #F7D358;
	color: #3498db;
	outline: none;
	/*padding: 13px 13px 13px 54px;*/
}

.focused {
	color: #30aed6;
	border: #30aed6 solid 3px;
}

#name {
	background-image: url(http://rexkirby.com/kirbyandson/images/name.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

#email {
	background-image: url(http://rexkirby.com/kirbyandson/images/email.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

#pwd {
	background-image: url(http://rexkirby.com/kirbyandson/images/email.svg);
	background-size: 30px 30px;
	background-position: 11px 8px;
	background-repeat: no-repeat;
}

input:hover, textarea:hover, input:focus, textarea:focus {
	background-color: white;
}

.btn1 {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	float: left; /* 플롯 중요(::after 가상요소 이용)*/
	width: 45%;
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
	margin-left: 30px;
	margin-top: 10px;
	margin-right: 10px;
	font-weight: 700;
}

#button-yellow:hover {
	background-color: rgba(0, 0, 0, 0);
	color: #F7D358;
}

.ease {
	width: 0;
	height: 74px;
	background-color: #fbfbfb;
	-webkit-transition: .3s ease;
	-moz-transition: .3s ease;
	-o-transition: .3s ease;
	-ms-transition: .3s ease;
	transition: .3s ease;
}

.submit:hover .ease {
	width: 100%;
	background-color: white;
}
</style>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
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
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="recharge.jsp">충전하기</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="list.jsp">펫시터게시글</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="information.jsp">후원안내</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="Donate.jsp">후원하기</a></li>

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
				<h2 class="section-heading text-uppercase">환영합니다!</h2>
				<h3 class="section-subheading text-muted">회원가입을 진행해주세요.</h3>
			</div>
		</div>
	</section>

	<div class="container" id="form-div">
		<form name="joinForm" action="joinAction.jsp" method="post">
			<p class="name">
				<input name="userName" type="text"
					class="validate[required,custom[onlyLetter],length[0,100]] feedback-input"
					placeholder="이름" id="userName" />
			</p>

			<p class="id">
				<input name="userID" type="text"
					class="validate[required,custom[id]] feedback-input" id="userID"
					placeholder="아이디" />
			</p>

			<p class="pwd">
				<input name="userPassword" type="text"
					class="validate[required,custom[pwd]] feedback-input"
					id="userPassword" placeholder="패스워드" />
			</p>
			
			<div class="account">
				<input name="account" type="text"
					class="validate[required,custom[pwd]] feedback-input"
					id="account" placeholder="계좌" />
				<button type="button" class="btn1" id="createAccount" name=createAccount>계좌생성</button>
					
			
			<button class="btn1" id="join" name=join>회원가입</button>
			</div>
			
		</form>
	</div>
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
<script src="js/web3.min.js"></script>
<script>
	$(document).ready(
			function() {
				console.log("ready!");

				if (typeof web3 !== 'undefined') {
					web3 = new Web3(web3.currentProvider);
				} else {
					// set the provider you want from Web3.providers
					web3 = new Web3(new Web3.providers.HttpProvider(
							"http://13.209.188.27:8542"));
				}
				web3 = new Web3(new Web3.providers.HttpProvider(
						"http://13.209.188.27:8542"));
				/* Get Node Info */
				web3.eth.getNodeInfo(function(error, result) {
					if (error) {
						console.log("error", error);
					} else {
						console.log("result", result);
						//$('#NodeInfo').val(result);
					}
				});
				$('#createAccount').click(
						function() {
							alert('계좌가 생성중입니다. 잠시만 기다려주세요.');
							var password = $('#userPassword').val();
							web3.eth.personal.newAccount(password).then(
									function(result) {
										account = result;
										document.getElementById("account").value = account;
									});

						});

			});
</script>