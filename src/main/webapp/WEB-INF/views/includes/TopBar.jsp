<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                
                              
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                           
                           	<div class="header__top__right__auth">
                                <a href="admin"><i class="fa fa-user"> </i> 관리자 </a>&nbsp;&nbsp;&nbsp;
                            </div>
                            
                            <div class="header__top__right__auth">
                                <a href="main"><i class="fa fa-user"> </i> 메인 </a>&nbsp;&nbsp;&nbsp;
                               
                            </div>
                            <c:choose>
                            <c:when test="${sessionScope.loginId == null }">
                            <div class="header__top__right__auth">
                                <a href="memberLoginPage"><i class="fa fa-user"> </i> 로그인 </a>&nbsp;&nbsp;&nbsp;
                               
                            </div>
                            <div class="header__top__right__auth">
                               <a href="memberJoinPage"> <i class="fa fa-user"></i> 회원가입 </a>&nbsp;&nbsp;&nbsp;
                               
                            </div>
                            </c:when>
                            <c:otherwise>
                                <div class="header__top__right__auth">
                                <a href="myInfo"><i class="fa fa-user"> </i> 내정보 </a>&nbsp;&nbsp;&nbsp;
                               
                            </div>
                            <div class="header__top__right__auth">
                               <a href="memberLogout"> <i class="fa fa-user"></i> 로그아웃 </a>&nbsp;&nbsp;&nbsp;
                               
                            </div>
                            </c:otherwise>
                            </c:choose>
                           
                            <div class="header__top__right__auth">
                               <a href="myCart"> <i class="fa fa-user"></i> 장바구니 </a>&nbsp;&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>