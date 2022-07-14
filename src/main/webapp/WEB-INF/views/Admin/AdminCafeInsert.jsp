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

.bc-blue {
	background-color: blue;
}

.bc-red {
	background-color: red;
}

.c-white {
	color: white;
}

.btn_width {
	width: 90px;
}

.input_width {
	width: 100%;
	padding: 1;
	border-width: 1;
}

.input_width2 {
	width: 35%;
	padding: 1;
	border-width: 1;
}

.input_width3 {
	width: 60%;
	padding: 1;
	border-width: 1;
}

.dp_none {
	display: none;
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
				<div class="col-1">
					<div class="items">
						<span class="font-weight-bold">카페이름</span>
					</div>
					<div class="items">
						<input class="input_width" type="text" id="cfname" name="cfname" placeholder="카페 이름">
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
				<div class="col-2">
					<div class="items">
						<span class="input_width font-weight-bold">카페 전화번호</span>
					</div>
					<div class="items">
						<input type="text" id="cftel" name="cftel" placeholder="전화번호 - 포함">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="input_width font-weight-bold">카페링크</span>
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
				<div class="col-1">
					<br> <br>
					<div class="items">
						<button type="button" id="cafeSend">입력</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<div id="companyList"></div>

</body>

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

<script type="text/javascript">
	$(document).ready(function() {
		getCafeInfo();
	});

	function getCafeInfo(){
		$.ajax({
			type : "get",
			url : "getCafeInfo",
			dataType : "json",
			success : function(cafe) {
				cafeInfoPrint(cafe);
			}
		});
	}

	function cafeInfoPrint(cafe) {
		var output = "";
		
		for (var i = 0; i < cafe.length; i++) {
			output += "<br>";
			output += "<div class=\"row text-center borderOn\">"; // 맨위

			output += "<div class=\"col-2\"><div class=\"items\">";
			if (cafe[i].cfimg != null) {
				/* console.log(i + "번 이미지 :" + company[i].cmimg.split("/")[1]); */
				output += "<img style=\"width:150px; height:80px;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/"
						+ cafe[i].cfimg.split("/")[1] + "\">";
			} else {
				output += "<div class=\"items\">이미지없음</div>";
			}
			output += "</div></div>";

			output += "<div class=\"col-2\"><div class=\"items\">";
			output += "<img style=\"width:150px; height:80px;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/"+ cafe[i].cfsigimg + "\">";
			output += "</div></div>";

			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">카페코드</span></div>";
			output += "<div class=\"items\">" + cafe[i].cfcode + "</div></div>";

			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">카페이름</span></div>";
			output += "<div class=\"items\">" + cafe[i].cfname + "</div></div>";

			output += "<div class=\"col-2\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">카페주소</span></div>";
			output += "<div class=\"items\">" + cafe[i].cfaddress
					+ "</div></div>";

			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">전화번호</span></div>";
			output += "<div class=\"items\">" + cafe[i].cftel + "</div></div>";

			output += "<div class=\"col-2\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">카페링크</span></div>";
			output += "<div class=\"items\">" + cafe[i].cflink + "</div></div>";

			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<button type=\"button\" onclick=\"cfModifyForm(this, '"
					+ cafe[i].cfcode + "')\">수정</button>&nbsp;";
			output += "<button type=\"button\" onclick=\"cfDelete('"
					+ cafe[i].cfcode + "')\">삭제</button>";
			output += "</div><div class=\"items\">";

			if (cafe[i].cfstate == 0) {
				output += "<button class=\"bc-blue c-white btn_width\" type=\"button\" onclick=\"stateChange(this,'"
						+ cafe[i].cfcode + "')\">활동중</button>";
			} else {
				output += "<button class=\"bc-red c-white btn_width\" type=\"button\" onclick=\"stateChange(this,'"
						+ cafe[i].cfcode + "')\">활동중지</button>";
			}

			output += "</div></div>";
			output += "</div>"; // 맨아래

			// ================================= 수정 =================================
			output += "<div id=\""+cafe[i].cfcode+"\" class=\"dp_none\">";
			output += "<div class=\"row text-center borderOn\">"; // 맨위

			output += "<div class=\"col-2\"><div class=\"items\">카페이미지";
			output += "<input type=\"file\" name=\"imgMod_"+cafe[i].cfcode+"\"></div>";
			output += "<div class=\"items\">시그니처이미지";
			output += "<input type=\"file\" name=\"sigimgMod_"+cafe[i].cfcode+"\">";
			output += "</div></div>";

			output += "<div class=\"col-1\"><div class=\"items\"><span class=\"font-weight-bold\">카페코드</span></div><div class=\"items\">";
			output += "<input class=\"input_width\" id=\"codeMod_"+cafe[i].cfcode+"\" readonly type=\"text\" value=\""+ cafe[i].cfcode +"\">";
			output += "</div></div>";

			output += "<div class=\"col-1\"><div class=\"items\"><span class=\"font-weight-bold\">카페이름</span></div><div class=\"items\">";
			output += "<input class=\"input_width\" id=\"nameMod_"+cafe[i].cfcode+"\" type=\"text\" value=\""+ cafe[i].cfname +"\">";
			output += "</div></div>";

			output += "<div class=\"col-3\"><div class=\"items\"><span class=\"font-weight-bold\">카페주소</span></div><div class=\"items\">";
			output += "<input type=\"button\" onclick=\"sample6_execDaumPostcode2('"
					+ cafe[i].cfcode + "')\" value=\"우편번호 찾기\">";
			output += "<br><input class=\"input_width2\" type=\"text\" id=\"sample6_postcode"+cafe[i].cfcode+"\" name=\"cmPostCode\" placeholder=\"우편번호\">";
			output += "<input class=\"input_width2\" type=\"text\" id=\"sample6_address"+cafe[i].cfcode+"\" name=\"cmAddr\" placeholder=\"주소\">";
			output += "<br><input class=\"input_width2\" type=\"text\" id=\"sample6_detailAddress"+cafe[i].cfcode+"\" name=\"cmDetailAddress\" placeholder=\"상세주소\">";
			output += "<input class=\"input_width2\" type=\"text\" id=\"sample6_extraAddress"+cafe[i].cfcode+"\" name=\"cmExtraAddress\" placeholder=\"참고항목\">";
			output += "</div></div>";

			output += "<div class=\"col-2\"><div class=\"items\"><span class=\"font-weight-bold\">전화번호</span></div><div class=\"items\">";
			output += "<input class=\"input_width\" id=\"telMod_"+cafe[i].cfcode+"\" type=\"text\" value=\""+ cafe[i].cftel +"\">";
			output += "</div></div>";

			output += "<div class=\"col-2\"><div class=\"items\"><span class=\"font-weight-bold\">카페링크</span></div><div class=\"items\">";
			output += "<input class=\"input_width\" id=\"linkMod_"+cafe[i].cfcode+"\" type=\"text\" value=\""+ cafe[i].cflink +"\">";
			output += "</div></div>";

			output += "<div class=\"col-1\"><br><div class=\"items\">";
			output += "<button class=\"btn_width\" type=\"button\" onclick=\"cfModify('"
					+ cafe[i].cfcode + "')\">수정완료</button>";
			output += "</div></div>";

			output += "<input type=\"hidden\" id=\"stateMod_"+cafe[i].cfcode+"\" value=\""+cafe[i].cfstate+"\">"

			output += "</div></div>"; // 맨아래
		}

		$("#companyList").html(output);
	}
</script>

<script type="text/javascript">
	function stateChange(selObj, cfcode) {

		if ($(selObj).text() == "활동중") {
			$(selObj).text("활동중지");
			$(selObj).removeClass("bc-blue");
			$(selObj).addClass("bc-red");
			var cfstate = '1';
		} else {
			$(selObj).text("활동중");
			$(selObj).removeClass("bc-red");
			$(selObj).addClass("bc-blue");
			var cfstate = '0';
		}

		$.ajax({
			type : "get",
			url : "cfstateModify",
			data : {
				"cfcode" : cfcode,
				"cfstate" : cfstate
			},
			async : false,
			success : function(result) {
				console.log("success");
			}
		});

	}

	function cfDelete(cfcode) {

		$.ajax({
			type : "get",
			url : "cafeDelete",
			data : {
				"cfcode" : cfcode
			},
			async : false,
			success : function(result) {
				console.log("success");
				getCafeInfo();
			}
		});

	}

	function cfModifyForm(selBtn, cmcode) {
		$("#" + cmcode).toggleClass("dp_none");

		if ($(selBtn).text() == "수정") {
			$(selBtn).text("접기");
		} else {
			$(selBtn).text("수정");
		}
	}

	function cfModify(cfcode) {

		var formData = new FormData();
		var inputFile = $("input[name = 'imgMod_" + cfcode + "']");
		var files = inputFile[0].files;
		console.log(files);

		for (var i = 0; i < files.length; i++) {
			formData.append("cfimgs", files[i]);
		}
		
		var inputFile2 = $("input[name = 'sigimgMod_" + cfcode + "']");
		var files2 = inputFile2[0].files;
		console.log(files2);
		
		formData.append("cfsigimgs", files2[0]);
		
		
		formData.append("cfcode", $("#codeMod_" + cfcode).val());
		formData.append("cfname", $("#nameMod_" + cfcode).val());
		formData.append("cfpostcode", $("#sample6_postcode" + cfcode).val());
		formData.append("cfaddr", $("#sample6_address" + cfcode).val());
		formData.append("cfdetailaddress", $("#sample6_detailAddress" + cfcode)
				.val());
		formData.append("cfextraaddress", $("#sample6_extraAddress" + cfcode)
				.val());
		formData.append("cftel", $("#telMod_" + cfcode).val());
		formData.append("cflink", $("#linkMod_" + cfcode).val());
		formData.append("cfstate", $("#stateMod_" + cfcode).val());

		$.ajax({
			type : "POST",
			url : "adminCafeModify",
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				console.log("업로드 성공");
				getCafeInfo();
			}
		});

	}
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

<script type="text/javascript">
	function sample6_execDaumPostcode2(cmcode) {
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
							document.getElementById("sample6_extraAddress"
									+ cmcode).value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress"
									+ cmcode).value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode' + cmcode).value = data.zonecode;
						document.getElementById("sample6_address" + cmcode).value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById(
								"sample6_detailAddress" + cmcode).focus();
					}
				}).open();
	}
</script>
</html>