<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>회원가입 페이지</title>

<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
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
<style type="text/css">
.margin {
	margin: auto;
}

.atag {
	text-align: center;
	padding: 10px;
}

.bord {
	padding: 10px;
}
</style>

</head>

<body>

	<%@ include file="../includes/TopBar.jsp"%>
	<div class="container">
		<!-- Outer Row -->

		<div class="container">
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
		</div>

		<div class="col-xl-6 col-lg-7" style="margin-left: 280px;">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->

					<div class="p-5" >
						<div class="text-center ">
							<h1 class="h4 text-gray-900 mb-4" style="font-weight: bold;">회원가입</h1>
						</div>
						<form class="user" action="memberJoin" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label>아이디</label> <input type="text"
									class="form-control form-control-user" id="mid" name="mid"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label>이름</label> <input type="text"
									class="form-control form-control-user" id="mname" name="mname">
							</div>
							<div class="form-group">
								<label>비밀번호</label> <input type="password"
									class="form-control form-control-user" id="mpw" name="mpw">
							</div>
							<div class="form-group">
								<label>비밀번호 확인</label> <input type="password"
									class="form-control form-control-user" id="mpwCheck"
									name="mpwCheck">
							</div>
							<div class="form-group">
								<label>전화번호</label> <input type="text"
									class="form-control form-control-user" id="mtel" name="mtel">
							</div>
							<label>이메일</label>
							<div class="row">
								<div class="col-5 form-group">
									<input type="text" class="form-control form-control-user"
										id="memail" name="memail">
								</div>
								@
								<div class="col-6 form-group">
									<input type="text" class="form-control form-control-user"
										id="emailDomain" name="emailDomain"> <select
										id="domainSelect" style="margin-top: 10px;">
										<option value="">직접입력</option>
										<option value="Naver.com">네이버</option>
										<option value="Daum.net">다음</option>
										<option value="Google.com">구글</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label>프로필 이미지</label> <input type="file"
									class="form-control form-control-user" id="mfile" name="mfile">
							</div>
							<div class="row form-group">
								<div class="col-6 form-group">
									<input class="form-control form-control-user" type="button"
										onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
									<br>
								</div>
								<div class="col-6 form-group">
									<input class="form-control form-control-user" type="text"
										id="mpostercode" name="mpostercode" placeholder="우편번호">
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<input class="form-control form-control-user" type="text"
										id="maddr" name="maddr" placeholder="주소"> <br>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-6 form-group">
									<input class="form-control form-control-user" type="text"
										id="mdetailaddress" name="mdetailaddress" placeholder="상세주소">
								</div>
								<div class="col-6 form-group">
									<input class="form-control form-control-user" type="text"
										id="mextraaddress" name="mextraaddress" placeholder="참고항목">
								</div>
							</div>
							<div class="row form-group">
								<input type="radio" name="mstate" value="0"
									style="margin-left: 70px;"> 개인 <input type="radio"
									name="mstate" value="1" style="margin-left: 90px;"> 카페
								<input type="radio" name="mstate" value="2"
									style="margin-left: 100px;"> 업체
							</div>
							<button type="submit" class="btn btn-primary btn-user btn-block">회원가입</button>
							<hr>
						</form>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
</body>
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