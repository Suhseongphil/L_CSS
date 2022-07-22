<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 글작성</title>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
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

<style type="text/css">
.scroll {
	overflow: scroll;
	width: auto;
	height: 370px;
}

.row div {
	padding: 0;
}
</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>

	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<!-- Hero Section End -->

	<section class="featured spad">
		<div class="text-center">
			<h2>게시글 작성</h2>
		</div>
		<div class="container">
			<h3 style="text-align: center;">제품선택</h3>
			<div class="row">
				<div class="col-2"></div>
				<div class="col-2 font-weight-bold" id="pdtype">
					<div>상품(선택)</div>
					<c:forEach items="${productType}" var="pdtype">
						<div style="margin: 1px auto 1px;" onclick="selectType(this)">${pdtype}</div>
					</c:forEach>
				</div>
				<div class="col-7">
					<div class="font-weight-bold">제품이름(선택)</div>
					<div class="scroll" id="pdname"></div>
				</div>
				<div class="col-1"></div>
			</div>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<form action="">
						<div class="row">
							<div class="col-1">
								<span class="font-weight-bold">제목</span>
							</div>
							<div class="col-11">
								<input style="width: 100%;" type="text" name="gbtitle" placeholder="제목을 입력해주세요...">
							</div>
						</div>
						<div class="row">
							<div class="col-1">
								<span class="font-weight-bold">내용</span>
							</div>
							<div class="col-11">
								<textarea id="gbcomment" name="gbcomment" placeholder="내용을 입력해주세요..." rows="7" style="width: 100%; resize: none;"></textarea>
								<div id="text_cnt">글자수(0 / 500)</div>
							</div>
						</div>
						<div class="row">
							<div class="col-1">
								<span class="font-weight-bold">제품</span>
								<br>
								<span class="font-weight-bold">코드</span>
							</div>
							<div class="col-11">
								<span id="selProduct"></span>
								<br>
								<span id="selPdcode"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="col-3"></div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
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
							<li>
								<a href="#">팀장 : 서성필</a>
							</li>
							<li>
								<a href="#">엔지니어 : 송영오</a>
							</li>
							<li>
								<a href="#">엔지니어 : 천호태</a>
							</li>
							<li>
								<a href="#">엔지니어 : 이상윤</a>
							</li>

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
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/handmade.js"></script>
</body>
<script type="text/javascript">
	var checkMsg = '${msg}'
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#gbcomment').on('keyup', function() {
			$('#text_cnt').html("(" + $(this).val().length + " / 500)");

			if ($(this).val().length > 500) {
				$(this).val($(this).val().substring(0, 500));
				$('#text_cnt').html("(500 / 500)");
			}
		});
	});
</script>

<script type="text/javascript">
	function selectType(selObj) {

		$("#pdtype div").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "saddlebrown").css("color", "white");

		var pdtype = $(selObj).text();

		$
				.ajax({
					type : "get",
					url : "selectPdtype",
					dataType : "json",
					data : {
						"pdtype" : pdtype
					},
					success : function(product) {
						var output = "";
						for (var i = 0; i < product.length; i++) {
							output += "<div style=\"margin: 1px auto 1px;\" onclick=\"selectProduct(this,'"
									+ product[i].pdcode
									+ "')\">"
									+ product[i].pdname + "</div>";
						}
						$("#pdname").html(output);
					}
				});
	}

	function selectProduct(selObj, pdcode) {

		$("#pdname div").css("background-color", "").css("color", "");
		$(selObj).css("background-color", "saddlebrown").css("color", "white");

		$("#selProduct").text($(selObj).text());
		$("#selPdcode").text(pdcode);

	}
</script>
</html>