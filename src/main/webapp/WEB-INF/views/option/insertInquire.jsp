<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>고객문의 글 작성</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">

</head>
<style>
.but_css {
	height: 20px;
	width: 20px;
	border: none;
	font-size: 10;
	font-weight: 800;
	text-align: center;
}

.item display {
	display: flex;
	flex-direction: column;
}

.item {
	padding-bottom: 30px;
}

.px {
	padding-bottom: 30px;
}

.divpadding {
	padding-top: 36px;
}

textarea {
	width: 300px;
	height: 300px;
	border: none;
	resize: none;
	padding-bottom: 10px;
}

h5 {
	padding-bottom: 10px;
}
</style>

<body>
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">

		<div class="container">
			<div class="collapse navbar-collapse" id="navbar-menu"></div>
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
		</div>
	</header>

	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<form action="insertInquire" method="post" enctype="multipart/form-data">
					<div class="row">
						<div class="row">
							<div class="col-6">
									작성자 : ${sessionScope.loginId}
									<input type="hidden" id="iqmid" name="iqmid" value="${sessionScope.loginId}">
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<input type="text" id="iqtitle" name="iqtitle">
							</div>
						</div>
						<div class="row">
							<div class="col-4">
								<h5>카테고리</h5>
							</div>
							<div class="col-8">
								<select name="iqcategory" id="iqcategory">
									<option value="결제오류">결제오류</option>
									<option value="배송관련">배송관련</option>
									<option value="상품관련">상품관련</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-4">
								<h5>
									문의내용 <br> <br>
									<textarea name="iqcomment" id="iqcomment" placeholder="내용을 입력해주세요.."></textarea>
								</h5>
							</div>
						</div>
						<div class="row">
							<div class="col-4">
								<h5>
									첨부파일 :
									<input type="file" name="iqfile" id="iqdile">
								</h5>
							</div>
						</div>
						<button>작성하기</button>
					</div>
				</form>

			</div>
		</div>
	</div>
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>

	<!-- JS -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

</body>

</html>