<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<head>
  <meta charset="UTF-8">
  <meta content="IE=edge" http-equiv="X-UA-Compatible">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <meta content="description" name="description">
  <meta name="google" content="notranslate" />
  <meta content="Mashup templates have been developped by Orson.io team" name="author">

  <!-- Disable tap highlight on IE -->
  <meta name="msapplication-tap-highlight" content="no">
  
  



  <title>Title page</title>  

<link href="${pageContext.request.contextPath }/resources/css/main.82cfd66e.css" rel="stylesheet"></head>
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
<style>

  .box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
  }
  .display{
  display: flex;
  }
  .flex-item{
  			width: 30%;
            height: 30%;
            margin: 10px;
  }
  </style>
<body>

 <!-- Add your content of header -->
<header class="">
  <div class="navbar navbar-default visible-xs">
    <button type="button" class="navbar-toggle collapsed">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a href="./index.html" class="navbar-brand">Mashup Template</a>
  </div>

  <nav class="sidebar">
    <div class="navbar-collapse" id="navbar-collapse">  
      

     
    </div> 
  </nav>
</header>
<main class="" id="main-collapse">
  <%@ include file ="../includes/TopBar.jsp" %>
<div class="row">
 <%@ include file ="../includes/MiddleBar.jsp" %>
  <div class="col-xs-12 section-container-spacer">
    <h3>카페 목록</h3>
    
  </div>
  <div class="display">
<%@ include file ="../includes/SideBar.jsp" %>
	<table>
	
	<c:forEach items="${selectCafeList}" var="caList">
  	<tr >
  		<td style="padding-bottom: 30px;">
  		<c:choose>
  		<c:when test="${caList.cfimg == null}">
  		 <img alt="" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS010.png">
  		</c:when>
  		<c:otherwise>
    <img alt="" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/${caList.cfimg.split('/')[1]}">
  		</c:otherwise>
  		</c:choose>
  		</td>
  		<td>
    	<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${caList.cfname }</h4>
    	
  		</td>
  		<td>
   			 <p>주소 : ${caList.cfaddress } / 대표메뉴</p>
   			 <p>${caList.cftel }</p>
  		</td>
  		<td>
  		<div class="flex-item">
   	 	<img class="img-responsive" alt="" src="./assets/images/img-12.jpg">
   		 <a href="./contact.html" class="btn btn-primary" title="">상세보기</a>
	</div>
  		
  		</td>
  	</tr>
  	
  	
  	
	</c:forEach>
	</table>
  	</div>

</div>



</main>

<script>
document.addEventListener("DOMContentLoaded", function (event) {
  navbarToggleSidebar();
  navActivePage();
});
</script>

<script type="text/javascript" src="./main.85741bff.js"></script></body>

</html>