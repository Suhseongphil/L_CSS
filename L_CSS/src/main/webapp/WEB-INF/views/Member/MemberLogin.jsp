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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
    <style type="text/css">
    .margin {
    margin : auto;
    }
    .atag{
    text-align:center;
    padding: 10px;
    }
    .bord{
    padding: 10px;
    }
    .coral {
    background-color:transparent;
    }
    </style>

</head>

<body>
	
 <%@ include file ="../includes/TopBar.jsp" %>
    <div class="container">
        <!-- Outer Row -->
        <div class="row justify-content-center"   >

            <div class="col-xl-5 col-lg-7 col-md-7">
                <div class="card o-hidden border-0 shadow-lg my-5">

                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="margin coral">
                            <div class="margin">
                                <div class="p-5">
                                    <div class="text-center ">
                                        <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                                    </div>
                                    <form class="user" method="post" action="memberLogin">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="mid" name="mid" aria-describedby="emailHelp"
                                                placeholder="아이디를 입력해주세요...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="mpw" name="mpw" placeholder="비밀번호를 입력해주세요...">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">
                                            로그인
                                        </button>
                                        <hr>
                                        <div class="row">
                                        <div class="col-6">
                                        <a href="index.html" class="btn btn-danger btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> 카카오 로그인
                                        </a>
                                        </div>
                                        <div class="col-6">
                                        <a href="index.html" class="btn btn-danger btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> 네이버 로그인
                                        </a>
                                        </div>
                                        </div>
                                    </form>
                                    <hr>
                                    <div class="atag">
                                        <a class="small" href="#">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  	
                                        <a class="small" href="MemberJoin">회원가입</a>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

</body>
<script type="text/javascript">
	var checkMsg = '${msg}'
	if(checkMsg.length > 0){
		alert(checkMsg);
	}
	
</script>
</html>