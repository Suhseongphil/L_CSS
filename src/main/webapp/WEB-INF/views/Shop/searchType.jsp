<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html" />

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
	<section>
		<%@ include file="../includes/SideBar2.jsp"%>
	</section>

	<section>

		<div class="container" style="padding-left: 80px;">
			<div class="col-lg-7 col-md-3" style="margin-left: 250px;">
				<div class="product__discount">
					<div class="section-title product__discount__title"
						style="text-align: center; margin-top: -400px;">
						<form action="searchProduct" method="get">
							<div id="search" class="row">
								<div class="col-lg-12" style="margin-top: 100px;">
									<div class="shoping__cart__btns"
										style="margin-left: 250px; margin-top: -70px;">
										<select name="pdcategory" id="pdcategory">
											<option value="pdname">이름</option>
											<option value="pdtype">종류</option>

										</select> <input style="margin-left: -400px; padding: 7px;" type="text"
											placeholder="검색어 입력.." name="searchText">&nbsp;&nbsp;&nbsp;
										<button type="submit" style="margin-left: -5px;">검색</button>

									</div>
								</div>

							</div>
						</form>
						<h2 style="margin-top: 100px;">추천 상품</h2>
					</div>
					<div class="row">
						<div class="row">

							<c:forEach items="${searchType}" var="pro">
								<div class="col-lg-4">
									<div class="product__discount__item">
										<div class="product__discount__item__pic set-bg"
											data-setbg="${pro.pdimg }"></div>
										<div class="product__discount__item__text">
											<a
												href="cartIn?pdcode=${pro.pdcode }&pdcmcode=${pro.pdcmcode}">
												<i class="fa fa-shopping-cart"></i>
											</a> <span>${pro.pdname}</span>
											<h5>
												<a href="productInfo?pdcode=${pro.pdcode}">${pro.pdtype}</a>
											</h5>
											<div class="product__item__price">${pro.pdprice}원</div>
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

	<section>

		<div
			style="font-size: 16px; margin-left: 600px; margin-bottom: 30px; margin-top: 30px;">

			<c:choose>
				<c:when test="${pagedto.page <= 1 }">
                      [이전]
                         </c:when>
				<c:otherwise>
					<a href="searchType?page=${pagedto.page - 1}">[이전]</a>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${pagedto.startPage }" end="${pagedto.endPage }"
				var="num" step="1">
				<c:choose>
					<c:when test="${pagedto.page == num }">
						<span style="font-size: 20px;">${num }</span>
					</c:when>
					<c:otherwise>
						<a href="searchType?page=${num}"> ${num } </a>&nbsp;&nbsp;
                      </c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pagedto.page >= pagedto.maxPate }">
                      [다음]
                   </c:when>
				<c:otherwise>
					<a href="searchType?page=${pagedto.page + 1}">[다음]</a>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
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


</html>