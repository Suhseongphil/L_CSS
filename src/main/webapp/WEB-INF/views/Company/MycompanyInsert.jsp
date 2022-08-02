<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내업체 등록 페이지</title>
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
	<header class="header">
		<%@ include file="../includes/TopBar.jsp"%>
	</header>

	<div class="container">
		<div class="row">
			<%@ include file="../includes/MiddleBar.jsp"%>
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row justify">
			<div class="col-xl-7 col-lg-8 col-md-7">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<div class="margin">
							<div class="margin">
								<div class="p-5">
									<div class="text-center ">
										<h1 class="h4 text-gray-900 mb-4" style="font-weight: bold;">업 체 등 록</h1>
									</div>
									<form class="user" action="createMycompany" method="post" enctype="multipart/form-data">
										<div class="row form-group">
											<div class="col-6 form-group">
												<label>회사이름</label>
												<input type="text" class="form-control form-control-user" id="cmname" name="cmname" aria-describedby="emailHelp" placeholder="회사이름을 입력해주세요.">
											</div>
											<div class="col-6 form-group">
												<label>전화번호</label>
												<input type="text" class="form-control form-control-user" id="cmtel" name="cmtel" placeholder="전화번호 - 포함">
											</div>
										</div>
										<div class="row form-group">
											<div class="col-6 form-group">
												<label>회사링크</label>
												<input type="text" class="form-control form-control-user" id="cmlink" name="cmlink" placeholder="회사홈페이지를 입력해주세요.">
											</div>
											<div class="col-6 form-group">
												<label>회사대표 이미지</label>
												<input type="file" class="form-control form-control-user" id="cmimgs" name="cmimgs" onchange="readURL(this);">
											</div>
										</div>
										<div class="row form-group">
											<div class="col-6 form-group">
												<input class="btn text-white  btn-user btn-block" style="background-color: #000000;" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
												<br>
											</div>
											<div class="col-6 form-group">
												<input class="form-control form-control-user" type="text" id="cmpostcode" name="cmpostcode" placeholder="우편번호">
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<input class="form-control form-control-user" type="text" id="cmaddr" name="cmaddr" placeholder="주소">
												<br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col-6 form-group">
												<input class="form-control form-control-user" type="text" id="cmdetailaddress" name="cmdetailaddress" placeholder="상세주소">
											</div>
											<div class="col-6 form-group">
												<input class="form-control form-control-user" type="text" id="cmextraaddress" name="cmextraaddress" placeholder="참고항목">
											</div>
										</div>
										<button type="submit" class="btn text-white  btn-user btn-block" style="background-color: #000000;">업체추가</button>
										<input type="hidden" name="cmmid" id="cmmid" value=${sessionScope.loginId }>
									</form>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-4">
				<div class="hero__item set-bg">
					<div class="hero__text3">
						<p>회사이미지 미리보기</p>
						<img id="preview" />
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>

</body>
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