<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>고객센터</title>
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

.hero__text2 h3 {
	text-align: center;
	font-weight: 700;
	letter-spacing: 4px;
	color: #036;
}
</style>

<body>
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<div class="container">
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
		</div>
	</header>
	
	<div class="cart-box-main">
		<div class="container">
			<div class="hero__text2" style="margin-top: 30px; margin-bottom: 30px; margin-left: auto; margin-right: auto;">
				<h3>고 객 문 의 게 시 판</h3>
			</div>
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-lg-9" style="margin-left: 200px; margin-right: 100px; margin-top: -20px;">
							<div class="shoping__cart__table">
								<div class="item display" style="padding-top: 30px;">
									<table class="type09">
										<thead>
											<tr>
												<th>자주묻는 질문</th>
												<th>문의 유형</th>
												<th>문의 제목</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">[배송 지연 질문]</th>
												<td>배송 관련</td>
												<td>물건을 주문했는데 배송확인이 안됩니다</td>
											</tr>
											<tr>
												<th scope="row">[결제 오류]</th>
												<td>결제 관련</td>
												<td>상품 결제가 안됩니다</td>
											</tr>
										</tbody>
									</table>

									<table class="type09">
										<thead>
											<tr>
												<th>문의 제목</th>
												<th>문의 유형</th>
												<th>시간</th>
												<th>상태</th>
											</tr>
										</thead>
									</table>
									<div id="myInqurreList" class="item" style=""></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-9"></div>
						<div class="col-lg-3">
							<div class="shoping__cart__btns">
								<a href="insertInquirePage" class="primary-btn cart-btn" style="padding-bottom: 10px; background-color: #000000; color: white; margin-bottom: 40px; margin-left: 40px;"> 문의작성</a>
							</div>
						</div>
					</div>
				</div>
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
<script type="text/javascript">
	$(document).ready(function() {
		myInquire();
	});

	function myInquire() {
		$.ajax({
			type : "get",
			url : "myInquire",
			dataType : "json",
			success : function(myInquire) {
				console.log(myInquire);
				InquirePrint(myInquire);
			}
		});
	}

	function InquirePrint(myInquire) {

		console.log(myInquire);
		var output = "";
		for (var i = 0; i < myInquire.length; i++) {

			//output += "<tr>"
			//output += "<td class=\"shoping__cart__item\">";
			output += "<div style=\"border-bottom: 1px solid gray; margin-top:15px;\" class=\"row \">";
			output += "<div class=\"col-5\">";

			output += "<a style=\"padding-top: 36px; font-size: 18px; margin-left: 20px;\" href=\"inquireInfo?iqcode="
					+ myInquire[i].iqcode
					+ "\">"
					+ myInquire[i].iqtitle
					+ "</a>&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";
			//output += "<td class=\"shoping__cart__price\">";
			output += "<div class=\"col-2\">";
			output += "<a style=\"font-size: 18px;\" href=\"inquireInfo?iqcode="
					+ myInquire[i].iqcode
					+ "\">"
					+ myInquire[i].iqcategory
					+ "</a>&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";

			output += "<div class=\"col-1\">";
			output += "</div>";

			//output += "<td class=\"shoping__cart__quantity\">";

			output += "<div class=\"col-2 \">"

			output += "<h5>" + myInquire[i].iqdate
					+ "</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";

			//output += "</td>";

			//output += "<td class=\"shoping__cart__total\">";
			output += "<div class=\"col-2 \">"
			if (myInquire[i].iqstate == 0) {

				output += "<h5>답변대기</h5>"
			} else {
				output += "<h5 style=\"font-weight:700;\">답변완료</h5>"
			}
			output += "</div>";
			output += "</div>";

		}

		$("#myInqurreList").html(output);

	}
</script>
</html>