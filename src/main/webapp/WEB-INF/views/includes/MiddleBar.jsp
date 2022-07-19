<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Edu+TAS+Beginner&family=Gowun+Batang:wght@700&family=Hahmlet:wght@700&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

</head>
<body>
	<div class="col-lg-3">
		<div class="header__logo" style="text-align: left;" id="text_ls">
			<h2>L&CSS</h2>
		</div>
	</div>
	<div class="col-lg-9">
		<nav class="header__menu2"
			style="vertical-align: middle; text-align: left;">
			<ul>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="active"><a href="main"> 메인</a></li>
				<li><a href="#">상품</a></li>
				<li><a href="#">카페</a>
					<ul class="header__menu__dropdown">
						<li><a href="cafeList">카페목록</a></li>
						<li><a href="#">추천 카페</a></li>
					</ul></li>
				<li><a href="#">업체</a>
					<ul class="header__menu__dropdown">
						<li><a href="companyList">업체목록</a></li>
						<li><a href="#">우수업체</a></li>
					</ul></li>
				<li><a href="./contact.html">공동구매</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>