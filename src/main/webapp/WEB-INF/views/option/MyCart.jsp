<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.hero__text2 h3 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: saddlebrown;
}
</style>

<body>
	<!-- Start Main Top -->

	<!-- End Main Top -->

	<!-- Start Main Top -->
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbar-menu"></div>
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
		</div>
	</header>


	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
		<div class="hero__text2" style="margin-top: 30px; margin-bottom: 10px; margin-left: auto; margin-right: auto;">
				<h3>장 바 구 니</h3>
			</div>
			<div class="row">
				<!--<section class="shoping-cart spad">  -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__table">

								
										<table class="type09" style="width: auto; margin-bottom: 30px; margin-top: 30px;">
											<thead>
												<tr>
													<th id="lsy2" style="width: 450px;">&nbsp;&nbsp;&nbsp;&nbsp;이미지</th>
													<th id="lsy2" style="width: 400px;">이름</th>
													<th id="lsy2" style="width: 300px;">가격</th>
													<th id="lsy2" style="width: 300px;">수량</th>
													<th id="lsy2" style="width: 250px;">총가격</th>
													<th id="lsy2" style="width: 80px;">취소</th>
												</tr>
											</thead>
											<tbody>
												
											</tbody>
										</table>

										<div id="myCartList" class="item" style="text-align: center;"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div
									class="back color-10 menu align-center expanded text-center SMN_effect-70"
									style="font-weight: bold;">
									<a href="shopMain" class="primary-btn text-white"
										style="margin-left: -800px; background-color: black;">더
										쇼핑하기</a> <a href="myCartPage" class="primary-btn text-white"
										style="background-color: black; float: right;"> 새로고침</a>
								</div>
							</div>
							<div id="checkOut" class="col-lg-4"
								style="margin-bottom: 100px; margin-left: 800px;"></div>
						</div>
					</div>
					<!--</section>  -->
				</div>
			</div>
	
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>

	<!-- JS -->
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
			output += "<div class=\"row \">";
			output += "<div class=\"col-2  \">"
			output += "<img style=\"width:100px;\" alt=\"\" src="+mycart[i].pdimg+">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			output += "</div>";
			output += "<div class=\"col-3  \">"
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
			output += "<h5>" + mycart[i].pdprice * mycart[i].ctamount
					+ "원</h5>";

			output += "</div>";
			output += "<div class=\"col-1 divpadding\">";
			output += "<h5><input onclick=\"checkbox()\"  type=\"checkbox\" id=\"check\" name=\"check\" value=\""
					+ mycart[i].ctcode + "\" ></h5>";
			output += "</div>";

			//output += "</td>";

			//output += "<td class=\"shoping__cart__item__close\">";
			//output += "</td>";
			//output += "</tr>"
			output += "</div>";
			totalPrice = mycart[i].pdprice * mycart[i].ctamount;
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

		$("input[name=check]:checked").each(function() {
			var chc = $(this).val();
			console.log(chc);

			$.ajax({
				type : "get",
				url : "deleteCart",
				data : {
					"ctcode" : chc
				},

				asyne : false,
				success : function(paymentInsert) {
					console.log(paymentInsert)
					myCart();
				}
			});

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