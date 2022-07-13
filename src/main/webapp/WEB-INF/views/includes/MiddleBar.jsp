<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Edu+TAS+Beginner&family=Gowun+Batang:wght@700&family=Hahmlet:wght@700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	.h2{
		font-family: 'Edu TAS Beginner', cursive;
		font-family: 'Gowun Batang', serif;
		font-family: 'Hahmlet', serif;
		font-family: 'Nanum Pen Script', cursive;
	}
</style>
</head>

<body>
	   <div class="col-lg-3">
                    <div class="header__logo" style="text-align:center;"> 
                        <h2 style="font-size:50px;">L&CSS</h2>
                    </div>
                </div>
                
                <div class="col-lg-6">
                    <nav class="header__menu">
                    	
                        <ul>
                        	 
                            <li class="active"><a href="./index.html">메인</a></li>
                            <li><a href="./shop-grid.html">상품</a></li>
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
                </div> 
</body>
</html>