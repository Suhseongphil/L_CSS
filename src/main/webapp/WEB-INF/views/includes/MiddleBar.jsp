<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Edu+TAS+Beginner&family=Gowun+Batang:wght@700&family=Hahmlet:wght@700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style type="text/css">

.header__logo a:hover {
 color: saddlebrown;
}
</style>
</head>
<body>
	<div class="col-lg-3">
		<div class="header__logo" style="text-align: left;" id="text_ls">
			<h2>
				<a href="main" style="font-size: 36px; font-style: oblique; font-weight: bold; font-family: text_ls;"> L&CSS </a>
			</h2>
		</div>
	</div>

	<div class="col-lg-9">
		<nav class="header__menu2" style="padding-left: 50px; margin-top: 10px;">
			<ul>
				<li class="active">
					<a href="main">메인</a>
				</li>
				<li>
					<a href="shopMain">상품</a>
				</li>
				<c:choose>
					<c:when test="${sessionScope.loginState == 1 }">
						<li>
							<a>카페</a>
							<ul class="header__menu__dropdown">
								<li>
									<a href="mycafeInsert">내 카페등록</a>
								</li>
								<li>
									<a href="mycafeInfo">내 카페정보</a>
								</li>
								<li>
									<a href="mycafeMenu">메뉴등록</a>
								</li>
								<li>
									<a href="cafeList">카페목록</a>
								</li>
							</ul>
						</li>
						<li>
							<a>업체</a>
							<ul class="header__menu__dropdown">
								<li>
									<a href="companyList">업체목록</a>
								</li>
							</ul>
						</li>
					</c:when>
					<c:when test="${sessionScope.loginState == 2 }">
						<li>
							<a>카페</a>
							<ul class="header__menu__dropdown">
								<li>
									<a href="cafeList">카페목록</a>
								</li>
							</ul>
						</li>
						<li>
							<a>업체</a>
							<ul class="header__menu__dropdown">
								<li>
									<a href="MycompanyInsert">내 업체등록</a>
								</li>
								<li>
									<a href="mycompanyInfo">내 업체정보</a>
								</li>
								<li>
									<a href="myProduct">상품등록</a>
								</li>
								<li>
									<a href="orderList">주문목록</a>
								</li>
								<li>
									<a href="companyList">업체목록</a>
								</li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a>카페</a>
							<ul class="header__menu__dropdown">
								<li>
									<a href="cafeList">카페목록</a>
								</li>
							</ul>
						</li>
						<li>
							<a>업체</a>
							<ul class="header__menu__dropdown">
								<li>
									<a href="companyList">업체목록</a>
								</li>
							</ul>
						</li>
					</c:otherwise>
				</c:choose>
				<li>
					<a href="groupBuyBoard">공동구매</a>
				</li>
			</ul>
		</nav>
	</div>
</body>
</html>