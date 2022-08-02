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

<meta name="msapplication-tap-highlight" content="no">
<title>카페리스트 페이지</title>
<link href="${pageContext.request.contextPath }/resources/css/main.82cfd66e.css" rel="stylesheet">

<style type="text/css">
.hero__text2 h3 {
	text-align: center;
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
				<h3>카 페 목 록</h3>
			</div>

			지역검색 :
			<select style="float: right; height: 20%; width: 8%;" name="cfaddress" id="cfaddress" onchange="selectCheck()">

				<option value="선택">선택</option>
				<option value="1">전체</option>
				<option value="인천">인천</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="충남">충남</option>
				<option value="강원">강원</option>
				<option value="경북">경북</option>
				<option value="전남">전남</option>
				<option value="전북">전북</option>
			</select>

			<div class="col-lg-12 col-md-12">
				<div class="row">
					<c:forEach items="${addressSelect}" var="cfList">
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="blog__item">
								<c:choose>
									<c:when test="${cfList.cfimg == null }">
										<div class="blog__item__pic">
											<a href="cafeInfo?cfcode=${cfList.cfcode}">
												<img alt="" style="width: 200px; height: 200px; padding-right: 30px; padding-left: 30px; margin-left: 30px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS010.png">
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="blog__item__pic">
											<a href="cafeInfo?cfcode=${cfList.cfcode}">
												<img alt="" style="width: 200px; height: 200px; padding-right: 30px; padding-left: 30px; margin-left: 30px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/${cfList.cfimg.split('/')[1]}">
											</a>
										</div>
									</c:otherwise>
								</c:choose>
								<div class="blog__item__text">
									<h2 style="text-align: center;">
										<a href="cafeInfo?cfcode=${cfList.cfcode}"> ${cfList.cfname } </a>
									</h2>
									<h5>주소 : ${cfList.cfaddress }</h5>
									<h5 style="text-align: center;">${cfList.cftel }</h5>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div class="">
		<ul class="ul3" style="margin-bottom: 30px; margin-top: 30px;">
			<c:choose>
				<c:when test="${pagedto.page <= 1 }">
					<li>
						<a href="#">« </a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="cafeList?page=${pagedto.page - 1}">«</a>
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
							<a href="cafeList?page=${num}"> ${num } </a>
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
						<a href="cafeList?page=${pagedto.page + 1}">»</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>



</body>
<script type="text/javascript">
	function selectCheck() {
		var check = document.getElementById("cfaddress");
		var selectValue = check.options[check.selectedIndex].value;

		console.log(selectValue);
		if (selectValue == 1) {
			location.href = "cafeList"
		} else {

			location.href = "selectCheck?cfaddress=" + selectValue
		}

	}
</script>

</html>