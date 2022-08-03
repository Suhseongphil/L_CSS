<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인 페이지</title>

<link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">
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

.coral {
	background-color: transparent;
}
</style>

</head>

<body>

	<%@ include file="../includes/TopBar.jsp"%>
	<div class="container">
		<div class="container">
			<div class="row">
				<%@ include file="../includes/MiddleBar.jsp"%>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-xl-5 col-lg-7 col-md-7">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<div class="margin coral">
							<div class="margin">
								<div class="p-5">
									<div class="text-center ">
										<h1 class="h4 text-gray-900 mb-4">로그인</h1>
									</div>
									<form class="user" method="post" action="memberLogin" onsubmit="return joinFormCheck();">
										<div class="form-group">
											<input type="text" class="form-control form-control-user" id="mid" name="mid" aria-describedby="emailHelp" placeholder="아이디를 입력해주세요..." autofocus="autofocus">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" id="mpw" name="mpw" placeholder="비밀번호를 입력해주세요...">
										</div>
										<button type="submit" class="btn text-white  btn-user btn-block" style="background-color: #000000;">로그인</button>
										<hr>
										<div>
											<a href="javascript:void(0)" id="kakaoLoginBtn" class="btn  btn-user btn-block"> 카카오 로그인 </a>
										</div>
									</form>
									<hr>
									<div class="atag">
										<a class="small" href="memberJoinPage">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
<script type="text/javascript">
	function joinFormCheck() {
		/* 아이디 입력 확인 */

		if ($("#mid").val().length == 0) {
			alert("아이디를 입력 해주세요!");
			$("#mid").focus();
			return false;
		}
		/* 비밀번호 입력 확인 */
		if ($("#mpw").val().length == 0) {
			alert("비밀번호를 입력 해주세요!");
			$("#mpw").focus();
			return false;
		}
	}
</script>
<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg);
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('64856a428ca540a734c1fe5835afab32'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
</script>

<script type="text/javascript">
	Kakao.Auth
			.createLoginButton({
				container : '#kakaoLoginBtn',
				size : 'large',
				success : function(response) {
					console.log(response);
					Kakao.API
							.request({
								url : '/v2/user/me',
								success : function(res) {
									console.log(res);
									console.log("res.id : " + res.id);
									console.log("res.kakao_account.email : "
											+ res.kakao_account.email);
									console
											.log("res.kakao_account.profile.nickname : "
													+ res.kakao_account.profile.nickname);
									console
											.log("res.kakao_account.profile.profile_image_url : "
													+ res.kakao_account.profile.profile_image_url);
									memberKakaoLogin(
											res.id,
											res.kakao_account.email,
											res.kakao_account.profile.nickname,
											res.kakao_account.profile.profile_image_url);
								},
								fail : function(error) {
									console.error(error)
								}
							});
				},
				fail : function(error) {
					console.log(error);
				},
			});
</script>
<script type="text/javascript">
	function memberKakaoLogin(mid, memail, mname, mprofile) {
		console.log(mid);
		console.log(memail);
		console.log(mname);
		console.log(mprofile);
		location.href = "memberKakaoLogin?mid=" + mid + "&memail=" + memail
				+ "&mname=" + mname + "&mprofile=" + mprofile;

	}
</script>

</html>