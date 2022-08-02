<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 관리</title>
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
			<div class="col-lg-3"></div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</div>
	<section class="featured spad">
		<div class="text-center">
			<h2>회사 정보 입력</h2>
		</div>
		<div class="container">
			<form action="adminCreateInfo" enctype="multipart/form-data">

				<div class="row cafeInsert">

					<div class="row">

						<div class="col-2">
							<span class="font-weight-bold">회사이름</span>
							<br>
							<input type="text" id="cmname" name="cmname" placeholder="회사 이름">
						</div>
						<div class="col-2">
							<span class="font-weight-bold">주소</span>
							<br>
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							<br>
							<input type="text" id="sample6_postcode" name="cmPostCode" placeholder="우편번호">
							<input type="text" id="sample6_address" name="cmAddr" placeholder="주소">
							<br>
							<input type="text" id="sample6_detailAddress" name="cmDetailAddress" placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" name="cmExtraAddress" placeholder="참고항목">
						</div>
						<div class="col-2">
							<span class="input_width font-weight-bold">회사 전화번호</span>
							<br>
							<input type="text" id="cmtel" name="cmtel" placeholder="전화번호 - 포함">
						</div>
						<div class="col-2">
							<span class="input_width font-weight-bold">회사링크</span>
							<br>
							<input type="text" id="cmlink" name="cmlink">
						</div>
						<div class="col-2">
							<span class="font-weight-bold">회사 이미지</span>
							<br>
							<input type="file" id="cmimgs" name="cmimgs" multiple="multiple">
						</div>
						<div class="col-2">
							<button class="cafeInsert-btn" type="button" id="companySend">회사추가</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<section class="featured spad">
		<div class="text-center">
			<h2>회사 리스트</h2>
		</div>
		<div class="container" id="companyList"></div>
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
				$("#companySend").on(
						"click",
						function() {
							var formData = new FormData();
							var inputFile = $("input[name = 'cmimgs']");
							var files = inputFile[0].files;
							console.log(files);

							console.log("cmname : " + $("#cmname").val());

							for (var i = 0; i < files.length; i++) {
								formData.append("cmimgs", files[i]);
							}
							formData.append("cmname", $("#cmname").val());
							formData.append("cmpostcode",
									$("#sample6_postcode").val());
							formData.append("cmaddr", $("#sample6_address")
									.val());
							formData.append("cmdetailaddress", $(
									"#sample6_detailAddress").val());
							formData.append("cmextraaddress", $(
									"#sample6_extraAddress").val());
							formData.append("cmtel", $("#cmtel").val());
							formData.append("cmlink", $("#cmlink").val());

							$.ajax({
								type : "POST",
								url : "adminCreateInfo",
								processData : false,
								contentType : false,
								data : formData,
								success : function(result) {
									console.log("업로드 성공");
									$("#cmname").val("");
									$("#sample6_postcode").val("");
									$("#sample6_address").val("");
									$("#sample6_detailAddress").val("");
									$("#sample6_extraAddress").val("");
									$("#cmtel").val("");
									$("#cmlink").val("");
									$("#cmimgs").val("");
									getCompanyInfo();
								}
							});
						});
			});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		getCompanyInfo();
	});

	function getCompanyInfo() {
		$.ajax({
			type : "get",
			url : "getCompanyInfo",
			dataType : "json",
			success : function(company) {
				companyInfoPrint(company);
			}
		});
	}

	function companyInfoPrint(company) {
		var output = "";

		for (var i = 0; i < company.length; i++) {
			output += "<br>";
			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\">";
			if (company[i].cmimg != null) {
				/* console.log(i + "번 이미지 :" + company[i].cmimg.split("/")[1]); */
				output += "<img style=\"width:150px; height:80px; margin-top:8%;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/"
						+ company[i].cmimg.split("/")[1] + "\">";
			} else {
				output += "<span style=\"margint:10px 30px 10px;\">이미지없음</span>";
			}
			output += "</div>";

			output += "<div class=\"col-7\"><div style=\"\">";
			output += "<span class=\"font-weight-bold\">회사코드 : </span>";
			output += "<span>" + company[i].cmcode + "</span><br>";
			output += "<span class=\"font-weight-bold\">회사이름 : </span>";
			output += "<span>" + company[i].cmname + "</span><br>";
			output += "<span class=\"font-weight-bold\">전화번호 : </span>";
			output += "<span>" + company[i].cmtel + "</span><br>";
			output += "<span class=\"font-weight-bold\">회사링크 : </span>";
			if (company[i].cmlink == "없음") {
				output += "<span></span><br>";
			} else {
				output += "<a href=\"" + company[i].cmlink + "\" style=\"font-size:14px; color:blue;\">"
						+ company[i].cmlink + "</a><br>";
			}
			output += "<span class=\"font-weight-bold\">회사주소 : </span>";
			output += "<span>" + company[i].cmaddress + "</span>";
			output += "</div></div>";

			output += "<div class=\"col-2\"><div style=\"margin-top:20%;\">";
			output += "<button class=\"cafeMod-btn\" type=\"button\" onclick=\"cmModifyForm(this, '"
					+ company[i].cmcode + "')\">수정</button>&nbsp;";
			output += "<button class=\"cafeDelete-btn\" type=\"button\" onclick=\"cmDelete('"
					+ company[i].cmcode + "')\">삭제</button>";

			if (company[i].cmstate == 0) {
				output += "<button class=\"cafeStateMod-blue-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ company[i].cmcode + "')\">활동중</button>";
			} else {
				output += "<button class=\"cafeStateMod-red-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ company[i].cmcode + "')\">활동중지</button>";
			}

			output += "</div></div>";
			output += "</div>"; // 맨아래

			// ================================= 수정 =================================
			output += "<div id=\""+company[i].cmcode+"\" class=\"dp_none\">";
			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\"><span class=\"font-weight-bold\">회사이미지</span>";
			output += "<input type=\"file\" name=\"imgMod_"+company[i].cmcode+"\">";
			output += "</div>";

			output += "<div class=\"col-7\"><span class=\"font-weight-bold\">회사코드 : </span>";
			output += "<input style=\"border:none;\" class=\"input_width\" id=\"codeMod_"+company[i].cmcode+"\" readonly type=\"text\" value=\""+ company[i].cmcode +"\">";
			output += "<br><span class=\"font-weight-bold\">회사이름 : </span>";
			output += "<input class=\"input_width\" id=\"nameMod_"+company[i].cmcode+"\" type=\"text\" value=\""+ company[i].cmname +"\">";
			output += "&nbsp;<span class=\"font-weight-bold\">전화번호 : </span>";
			output += "<input class=\"input_width\" id=\"telMod_"+company[i].cmcode+"\" type=\"text\" value=\""+ company[i].cmtel +"\">";
			output += "<br><span class=\"font-weight-bold\">회사링크 : </span>";
			output += "<input class=\"input_width\" id=\"linkMod_"+company[i].cmcode+"\" type=\"text\" value=\""+ company[i].cmlink +"\">";
			output += "<br><span class=\"font-weight-bold\">회사주소 : </span>";
			output += "<input type=\"text\" id=\"sample6_postcode"+company[i].cmcode+"\" name=\"cmPostCode\" value=\""+ company[i].cmpostcode +"\">";
			if (company[i].cmaddr == null) {
				output += "<input type=\"text\" id=\"sample6_address"+company[i].cmcode+"\" name=\"cmAddr\">";
			} else {
				output += "<input type=\"text\" id=\"sample6_address"+company[i].cmcode+"\" name=\"cmAddr\" value=\""+ company[i].cmaddr +"\">";
			}
			if (company[i].cmdetailaddress == null) {
				output += "<br><input style=\"margin-left:64px;\" type=\"text\" id=\"sample6_detailAddress"+company[i].cmcode+"\" name=\"cmDetailAddress\">";
			} else {
				output += "<br><input style=\"margin-left:64px;\" type=\"text\" id=\"sample6_detailAddress"+company[i].cmcode+"\" name=\"cmDetailAddress\" value=\""+ company[i].cmdetailaddress +"\">";
			}
			if (company[i].cmextraaddress == null) {
				output += "<input type=\"text\" id=\"sample6_extraAddress"+company[i].cmcode+"\" name=\"cmExtraAddress\">";
			} else {
				output += "<input type=\"text\" id=\"sample6_extraAddress"+company[i].cmcode+"\" name=\"cmExtraAddress\" value=\""+ company[i].cmextraaddress +"\">";
			}

			output += "<input type=\"button\" onclick=\"sample6_execDaumPostcode2('"
					+ company[i].cmcode + "')\" value=\"우편번호 찾기\">";
			output += "</div>";

			output += "<div class=\"col-2\">";
			output += "<button class=\"cafeModInsert-btn\" type=\"button\" onclick=\"cmModify('"
					+ company[i].cmcode + "')\">수정완료</button>";
			output += "</div>";

			output += "<input type=\"hidden\" id=\"stateMod_"+company[i].cmcode+"\" value=\""+company[i].cmstate+"\">"

			output += "</div></div>"; // 맨아래
		}

		$("#companyList").html(output);
	}
</script>

<script type="text/javascript">
	function stateChange(selObj, cmcode) {

		if ($(selObj).text() == "활동중") {
			$(selObj).text("활동중지");
			$(selObj).removeClass("cafeStateMod-blue-btn");
			$(selObj).addClass("cafeStateMod-red-btn");
			var cmstate = '1';
		} else {
			$(selObj).text("활동중");
			$(selObj).removeClass("cafeStateMod-red-btn");
			$(selObj).addClass("cafeStateMod-blue-btn");
			var cmstate = '0';
		}

		$.ajax({
			type : "get",
			url : "cmstateModify",
			data : {
				"cmcode" : cmcode,
				"cmstate" : cmstate
			},
			async : false,
			success : function(result) {
				console.log("success");
			}
		});

	}

	function cmDelete(cmcode) {

		$.ajax({
			type : "get",
			url : "companyDelete",
			data : {
				"cmcode" : cmcode,
			},
			async : false,
			success : function(result) {
				console.log("success");
				getCompanyInfo();
			}
		});
	}

	function cmModifyForm(selBtn, cmcode) {
		$("#" + cmcode).toggleClass("dp_none");

		if ($(selBtn).text() == "수정") {
			$(selBtn).text("접기");
		} else {
			$(selBtn).text("수정");
		}
	}

	function cmModify(cmcode) {
		var formData = new FormData();
		var inputFile = $("input[name = 'imgMod_" + cmcode + "']");
		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {
			formData.append("cmimgs", files[i]);
		}
		formData.append("cmcode", $("#codeMod_" + cmcode).val());
		formData.append("cmname", $("#nameMod_" + cmcode).val());
		formData.append("cmpostcode", $("#sample6_postcode" + cmcode).val());
		formData.append("cmaddr", $("#sample6_address" + cmcode).val());
		formData.append("cmdetailaddress", $("#sample6_detailAddress" + cmcode)
				.val());
		formData.append("cmextraaddress", $("#sample6_extraAddress" + cmcode)
				.val());
		formData.append("cmtel", $("#telMod_" + cmcode).val());
		formData.append("cmlink", $("#linkMod_" + cmcode).val());
		formData.append("cmstate", $("#stateMod_" + cmcode).val());

		$.ajax({
			type : "POST",
			url : "adminCompanyModify",
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				console.log("업로드 성공");
				getCompanyInfo();
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