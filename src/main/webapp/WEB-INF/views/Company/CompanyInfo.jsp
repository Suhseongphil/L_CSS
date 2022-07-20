<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width,initial-scale=1" name="viewport">
<meta content="description" name="description">
<meta name="google" content="notranslate" />
<meta content="Mashup templates have been developped by Orson.io team"
	name="author">
<title>Insert title here</title>
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

	<main class="" id="main-collapse">
		<%@ include file="../includes/TopBar.jsp"%>
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-xs-12 section-container-spacer">
				<h3>업체 목록</h3>
			</div>

			<section class="blog-details spad">
				<div class="container">
					<div class="row">

						<div class="col-lg-6 col-md-10 ">
							<div class="blog__item__pic">
								<c:choose>
									<c:when test="${comInfo.cmimg == null }">
										<img alt="" style="width: 600px; height: 500px; padding-right: 30px; padding-left: 30px; margin-top: -150px; margin-left: 100px;"
											src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS011.png">
									</c:when>
									<c:otherwise>
										<img style="width: 450px; height: 250px; padding-right: 30px; padding-left: 30px; margin-top: -50px; margin-left: 100px;"
											src="${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/${comInfo.cmimg}"
											alt="">
									</c:otherwise>

								</c:choose>
								
							</div>
							<div class="blog__details__content"></div>
						</div>
					</div>
				</div>
			</section>
			
			<section class="blog-details spad">
				<div class="container">
					<div class="row">
						<div style="margin-top: 100px;">
							<h5 style="text-align: center; margin-top: 30px;">${comInfo.cmname}</h5>
							<h5 style="text-align: center;">${comInfo.cmtel}</h5>
							<h5 style="text-align: center;">${comInfo.cmaddress}</h5>
						</div>
					</div>
				</div>
			</section>
			
			<section class="blog-details spad">
				<div class="container">
					<div class="row">
						<c:forEach items="${proInfo }" var="pdList" begin="0" end="5">
							<div class="col-lg-4 col-md-4">
								<div class="blog__details__text" style="margin: 30px;">

									<img style="width: 200px; height: 150px; margin-left: 30px;" src="${pdList.pdimg }" alt="">

									<h5 style="font-weight: 100px;">${pdList.pdname }</h5>
									<h5 style="text-align: center; margin-top: 10px;">${pdList.pdprice }원</h5>
								</div>
								<div class="blog__details__content"></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
</html>