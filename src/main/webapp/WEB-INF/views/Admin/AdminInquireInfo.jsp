<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Site Metas -->
<title>관리자 문의 상세보기</title>
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

.center {
	text-align: center;
}

h7 {
	text-align: center;
}

.answer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.show2 {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.window2 {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup2 {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	/* 임시 지정 */
	width: 480px;
	height: 530px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
	border-radius: 10px;
}

.show2 .popup2 {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

label {
	font-weight: bold;
}

.hero__text2 p {
	font-weight: bold;
}

textarea {
	width: 300px;
	height: 300px;
	border: none;
	resize: none;
	padding-bottom: 10px;
}

.hero__text2 h3 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: saddlebrown;
}
</style>
<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<%@ include file="../includes/AdminMiddleBar.jsp"%>
			<div class="hero__text2" style="margin-top: 30px; margin-bottom: 30px; margin-left: auto; margin-right: auto;">
				<h3>고객문의 상세보기</h3>
			</div>
		</div>
	</div>
	<div class="container" style="margin-bottom: 10px;">
		<div class="row">
			<div class="col-3">
				<c:if test="${inquireInfo.iqimg != null }">
					<div class="text-center" style="border-top: 3px solid #036; padding: 5px 0px;">
						<img alt="" src="${pageContext.request.contextPath }/resources/fileUpLoad/InquireFile/${inquireInfo.iqimg}" style="width: 300px;">
					</div>
				</c:if>
			</div>
			<div class="col-6" style="border-top: 3px solid #036; border-bottom: 4px solid #036; padding: 5px 0px;">
				<div class="row">
					<div class="col-3">
						<span>작성자</span>
					</div>
					<div class="col-9">
						<input type="text" value="${inquireInfo.iqmid}" style="border: none;" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>제목</span>
					</div>
					<div class="col-9">
						<input type="text" value="${inquireInfo.iqtitle}" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>카테고리</span>
					</div>
					<div class="col-9">
						<input type="text" value="${inquireInfo.iqcategory}" style="border: none;">
					</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>작성일</span>
					</div>
					<div class="col-9">
						<input type="text" value="${inquireInfo.iqdate}" style="border: none;" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-3">
						<span>내용</span>
					</div>
					<div class="col-9">
						<textarea readonly>${inquireInfo.iqcomment}</textarea>
					</div>
				</div>
				<c:if test="${AnswerList == null}">
					<div class="text-center" style="margin-bottom: 10px;">
						<button class="inquireBtn" id="show">답변하기</button>
					</div>
				</c:if>
			</div>
			<div class="col-3">
				<c:if test="${AnswerList != null }">
					<div style="border-top: 3px solid #036; padding: 5px 0px;">
						<div class="row">
							<div class="col-3">
								<span>
									답변<br>내용
								</span>
							</div>
							<div class="col-9">
								<textarea readonly>${AnswerList.ancomment}</textarea>
							</div>
						</div>
						<div class="row">
							<div class="col-3">
								<span>작성일</span>
							</div>
							<div class="col-9">
								<input type="text" value="${AnswerList.andate}" style="border: none;" readonly>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="answer">
		<div class="window2">
			<form class="user" action="amindInsert" method="post" enctype="multipart/form-data">
				<div class="popup2" id="modal">
					<div>
						<h4 style="text-align: center; font-weight: 700; margin-top: 20px;">
							답변내용 <br> <br>
						</h4>
					</div>
					<div class="textcenter">
						<textarea style="border: 1px solid black; margin-left: 93px; margin-bottom: 20px;" name="ancomment" id="ancomment" placeholder="내용을 입력해주세요.."></textarea>
						<input type="hidden" name="iqcode" id="iqcode" value="${inquireInfo.iqcode}">
					</div>
					<button type="submit" id="save" class="btn text-white button btnPush btnLightBlue" title="Button push lightblue" style="background-color: #000000; margin-left: 93px;">작성</button>
					<button type="button" id="close" class="btn text-white button btnPush btnLightBlue" title="Button push lightblue" style="background-color: #000000; margin-left: 180px;">취소</button>
				</div>
			</form>
		</div>
	</div>
	<footer class="footer" style="margin-top: 100px;">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<!-- ALL JS FILES -->
</body>
<script type="text/javascript">
	var checkMsg = '${msg}'
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
<script type="text/javascript">
	function show() {
		document.querySelector(".answer").className = "answer show2";
	}
	function close() {
		document.querySelector(".answer").className = "answer";
	}
	document.querySelector("#show").addEventListener('click', show);
	document.querySelector("#close").addEventListener('click', close);
</script>
</html>