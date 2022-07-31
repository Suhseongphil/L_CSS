<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/handmade.css"
	type="text/css">
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
	
</head>
<style>
.imgClass {
	width: 300px;
	height: 300px;
	border-radius: 70%;
	overflow: hidden;
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
	height: 790px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
	border-radius:10px;
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

</style>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"> <img src="img/logo.png" alt="">
			</a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"> <i class="fa fa-heart"></i> <span>1</span>
				</a></li>
				<li><a href="#"> <i class="fa fa-shopping-bag"></i> <span>3</span>
				</a></li>
			</ul>
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<img src="img/language.png" alt="">
				<div>English</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="#">Spanis</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"> <i class="fa fa-user"></i> Login
				</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./index.html">Home</a></li>
				<li><a href="./shop-grid.html">Shop</a></li>
				<li><a href="#">카페</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="./blog.html">업체</a></li>
				<li><a href="./contact.html">공동구매</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"> <i class="fa fa-facebook"></i>
			</a> <a href="#"> <i class="fa fa-twitter"></i>
			</a> <a href="#"> <i class="fa fa-linkedin"></i>
			</a> <a href="#"> <i class="fa fa-pinterest-p"></i>
			</a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
				<li>Free Shipping for all Order of $99</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>

	</header>
	<!-- Header Section End -->
	<div class="container">

		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">

					<div class="hero__item set-bg">
						<div class="hero__text2">
							<span style="font-size: 22px;">내&nbsp;정보</span> <br> <br>
							<br>
							<p>아이디&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mid }</p>
							<p>이름&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mname }</p>
							<p>전화번호&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mtel }</p>
							<p>이메일&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.memail }</p>
							<p>우편번호&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mpostercode }</p>
							<p>
								주소&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.maddr }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${memberInfo.maddr2 }
							</p>
							<button type="button" id="show" class="btn text-white"
								style="background-color: #000000;">정보수정</button>
						</div>
					</div>
				</div>
				<div class="col-lg-5">

					<div class="hero__item set-bg">
						<div class="hero__text">
							<img class="imgClass" alt=""
								src="${pageContext.request.contextPath }/resources/fileUpLoad/MemberFrofile/${memberInfo.mprofile}">
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="background2">
			<div class="window2">
				<form class="user" action="memberModify" method="post"
					enctype="multipart/form-data">
					<div class="popup2">
						<div
							style="margin-left: 20px; margin-right: 400px; margin-top: 20px;">
							<label>아이디</label> <input type="text" id="mid"
								style="border: none;" readonly="readonly" name="mid"
								value="${memberInfo.mid }"
								class="form-control form-control-user">
						</div>
						<br>
						<div style="margin-left: 20px; margin-right: 400px;">
							<label>이름</label> <input type="text" style="border: none;"
								readonly="readonly" id="mname" name="mname"
								value="${memberInfo.mname }"
								class="form-control form-control-user">
						</div>
						<br>
						<div style="margin-left: 20px; margin-right: 400px;">
							<label>비밀번호</label> <input type="password" id="mpw" name="mpw"
								value="${memberInfo.mpw }"
								class="form-control form-control-user">
						</div>
						<br>
						<div style="margin-left: 20px; margin-right: 400px;">
							<label>전화번호</label> <input type="text" id="mtel" name="mtel"
								value="${memberInfo.mtel }"
								class="form-control form-control-user">
						</div>
						<br>
						<div style="margin-left: 20px;">
							<label>이메일</label>
						</div>
						<div class="row">
							<div class="col-4 form-group" style="margin-left: 20px;">

								<input type="text" id="memail" name="memail"
									value="${memberInfo.memail }"
									class="form-control form-control-user">
							</div>
							@
							<div class="col-4 form-group">
								<input type="text" id=emailDomain name="emailDomain"
									class="form-control form-control-user"
									value="${memberInfo.emailDomain }">
							</div>
							<div class="col-2 form-group">
								<select id="domainSelect">
									<option value="">직접입력</option>
									<option value="Naver.com">네이버</option>
									<option value="Daum.net">다음</option>
									<option value="Google.com">구글</option>
								</select>
							</div>
						</div>
						<div style="margin-left: 20px;">
							<label>주소</label>
						</div>
						<div class="row form-group">
							<div class="col-5 form-group" style="margin-left: 20px;">
								<input class="form-control form-control-user btn text-white"
									type="button" onclick="sample6_execDaumPostcode()"
									style="background-color: #000000;" value="우편번호 찾기"> <br>
							</div>
							<div class="col-6 form-group" style="margin-right: 20px;">
								<input class="form-control form-control-user" type="text"
									id="mpostercode" name="mpostercode"
									value="${memberInfo.mpostercode }" placeholder="우편번호">
							</div>
						</div>
						<div class="row">
							<div class="col-6" style="margin-left: 20px;">
								<input class="form-control form-control-user" type="text"
									id="maddr" name="maddr" value="${memberInfo.maddr }"
									placeholder="주소"> <br>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-4 form-group" style="margin-left: 20px;">
								<input class="form-control form-control-user" type="text"
									id="mdetailaddress" name="mdetailaddress"
									value="${memberInfo.mdetailaddress }" placeholder="상세주소">
							</div>
							<div class="col-6 form-group" style="margin-left: 20px;">
								<input class="form-control form-control-user" type="text"
									id="mextraaddress" name="mextraaddress"
									value="${memberInfo.mextraaddress }" placeholder="참고항목">
							</div>
						</div>
						<button type="submit" id="save" class="btn text-white"
							style="background-color: #000000; margin-left: 20px;">정보수정</button>
						<button type="button" id="close" class="btn text-white"
							style="background-color: #000000; margin-left: 20px;">취소</button>
					</div>
				</form>
			</div>
		</div>

	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->

	<!-- Categories Section End -->

	<!-- Featured Section Begin -->

	<!-- Featured Section End -->

	<!-- Banner Begin -->

	<!-- Banner End -->

	<!-- Latest Product Section Begin -->

	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->

	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
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
	<script
		src="${pageContext.request.contextPath }/resources/js/handmade.js"></script>

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
	$("#domainSelect").change(function() {

		var selDomain = $("#domainSelect").val();
		$("#emailDomain").val(selDomain);
	});
</script>



<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("mextraaddress").value = extraAddr;

				} else {
					document.getElementById("mextraaddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('mpostercode').value = data.zonecode;
				document.getElementById("maddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("mdetailaddress").focus();
			}
		}).open();
	}
</script>


</html>