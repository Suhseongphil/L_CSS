<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 페이지</title>
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
.text-center h2 {
text-transform: uppercase;
	font-weight: 700;
	letter-spacing: 4px;
	color: black;
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
	<section class="featured spad">
	<div class="text-center">
		<h2>상품 정보 입력</h2>
	</div>
	<div class="container">
		<form action="productInsert" enctype="multipart/form-data">
			<div class="row cafeInsert">
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">상품이름</span>
					</div>
					<div class="items">
						<input type="text" id="pdname" name="pdname" placeholder="상품 이름">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">상품가격</span>
					</div>
					<div class="items">
						<input type="text" id="pdprice" name="pdprice" placeholder="가격">
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">상품타입</span>
					</div>
					<div class="items">
						
						<select id="pdtype" name="pdtype">
						<c:forEach items="${productType}" var="pdtype2">
						<option value="${pdtype2 }">${pdtype2}</option>
						</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">상품개수</span>
					</div>
					<div class="items">
					<input type="text" id="pdamount" name="pdamount" placeholder="상품 갯수">
					</div>
				</div>
						<input type="hidden" id="pdcmcode" name="pdcmcode"  value="${mycompanyInfo.cmcode }">
						



				<div class="col-2">
					<div class="items">
						<span class="font-weight-bold">상품 이미지</span>
					</div>
					<div class="items">

						<input type="file" id="pdimgs" name="pdimgs">
					</div>
				</div>
				<div class="col-2">
					<br> <br>
					<div class="items">
						<button type="button" id="menuSend" class="btn text-white" style="background-color: #000000; margin-left: 50px;">메뉴등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	</section>
	<hr>
	<section class="featured spad">
		<div class="text-center">
			<h2>상품 리스트</h2>
		</div>
		<div class="container" id="productList"></div>
	</section>


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
							var inputFile = $("input[name = 'pdimgs']");
							var files = inputFile[0].files;
							console.log(files);

							

							for (var i = 0; i < files.length; i++) {
								formData.append("pdimgs", files[i]);
							}
							formData.append("pdname", $("#pdname").val());
							formData.append("pdtype",
									$("#pdtype").val());
							formData.append("pdprice", $("#pdprice")
									.val());
							formData.append("pdamount", $("#pdamount")
									.val());
							formData.append("pdcmcode", $("#pdcmcode")
									.val());
							
							
							
							$.ajax({
								type : "POST",
								url : "productInsert",
								processData : false,
								contentType : false,
								data : formData,
								success : function(result) {
									console.log("업로드 성공");
									$("#pdname").val("");
									$("#pdtype").val("");
									$("#pdprice").val("");
									$("#pdcmcode").val("");
									$("#pdamount").val("");
									
									getMyProductInfo();
								}
							});
						});

			});

</script>

<script type="text/javascript">
	$(document).ready(function() {
		 getMyProductInfo();
	});
	
	function getMyProductInfo(){
		var pdcmcode = $("#pdcmcode").val();
		$.ajax({
			type : "get",
			url : "getMyProductInfo",
			data : {"pdcmcode" : pdcmcode},
			dataType : "json",
			success : function(product) {
				console.log(product);
				MyproductInfoPrint(product);
			}
		});
	}

	function MyproductInfoPrint(product) {
		var output = "";

		for (var i = 0; i < product.length; i++) {
			output += "<br>";
			

			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\">";
			if (product[i].pdimg != null) {
				/* console.log(i + "번 이미지 :" + company[i].cmimg.split("/")[1]); */
				if (product[i].pdimg.indexOf('http') == 0) {
				output += "<img style=\"width:150px; height:80px; margin-top:8%;\" alt=\"\" src=" + product[i].pdimg + ">";
					
				}else {
					output += "<img style=\"width:150px; height:80px; margin-top:8%;\" alt=\"\" src=\"${pageContext.request.contextPath }/resources/fileUpLoad/ProductFile/"
						+ product[i].pdimg + "\">";
				}
						
			} else {
				output += "<span style=\"margint:10px 30px 10px;\">이미지없음</span>";
			}
			output += "</div>";

			output += "<div class=\"col-7\"><div style=\"\">";
			output += "<span class=\"font-weight-bold\">상품코드 : </span>";
			output += "<span>" + product[i].pdcode + "</span><br>";
			output += "<span class=\"font-weight-bold\">상품이름 : </span>";
			output += "<span>" + product[i].pdname + "</span><br>";
			output += "<span class=\"font-weight-bold\">가격 : </span>";
			output += "<span>" + product[i].pdprice + "</span><br>";
			output += "<span class=\"font-weight-bold\">상품타입 : </span>";
			output += "<span>" + product[i].pdtype + "</span><br>";
			output += "<span class=\"font-weight-bold\">상품갯수 : </span>";
			output += "<span>" + product[i].pdamount + "</span>";
			output += "</div></div>";

			output += "<div class=\"col-2\"><div style=\"margin-top:20%;\">";
			output += "<button class=\"cafeMod-btn\" type=\"button\" onclick=\"pdModifyForm(this, '"
					+ product[i].pdcode + "')\">수정</button>&nbsp;";
			output += "<button class=\"cafeDelete-btn\" type=\"button\" onclick=\"pdDelete('"
					+ product[i].pdcode + "')\">삭제</button>";

			if (product[i].pdstate == 0) {
				output += "<button class=\"cafeStateMod-blue-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ product[i].pdcode + "')\">활동중</button>";
			} else {
				output += "<button class=\"cafeStateMod-red-btn\" type=\"button\" onclick=\"stateChange(this,'"
						+ product[i].pdcode + "')\">활동중지</button>";
			}

			output += "</div></div>";
			output += "</div>"; // 맨아래

			// ================================= 수정 =================================
			output += "<div id=\""+product[i].pdcode+"\" class=\"dp_none\">";
			output += "<div class=\"row cafeInsert\">"; // 맨위

			output += "<div class=\"col-3\"><span class=\"font-weight-bold\">메뉴이미지</span>";
			output += "<input type=\"file\" name=\"imgMod_"+product[i].pdcode+"\">";
			output += "</div>";

			output += "<div class=\"col-7\"><span class=\"font-weight-bold\">상품코드 : </span>";
			output += "<input style=\"border:none;\" class=\"input_width\" id=\"codeMod_"+product[i].pdcode+"\" readonly type=\"text\" value=\""+ product[i].pdcode +"\">";
			output += "<br><span class=\"font-weight-bold\">상품이름 : </span>";
			output += "<input class=\"input_width\" id=\"nameMod_"+product[i].pdcode+"\" type=\"text\" value=\""+ product[i].pdname +"\">";
			output += "&nbsp;<span class=\"font-weight-bold\">가격 : </span>";
			output += "<input class=\"input_width\" id=\"priceMod_"+product[i].pdcode+"\" type=\"text\" value=\""+ product[i].pdprice +"\">";
			output += "<br><span class=\"font-weight-bold\">상품타입 : </span>";
			output += "<input class=\"input_width\" id=\"menuMod_"+product[i].pdcode+"\" type=\"text\" value=\""+ product[i].pdtype +"\">";
			output += "<br><span class=\"font-weight-bold\">상품갯수 : </span>";
			output += "<input class=\"input_width\" id=\"amountMod_"+product[i].pdcode+"\" type=\"text\" value=\""+ product[i].pdamount +"\">";
			output += "</div>";

			output += "<div class=\"col-2\">";
			output += "<button class=\"productModInsert-btn\" type=\"button\" onclick=\"pdModify('"
					+ product[i].pdcode + "')\">수정완료</button>";
			output += "</div>";

			output += "<input type=\"hidden\" id=\"stateMod_"+product[i].pdcode+"\" value=\""+product[i].pdstate+"\">"

			output += "</div></div>"; // 맨아래

		}

		$("#productList").html(output);
	}
</script>

<script type="text/javascript">
	function stateChange(selObj, pdcode) {
		

		if ($(selObj).text() == "활동중") {
			$(selObj).text("활동중지");
			$(selObj).removeClass("cafeStateMod-blue-btn");
			$(selObj).addClass("cafeStateMod-red-btn");
			var pdstate = '1';
		} else {
			$(selObj).text("활동중");
			$(selObj).removeClass("cafeStateMod-red-btn");
			$(selObj).addClass("cafeStateMod-blue-btn");
			var pdstate = '0';
		}
		$.ajax({
			type : "get",
			url : "pdstateModify",
			data : {
				"pdcode" : pdcode,
				"pdstate" : pdstate,
			},
			async : false,
			success : function(result) {
				console.log("success");
			}
		});

	}


	function pdDelete(pdcode) {
		var pdimg = $("#pdimgs").val();
		$.ajax({
			type : "get",
			url : "productDelete",
			data : {
				"pdcode" : pdcode,
				"pdimg" : pdimg
			},
			async : false,
			success : function(result) {
				console.log("success");
				getMyProductInfo();
			}
		});
	}

	function pdModifyForm(selBtn, pdcode) {
		$("#" + pdcode).toggleClass("dp_none");

		if ($(selBtn).text() == "수정") {
			$(selBtn).text("접기");
		} else {
			$(selBtn).text("수정");
		}
	}

	function pdModify(pdcode) {
		var formData = new FormData();
		var inputFile = $("input[name = 'imgMod_" + pdcode + "']");
		var files = inputFile[0].files;
		for (var i = 0; i < files.length; i++) {
			formData.append("pdimgs", files[i]);
		}
		console.log(files)
		formData.append("pdcode", $("#codeMod_" + pdcode).val());
		formData.append("pdname", $("#nameMod_" + pdcode).val());
		formData.append("pdprice", $("#priceMod_" + pdcode).val());
		formData.append("pdtype", $("#menuMod_" + pdcode).val());
		formData.append("pdstate", $("#stateMod_" + pdcode).val());
		formData.append("pdamount", $("#amountMod_" + pdcode).val());

		$.ajax({
			type : "POST",
			url : "MypdModify",
			processData : false,
			contentType : false,
			data : formData,
			success : function(result) {
				console.log("업로드 성공");
				getMyProductInfo();
			}
		});
	}
</script>


</html>