<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 게시판</title>
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
	height: 450px;
}

.scroll div {
	padding: 2px 2px;
}

.chatting {
	background-color: #ffc107;
	padding: 3px;
	margin: 4px 10px;
	border-radius: 5px 5px;
}

.chatting2 {
	background-color: white;
	padding: 3px;
	margin: 4px 10px;
	border-radius: 5px 5px;
}

.chatBtn {
	background-color: #ffc107;
	border: none;
}

.recev{
	margin: 4px 10px;
	font-size:4px;
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
			<h2>공동구매 채팅방</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-3" style="height: 500px;">
					<div class="text-center font-weight-bold">
						<span>제품</span>
					</div>
					<div>
						<img alt="" src="${gbreserve.pdimg}">
					</div>
					<div>
						<span>${gbreserve.pdname}</span>
					</div>
					<div>
						<span>
							<fmt:formatNumber value="${gbreserve.pdprice}" pattern="#,###" />
							원
						</span>
					</div>
				</div>

				<div class="col-6" style="height: 500px;">
					<div class="scroll" id="chatRoom" style="height: 450px; background-color: #9bbbd4;">
						<c:forEach items="${chattingLog}" var="chLog">
							<c:choose>
								<c:when test="${chLog.chmid == sessionScope.loginId }">
									<div class="font-weight-bold text-right">
									<c:set var="chdate_split" value="${fn:split(chLog.chdate,' ')[1]}"></c:set>
									<span class="font-weight-lighter" style="font-size:4px; color:white;">${fn:substring(chdate_split,0,5)}</span>
										<span class="chatting">${chLog.chcomment}</span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="text-left">
										<span class="recev">${chLog.chmid}</span>
										<br>
										<c:set var="chdate_split" value="${fn:split(chLog.chdate,' ')[1]}"></c:set>
										<span class="chatting2 font-weight-bold">${chLog.chcomment}</span><span class="font-weight-lighter" style="font-size:4px; color:white;">${fn:substring(chdate_split,0,5)}</span>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<div class="text-center" style="background-color: #f8f9fa; padding: 5px 5px;">
						<input style="width: 84%;" type="text" id="inputChat" placeholder="내용을 입력해주세요....">
						<button id="chatBtn" class="chatBtn" style="width: 13%;" onclick="chattingRoad('${gbreserve.gbcode}')">전송</button>
					</div>
				</div>

				<div class="col-3" style="height: 500px;">
					<div class="text-center font-weight-bold">
						<span>참여자 목록 </span>
						<span>${gbCnt}명</span>
					</div>
					<div class="scroll">
						<c:forEach items="${gbpeopleList}" var="gpList">
							<div>
								<span>${gpList.gpmid}</span>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section Begin -->
	<footer class="footer" style="margin-top: 200px;">
		<%@ include file="../includes/FooterBar.jsp"%>
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
		$("#chatRoom").scrollTop($("#chatRoom")[0].scrollHeight);
		$("#inputChat").focus();

		$("#inputChat").keyup(function(e) {
			if (e.keyCode == 13)
				$("#chatBtn").click();
		});
	});
</script>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
	var url = '${pageContext.request.contextPath }/chattingRoom';
	console.log(url);

	var sock = new SockJS(url);
	sock.onopen = function() {
		console.log('open');

	};

	sock.onmessage = function(e) {
		console.log('message', e.data);

		var receiveData = JSON.parse(e.data);
		console.log(receiveData);

		consol.log(receiveData.chdate);

		var output = "<div class=\"text-left\">";
		output += "<span class=\"text-gray-700\">" + receiveData.chmid
				+ "</span><br>";
		output += "<span class=\"chatting2 font-weight-bold\">"
				+ receiveData.chcomment + "</span></div>";

		$("#chatRoom").append(output);

	};

	sock.onclose = function() {
		console.log('close');
	};
</script>

<script type="text/javascript">
	function chattingRoad(gbcode) {

		var username = "${sessionScope.loginId}";
		var comment = $("#inputChat").val();

		var time = new Date();
		var hours = time.getHours();
		var minutes = time.getMinutes();
		var thisTime = hours + ":" + minutes;

		if (comment.length > 0) {
			$("#inputChat").val("");

			var msgData = {
				"chmid" : username,
				"chcomment" : comment,
				"chgbcode" : gbcode
			};
			sock.send(JSON.stringify(msgData));

			var output = "<div class=\"font-weight-bold text-right\">";
			output += "<span class=\"font-weight-lighter\" style=\"font-size:4px;\">"+thisTime+"</span><span class=\"chatting\">" + comment + "</span></div>";

			$("#chatRoom").append(output);
			$("#chatRoom").scrollTop($("#chatRoom")[0].scrollHeight);
		}
		$("#inputChat").focus();
	}
</script>
</html>