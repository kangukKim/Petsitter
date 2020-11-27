<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> 
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
				<h2 class="section-heading text-uppercase">게시글 등록하기</h2>
				<h3 class="section-subheading text-muted">저의 펫시터가 되어주세요.</h3>
			</div>
		</div>
	</section>

	<div class="container">
								<%
							UserDAO userDAO = new UserDAO();
							String _account = userDAO.getAccount(userID);

							%>

		<form name="register" action="registerAction.jsp" method="get">

			<table style="text-align: center; border: 1px solid #dddddd">

				<tbody>
					<tr>
						<td><input type="text" class="form-control"
							placeholder="글 제목" name="title" maxlength="50" /></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="포인트"
							name="request" id="request" maxlength="50" /></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="비밀번호"
							name="pwd" id="pwd" maxlength="50" /></td>
					</tr>
					<tr>
						<td><textarea class="form-control"
								placeholder="펫이름 /나이 /성별 /특이사항 /시터기한 /위치 등을 적어주세요."
								name="content" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>

					<tr>
						<td><input type="file" id="petImg" /></td>

					</tr>
				</tbody>
			</table>
		</form>

	</div>
	<button id="btn">등록</button>

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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="js/web3.min.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							console.log("ready!");

							if (typeof web3 !== 'undefined') {
								web3 = new Web3(web3.currentProvider);
							} else {
								// set the provider you want from Web3.providers
								web3 = new Web3(
										new Web3.providers.HttpProvider(
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
							var addr="<%=_account%>";
							$('#btn')
									.click(
											function() {
												var _Amount = $('#request')
														.val();
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
												var contractAddress = '';
												var _bin = "608060405233600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055503460008190555034600054146100c3576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260158152602001807f56616c75652068617320746f206265206576656e2e000000000000000000000081525060200191505060405180910390fd5b6109a8806100d26000396000f3fe60806040526004361061007b5760003560e01c806373fac6f01161004e57806373fac6f014610170578063c19d93fb14610187578063c7981b1b146101c0578063d6960697146101d75761007b565b806308551a531461008057806335a063b4146100d75780633fa4f245146100ee5780637150d8ae14610119575b600080fd5b34801561008c57600080fd5b506100956101e1565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156100e357600080fd5b506100ec610207565b005b3480156100fa57600080fd5b50610103610422565b6040518082815260200191505060405180910390f35b34801561012557600080fd5b5061012e610428565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561017c57600080fd5b5061018561044e565b005b34801561019357600080fd5b5061019c6105ff565b604051808260038111156101ac57fe5b60ff16815260200191505060405180910390f35b3480156101cc57600080fd5b506101d5610612565b005b6101df610832565b005b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16146102ca576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601a8152602001807f4f6e6c792073656c6c65722063616e2063616c6c20746869732e00000000000081525060200191505060405180910390fd5b60008060038111156102d857fe5b600260149054906101000a900460ff1660038111156102f357fe5b14610366576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252600e8152602001807f496e76616c69642073746174652e00000000000000000000000000000000000081525060200191505060405180910390fd5b7f72c874aeff0b183a56e2b79c71b46e1aed4dee5e09862134b8821ba2fddbf8bf60405160405180910390a16003600260146101000a81548160ff021916908360038111156103b157fe5b0217905550600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc479081150290604051600060405180830381858888f1935050505015801561041e573d6000803e3d6000fd5b5050565b60005481565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614610511576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004018080602001828103825260198152602001807f4f6e6c792062757965722063616e2063616c6c20746869732e0000000000000081525060200191505060405180910390fd5b600180600381111561051f57fe5b600260149054906101000a900460ff16600381111561053a57fe5b146105ad576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252600e8152602001807f496e76616c69642073746174652e00000000000000000000000000000000000081525060200191505060405180910390fd5b7fe89152acd703c9d8c7d28829d443260b411454d45394e7995815140c8cbcbcf760405160405180910390a160028060146101000a81548160ff021916908360038111156105f757fe5b021790555050565b600260149054906101000a900460ff1681565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16146106d5576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252601a8152602001807f4f6e6c792073656c6c65722063616e2063616c6c20746869732e00000000000081525060200191505060405180910390fd5b60028060038111156106e357fe5b600260149054906101000a900460ff1660038111156106fe57fe5b14610771576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252600e8152602001807f496e76616c69642073746174652e00000000000000000000000000000000000081525060200191505060405180910390fd5b7ffda69c32bcfdba840a167777906b173b607eb8b4d8853b97a80d26e613d858db60405160405180910390a16003600260146101000a81548160ff021916908360038111156107bc57fe5b0217905550600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc6000546002029081150290604051600060405180830381858888f1935050505015801561082e573d6000803e3d6000fd5b5050565b600080600381111561084057fe5b600260149054906101000a900460ff16600381111561085b57fe5b146108ce576040517f08c379a000000000000000000000000000000000000000000000000000000000815260040180806020018281038252600e8152602001807f496e76616c69642073746174652e00000000000000000000000000000000000081525060200191505060405180910390fd5b6000543414806108dd57600080fd5b7fd5d55c8a68912e9a110618df8d5e2e83b8d83211c57a8ddd1203df92885dc88160405160405180910390a133600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055506001600260146101000a81548160ff0219169083600381111561096957fe5b0217905550505056fea264697066735822122002a1217b7a8b20556d3fa3f05f0a1c939c08f3a50d793240a4582aafb0cb551064736f6c63430006060033";
												var greeterContract = new web3.eth.Contract(
														abi);

												 
													var object = {
														"from" : addr,
														"value" : web3.utils.toWei(
																_Amount, 'ether'),
													}
													alert('채굴중입니다. 잠시만 기다려 주세요!');

												web3.eth.personal.unlockAccount(addr, $('#pwd').val(), 600).then(function(){
												greeterContract
														.deploy({
															data : "0x" + _bin
														})
														.send(object)
														.then(
																function(
																		newContractInstance) {
																	contractAddress = newContractInstance.options.address;
																	var f = document.register;
																	var input_id = document.createElement("input");

																	input_id.setAttribute("type", "hidden");

																	input_id.setAttribute("name", "contract");      //name 속성 지정
																	input_id.setAttribute("value", contractAddress);        //value 값 설정

																	f.appendChild(input_id); 
																	f.submit();
																});
											});
											});

						});
	</script>
</body>


