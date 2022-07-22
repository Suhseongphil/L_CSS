<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴등록 페이지</title>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<style>
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
</style>

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
	<div class="text-center">
		<h1>메뉴 정보 입력</h1>
	</div>
	<div>
		<form action="menuInsert" enctype="multipart/form-data">
			<div class="row text-center borderOn">
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">메뉴이름</span>
					</div>
					<div class="items">
						<input type="text" id="muname" name="muname" placeholder="메뉴 이름">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">메뉴가격</span>
					</div>
					<div class="items">
						<input type="text" id="muprice" name="muprice" placeholder="가격">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">메뉴타입</span>
					</div>
					<div class="items">
						<input type="text" id="mutype" name="mutype" placeholder="메뉴 타입">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">카페코드</span>
					</div>
					<div class="items">
						<input type="text" id="mucfcode" name="mucfcode"  value="${mycafeInfo.cfcode }">
					</div>
				</div>



				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">메뉴 이미지</span>
					</div>
					<div class="items">

						<input type="file" id="muims" name="muims">
					</div>
				</div>
				<div class="col-2">
					<br> <br>
					<div class="items">
						<button type="button" id="menuSend" class="btn text-white" style="background-color: #000000;">메뉴등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<div id="menuList">

	</div>


	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>

	<!-- Js Plugins -->
	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/handmade.js"></script>
	
	<footer class="footer">
		<%@ include file="../includes/FooterBar.jsp"%>
	</footer>
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
				$("#menuSend").on(
						"click",
						function() {
							var formData = new FormData();
							var inputFile = $("input[name = 'muims']");
							var files = inputFile[0].files;
							console.log(files);

							

							for (var i = 0; i < files.length; i++) {
								formData.append("muims", files[i]);
							}
							formData.append("muname", $("#muname").val());
							formData.append("mutype",
									$("#mutype").val());
							formData.append("muprice", $("#muprice")
									.val());
							formData.append("mucfcode", $("#mucfcode")
									.val());
							
							
							
							$.ajax({
								type : "POST",
								url : "menuInsert",
								processData : false,
								contentType : false,
								data : formData,
								success : function(result) {
									console.log("업로드 성공");
									$("#muname").val("");
									$("#mutype").val("");
									$("#muprice").val("");
									
									getMyMenuInfo();
								}
							});
						});

			});

</script>

<script type="text/javascript">
	$(document).ready(function() {
		 getMyMenuInfo();
	});
	
	function getMyMenuInfo(){
		$.ajax({
			type : "get",
			url : "getMyMenuInfo",
			dataType : "json",
			success : function(menu) {
				console.log(menu);
				MymenuInfoPrint(menu);
			}
		});
	}

	function MymenuInfoPrint(menu) {
		var output = "";

		for (var i = 0; i < menu.length; i++) {
			output += "<br>";

			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\">";
			if (menu[i].cmimg != null) {
				/* console.log(i + "번 이미지 :" + company[i].cmimg.split("/")[1]); */
				output += "<img style=\"width:150px; height:80px; margin-top:8%;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/"
						+ menu[i].muimg.split("/")[1] + "\">";
			} else {
				output += "<span style=\"margint:10px 30px 10px;\">이미지없음</span>";
			}
			output += "</div>";

			output += "<div class=\"col-7\"><div style=\"\">";
			output += "<span class=\"font-weight-bold\">메뉴코드 : </span>";
			output += "<span>" + menu[i].mucode + "</span><br>";
			output += "<span class=\"font-weight-bold\">메뉴이름 : </span>";
			output += "<span>" + menu[i].muname + "</span><br>";
			output += "<span class=\"font-weight-bold\">가격 : </span>";
			output += "<span>" + menu[i].muprice + "</span><br>";
			output += "<span class=\"font-weight-bold\">메뉴타입 : </span>";
			output += "<span>" + menu[i].mutype + "</span>";
			output += "</div></div>";

			output += "<div class=\"col-2\"><div style=\"margin-top:20%;\">";
			output += "<button class=\"cafeMod-btn\" type=\"button\" onclick=\"muModifyForm(this, '"
					+ menu[i].mucode + "')\">수정</button>&nbsp;";
			output += "<button class=\"cafeDelete-btn\" type=\"button\" onclick=\"muDelete('"
					+ menu[i].mucode + "')\">삭제</button>";

			if (menu[i].mustate == 0) {
				output += "<button class=\"cafeStateMod-blue-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ menu[i].mucode + "')\">활동중</button>";
			} else {
				output += "<button class=\"cafeStateMod-red-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ menu[i].mucode + "')\">활동중지</button>";
			}

			output += "</div></div>";
			output += "</div>"; // 맨아래

			// ================================= 수정 =================================
			output += "<div id=\""+menu[i].mucode+"\" class=\"dp_none\">";
			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\"><span class=\"font-weight-bold\">메뉴이미지</span>";
			output += "<input type=\"file\" name=\"imgMod_"+menu[i].mucode+"\">";
			output += "</div>";

			output += "<div class=\"col-7\"><span class=\"font-weight-bold\"메뉴코드 : </span>";
			output += "<input style=\"border:none;\" class=\"input_width\" id=\"codeMod_"+menu[i].mucode+"\" readonly type=\"text\" value=\""+ menu[i].mucode +"\">";
			output += "<br><span class=\"font-weight-bold\">메뉴이름 : </span>";
			output += "<input class=\"input_width\" id=\"nameMod_"+menu[i].mucode+"\" type=\"text\" value=\""+ menu[i].muname +"\">";
			output += "&nbsp;<span class=\"font-weight-bold\">가격 : </span>";
			output += "<input class=\"input_width\" id=\"priceMod_"+menu[i].mucode+"\" type=\"text\" value=\""+ menu[i].muprice +"\">";
			output += "<br><span class=\"font-weight-bold\">메뉴타입 : </span>";
			output += "<input class=\"input_width\" id=\"menuMod_"+menu[i].mucode+"\" type=\"text\" value=\""+ menu[i].mutype +"\">";
			output += "</div>";

			output += "<div class=\"col-2\">";
			output += "<button class=\"cafeModInsert-btn\" type=\"button\" onclick=\"muModify('"
					+ menu[i].mucode + "')\">수정완료</button>";
			output += "</div>";

			output += "<input type=\"hidden\" id=\"stateMod_"+menu[i].mucode+"\" value=\""+menu[i].mustate+"\">"

			output += "</div></div>"; // 맨아래

		}

		$("#menuList").html(output);
	}
</script>

<script type="text/javascript">
	function stateChange(selObj, mucode) {

		if ($(selObj).text() == "활동중") {
			$(selObj).text("활동중지");
			$(selObj).removeClass("cafeStateMod-blue-btn");
			$(selObj).addClass("cafeStateMod-red-btn");
			var mustate = '1';
		} else {
			$(selObj).text("활동중");
			$(selObj).removeClass("cafeStateMod-red-btn");
			$(selObj).addClass("cafeStateMod-blue-btn");
			var mustate = '0';
		}

		$.ajax({
			type : "get",
			url : "mustateModify",
			data : {
				"mucode" : mucode,
				"mustate" : mustate
			},
			async : false,
			success : function(result) {
				console.log("success");
			}
		});

	}


	function muDelete(mucode) {
		$.ajax({
			type : "get",
			url : "menuDelete",
			data : {
				"mucode" : mucode,
			},
			async : false,
			success : function(result) {
				console.log("success");
				getMyMenuInfo();
			}
		});
	}

	function muModifyForm(selBtn, mucode) {
		$("#" + mucode).toggleClass("dp_none");

		if ($(selBtn).text() == "수정") {
			$(selBtn).text("접기");
		} else {
			$(selBtn).text("수정");
		}
	}

	function muModify(mucode) {
		var formData = new FormData();
		var inputFile = $("input[name = 'imgMod_" + mucode + "']");
		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {
			formData.append("muimgs", files[i]);
		}
		formData.append("mucode", $("#codeMod_" + mucode).val());
		formData.append("muname", $("#nameMod_" + mucode).val());
		formData.append("muprice", $("#priceMod_" + mucode).val());
		formData.append("mutype", $("#typeMod_" + mucode).val());
		formData.append("mustate", $("#stateMod_" + mucode).val());

		$.ajax({
			type : "POST",
			url : "mustateModify",
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				console.log("업로드 성공");
				getMyMenuInfo();
			}
		});
	}
</script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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