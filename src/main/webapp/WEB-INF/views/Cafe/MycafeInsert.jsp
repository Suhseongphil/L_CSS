<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내카페 등록 페이지</title>
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
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<!-- Hero Section End -->

	<!-- Featured Section Begin -->
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify">

			<div class="col-xl-7 col-lg-8 col-md-7">
				<div class="card o-hidden border-0 shadow-lg my-5">

					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="margin">
							<div class="margin">
								<div class="p-5">
									<div class="text-center ">
										<h1 class="h4 text-gray-900 mb-4" style="font-weight: bold;">카페등록</h1>
									</div>
									<form class="user" action="CafeUpLoad" method="post" enctype="multipart/form-data">
										<div class="row form-group">
										<div class="col-6 form-group">
											<label>카페이름</label>
											<input type="text" class="form-control form-control-user" id="cfname" name="cfname" aria-describedby="emailHelp">
										</div>
										<div class="col-6 form-group">
											<label>전화번호</label>
											<input type="text" class="form-control form-control-user" id="cftel" name="cftel" placeholder="전화번호 - 포함">
										</div>
										</div>
										<div class="form-group">
											<label>카페링크</label>
											<input type="text" class="form-control form-control-user" id="cflink" name="cflink">
										</div>
										<div class="row form-group">
										<div class="col-6 form-group">
											<label>카페 이미지</label>
											<input type="file" class="form-control form-control-user" id="cfimgs" name="cfimgs">
										</div>
										<div class="col-6 form-group">
											<label>시그니처 이미지</label>
											<input type="file" class="form-control form-control-user" id="cfsigimgs" name="cfsigimgs">
										</div>
										</div>
										<div class="row form-group">
											<div class="col-6 form-group">
												<input class="btn text-white  btn-user btn-block" style="background-color: #000000;" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
												<br>
											</div>
											<div class="col-6 form-group">
												<input class="form-control form-control-user" type="text" id="mpostercode" name="mpostercode" placeholder="우편번호">
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<input class="form-control form-control-user" type="text" id="maddr" name="maddr" placeholder="주소">
												<br>
											</div>
										</div>

										<div class="row form-group">
											<div class="col-6 form-group">
												<input class="form-control form-control-user" type="text" id="mdetailaddress" name="mdetailaddress" placeholder="상세주소">
											</div>
											<div class="col-6 form-group">
												<input class="form-control form-control-user" type="text" id="mextraaddress" name="mextraaddress" placeholder="참고항목">
											</div>
										</div>
										
										<button type="submit" class="btn text-white  btn-user btn-block" style="background-color: #000000;">카페추가</button>
										<hr>

									</form>
									<hr>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			
			<div class="col-lg-4">

					<div class="hero__item set-bg">
						<div class="hero__text">
							<p>카페이미지</p>
							<img class="imgClass" alt="" src="${pageContext.request.contextPath }/resources/fileUpLoad/MemberFrofile/${memberInfo.mprofile}">
						</div>
					</div>

				</div>

		</div>

	</div>



</body>
</html>