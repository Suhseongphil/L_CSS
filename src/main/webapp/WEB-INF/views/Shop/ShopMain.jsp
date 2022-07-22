<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/handmade.css"
	type="text/css">

<style>
.cate-box {
	max-width: 280px;
	border: 1px solid lightgray;
	padding: 20px;
}

.cate-box ul {
	padding-left: 25px;
}

.cate-box li {
	margin: 8px 0;
}

.cate-box a {
	color: gray;
}

.cate-box i {
	color: royalblue;
}

.cate-parent {
	display: flex;
	justify-content: space-between;
}

.cate-child {
	display: none;
}

.cate-btn {
	padding: 0 5px;
	
}

</style>

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
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 section-container-spacer"
					style="margin-top: -30px;">
					<div class="sidebar">
						<div class="sidebar__item" id="category">
							<h4>카테고리</h4>

							<ul>

								<li>
									<div class="cate-parent">음료</div>
									<ul class="cate-child">
										<li value="원두">원두</li>
										<li value="소스">소스</li>
										<li value="파우더">파우더</li>
									</ul>
								</li>
								<li>
									<div class="cate-parent">머신</div>
									<ul class="cate-child">
										<li value="그라인더">그라인더</li>
										<li value="커피머신">커피머신</li>
										<li value="제빙기">제빙기</li>
									</ul>
								</li>
								<li>
									<div class="cate-parent">컵</div>
									<ul class="cate-child">
										<li value="머그잔">머그잔</li>
										<li value="텀블러">텀블러</li>
									</ul>
								</li>
								<li>
									<div class="cate-parent">일화용품</div>
									<ul class="cate-child">
										<li value="아이스컵">아이스컵</li>
										<li value="스트로우">스트로우</li>
										<li value="종이컵">종이컵</li>
										<li value="컵홀더">컵홀더</li>
										<li value="냅킨">냅킨</li>
									</ul>
								</li>
								<li>
									<div class="cate-parent">가구</div>
									<ul class="cate-child">
										<li value="의자">의자</li>
										<li value="테이블">테이블</li>
									</ul>
								</li>
							</ul>
						</div>



					</div>
				</div>
			</div>
		</div>
	</section>

	<section >
		<div class="container" style="padding-left: 10px;">
			<div class="col-lg-7 col-md-3" style="margin-left: 250px;">
				<div class="product__discount">
					<div class="section-title product__discount__title"
						style="text-align: center; margin-top: -500px;">
						<h2>추천 상품</h2>
					</div>
					<div class="row">
						<div class="product__discount__slider owl-carousel">

							<c:forEach items="${selectPro}" var="pro">
								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="${pro.pdimg }"></div>
										<div class="product__discount__item__text">
											<a href="cartIn?pdcode=${pro.pdcode }&pdcmcode=${pro.pdcmcode}"> <i class="fa fa-shopping-cart"></i>
											</a> <span>${pro.pdname}</span>
											<h5>
												<a href="#">${pro.pdtype}</a>
											</h5>
											<div class="product__item__price">${pro.pdprice}</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 
		<div class="filter__item">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="filter__sort">
						<span>상품목록</span> <select>
							<option value="0">Default</option>
							<option value="0">Default</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="img/product/product-1.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="product__item__text">
						<h6>
							<a href="#">Crab Pool Security</a>
						</h6>
						<h5>$30.00</h5>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 col-sm-6">
				<div class="product__item">
					<div class="product__item__pic set-bg"
						data-setbg="img/product/product-2.jpg">
						<ul class="product__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
		<div class="product__pagination">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
				class="fa fa-long-arrow-right"></i></a>
		</div>
 -->

	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<h2>L&CSS</h2>
						</div>
						<ul>
							<li>회사주소: 인천일보아카데미</li>
							<li>전화번호: 032-111-1111</li>
							<li>이메일 : #</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>프로젝트</h6>
						<ul>
							<li><a href="#">팀장 : 서성필</a></li>
							<li><a href="#">엔지니어 : 송영오</a></li>
							<li><a href="#">엔지니어 : 천호태</a></li>
							<li><a href="#">엔지니어 : 이상윤</a></li>

						</ul>

					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">

						<a href="InquirePage">고객문의</a>



					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright"></div>
				</div>
			</div>
		</div>
	</footer>
</body>

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

<script type="text/javascript">
	function sauceCategory() {
		console.log('호출');
		var con = document.getElementById('sauce');
		console.log(con);
		if (con.style.display == 'block') {

			con.style.display = 'none';
		} else {
			con.style.display = 'block';
		}

	}
</script>
<script type="text/javascript">
	function tumblerCategoru() {
		console.log('호출');
		var con = document.getElementById('tumbler');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function furnitureCategoru() {
		console.log('호출');
		var con = document.getElementById('furniture');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>

<script type="text/javascript">
	function machineCategoru() {
		console.log('호출');
		var con = document.getElementById('machine');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function disposableCategoru() {
		console.log('호출');
		var con = document.getElementById('disposable');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>

<script type="text/javascript">
	function productCategory() {
		console.log('호출');
		var con = document.getElementById('productNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function cafeCategory() {
		console.log('호출');
		var con = document.getElementById('cafeNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function companyCategory() {
		console.log('호출');
		var con = document.getElementById('comNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>
<script type="text/javascript">
	function inquireCategory() {
		console.log('호출');
		var con = document.getElementById('inquireNone');
		console.log(con);
		if (con.style.display == 'none') {

			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}

	}
</script>

<script>
	$(document).ready(
			function() {
				var cateBtn = $("<a>").addClass("cate-btn").append(
						$("<i>").addClass("fas fa-caret-down")).attr("href",
						"javascript:void(0)").click(function() {
					$(this).parent().next().toggle();
					$(this).children("i").toggleClass("fa-rotate-180");
				});
				$(".cate-parent").append(cateBtn);
				$("#testColor").click(function() {
					$(".cate-parent, .cate-btn").toggleClass("color");
				});
			});
</script>
</html>