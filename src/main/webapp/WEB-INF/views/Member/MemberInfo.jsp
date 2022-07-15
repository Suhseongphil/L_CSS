<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
 .imgClass {
    width: 300px;
    height: 300px; 
    border-radius: 70%;
    overflow: hidden;
  }
</style>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">카페</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">업체</a></li>
                <li><a href="./contact.html">공동구매</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <%@ include file ="../includes/TopBar.jsp" %>
       
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
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                  	
                    <div class="hero__item set-bg" >
                        <div class="hero__text2">
                            <span>내정보</span> <br> <br>           
                            <p>아이디&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mid } </p>
                            <p>이름&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mname }</p>
                            <p>이메일&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.memail }</p>
                            <p>우편번호&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mpostercode }</p>
                            <p>주소&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.maddr }<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${memberInfo.maddr2 }</p>
           					<button type="button" id="show" class="btn btn-primary">정보수정</button>
                        </div>
                        <div class="background">
                        	<div class="window">
                        		<div class="popup">
                        		<p>아이디&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mid } </p>
                            	<p>이름&nbsp;&nbsp;:&nbsp;&nbsp;${memberInfo.mname }</p>
                        		<button type="button" id="save" class="btn btn-primary">정보수정</button>
                        		<button type="button" id="close" class="btn btn-primary">취소</button>
                        		</div>
                        	</div>
                        </div>
                        
                    </div>
                    
                    
                </div>
                 <div class="col-lg-5">
                  	
                    <div class="hero__item set-bg" >
                        <div class="hero__text">
                           <img class="imgClass" alt="" src="${pageContext.request.contextPath }/resources/fileUpLoad/MemberFrofile/${memberInfo.mprofile}">
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
    </section>
    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    
    <!-- Featured Section End -->

    <!-- Banner Begin -->
  
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
   
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
   
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <h2>L&CSS</h2>
                        </div>
                        <ul>
                            <li>회사주소: 인천일보아카데미</li>
                            <li>전화번호: 032-111-1111</li>
                            <li>이메일 :  #</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>프로젝트</h6>
                        <ul>
                            <li><a href="#">팀장 : 서성필</a></li>
                            <li><a href="#">엔지니어 : 송영오</a></li>
                            <li><a href="#">엔지니어 : 천호태</a></li>
                            <li><a href="#">엔지니어 : 이상윤</a></li>
                            
                        </ul>
                     
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                       
                        <a href="InquirePage">고객문의</a>
                        
                       
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

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
	if(checkMsg.length > 0){
		alert(checkMsg);
	}
	
</script>

<script>
function show () {
	  document.querySelector(".background").className = "background show";
	}

	function close () { 
	  document.querySelector(".background").className = "background";
	}

	document.querySelector("#show").addEventListener('click', show);
	document.querySelector("#close").addEventListener('click', close);
</script>


</html>