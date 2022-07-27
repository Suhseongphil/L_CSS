<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/images/apple-touch-icon.png">

<!-- Bootstrap CSS -->

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
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
</style>

<body>
	<!-- Start Main Top -->

	<!-- End Main Top -->

	<!-- Start Main Top -->
	<%@ include file="../includes/TopBar.jsp"%>
	<header class="main-header">
		<!-- Start Navigation -->

		<div class="container">
			<!-- Start Header Navigation -->

			<!-- End Header Navigation -->

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="navbar-menu"></div>
			<!-- /.navbar-collapse -->

			<!-- Start Atribute Navigation -->
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
			<!-- End Atribute Navigation -->
		</div>
		<!-- Start Side Menu -->

		<!-- End Side Menu -->

		<!-- End Navigation -->
	</header>


	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">


				<!--<section class="shoping-cart spad">  -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__table">

								<div class="item display" style="padding-top: 30px;">
							

									<c:forEach items="${inquireInfo }" var="iqList">
									<div class="row"
										style="padding-bottom: 20px; text-align: center;">
										<div class="col-6">
										제목 : <h5>${iqList.iqtitle }</h5>
										</div>
										<div class="col-3">
										작성자 :	<h5>${iqList.iqmid }</h5>
										</div>
										<div class="col-3">
										카테고리 :	<h5>${iqList.iqcategory }</h5>
										</div>
										
									</div>
									
									<div 
										style="padding-bottom: 20px; text-align: center;">
										<div class="col-6">
										문의내용 : <h5>${iqList.iqcomment }</h5>
										</div>
										
										
									</div>
									
									</c:forEach>

								</div>

							</div>
						</div>
					</div>		
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="shoping__cart__table">

								<div class="item display" style="padding-top: 30px;">
							

									<c:forEach items="${AnswerList }" var="anList">
									<div class="row"
										style="padding-bottom: 20px; text-align: center;">
										
										<div class="col-8">
										답변내용 :	<h5>${anList.ancomment }</h5>
										</div>
		
										
										<div class="col-5">
										답변날짜 : <h5>${anList.andate }</h5>
										</div>
										
										
									</div>
									
									</c:forEach>

								</div>

							</div>
						</div>
					</div>		
				</div>
				<!--</section>  -->
			</div>


		</div>
	</div>
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
	<!-- End Cart -->

	<!-- Start Instagram Feed  -->

	<!-- End Instagram Feed  -->


	<!-- Start Footer  -->

	<!-- End Footer  -->

	<!-- Start copyright  -->

	<!-- End copyright  -->


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
	<!-- ALL JS FILES -->

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
			output += "<div class=\"row px\">";
			output += "<div class=\"col-6 center\">"

			output += "<h7 style=\"padding-top: 36px;\">"
					+ myInquire[i].iqcategory
					+ "</h7>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";
			//output += "<td class=\"shoping__cart__price\">";
			output += "<div class=\"col-2 divpadding \">"
			output += "<a href=\"inquireInfo?iqtitle="+myInquire[i].iqtitle+"\">" + myInquire[i].iqtitle
					+ "</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";

			//output += "<td class=\"shoping__cart__quantity\">";

			output += "<div class=\"col-2 divpadding \">"
			output += "<h5>" + myInquire[i].iqdate
					+ "</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			//output += "</td>";
			output += "</div>";

			//output += "</td>";

			//output += "<td class=\"shoping__cart__total\">";
			output += "<div class=\"col-2 divpadding\">"
			output += "<h5>" + myInquire[i].iqstate
					+ " &nbsp;&nbsp;<span class=\"icon_close\"></span></h5>";
			output += "</div>";
			output += "</div>";

		}

		$("#myInqurreList").html(output);

	}
</script>
</html>