<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html" />

<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">
<style type="text/css">
.cartBtn {
	background-color: #007bff;
	color: white;
	border-radius: 5px;
	border:none;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}

.cntBtn {
	border-radius: 3px;
	width: 30px;
	height: 29px;
	background-color: white;
	color: black;
	border: 1px solid grey;
	background-color: white;
}
</style>
</head>
<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<!-- Header Section End -->
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
		</div>
	</div>

	<section class="product-details spad">
		<div class="container">

			<div class="row">
				<div class="col2aa">
					<%@ include file="../includes/SideBar2.jsp"%>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large" src="${productInfo.pdimg }" alt="">
						</div>

					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="product__details__text">
						<h3>${productInfo.pdname }</h3>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i>
							<span>(리뷰수)</span>
						</div>
						<div class="product__details__price">
							<fmt:formatNumber value="${productInfo.pdprice}" pattern="#,###" />
							원
						</div>
						<div class="product__details__quantity">
							<div class="quantity">
								<div class="">
									수량 :
									<button class="cntBtn" onclick="minus()">-</button>
									<input id="amount" type="number" value="1" style="width: 30px; height: 29px;">
									<button class="cntBtn" onclick="plus()">+</button>
								</div>
							</div>
						</div>
						<button onclick="cartIn('${productInfo.pdcode}','${productInfo.pdcmcode}')" class="font-weight-bold cartBtn">장바구니담기</button>
						<ul>
							<li>
								<b>업체명</b>
								<span>${companyInfo.cmname }</span>
							</li>
							<li>
								<b>배송시간</b>
								<span>
									1~2일 소요
									<samp>&nbsp;&nbsp; 연중무휴</samp>
								</span>
							</li>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
</body>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script type="text/javascript">
	$(".submenu li a").click(function() {
		console.log($(this).text());
		var type = $(this).text();
		location.href = "searchType?type=" + type
	});
</script>
<script>
	$(document).ready(function() {
		//menu v2
		$(".menu-v2").mouseover(function() {
			$(this).children(".submenu").show(150);
		});
		$(".menu-v2").mouseleave(function() {
			$(this).children(".submenu").hide(150);
		});
	});
</script>

<script type="text/javascript">
	function plus() {
		var ctamount = $("#amount").val();
		ctamount = parseInt(ctamount) + 1;
		$("#amount").val(ctamount);
	}

	function minus() {
		var ctamount = $("#amount").val();
		if (ctamount > 1) {
			ctamount = parseInt(ctamount) - 1;
		}
		$("#amount").val(ctamount);
	}
</script>

<script type="text/javascript">
	function cartIn(pdcode, pdcmcode) {
		if(${empty sessionScope.loginId}){
			alert("로그인 후 이용 가능합니다.");
			return false;
		}
		var ctamount = $("#amount").val();
		location.href = "cartIn?ctmupdcode=" + pdcode + "&ctcfcmcode="
				+ pdcmcode + "&ctamount=" + ctamount;
	}
</script>


</html>