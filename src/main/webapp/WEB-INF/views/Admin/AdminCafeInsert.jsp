<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>InsertInfo_Company</title>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<style>
.container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	background-color: tan;
}

.items {
	flex-basis: auto;
	margin-top: 5px;
	margin-bottom: 5px;
}

.box {
	display: block;
}

.borderOn {
	border: solid 1px black;
}

span, h1 {
	color: black;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" type="text/css">
</head>

<body>
	<div class="text-center">
		<h1>카페 정보 입력</h1>
	</div>
	<div>
		<form action="adminCreateCafeInfo" enctype="multipart/form-data">
			<div class="row text-center borderOn">
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">카페이름</span>
					</div>
					<div class="items">
						<input type="text" id="cfname" name="cfname" placeholder="카페 이름">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">주소</span>
					</div>
					<div class="items">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						<br>
						<input type="text" id="sample6_postcode" name="cfPostCode" placeholder="우편번호">
						<input type="text" id="sample6_address" name="cfAddr" placeholder="주소">
						<br>
						<input type="text" id="sample6_detailAddress" name="cfDetailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" name="cfExtraAddress" placeholder="참고항목">
					</div>
				</div>
				<div class="col-1">
					<div class="items">
						<span class="font-weight-bold">카페 전화번호</span>
					</div>
					<div class="items">
						<input type="text" id="cftel" name="cftel" placeholder="전화번호 - 포함">
					</div>
				</div>
				<div class="col-1">
					<div class="items">
						<span class="font-weight-bold">카페링크</span>
					</div>
					<div class="items">
						<input type="text" id="cflink" name="cflink">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">카페 이미지</span>
					</div>
					<div class="items">
						<input type="file" id="cfimgs" name="cfimgs" multiple="multiple">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">시그니처 이미지</span>
					</div>
					<div class="items">
						<input type="file" id="cfsigimgs" name="cfsigimgs">
					</div>
				</div>
				<div class="col-2">
					<br> <br>
					<div class="items">
						<button type="button" id="cafeSend">입력</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<div>
		<div class="row text-center borderOn" id="cafeList">
		
			<div class="col-2">
				<div class="items">
					<span class="font-weight-bold">카페이름</span>
				</div>
				<div class="items">
					(주)ICIA
				</div>
			</div>
			<div class="col-5">
				<div class="items">
					<span class="font-weight-bold">카페주소</span>
				</div>
				<div class="items">
					incheon
				</div>
			</div>
			<div class="col-3">
				<div class="items">
					<span class="font-weight-bold">전화번호</span>
				</div>
				<div class="items">
					010-1111-2222
				</div>
			</div>
			<div class="col-2">
				<div class="items">
					<button type="button">수정</button>
					<button type="button">삭제</button>
				</div>
				<div class="items">
					<button type="button">활동중</button>
				</div>
			</div>
			
		</div>
	</div>

</body>

<script type="text/javascript">
	$(document).ready(function() {

		$.ajax({
			type : "get",
			url : "getCafeInfo",
			dataType : "json",
			success : function(cafe) {
				console.log("success");
				/* companyInfoPrint(company); */
			}
		});
	});

	function cafeInfoPrint(cafe) {
		var output = "";
		output = output + "<table border = '1'>";
	}
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#cafeSend").on(
						"click",
						function() {
							var formData = new FormData();
							var inputFile = $("input[name = 'cfimgs']");
							var files = inputFile[0].files;
							console.log(files);
							
							var inputFile2 = $("input[name = 'cfsigimgs']");
							console.log(inputFile2);
							var files2 = inputFile2[0].files;
							console.log(files2[0]);

							console.log("cfname : " + $("#cfname").val());

							for (var i = 0; i < files.length; i++) {
								formData.append("cfimgs", files[i]);
							}
							formData.append("cfname", $("#cfname").val());
							formData.append("cfpostcode",
									$("#sample6_postcode").val());
							formData.append("cfaddr", $("#sample6_address")
									.val());
							formData.append("cfdetailaddress", $(
									"#sample6_detailAddress").val());
							formData.append("cfextraaddress", $(
									"#sample6_extraAddress").val());
							formData.append("cftel", $("#cftel").val());
							formData.append("cflink", $("#cflink").val());
							formData.append("cfsigimgs", files2[0]);
							console.log("inputFile2 : " + files2);
							$.ajax({
								type : "POST",
								url : "adminCreateCafeInfo",
								processData : false,
								contentType : false,
								data : formData,
								success : function(result) {
									console.log("업로드 성공");
									$("#cfname").val("");
									$("#sample6_postcode").val("");
									$("#sample6_address").val("");
									$("#sample6_detailAddress").val("");
									$("#sample6_extraAddress").val("");
									$("#cftel").val("");
									$("#cflink").val("");
									$("#cfimgs").val("");
									$("#cfsigimgs").val("");
								}
							});

						});
			});
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>