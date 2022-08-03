<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>업체 상세보기</title>
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

	<header>
		<%@ include file="../includes/TopBar.jsp"%>
	</header>

	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-xs-12 section-container-spacer">
				<h3>업체 목록</h3>
			</div>

			<section class="blog-details spad">
				<div class="container">
					<div class="row">
						<div class="blog__item__pic">
							<c:choose>
								<c:when test="${comInfo.cmimg == null }">
									<img alt=""
										style="width: 450px; height: 500px; padding-right: 30px; padding-left: 30px; margin-top: -50px; margin-left: 100px;"
										src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS011.png">
								</c:when>
								<c:otherwise>
									<img
										style="width: 450px; height: 250px; padding-right: 30px; padding-left: 30px; margin-top: 50px; margin-left: 80px;"
										src="${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/${comInfo.cmimg}"
										alt="">
								</c:otherwise>
							</c:choose>
						</div>

						<div style="margin-top: -150px; margin-left: 30px;">
							<h2
								style="text-align: center; margin-top: 30px; margin-left: -500px; font-weight: bold;">${comInfo.cmname}</h2>
							<div id="map2"
								style="width: 500px; height: 500px; margin-top: 35px;"></div>
							<h4 style="text-align: center;">${comInfo.cmtel}</h4>
							<h4 style="text-align: center; width: 500px;">${comInfo.cmaddress}</h4>
							<input id="address2" type="hidden" value="${comInfo.cmaddress}">
							<input id="cmname" type="hidden" value="${comInfo.cmname}">
						</div>
					</div>
				</div>
			</section>

			<section class="blog-details spad">
				<div class="container">
					<h2 style="text-align: center; padding-bottom: 30px;">[주력 상품]</h2>
					<div class="row">
						<c:forEach items="${proInfo }" var="pdList" begin="0" end="5">
							<div class="col-lg-4 col-md-4">
								<div class="blog__details__text" style="margin: 30px;">

									<img style="width: 200px; height: 150px; margin-left: 30px;"
										src="${pdList.pdimg }" alt="">

									<h5 style="font-weight: 100px;">${pdList.pdname }</h5>
									<h4>
										<fmt:formatNumber value="${pdList.pdprice}" pattern="#,###" />
										원
									</h4>
								</div>
								<div class="blog__details__content"></div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
		</div>
	</div>

	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
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
	<script
		src="${pageContext.request.contextPath }/resources/js/handmade.js"></script>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6853b687201d63e6a4e8bde66cfc718d&libraries=services"></script>
<script type="text/javascript">
	var address = $("#address2").val();
	address = address.split("_")[1];
	console.log(address);

	var cfname = $("#cmname").val();

	var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					address,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ cfname + '</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>
</html>