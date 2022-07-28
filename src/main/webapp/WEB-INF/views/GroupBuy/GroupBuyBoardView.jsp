<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

.bd_none {
	border: none;
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

.background3 {
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

.show {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
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
	height: 330px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.popup3 {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	box-shadow: 0 2px 7px rgba(0, 0, 0, 0.3);
	/* 임시 지정 */
	width: 600px;
	height: 420px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show .popup2 .show2 .popup3 {
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

.hero__text2 h3 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: saddlebrown;
}

.hero__text4 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: gray;
}

.chBtn {
	width: 100%;
	border: none;
	background-color: black;
	color: white;
	margin-bottom: 2px;
}

.chBtn2 {
	width: 48%;
	border: none;
	background-color: black;
	color: white;
	margin-bottom: 2px;
}
</style>
</head>

<body>
	<!-- Header Section Begin -->
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>
	<!-- Header Section End -->

	<!-- Hero Section Begin -->
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="hero__text2" style="margin-top: 30px; margin-bottom: 50px; margin-left: auto; margin-right: auto;">
				<h3>게시글 상세보기</h3>
			</div>
		</div>
	</div>
	<!-- Hero Section End -->
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div>
						<img alt="" src="${gbreserve.pdimg}" style="width: 100%;">
					</div>
					<div>
						<span>${gbreserve.pdname}</span>
					</div>
					<div>
						<span>
							<fmt:formatNumber value="${gbreserve.pdprice}" pattern="#,###" />
							원
							<input type="hidden" id="pdprice2" value="${gbreserve.pdprice}">
						</span>
					</div>
				</div>
				<div class="col-6">
					<div class="row" style="background-color: #f8f9fa; height: 500px; padding: 10px 10px;">
						<div class="col-2">
							<span class="font-weight-bold">작성자</span>
						</div>
						<div class="col-9">
							<span>${gbreserve.gbmid}</span>
						</div>
						<div class="col-2">
							<span class="font-weight-bold">제목</span>
						</div>
						<div class="col-9">
							<span>${gbreserve.gbtitle}</span>
						</div>
						<div class="col-2">
							<span class="font-weight-bold">내용</span>
						</div>
						<div class="col-9">
							<textarea class="bd_none" readonly="readonly" rows="7" style="width: 90%; resize: none;">${gbreserve.gbcomment}</textarea>
						</div>
						<div class="col-2">
							<span class="font-weight-bold">지역</span>
						</div>
						<div class="col-9">
							<span>${gbreserve.gbregion}</span>
						</div>
						<div class="col-2">
							<span class="font-weight-bold">기간</span>
						</div>
						<div class="col-9">
							<span>${gbreserve.gbsdate} ~ ${gbreserve.gbfdate}</span>
						</div>
					</div>
				</div>
				<div class="col-3">
					<c:if test="${gbreserve.gbmid == sessionScope.loginId }">
						<button class="chBtn2 font-weight-bold" id="show2">수정</button>
						<button class="chBtn2 font-weight-bold" onclick="deleteBoard('${gbreserve.gbcode}')">삭제</button>
					</c:if>
					<div class="text-center font-weight-bold">
						<span>참여자 목록 </span>
						<span>${fn:length(gbpeopleList)}명</span>
					</div>
					<div class="scroll">
						<c:forEach items="${gbpeopleList}" var="gpList">
							<div>
								<span>${gpList.gpmid}</span>
							</div>
						</c:forEach>
					</div>
					<div>
						<button class="chBtn font-weight-bold" id="show">공동구매 참여</button>
						<c:forEach items="${gbpeopleList}" var="gpList">
							<c:if test="${gpList.gpmid == sessionScope.loginId}">
								<button class="chBtn font-weight-bold" onclick="joinChatRoom('${gbreserve.gbcode}')">채팅방 입장</button>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col-12 hero__text4" style="margin-top: 30px;">
				<span>게시글 작성자 또한 '공동구매 참여'버튼으로 참여하여야 합니다.</span>
			</div>
		</div>
	<!-- Footer Section Begin -->
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
	<!-- Footer Section End -->

	<!-- 공동구매 참여 -->
	<div class="background2">
		<div class="window2">
			<form class="user" action="joinGroupBuy" method="get">
				<div class="popup2">
					<div class="text-center" style="margin-top: 15px; margin-bottom: 20px;">
						<h4 class="font-weight-bold">공동구매 참여</h4>
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

	<!-- 게시글 수정 -->
	<div class="background3">
		<div class="window2">
			<form class="user" action="modGroupBuy" method="get">
				<div class="popup3">
					<div class="text-center" style="margin-top: 15px; margin-bottom: 20px;">
						<h4 class="font-weight-bold">게시글 수정</h4>
						<input type="hidden" name="gbcode" value="${gbreserve.gbcode}">
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-1"></div>
						<div class="col-2">
							<span class="font-weight-bold">제목</span>
						</div>
						<div class="col-9">
							<input type="text" name="gbtitle" placeholder="제목을 입력해주세요..." style="width: 90%;" value="${gbreserve.gbtitle}">
						</div>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<div class="col-1"></div>
						<div class="col-2">
							<span class="font-weight-bold">내용</span>
						</div>
						<div class="col-9">
							<textarea id="gbcomment" name="gbcomment" placeholder="내용을 입력해주세요..." rows="7" style="width: 90%; resize: none;">${gbreserve.gbcomment}</textarea>
							<div id="text_cnt" style="margin-top: 5px;">글자수(0 / 500)</div>
						</div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-2">
							<span class="font-weight-bold">마감</span>
						</div>
						<div class="col-9">
							<input name="gbfdate" type="date" style="width: 30%;">
							<input id="fdate" type="hidden" value="${gbreserve.gbfdate}">
						</div>
					</div>
					<div class="text-center" style="margin-top: 20px;">
						<button type="submit" id="save" class="btn text-white" style="background-color: #000000; margin-left: 20px;">글 수정</button>
						<button type="button" id="close2" class="btn text-white" style="background-color: #000000; margin-left: 20px;">취소</button>
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
	// 공구참여
	function show() {
		if(${empty sessionScope.loginId}){
			alert("로그인후 사용이 가능합니다.");
			return false;
		}
		
		document.querySelector(".background2").className = "background2 show";
	}

	function close() {
		document.querySelector(".background2").className = "background2";
	}

	document.querySelector("#show").addEventListener('click', show);
	document.querySelector("#close").addEventListener('click', close);

	// 게시글 수정
	function show2() {
		document.querySelector(".background3").className = "background3 show2";
	}

	function close2() {
		document.querySelector(".background3").className = "background3";
	}

	document.querySelector("#show2").addEventListener('click', show2);
	document.querySelector("#close2").addEventListener('click', close2);

	// 공구 채팅방 이동
	function joinChatRoom(gbcode) {
		location.href = "chatRoom?gbcode=" + gbcode;
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
	$(document).ready(function() {
		$('#gpamount').on('change', function() {
			var amount = $(this).val();
			var pdprice = $("#pdprice2").val();

			$("#gpprice").val(amount * pdprice);

		});
		
		var fdate = $("#fdate").val().replaceAll("/","-");
		
		$("input[type=date]").val(fdate);

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