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
<title>고객문의 게시글</title>
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
textarea {
	width: 90%;
	height: 300px;
	resize: none;
	padding-bottom: 10px;
	border: solid 1px #e8e8e8;
	border-radius: 5px;
}

input {
	width: 90%;
	border: solid 1px #e8e8e8;
	border-radius: 5px;
}

.col-3 {
	text-align: center;
	font-weight: bold;
}

.hero__text2 h3 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: #036;
}

.row {
	margin-bottom: 10px;
}

.inquireBtn {
	font-weight: bold;
	border: solid 1px #e8e8e8;
	border-radius: 5px;
	width: 30%;
}
</style>

<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="hero__text2" style="margin-top: 30px; margin-bottom: 30px; margin-left: auto; margin-right: auto;">
				<h3>고객문의 상세보기</h3>
			</div>
		</div>
	</div>

	<div class="container" style="margin-bottom: 10px;">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6" style="border-top: 3px solid #036; border-bottom: 4px solid #036; padding: 5px 0px;">
				<form action="insertInquire" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck();">
					<div class="row">
						<div class="col-3">
							<span>작성자</span>
						</div>
						<div class="col-9">
							<input type="text" name="iqmid" value="${inquireInfo.iqmid}">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span>제목</span>
						</div>
						<div class="col-9">
							<input type="text" id="iqtitle" name="iqtitle" value="${inquireInfo.iqtitle}">
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span>카테고리</span>
						</div>
						<div class="col-9">
							<select name="iqcategory" id="iqcategory">
								<option value="결제오류">결제오류</option>
								<option value="배송관련">배송관련</option>
								<option value="상품관련">상품관련</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span>내용</span>
						</div>
						<div class="col-9">
							<textarea id="iqcomment" name="iqcomment" placeholder="내용을 입력해주세요.."></textarea>
							<div id="text_cnt">글자수(0 / 200)</div>
						</div>
					</div>
					<div class="row">
						<div class="col-3">
							<span>첨부파일</span>
						</div>
						<div>
							<input type="file" name="iqfile">
						</div>
					</div>
					<div class="text-center" style="margin-bottom: 10px;">
						<button class="inquireBtn">작성하기</button>
					</div>
				</form>
			</div>
			<div class="col-3"></div>
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