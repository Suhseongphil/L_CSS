<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width,initial-scale=1" name="viewport">
<meta content="description" name="description">
<meta name="google" content="notranslate" />
<meta content="Mashup templates have been developped by Orson.io team"
	name="author">

<!-- Disable tap highlight on IE -->
<meta name="msapplication-tap-highlight" content="no">

<title>Title page</title>

<link
	href="${pageContext.request.contextPath }/resources/css/main.82cfd66e.css"
	rel="stylesheet">
</head>
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
<!-- Css Styles -->
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

<body>
	<!-- Add your content of header -->
	<!--  
	<header class="">
		<div class="navbar navbar-default visible-xs">
			<button type="button" class="navbar-toggle collapsed">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="./index.html" class="navbar-brand">Mashup Template</a>
		</div>
		<nav class="sidebar">
			<div class="navbar-collapse" id="navbar-collapse"></div>
		</nav>
	</header>
	-->

	<main class="" id="main-collapse">
		<%@ include file="../includes/TopBar.jsp"%>
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-xs-12 section-container-spacer">
				<h3>카페 목록</h3>
			</div>

			<div class="col-lg-12 col-md-12">
				<div class="row">
					<c:forEach items="${selectCafeList}" var="cfList">
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="blog__item">
								<c:choose>
									<c:when test="${cfList.cfimg == null }">
										<div class="blog__item__pic">
											<img alt=""
												style="width: 200px; height: 200px; padding-right: 30px; padding-left: 30px;"
												src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS010.png">
										</div>
									</c:when>
									<c:otherwise>
										<div class="blog__item__pic">
											<img alt=""
												style="width: 200px; height: 200px; padding-right: 30px; padding-left: 30px;"
												src="${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/${cfList.cfimg.split('/')[1]}">
										</div>
									</c:otherwise>
								</c:choose>
								<div class="blog__item__text">
									<h2>${cfList.cfname }</h2>
									<p>주소 : ${cfList.cfaddress }</p>
									<p>${cfList.cftel }</p>
								</div>
							</div>
						</div>
					</c:forEach>

					<div style="font-size: 12px;">
						<c:choose>
							<c:when test="${pagedto.page <= 1 }">
       					[이전]
       				</c:when>
							<c:otherwise>
								<a href="cafeList?page=${pagedto.page - 1}">[이전]</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${pagedto.startPage }" end="${pagedto.endPage }"
							var="num" step="1">
							<c:choose>
								<c:when test="${pagedto.page == num }">
									<span style="font-size: 20px;">${num }</span>
								</c:when>
								<c:otherwise>
									<a href="cafeList?page=${num}"> ${num } </a>&nbsp;&nbsp;
       					</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pagedto.page >= pagedto.maxPate }">
       					[다음]
       				</c:when>
							<c:otherwise>
								<a href="cafeList?page=${pagedto.page + 1}">[다음]</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

	</main>

</body>

</html>