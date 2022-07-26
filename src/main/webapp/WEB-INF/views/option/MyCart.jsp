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
										style="padding-bottom: 20px; text-align: center;">
										<div class="col-6">
											<h5>이름</h5>
										</div>
										<div class="col-2">
											<h5>가격</h5>
										</div>
										<div class="col-2">
											<h5>수량</h5>
										</div>
										<div class="col-2">
											<h5>총가격</h5>
										</div>
									</div>

									<div id="myCartList" class="item"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__btns">
								<a href="shopMain" class="primary-btn cart-btn">더 쇼핑하기</a> <a href="#"
									class="primary-btn cart-btn cart-btn-right"> 새로고침</a>
							</div>
						</div>
						<div id="checkOut" class="col-lg-6" style="margin-bottom: 350px;"></div>
					</div>
				</div>
				<!--</section>  -->
			</div>
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
	$(document).ready(function() {
		myCart();
	});

	function myCart() {
		$.ajax({
			type : "get",
			url : "myCart",
			dataType : "json",
			success : function(mycart) {
				console.log(mycart);
				cartPrint(mycart);
			}
		});
	}

	function cartPrint(mycart) {

		var totalPrice = 0;
		var maxPrice = 0;

		var output = "";
		for (var i = 0; i < mycart.length; i++) {

			//output += "<tr>"
			//output += "<td class=\"shoping__cart__item\">";
			output += "<div class=\"row px\">";
			output += "<div class=\"col-6\">"
			output += "<img style=\"width:100px;\" alt=\"\" src="+mycart[i].pdimg+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			output += "<h7>" + mycart[i].pdname
					+ "</h7>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";
			//output += "<td class=\"shoping__cart__price\">";
			output += "<div class=\"col-2 divpadding \">"
			output += "<h5>" + mycart[i].pdprice
					+ "원</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";

			//output += "<td class=\"shoping__cart__quantity\">";
			output += "<div class=\"col-2 divpadding\">"
			output += "<div id=\"amounList\" >";
			output += "<button class=\"but_css\" onclick=\"updateMinus('"
					+ mycart[i].ctcode + "','" + mycart[i].ctamount
					+ "')\">-</button>&nbsp;&nbsp;"
			output += "<input style=\"width:50px;\" id=\"conut\" type=\"text\" value="+mycart[i].ctamount+ ">&nbsp;&nbsp;";
			output += "<button class=\"but_css\" onclick=\"updatePlus('"
					+ mycart[i].ctcode + "','" + mycart[i].ctamount
					+ "')\">+</button>&nbsp;&nbsp;"
			output += "</div>";
			output += "</div>";
			//output += "</td>";

			//output += "<td class=\"shoping__cart__total\">";
			output += "<div class=\"col-2 divpadding\">"
			output += "<h5>"
					+ mycart[i].pdprice
					* mycart[i].ctamount
					+ "원 &nbsp;&nbsp;<input onclick=\"checkbox()\"  type=\"checkbox\" id=\"check\" name=\"check\" value=\"'"
					+ mycart[i].ctcode + "'\" ></h5>";

			output += "</div>";
			//output += "</td>";

			//output += "<td class=\"shoping__cart__item__close\">";
			//output += "</td>";
			//output += "</tr>"
			output += "</div>";
			totalPrice = mycart[i].cttotal;
			maxPrice = maxPrice + totalPrice;
		}

		$("#myCartList").html(output);
		var sumPrice = 0;
		console.log("호출2");
		var output2 = "";

		output2 += "<div class=\"shoping__checkout\">";
		output2 += "<h5>전체 가격</h5>";
		output2 += "<ul>";
		output2 += "<li>전체 금액 <span>" + maxPrice + "&nbsp;원</span>";
		output2 += "<li> 할인 금액 <span>0</span>";
		output2 += "</li>";
		output2 += "<li>결제 금액 <span>" + maxPrice + "&nbsp;원</span></li>";
		output2 += "</ul>";
		output2 += " <button class=\"btn_none\" onclick=\"kokopay()\"  type=\"submit\" ><img alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/kokopay.png\"></button>";
		output2 += "</div>";

		/* onclick=\"checkbox()\" */
		$("#checkOut").html(output2);

	}

	function updateMinus(ctcode, ctamount) {

		console.log("빼기")
		console.log(ctcode);
		console.log(ctamount);
		$.ajax({
			type : "get",
			url : "updateMinus",
			data : {
				"ctcode" : ctcode,
				"ctamount" : ctamount
			},
			dataType : "json",
			async : false,
			success : function(mycart) {
				console.log(mycart);
				myCart();
			}

		});

	}

	function updatePlus(ctcode, ctamount) {
		console.log("더하기")
		console.log(ctcode);
		console.log(ctamount);

		$.ajax({
			type : "get",
			url : "updatePlus",
			data : {
				"ctcode" : ctcode,
				"ctamount" : ctamount
			},
			dataType : "json",
			async : false,
			success : function(mycart) {
				console.log(mycart);
				myCart();
			}

		});
	}

	function checkbox() {

		var checkArr = [];
		$("input[name=check]:checked").each(function() {
			var chc = $(this).val();
			console.log(chc);
			checkArr.push(chc);
			console.log("배열" + checkArr[0]);
			console.log("배열" + checkArr[1]);
			/*
			$.ajax({
				type : "post",
				url : "paymentInsert",
				data : {"checkArr" : checkArr},
				dataType : "json",
				asyne : false,
				success : function(paymentInsert){
					console.log(paymentInsert)
				}
			});
			 */

		});
	}

	function kokopay() {
		console.log("카카오페이 테스트");
		$.ajax({

			url : "kokopayTest",
			dataType : "json",
			asyne : false,
			success : function(data) {

				var keydate = data.next_redirect_pc_url;

				window.open(keydate);

			}

		});

	}
</script>

</html>