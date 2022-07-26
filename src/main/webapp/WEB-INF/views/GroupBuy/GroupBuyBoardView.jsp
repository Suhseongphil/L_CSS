<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 글 상세보기</title>
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
	height: 200px;
}

.row {
	margin-bottom: 3px;
}

.row div {
	padding: 0;
}

input {
	width: 90%;
}

.bd_none {
	border: none;
}

.hero__text2 p {
	font-weight: bold;
}

.background2 {
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
	width: 600px;
	height: 300px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show2 .popup2 {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

label {
	font-weight: bold;
}

.imgsize {
	width: 200px;
	height: 200px;
	object-fit: cover;
}

.imgclass {
	width: 300px;
	height: 300px;
	object-fit: cover;
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
			<h2>게시글 상세보기</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div class="row">
						<div class="col-12">
							<img alt="" src="${gbreserve.pdimg}">
						</div>
					</div>
					<div class="row">
						<div class="col-2 font-weight-bold">
							<span>제품</span>
						</div>
						<div class="col-10">
							<span>${gbreserve.pdname}</span>
						</div>
					</div>
					<div class="row">
						<div class="col-2 font-weight-bold">
							<span>가격</span>
						</div>
						<div class="col-10">
							<span>
								<fmt:formatNumber value="${gbreserve.pdprice}" pattern="#,###" />
								원
								<input type="hidden" id="pdprice2" value="${gbreserve.pdprice}">
							</span>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
				<div class="col-6">
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">작성자</span>
						</div>
						<div class="col-7">
							<input type="text" value="${gbreserve.gbmid}" class="bd_none" readonly="readonly">
						</div>
						<div class="col-2">
							<c:if test="${gbreserve.gbmid == sessionScope.loginId }">
								<button>수정</button>
								<button onclick="deleteBoard('${gbreserve.gbcode}')">삭제</button>
							</c:if>

						</div>
						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">제목</span>
						</div>
						<div class="col-11">
							<input type="text" name="gbtitle" value="${gbreserve.gbtitle}" class="bd_none" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">내용</span>
						</div>
						<div class="col-11">
							<textarea id="gbcomment" name="gbcomment" class="bd_none" readonly="readonly" rows="7" style="width: 90%; resize: none;">${gbreserve.gbcomment}</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">지역</span>
						</div>
						<div class="col-11">
							<input name="gbregion" class="bd_none" readonly="readonly" type="text" value="${gbreserve.gbregion}">
						</div>
					</div>
					<div class="row">
						<div class="col-1">
							<span class="font-weight-bold">기간</span>
						</div>
						<div class="col-11">
							<input name="gbfdate" type="text" class="bd_none" readonly="readonly" value="${gbreserve.gbsdate} ~ ${gbreserve.gbfdate}">
						</div>
					</div>
				</div>
				<div class="col-2">
					<div class="text-center font-weight-bold" style="background-color: grey;">
						<span>참여자 목록 </span>
						<span>${gbCnt}명</span>
					</div>
					<div class="scroll" style="border: 1px solid black;">
						<c:forEach items="${gbpeopleList}" var="gpList">
							<div>
								<span>${gpList.gpmid}</span>
							</div>
						</c:forEach>
					</div>
					<div>
						<c:set var="loop_flag" value="false" />
						<c:forEach items="${gbpeopleList}" var="gpList">
							<c:if test="${gpList.gpmid == sessionScope.loginId}">
								<a href="chatRoom?gbcode=${gbreserve.gbcode}">채팅방 참여(버튼)</a>
							</c:if>
							<c:if test="${not loop_flag }">
								<c:if test="${gpList.gpmid != sessionScope.loginId}">
									<button id="show">공동구매 참여</button>
									<c:set var="loop_flag" value="true"/>
								</c:if>
							</c:if>
						</c:forEach>
					</div>
					<div>
						<span>게시글 작성자 또한 '공동구매 참여'버튼으로 참여하여야 합니다.</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
	<!-- Footer Section End -->
	<!-- 모달 -->
	<div class="background2">
		<div class="window2">
			<form class="user" action="joinGroupBuy" method="get">
				<div class="popup2">
					<div class="text-center" style="margin-top: 3px;">
						<label>공동구매 참여</label>
						<input type="hidden" name="gpmid" value="${sessionScope.loginId}">
					</div>
					<div class="row form-group" style="margin-left: 2px;">
						<div class="col-5 form-group" style="margin-left: 20px;">
							<label>제품 이름</label>
							<br>
							<span>${gbreserve.pdname}</span>
							<br>
							<input type="hidden" name="gpgbcode" value="${gbreserve.gbcode}">
						</div>
						<br>
						<div class="col-5 form-group" style="margin-left: 20px;">
							<label>제품 가격</label>
							<br>
							<span>
								<fmt:formatNumber value="${gbreserve.pdprice}" pattern="#,###" />
								원
							</span>
						</div>
					</div>
					<div class="row form-group" style="margin-left: 2px;">
						<div class="col-5 form-group" style="margin-left: 20px;">
							<label>구매할 개수</label>
							<input type="number" id="gpamount" name="gpamount" placeholder="숫자를 입력해주세요">
						</div>
						<br>
						<div class="col-5 form-group" style="margin-left: 20px;">
							<label>총 가격</label>
							<input type="text" name="gpprice" id="gpprice" readonly="readonly">
						</div>
					</div>
					<div class="text-center">
						<button type="submit" id="save" class="btn text-white" style="background-color: #000000; margin-left: 20px;">공동구매참여</button>
						<button type="button" id="close" class="btn text-white" style="background-color: #000000; margin-left: 20px;">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>

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

<script>
	function show() {
		document.querySelector(".background2").className = "background2 show2";
	}

	function close() {
		document.querySelector(".background2").className = "background2";
	}

	document.querySelector("#show").addEventListener('click', show);
	document.querySelector("#close").addEventListener('click', close);
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#gpamount').on('change', function() {
			var amount = $(this).val();
			var pdprice = $("#pdprice2").val();

			$("#gpprice").val(amount * pdprice);

		});
	});
</script>

<script type="text/javascript">
	function deleteBoard(gbcode) {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href = "deleteBoard?gbcode=" + gbcode;
		} else { //취소
			return false;
		}
	}
</script>

</html>