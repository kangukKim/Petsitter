<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="user.UserDAO"%>
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
.btn1 {
	font-family: 'Montserrat', Arial, Helvetica, sans-serif;
	border: #fbfbfb solid 4px;
	cursor: pointer;
	background-color: #F7D358;
	color: white;
	font-size: 16px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-weight: 500;
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
	UserDAO userDAO = new UserDAO();
	String _account = userDAO.getAccount(userID);
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
				<h2 class="section-heading text-uppercase">게시글 확인하기</h2>
				<h3 class="section-subheading text-muted">저의 펫시터가 되어주세요.</h3>
			</div>
		</div>
	</section>

	<div class="container">
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3"
						style="background-color: #eeeeee; text-align: center; font-size: 25px;">게시글 보기</th>
				</tr>
			</thead>

			<tbody>
				<%
					BbsDAO bbs = new BbsDAO();
				ResultSet rs = bbs.getBoardDetail(Integer.parseInt(request.getParameter("boardIdx")));
				String addr = "";
				String postID = "";
				String point="";
				while (rs.next()) {
				%>
				<tr>
					<%
						postID = rs.getString("userID");
					addr = rs.getString("contract");
					point=rs.getString("point");
					%>
					<th style="width: 20%;">작성자</th>
					<td colspan="2"><%=postID%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="2"><%=rs.getString("boardTitle")%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2" style="min-height: 200px; text-align: center;"><%=rs.getString("content")%></td>
				</tr>
				<tr>
					<th>매칭 포인트</th>
					<td colspan="2"><input type="text" name="point"
						value=<%=point%> readonly /></td>
				</tr>
				<tr>
					<td>Contract Address</td>
					<td colspan="2"><%=addr%></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="text" name="pwd" id="pwd">
									<%
					if (!postID.equals(userID)) {


				%>
						<button class="btn1" name="matching" id="matching">매칭</button>
						<button class="btn1" name="accept" id="accept">돌봄확정</button>
						<%
					}else{
						%>
						<button class="btn1" name="abort" id="abort">취소</button>
						<button class="btn1" name="refund" id="refund">환급</button>

						<% 
					}%>
											
						</td>

				</tr>


						<%									

				}
				%>
			</tbody>
		</table>
	</div>
	<button type="submit" id="btn" onclick="location.href='list.jsp'">목록
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

<script src="js/web3.min.js"></script>
<script>

		$(document).ready(
				function() {
					console.log("ready!");

					var web3 = new Web3(new Web3.providers.HttpProvider(
					"http://13.209.188.27:8542"));
					$('#refund').click(function(){
						var abi = [
							{
								"inputs" : [],
								"name" : "abort",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmPurchase",
								"outputs" : [],
								"stateMutability" : "payable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmReceived",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"stateMutability" : "payable",
								"type" : "constructor"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "Aborted",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "ItemReceived",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "PurchaseConfirmed",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "refundSeller",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "SellerRefunded",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "buyer",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "seller",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "state",
								"outputs" : [ {
									"internalType" : "enum Purchase.State",
									"name" : "",
									"type" : "uint8"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "value",
								"outputs" : [ {
									"internalType" : "uint256",
									"name" : "",
									"type" : "uint256"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							} ];
					var contractAddress = "<%=addr%>";
					
					var contract = new web3.eth.Contract(
							abi, contractAddress, {
								from : "<%=_account%>"
							});
					web3.eth.personal.unlockAccount("<%=_account%>", $('#pwd').val(), 600).then(function(){
						alert('환급중입니다. 잠시만 기다려 주세요!');

						contract.methods
								.refundSeller().send({from : "<%=_account%>"})
								.then(function(receipt) {
										console.log(receipt);
								});
						});
					
					});
					$('#accept').click(function(){
						var abi = [
							{
								"inputs" : [],
								"name" : "abort",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmPurchase",
								"outputs" : [],
								"stateMutability" : "payable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmReceived",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"stateMutability" : "payable",
								"type" : "constructor"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "Aborted",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "ItemReceived",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "PurchaseConfirmed",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "refundSeller",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "SellerRefunded",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "buyer",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "seller",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "state",
								"outputs" : [ {
									"internalType" : "enum Purchase.State",
									"name" : "",
									"type" : "uint8"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "value",
								"outputs" : [ {
									"internalType" : "uint256",
									"name" : "",
									"type" : "uint256"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							} ];
					var contractAddress = "<%=addr%>";
					
					var contract = new web3.eth.Contract(
							abi, contractAddress, {
								from : "<%=_account%>"
							});
					
					web3.eth.personal.unlockAccount("<%=_account%>", $('#pwd').val(), 600).then(function(){
						alert('확정중입니다. 잠시만 기다려주세요!');

						contract.methods
								.confirmReceived().send({from : "<%=_account%>"})
								.then(function(receipt) {
									console.log(receipt);
								});
						});
					
					});
					
					
					$('#abort').click(function(){
						var abi = [
							{
								"inputs" : [],
								"name" : "abort",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmPurchase",
								"outputs" : [],
								"stateMutability" : "payable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmReceived",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"stateMutability" : "payable",
								"type" : "constructor"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "Aborted",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "ItemReceived",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "PurchaseConfirmed",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "refundSeller",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "SellerRefunded",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "buyer",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "seller",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "state",
								"outputs" : [ {
									"internalType" : "enum Purchase.State",
									"name" : "",
									"type" : "uint8"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "value",
								"outputs" : [ {
									"internalType" : "uint256",
									"name" : "",
									"type" : "uint256"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							} ];
					var contractAddress = "<%=addr%>";
					
					var contract = new web3.eth.Contract(
							abi, contractAddress, {
								from : "<%=_account%>"
							});
					web3.eth.personal.unlockAccount("<%=_account%>", $('#pwd').val(), 600).then(function(){
						alert('취소중입니다. 잠시만 기다려 주세요!');
						contract.methods
								.abort().send({from : "<%=_account%>"})
								.then(function(hash) {
									alert('취소되었습니다!');
								});
						});
					
					});

					$('#matching').click(function(){
						
						var abi = [
							{
								"inputs" : [],
								"name" : "abort",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmPurchase",
								"outputs" : [],
								"stateMutability" : "payable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "confirmReceived",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"inputs" : [],
								"stateMutability" : "payable",
								"type" : "constructor"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "Aborted",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "ItemReceived",
								"type" : "event"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "PurchaseConfirmed",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "refundSeller",
								"outputs" : [],
								"stateMutability" : "nonpayable",
								"type" : "function"
							},
							{
								"anonymous" : false,
								"inputs" : [],
								"name" : "SellerRefunded",
								"type" : "event"
							},
							{
								"inputs" : [],
								"name" : "buyer",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "seller",
								"outputs" : [ {
									"internalType" : "address payable",
									"name" : "",
									"type" : "address"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "state",
								"outputs" : [ {
									"internalType" : "enum Purchase.State",
									"name" : "",
									"type" : "uint8"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							},
							{
								"inputs" : [],
								"name" : "value",
								"outputs" : [ {
									"internalType" : "uint256",
									"name" : "",
									"type" : "uint256"
								} ],
								"stateMutability" : "view",
								"type" : "function"
							} ];
					var contractAddress = "<%=addr%>";
					
					var contract = new web3.eth.Contract(
							abi, contractAddress, {
								from : "<%=_account%>"
							});
					web3.eth.personal.unlockAccount("<%=_account%>", $('#pwd').val(), 600).then(function(){
						alert('매칭중입니다. 잠시만 기다려 주세요!');

					contract.methods
							.confirmPurchase()
							.send(
									{
										from : "<%=_account%>",
										value : web3.utils
												.toWei(
														"<%=point%>",
														'ether')
									})
							.then(function(receipt) {
								console.log(receipt);
								alert('매칭되었습니다!');
							});
					});
					
					});
				});
		</script>
