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

.btn_none {
	border: none;
	background: #f5f5f5;
}

.imgClass {
	width: 300px;
	height: 300px;
	border-radius: 70%;
	overflow: hidden;
}

.reView {
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
									<div class="row"
										style="padding-bottom: 20px; text-align: center; margin-top: 50px;">
										<div class="col-2">
											<h5 style="font-weight: bold;">이미지</h5>
										</div>
										<div class="col-3">
											<h5 style="font-weight: bold;">제품</h5>
										</div>
										<div class="col-2">
											<h5 style="font-weight: bold;">가격</h5>
										</div>
										<div class="col-1">
											<h5 style="font-weight: bold;">수량</h5>
										</div>
										<div class="col-2">
											<h5 style="font-weight: bold;">총가격</h5>
										</div>
										<div class="col-1">
											<h5 style="font-weight: bold;">배 송<br>준 비</h5>
										</div>
										<div class="col-1">
											<h5 style="font-weight: bold;">주 문<br>취 소</h5>
										</div>
									</div>


								</div>

								<c:forEach items="${OrderList}" var="odList">
									
										<div class="row" style="text-align: center;">
											<div class="col-2">
												<img alt="" src="${odList.pdimg }">
											</div>
											<div class="col-3" style="margin-top: 60px;">
												<h5>${odList.pdname }</h5>
											</div>
											<div class="col-2" style="margin-top: 60px;">
												<h5>${odList.pdprice }</h5>
											</div>
											<div class="col-1" style="margin-top: 60px;">
												<h5>${odList.reamount }</h5>
											</div>
											<div class="col-2" style="margin-top: 60px;">
												<h5>${odList.reprice }</h5>
											</div>
											<c:choose>
												<c:when test="${odList.restate == 0}">
													<div class="col-1">
														<h5 style="font-size: 18px; margin-top: 60px;"
														>배 송<br>준 비</h5>
													</div>
												</c:when>
												<c:when test="${odList.restate == 2}">
													<div class="col-1">
														<h5>배송완료</h5>
														<button id="show" value="${odList.recode }">리뷰작성</button>	
													</div>
												</c:when>
												<c:when test="${odList.restate == 4}">
													<div class="col-1">
														<h5>배 송<br>완 료<hr></h5>
														<h6>리 뷰<br>작 성<br>완 료</h6>														
													</div>
												</c:when>
											</c:choose>
											<c:choose>
												<c:when test="${odList.restate == 0}">
														<div class="col-1">
													<form action="orderCancel" method="get">

															<button type="submit" name="recode"
															style="margin-top: 60px;
																value="${odList.recode}">주 문<br>취 소</button>
													</form>
														</div>
												</c:when>
												<c:when test="${odList.restate == 2}">
														<div class="col-1">
													<form action="orderCancel" method="get">

															<button type="submit" name="recode"
																value="${odList.recode}">환 불<br>요 청</button>
													</form>
														</div>
												</c:when>
												<c:otherwise>
													<div class="col-1">
														<h5 style="margin-top: 50px;">취 소<br>대 기</h5>
													</div>
												</c:otherwise>


											</c:choose>
										</div>
										<hr>
									
								</c:forEach>

								
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="back color-10 menu align-center expanded text-center SMN_effect-70">
								<a href="shopMain" class="primary-btn cart-btn" style="margin-left: -800px; color: black;">더 쇼핑하기</a> 
								<a href="orderhistory" 
								class="primary-btn cart-btn cart-btn-right"
								style="color: black;">
									새로고침</a>
							</div>
						</div>




					</div>
				</div>
				<!--</section>  -->
			</div>


		</div>
	</div>
	<div class="reView">
		<div class="window2">
			<form class="user" action="reViewInsert" method="post"
				enctype="multipart/form-data">
				<div class="popup2" id="modal">
					<div
						style="margin-left: 20px; margin-right: 400px; margin-top: 20px;">
						<label>회사명</label> <input type="text" id="cmname"
							style="border: none;" readonly="readonly" name="cmname"
							 class="form-control form-control-user">
					</div>
					<br>
					<div style="margin-left: 20px; margin-right: 400px;">
						<label>제품명</label> <input type="text" style="border: none;"
							readonly="readonly" id="pdname" name="pdname"
							
							class="form-control form-control-user">
							<input type="hidden" id="pdcode" name="pdcode">
							<input type="hidden" id="recode" name="recode">
					</div>
					<br>
					
						<div >
							<h5>
								리뷰내용 <br> <br>
								<textarea name="recomment" id="recomment"
									placeholder="내용을 입력해주세요.."></textarea>
							</h5>
						</div>
					
					<div>
						<input type="radio" name="rvrecommend" value="0">공개
						<input type="radio" name="rvrecommend" value="1">비공개
					</div>

					<button type="submit" id="save" class="btn text-white"
						style="background-color: #000000; margin-left: 20px;">리뷰작성</button>
					<button type="button" id="close" class="btn text-white"
						style="background-color: #000000; margin-left: 20px;">취소</button>
				</div>
			</form>
		</div>
	</div>

	<footer class="footer" style="margin-top: 200px;">
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
		var recode = document.getElementById("show").value;
		var output = "";
		console.log(recode);
		$.ajax({
			type : "get",
			url : "selectRecode",
			data : {"recode" : recode},
			dataType : "json",
			async : false,
			success : function(reCode){
				console.log(reCode);
				
				$("#cmname").val(reCode.cmname);
				$("#pdname").val(reCode.pdname);
				$("#pdcode").val(reCode.pdcode);
				$("#recode").val(reCode.recode);

			}
			
		});		
		
		document.querySelector(".reView").className = "reView show2";
	}

	function close() {
		document.querySelector(".reView").className = "reView";
	}

	document.querySelector("#show").addEventListener('click', show);
	document.querySelector("#close").addEventListener('click', close);
</script>

</html>