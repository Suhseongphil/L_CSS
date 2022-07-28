<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/handmade.css"
	type="text/css">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
.but_css {
	height: 20px;
	width: 20px;
	border: none;
	font-size: 10;
	font-weight: 800;
	text-align: center;
}

.item display {
	display: flex;
	flex-direction: column;
}

.item {
	padding-bottom: 30px;
}

.px {
	padding-bottom: 30px;
}

.divpadding {
	padding-top: 36px;
}

.center {
	text-align: center;
}

h7 {
	text-align: center;
}

.answer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.show2 {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.window2 {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup2 {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	/* 임시 지정 */
	width: 520px;
	height: 630px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show2 .popup2 {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

label {
	font-weight: bold;
}

.hero__text2 p {
	font-weight: bold;
}

textarea {
	width: 300px;
	height: 300px;
	border: none;
	resize: none;
	padding-bottom: 10px;
}
</style>


<body>
	<!-- Start Main Top -->

	<!-- End Main Top -->

	<!-- Start Main Top -->
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<!-- Start Navigation -->

		<div class="container">
			<!-- Start Header Navigation -->

			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu"></div>
			<!-- /.navbar-collapse -->

			<!-- Start Atribute Navigation -->
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
			<!-- End Atribute Navigation -->
		</div>
		<!-- Start Side Menu -->

		<!-- End Side Menu -->

		<!-- End Navigation -->
	</header>


	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">


				<!--<section class="shoping-cart spad">  -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__table">

								<div class="item display" style="padding-top: 30px;">
									<table class="type09">
									<c:forEach items="${inquireInfo }" var="iqList">
									<thead>
									<tr>
									<th scope="cols">제목</th>
									<th scope="cols">작성자</th>
									<th scope="cols">카테고리</th>
									</tr>
									</thead>
									<tbody>
									<tr><th>${iqList.iqtitle }</th>
									<th>${iqList.iqmid }</th>
									<th>${iqList.iqcategory }</th></tr>
									</tbody>
									</c:forEach>
									</table>
													
									<table class="type09">
									<c:forEach items="${inquireInfo }" var="iqList">
									<thead>
									<tr>
									<th scope="cols">문의내용</th>
									</tr>
									<tbody>
									<tr><td>${iqList.iqcomment }</td></tr>
									</tbody>
								<button value="${iqList.iqcode }"
									 id="show" class="primary-btn cart-btn cart-btn-sright" style="padding-bottom: 10px; background-color: #000000;">
									답변작성</button>
									</c:forEach>
									</table>	
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

							</div>
						</div>

	
	<div class="answer">
		<div class="window2">
			<form class="user" action="amindInsert" method="post"
				enctype="multipart/form-data">
				<div class="popup2" id="modal">

					<div>
						<h5>
							답변내용 <br> <br>
							<textarea name="ancomment" id="ancomment"
								placeholder="내용을 입력해주세요.."></textarea>
						<input type="hidden" name="iqcode" id="iqcode" value="0">
						</h5>
					</div>

					<div>
						<input type="radio" name="ancommend" value="0">공개 <input
							type="radio" name="ancommend" value="1">비공개
					</div>

					<button type="submit" id="save"
						class="btn text-white button btnPush btnLightBlue"
						title="Button push lightblue"
						style="background-color: #000000; margin-left: 20px;">답변작성</button>
					<button type="button" id="close"
						class="btn text-white button btnPush btnLightBlue"
						title="Button push lightblue"
						style="background-color: #000000; margin-left: 20px;">취소</button>
				</div>
			</form>
		</div>
	</div>
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
	<!-- End Cart -->

	<!-- Start Instagram Feed  -->

	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->

	<!-- End Footer  -->

	<!-- Start copyright  -->

	<!-- End copyright  -->


	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<!-- ALL JS FILES -->

</body>
<script type="text/javascript">
	var checkMsg = '${msg}'
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
<script type="text/javascript">
	function show() {
		var iqcode = document.getElementById("show").value;
		
		console.log(iqcode);
		
		$.ajax({
			type : "get",
			url : "selectIqcode",
			data : {"iqcode" : iqcode},
			dataType : "json",
			async : false,
			success : function(insertResult){
				console.log(insertResult);
				$("#iqcode").val(insertResult.iqcode);
			}
			
	});
		document.querySelector(".answer").className = "answer show2";
	}

	function close() {
		document.querySelector(".answer").className = "answer";
	}

	document.querySelector("#show").addEventListener('click', show);
	document.querySelector("#close").addEventListener('click', close);
</script>
</html>