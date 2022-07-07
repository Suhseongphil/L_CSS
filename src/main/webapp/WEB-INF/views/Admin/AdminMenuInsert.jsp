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
.bc-blue{
	background-color: blue;
}
.bc-red{
	background-color: red;
}
.c-white{
	color: white;
}
.btn_width{
	width: 90px;
}
</style>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" type="text/css">
</head>

<body>
	<div class="text-center">
		<h1>메뉴 정보 입력</h1>
	</div>
	<div>
		<form action="menuInsert"  enctype="multipart/form-data">
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
						<input type="text" id="mucfcode" name="mucfcode"  value="CF001">
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
						<button type="button" id="menuSend">입력</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<div id="companyList">

	</div>

</body>

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
									
									getMenuInfo();
								}
							});
						});
			});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		 getMenuInfo();
	});
	
	function getMenuInfo(){
		$.ajax({
			type : "get",
			url : "getMenuInfo",
			dataType : "json",
			success : function(menu) {
				console.log(menu);
				menuInfoPrint(menu);
			}
		});
	}

	function menuInfoPrint(menu) {
		var output = "";

		for (var i = 0; i < menu.length; i++) {
			output += "<br>";
			
			if(menu[i].muimg.includes('BS')){
				output += "<div class=\"row text-center borderOn\">";
				output += "<div class=\"col-2\"><div class=\"items\">";
				
				output += "<img style=\"width:150px; height:80px;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/"
							+ menu[i].muimg + "\">";
				output += "</div></div>";
			}else{
				output += "<div class=\"row text-center borderOn\">";
				output += "<div class=\"col-2\"><div class=\"items\">";
				
				output += "<img style=\"width:150px; height:80px;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/"
							+ menu[i].muimg + "\">";
				output += "</div></div>";
			}
			

			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">메뉴코드</span></div>";
			output += "<div class=\"items\">"+ menu[i].mucode +"</div></div>";
			
			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">이름</span></div>";
			output += "<div class=\"items\">"+ menu[i].muname +"</div></div>";
			
			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<span class=\"font-weight-bold\">가격</span></div>";
			output += "<div class=\"items\">"+ menu[i].muprice +"</div></div>";
			
			output += "<div class=\"col-1\"><div class=\"items\">";
			output += "<button type=\"button\" onclick=\"muModify('"+ menu[i].mucode +"')\">수정</button>&nbsp;";
			output += "<button type=\"button\" onclick=\"muDelete('"+ menu[i].mucode +"')\">삭제</button>";
			output += "</div><div class=\"items\">";
			
			if(menu[i].mustate == 0){
				output += "<button class=\"bc-blue c-white btn_width\" type=\"button\" onclick=\"stateChange(this,'"+ menu[i].mucode +"')\">활동중</button>";			
			}else{
				output += "<button class=\"bc-red c-white btn_width\" type=\"button\" onclick=\"stateChange(this,'"+ menu[i].mucode +"')\">활동중지</button>";
			}
			
			output += "</div></div></div>";
		}

		$("#companyList").html(output);
	}
</script>

<script type="text/javascript">
	function stateChange(selObj, mucode){
		
		if($(selObj).text() == "활동중"){
			$(selObj).text("활동중지");
			$(selObj).removeClass("bc-blue");
			$(selObj).addClass("bc-red");
			var mustate = '1';
		}else{
			$(selObj).text("활동중");
			$(selObj).removeClass("bc-red");
			$(selObj).addClass("bc-blue");
			var mustate = '0';
		}
		
		$.ajax({
			type : "get",
			url : "mustateModify",
			data : {"mucode" : mucode, "mustate" : mustate },
			async : false,
			success : function(result){
				console.log("success");
			}
		});
	}
	
	function muDelete(mucode){
		
		$.ajax({
			type : "get",
			url : "menuDelete",
			data : {"mucode" : mucode},
			async : false,
			success : function(result){
				console.log("success");
				getMenuInfo();
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