<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>목록</span>
                        </div>
                        <ul>
                            <li><a href="#">상품</a></li>
                            <li><a href="#">카페</a></li>
                            <li><a href="#">업체</a></li>
                            <li><a href="#">공동구매</a></li>
                            <li><a href="InquirePage">고객문의</a></li>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    검색
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="검색할 내용..">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                           
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath }/resources/img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>FRUIT FRESH</span>
                            <h2>Vegetable <br />100% Organic</h2>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="#" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
</body>
</html>