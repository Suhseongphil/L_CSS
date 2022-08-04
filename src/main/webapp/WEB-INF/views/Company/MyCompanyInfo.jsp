<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>내 업체 정보 페이지</title>
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
	height: 700px;
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

.addr div {
	margin-bottom: 10px;
}
</Style>
<body>
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>

	</header>
	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
		</div>
	</div>
	<section class="hero">
		<!-- 회사정보 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="p-3" style="margin-top: 10px;">
						<div class="hero__text2">
							<span style="font-size: 22px;">내&nbsp;업체정보</span>
							<br> <br> <br>
							<p>회사이름&nbsp;&nbsp;:&nbsp;&nbsp;${mycompanyInfo.cmname }</p>
							<p>전화번호&nbsp;&nbsp;:&nbsp;&nbsp;${mycompanyInfo.cmtel }</p>
							<p>회사링크&nbsp;&nbsp;:&nbsp;&nbsp;${mycompanyInfo.cmlink }</p>
							<p>우편번호&nbsp;&nbsp;:&nbsp;&nbsp;${mycompanyInfo.cmpostcode }</p>
							<p>
								주소&nbsp;&nbsp;:&nbsp;&nbsp;${mycompanyInfo.cmaddr }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mycompanyInfo.cmaddr2 }
							</p>
							<button type="button" id="show" class="btn text-white" style="background-color: #000000;">정보수정</button>
						</div>
					</div>
				</div>
				<div class="row col-lg-8">
					<div class="p-5" style="margin-top: 20px;">
						<div class="hero__text">
							<label>회사이미지</label>
							<br>
							<c:choose>
									<c:when test="${mycompanyInfo.cmimg == null }">
										<div class="blog__item__pic">
											<a href="compnayInfo?cmcode=${mycompanyInfo.cmcode }">
												<img class="imgclass" alt=""src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS011.png">
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="blog__item__pic">
											<a href="compnayInfo?cmcode=${mycompanyInfo.cmcode }">
												<img class="imgclass" alt="" src="${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/${mycompanyInfo.cmimg.split('/')[1]}">
											</a>
										</div>
									</c:otherwise>
								</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 정보수정 모달창 -->
		<div class="background2">
			<div class="window2">
				<form class="user" action="mycompanyModify" method="post" enctype="multipart/form-data">
					<div class="popup2 text-center" style="padding: 20px;">
						<div>
							<label>회사이름</label>
							<br>
							<input type="text" id="cmname" name="cmname" value="${mycompanyInfo.cmname }" class="form-control form-control-user">
						</div>
						<br>
						<div class="row">
							<div class="col-6">
								<label>전화번호</label>
								<br>
								<input class="form-control form-control-user" type="text" id="cmtel" name="cmtel" value="${mycompanyInfo.cmtel }">
							</div>
							<div class="col-6">
								<label>회사링크</label>
								<br>
								<input class="form-control form-control-user" type="text" id="cmlink" name="cmlink" value="${mycompanyInfo.cmlink }">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-12">
								<label>회사 이미지</label>
							</div>
							<div class="col-6">
								<input type="file" class="form-control form-control-user" id="cmimgs" name="cmimgs" onchange="readURL(this);">
							</div>
							<div class="col-6">
								<img class="imgsize" id="preview" />
							</div>
						</div>
						<br>
						<div>
							<label>주소</label>
						</div>
						<div class="row addr">
							<div class="col-6">
								<input class="form-control form-control-user btn text-white" type="button" onclick="sample6_execDaumPostcode()" style="background-color: #000000;" value="우편번호 찾기">
							</div>
							<div class="col-6">
								<input class="form-control form-control-user" type="text" id="cmpostcode" name="cmpostcode" value="${mycompanyInfo.cmpostcode }" placeholder="우편번호">
							</div>
							<div class="col-12">
								<input class="form-control form-control-user" type="text" id="cmaddr" name="cmaddr" value="${mycompanyInfo.cmaddr }" placeholder="주소">
							</div>
							<div class="col-6">
								<input class="form-control form-control-user" type="text" id="cmdetailaddress" name="cmdetailaddress" value="${mycompanyInfo.cmdetailaddress }" placeholder="상세주소">
							</div>
							<div class="col-6">
								<input class="form-control form-control-user" type="text" id="cmextraaddress" name="cmextraaddress" value="${mycompanyInfo.cmextraaddress }" placeholder="참고항목">
							</div>
						</div>
						<input type="hidden" id="cmmid" name="cmmid" value="${mycompanyInfo.cmmid }">
						<button type="submit" id="save" class="btn text-white" style="background-color: #000000; margin-left: 20px;">정보수정</button>
						<button type="button" id="close" class="btn text-white" style="background-color: #000000; margin-left: 20px;">취소</button>
					</div>
				</form>
			</div>
		</div>
	</section>


	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
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


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("cmextraaddress").value = extraAddr;

						} else {
							document.getElementById("cmextraaddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('cmpostcode').value = data.zonecode;
						document.getElementById("cmaddr").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("cmdetailaddress").focus();
					}
				}).open();
	}
</script>


</html>