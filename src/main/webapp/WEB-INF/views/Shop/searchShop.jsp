<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품</title>
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#body-wrapper {
	min-height: 100%;
	position: relative;
}

#body-content {
	padding-bottom: 320px; /* footer의 높이 */
}

footer {
	width: 100%;
	height: 320px; /* footer의 높이 */
	position: absolute;
	bottom: 0;
	left: 0;
}
</style>
</head>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">

<body>
	<div id="body-wrapper">
		<div id="body-content">
			<header class="header">
				<%@ include file="../includes/TopBar.jsp"%>
			</header>
			<div class="container">
				<div class="row">
					<%@ include file="../includes/MiddleBar.jsp"%>
				</div>
			</div>
			<section>
				<%@ include file="../includes/SideBar2.jsp"%>
			</section>
			<section>
		<div class="container">
			<div class="row">
				<form action="searchProduct" method="get"
					style="margin-left: 400px; margin-top: -400px;">
					<div id="search" class="row">
						<div class="shoping__cart__btns">
							<select name="pdcategory" id="pdcategory">
								<option value="pdname">이름</option>
								<option value="pdtype">종류</option>
							</select> <input style="margin-left: 20px; padding: 7px;" type="text"
								placeholder="검색어 입력.." name="searchText">
							&nbsp;&nbsp;&nbsp;
							<button type="submit" class="primary-btn text-white"
								style="background-color: #000000; margin-left: -5px;">검색</button>
						</div>
					</div>
				</form>
				<h2
					style="margin-top: -300px; margin-left: 530px; font-weight: bold;">
					추천 상품<br> <br>
				</h2>
				<div class="product__discount__slider owl-carousel col-lg-9"
					style="margin-left: 200px; margin-top: -200px; margin-bottom: 200px;">
					<c:forEach items="${reverseList}" var="rePro" begin="0" end="20">
						<div class="col-lg-4">
							<div class="product__discount__item">
								<c:set var="imgCheck" value="${rePro.pdimg }" />
								<c:choose>
									<c:when test="${fn:substring(imgCheck,0,4) == 'http'}">
										<div class="product__discount__item__pic set-bg"
											data-setbg="${rePro.pdimg }"></div>
									</c:when>
									<c:otherwise>
										<div class="product__discount__item__pic set-bg"
											data-setbg="${pageContext.request.contextPath }/resources/fileUpLoad/ProductFile/${rePro.pdimg }"></div>
									</c:otherwise>
								</c:choose>
								<div class="product__discount__item__text">
									<a href="productInfo?pdcode=${rePro.pdcode}"> <span>${rePro.pdname}</span>
									</a>
									
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

			<section>
				<div class="row" style="margin-left: 400px; margin-right: 300px; margin-top: -50px;">
					<c:forEach items="${selectproductList}" var="pro">
						<div class="col-lg-3">
							<div class="product__discount__item">
								<c:set var="imgCheck" value="${pro.pdimg }" />
								<c:choose>
									<c:when test="${fn:substring(imgCheck,0,4) == 'http'}">
										<div class="product__discount__item__pic set-bg" data-setbg="${pro.pdimg }"></div>
									</c:when>
									<c:otherwise>
										<div class="product__discount__item__pic set-bg" data-setbg="${pageContext.request.contextPath }/resources/fileUpLoad/ProductFile/${pro.pdimg }"></div>
									</c:otherwise>
								</c:choose>
								<div class="product__discount__item__text">
									<a href="cartIn?ctmupdcode=${pro.pdcode }&ctcfcmcode=${pro.pdcmcode}&ctamount=1">
										<i class="fa fa-shopping-cart"></i>
									</a>
									<a href="productInfo?pdcode=${pro.pdcode}">
										<span>${pro.pdname}</span>
									</a>
									<h5>
										<a href="productInfo?pdcode=${pro.pdcode}">${pro.pdtype}</a>
									</h5>
									<div class="product__item__price">${pro.pdprice}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>

			<div>
				<ul class="ul3" style="margin-bottom: 30px; margin-top: 30px;">
					<c:choose>
						<c:when test="${pagedto.page <= 1 }">
							<li>
								<a href="#">« </a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="searchProduct?page=${pagedto.page - 1}&pdcategory=${sessionScope.searchpdcategory }&searchText=${sessionScope.searchText }">«</a>
							<li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${pagedto.startPage }" end="${pagedto.endPage }" var="num" step="1">
						<c:choose>
							<c:when test="${pagedto.page == num }">
								<li>
									<span class="pageNum">${num }</span>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="searchProduct?page=${num}&pdcategory=${sessionScope.searchpdcategory }&searchText=${sessionScope.searchText }"> ${num } </a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pagedto.page >= pagedto.maxPate }">
							<li>
								<a href="#">» </a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="searchProduct?page=${pagedto.page + 1}&pdcategory=${sessionScope.searchpdcategory }&searchText=${sessionScope.searchText }">»</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

			<footer class="footer">
				<%@ include file="../includes/FooterBar.jsp"%>
			</footer>

		</div>
	</div>
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
		location.href = "shopMain?pdtype=" + type
	});
</script>

<script>
	$(document).ready(function() {
		//menu v2
		$(".menu-v2").mouseover(function() {
			$(this).children(".submenu").show(200);
		});
		$(".menu-v2").mouseleave(function() {
			$(this).children(".submenu").hide(200);
		});

	});
</script>

</html>