<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>내 카페 정보 페이지</title>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
</head>

<Style>
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
	height: 900px;
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
object-fit:cover;


}
</Style>
<body>

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

<section class="hero">

<div class="container">
			<div class="row">
				<div class="col-lg-7">

					<div class="hero__item set-bg">
						<div class="hero__text2">
							<span style="font-size: 22px;">내&nbsp;카페정보</span>
							<br> <br> <br>
							<p>카페이름&nbsp;&nbsp;:&nbsp;&nbsp;${mycafeInfo.cfname }</p>
							<p>전화번호&nbsp;&nbsp;:&nbsp;&nbsp;${mycafeInfo.cftel }</p>
							<p>카페링크&nbsp;&nbsp;:&nbsp;&nbsp;${mycafeInfo.cflink }</p>
							<p>우편번호&nbsp;&nbsp;:&nbsp;&nbsp;${mycafeInfo.cfpostcode }</p>
							<p>
								주소&nbsp;&nbsp;:&nbsp;&nbsp;${mycafeInfo.cfaddr }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mycafeInfo.cfaddr2 }
							</p>
							<button type="button" id="show" class="btn text-white" style="background-color: #000000;">정보수정</button>
						</div>
					</div>





				</div>
				<div class="col-lg-5">

					<div class="p-5">
						<div class="hero__text">
							<label>카페이미지</label>
							<img class="imgClass" alt="" src="${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/${mycafeInfo.cfimg}">
						</div>
					</div>
					<div class="p-5">
						<div class="hero__text">
							<label>시그니처 이미지</label>
							<img class="sigimgClass" alt="" src="${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/${mycafeInfo.cfsigimg}">
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="background2">
			<div class="window2">
				<form class="user" action="mycafeModify" method="post" enctype="multipart/form-data">
					<div class="popup2">
						<div style="margin-left: 20px; margin-right: 400px; margin-top: 20px;">
							<label>카페이름</label>
							<input type="text" id="cfname"  name="cfname" value="${mycafeInfo.cfname }" class="form-control form-control-user">
						</div>
						<br>
						<div class="row form-group">
							<div class="col-5 form-group" style="margin-left: 20px;">
							<label>전화번호</label>
							<input type="text"   id="cftel" name="cftel" value="${mycafeInfo.cftel }">
							
							</div>
						<br>
						<div class="col-5 form-group" style="margin-left: 20px;">
							<label>카페링크</label>
							<input type="text" id="cflink" name="cflink" value="${mycafeInfo.cflink }">
						</div>
						</div>
						<br>
						<div class="row form-group">
											<div class="col-6 form-group">
												<label>카페 이미지</label> <input type="file"
													class="form-control form-control-user" id="cfimgs2"
													name="cfimgs2" onchange="readURL(this);" >
													<img class="imgsize" id="preview" />
											</div>
											<div class="col-6 form-group">
												<label>시그니처 이미지</label> <input type="file"
													class="form-control form-control-user" id="cfsigimgs"
													name="cfsigimgs" onchange="sigURL(this);" >
													<img class="imgsize" id="sigpreview" />
											</div>
										</div>
						
						<div style="margin-left: 20px;">
							<label>주소</label>
						</div>
						<div class="row form-group">
							<div class="col-5 form-group" style="margin-left: 20px;">
								<input class="form-control form-control-user btn text-white" type="button" onclick="sample6_execDaumPostcode()" style="background-color: #000000;" value="우편번호 찾기">
								<br>
							</div>
							<div class="col-6 form-group" style="margin-right: 20px;">
								<input class="form-control form-control-user" type="text" id="cfpostcode" name="cfpostcode" value="${mycafeInfo.cfpostcode }" placeholder="우편번호">
							</div>
						</div>
						<div class="row">
							<div class="col-6" style="margin-left: 20px;">
								<input class="form-control form-control-user" type="text" id="cfaddr" name="cfaddr" value="${mycafeInfo.cfaddr }" placeholder="주소">
								<br>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-4 form-group" style="margin-left: 20px;">
								<input class="form-control form-control-user" type="text" id="cfdetailaddress" name="cfdetailaddress" value="${mycafeInfo.cfdetailaddress }" placeholder="상세주소">
							</div>
							<div class="col-6 form-group" style="margin-left: 20px;">
								<input class="form-control form-control-user" type="text" id="cfextraaddress" name="cfextraaddress" value="${mycafeInfo.cfextraaddress }" placeholder="참고항목">
							</div>
						</div>
						<input type="hidden" id = "cfmid" name="cfmid" value="${mycafeInfo.cfmid }">
						<button type="submit" id="save" class="btn text-white" style="background-color: #000000; margin-left: 20px;">정보수정</button>
						<button type="button" id="close" class="btn text-white" style="background-color: #000000; margin-left: 20px;">취소</button>
					</div>
				</form>
			</div>
		</div>
</section>


<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<h2>L&CSS</h2>
						</div>
						<ul>
							<li>회사주소: 인천일보아카데미</li>
							<li>전화번호: 032-111-1111</li>
							<li>이메일 : #</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>프로젝트</h6>
						<ul>
							<li>
								<a href="#">팀장 : 서성필</a>
							</li>
							<li>
								<a href="#">엔지니어 : 송영오</a>
							</li>
							<li>
								<a href="#">엔지니어 : 천호태</a>
							</li>
							<li>
								<a href="#">엔지니어 : 이상윤</a>
							</li>

						</ul>

					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">

						<a href="InquirePage">고객문의</a>


					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright"></div>
				</div>
			</div>
		</div>
	</footer>


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
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
</script>
<script type="text/javascript">
	function sigURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('sigpreview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('sigpreview').src = "";
		}
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
					document.getElementById("cfextraaddress").value = extraAddr;

				} else {
					document.getElementById("cfextraaddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('cfpostcode').value = data.zonecode;
				document.getElementById("cfaddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("cfdetailaddress").focus();
			}
		}).open();
	}
</script>
</html>