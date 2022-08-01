<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 관리</title>
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
			<%@ include file="../includes/AdminMiddleBar.jsp"%>
		</div>
	</div>
	<section class="featured spad">
		<div class="text-center">
			<h2>카페 정보 입력</h2>
		</div>
		<div class="container">
			<form action="adminCreateCafeInfo" enctype="multipart/form-data">
				<div class="row cafeInsert">
					<div class="row">
						<div class="col-2">
							<span class="font-weight-bold">카페이름</span>
							<br>
							<input type="text" id="cfname" name="cfname" placeholder="카페 이름">
						</div>
						<div class="col-2">
							<span class="font-weight-bold">주소</span>
							<br>
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<br>
							<input type="text" id="sample6_postcode" name="cfPostCode" placeholder="우편번호">
							<input type="text" id="sample6_address" name="cfAddr" placeholder="주소">
							<br>
							<input type="text" id="sample6_detailAddress" name="cfDetailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name="cfExtraAddress" placeholder="참고항목">
						</div>
						<div class="col-2">
							<span class="input_width font-weight-bold">카페 전화번호</span>
							<br>
							<input type="text" id="cftel" name="cftel" placeholder="전화번호 - 포함">
						</div>
						<div class="col-2">
							<span class="input_width font-weight-bold">카페링크</span>
							<br>
							<input type="text" id="cflink" name="cflink">
						</div>
						<div class="col-2">
							<span class="font-weight-bold">카페 이미지</span>
							<br>
							<input type="file" id="cfimgs" name="cfimgs" multiple="multiple">
							<br> <br>
							<span class="font-weight-bold">시그니처 이미지</span>
							<br>
							<input type="file" id="cfsigimgs" name="cfsigimgs">
						</div>
						<div class="col-2">
							<button class="cafeInsert-btn" type="button" id="cafeSend">카페추가</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<section class="featured spad">
		<div class="text-center">
			<h2>카페 리스트</h2>
		</div>
		<div class="container" id="cafeList"></div>
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
									getCafeInfo();
								}
							});

						});
			});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		getCafeInfo();
	});

	function getCafeInfo() {
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
			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\">";
			if (cafe[i].cfimg != null) {
				/* console.log(i + "번 이미지 :" + company[i].cmimg.split("/")[1]); */
				output += "<img style=\"width:150px; height:80px; margin-bottom:2px;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/"
						+ cafe[i].cfimg.split("/")[1] + "\">";
			} else {
				output += "<span>이미지없음</span>";
			}
			output += "<br><img style=\"width:150px; height:80px;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/"+ cafe[i].cfsigimg + "\">";
			output += "</div>";

			output += "<div class=\"col-7\"><div style=\"margin-top:2%;\">";
			output += "<span class=\"font-weight-bold\">카페코드 : </span>";
			output += "<span>" + cafe[i].cfcode + "</span><br>";
			output += "<span class=\"font-weight-bold\">카페이름 : </span>";
			output += "<span>" + cafe[i].cfname + "</span><br>";
			output += "<span class=\"font-weight-bold\">전화번호 : </span>";
			output += "<span>" + cafe[i].cftel + "</span><br>";
			output += "<span class=\"font-weight-bold\">카페링크 : </span>";
			if (cafe[i].cflink == "없음") {
				output += "<span></span><br>";
			} else {
				output += "<a href=\"" + cafe[i].cflink + "\" style=\"font-size:14px;\">"
						+ cafe[i].cflink + "</a><br>";
			}
			output += "<span class=\"font-weight-bold\">카페주소 : </span>";
			output += "<span>" + cafe[i].cfaddress + "</span>";
			output += "</div></div>";

			output += "<div class=\"col-2\"><div style=\"margin-top:30%;\">";
			output += "<button class=\"cafeMod-btn\" type=\"button\" onclick=\"cfModifyForm(this, '"
					+ cafe[i].cfcode + "')\">수정</button>&nbsp;";
			output += "<button class=\"cafeDelete-btn\" type=\"button\" onclick=\"cfDelete('"
					+ cafe[i].cfcode + "')\">삭제</button>";

			if (cafe[i].cfstate == 0) {
				output += "<button class=\"cafeStateMod-blue-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ cafe[i].cfcode + "')\">활동중</button>";
			} else {
				output += "<button class=\"cafeStateMod-red-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ cafe[i].cfcode + "')\">활동중지</button>";
			}

			output += "</div></div>";
			output += "</div>"; // 맨아래

			// ================================= 수정 =================================
			output += "<div id=\""+cafe[i].cfcode+"\" class=\"dp_none\">";
			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\"><span class=\"font-weight-bold\">카페이미지</span>";
			output += "<input type=\"file\" name=\"imgMod_"+cafe[i].cfcode+"\">";
			output += "<span class=\"font-weight-bold\">시그니처이미지</span>";
			output += "<input type=\"file\" name=\"sigimgMod_"+cafe[i].cfcode+"\">";
			output += "</div>";

			output += "<div class=\"col-7\"><span class=\"font-weight-bold\">카페코드 : </span>";
			output += "<input style=\"border:none;\" class=\"input_width\" id=\"codeMod_"+cafe[i].cfcode+"\" readonly type=\"text\" value=\""+ cafe[i].cfcode +"\">";
			output += "<br><span class=\"font-weight-bold\">카페이름 : </span>";
			output += "<input class=\"input_width\" id=\"nameMod_"+cafe[i].cfcode+"\" type=\"text\" value=\""+ cafe[i].cfname +"\">";
			output += "&nbsp;<span class=\"font-weight-bold\">전화번호 : </span>";
			output += "<input class=\"input_width\" id=\"telMod_"+cafe[i].cfcode+"\" type=\"text\" value=\""+ cafe[i].cftel +"\">";
			output += "<br><span class=\"font-weight-bold\">카페링크 : </span>";
			output += "<input class=\"input_width\" id=\"linkMod_"+cafe[i].cfcode+"\" type=\"text\" value=\""+ cafe[i].cflink +"\">";
			output += "<br><span class=\"font-weight-bold\">카페주소 : </span>";
			output += "<input type=\"text\" id=\"sample6_postcode"+cafe[i].cfcode+"\" name=\"cmPostCode\" value=\""+ cafe[i].cfpostcode +"\">";
			output += "<input type=\"text\" id=\"sample6_address"+cafe[i].cfcode+"\" name=\"cmAddr\" value=\""+ cafe[i].cfaddr +"\">";
			output += "<br><input style=\"margin-left:64px;\" type=\"text\" id=\"sample6_detailAddress"+cafe[i].cfcode+"\" name=\"cmDetailAddress\" value=\""+ cafe[i].cfdetailaddress +"\">";
			if (cafe[i].cfextraaddress == null) {
				output += "<input type=\"text\" id=\"sample6_extraAddress"+cafe[i].cfcode+"\" name=\"cmExtraAddress\">";
			} else {
				output += "<input type=\"text\" id=\"sample6_extraAddress"+cafe[i].cfcode+"\" name=\"cmExtraAddress\" value=\""+ cafe[i].cfextraaddress +"\">";
			}

			output += "<input type=\"button\" onclick=\"sample6_execDaumPostcode2('"
					+ cafe[i].cfcode + "')\" value=\"우편번호 찾기\">";
			output += "</div>";

			output += "<div class=\"col-2\">";
			output += "<button class=\"cafeModInsert-btn\" type=\"button\" onclick=\"cfModify('"
					+ cafe[i].cfcode + "')\">수정완료</button>";
			output += "</div>";

			output += "<input type=\"hidden\" id=\"stateMod_"+cafe[i].cfcode+"\" value=\""+cafe[i].cfstate+"\">"

			output += "</div></div>"; // 맨아래
		}

		$("#cafeList").html(output);
	}
</script>

<script type="text/javascript">
	function stateChange(selObj, cfcode) {

		if ($(selObj).text() == "활동중") {
			$(selObj).text("활동중지");
			$(selObj).removeClass("cafeStateMod-blue-btn");
			$(selObj).addClass("cafeStateMod-red-btn");
			var cfstate = '1';
		} else {
			$(selObj).text("활동중");
			$(selObj).removeClass("cafeStateMod-red-btn");
			$(selObj).addClass("cafeStateMod-blue-btn");
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
</html>