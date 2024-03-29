<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="width=device-width,initial-scale=1" name="viewport">
<meta content="description" name="description">
<meta name="google" content="notranslate" />
<meta content="Mashup templates have been developped by Orson.io team" name="author">
<!-- Disable tap highlight on IE -->
<meta name="msapplication-tap-highlight" content="no">
<title>업체목록 리스트</title>
<link href="${pageContext.request.contextPath }/resources/css/main.82cfd66e.css" rel="stylesheet">

<style type="text/css">
.hero__text2 h3 {
	text-transform: uppercase;
	font-weight: 700;
	letter-spacing: 4px;
	color: saddlebrown;
}
</style>
</head>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<!-- Css Styles -->
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
	<header>
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="hero__text2" style="margin-top: 30px; margin-bottom: 50px; margin-left: auto; margin-right: auto;">
				<h3>업 체 목 록</h3>
			</div>

			<div class="col-lg-12 col-md-12">
				<div class="row">
					<c:forEach items="${selestCompanyList}" var="comList">
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="blog__item">
								<c:choose>
									<c:when test="${comList.cmimg == null }">
										<div class="blog__item__pic">
											<a href="compnayInfo?cmcode=${comList.cmcode }">
												<img alt="" style="width: 200px; height: 200px; padding-right: 30px; padding-left: 30px; margin-left: 30px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS011.png">
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="blog__item__pic">
											<a href="compnayInfo?cmcode=${comList.cmcode }">
												<img alt="" style="width: 200px; height: 200px; padding-right: 30px; padding-left: 30px; margin-left: 30px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/${comList.cmimg.split('/')[1]}">
											</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="blog__item__text">
									<img class="img-responsive" alt="" src="./assets/images/img-12.jpg">
									<div class="item">
										<h2 style="text-align: center; margin-bottom: 30px;">
											<a href="compnayInfo?cmcode=${comList.cmcode }"> ${comList.cmname } </a>
										</h2>
										<h5>주소 : ${comList.cmaddress }</h5>
										<h5 style="text-align: center;">${comList.cmtel }</h5>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

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
						<a href="companyList?page=${pagedto.page - 1}">«</a>
					<li>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${pagedto.startPage }" end="${pagedto.endPage }" var="num" step="1">
				<c:choose>
					<c:when test="${pagedto.page == num }">
						<li>
							<a href="#">${num }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="companyList?page=${num}"> ${num } </a>
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
						<a href="companyList?page=${pagedto.page + 1}">»</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>

	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
</body>

</html>