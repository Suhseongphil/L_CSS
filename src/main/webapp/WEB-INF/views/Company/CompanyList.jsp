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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/handmade.css" type="text/css">
<style>

  .box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
  }
  .item display{
  	display: flex;
  	flex-direction: column;
  	
  }
  .item{
  padding-bottom: 30px;
  }
  .px{
  padding-bottom: 30px;
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
    <h3>업체 목록</h3>
    
  </div>
  
	<div class="item display">
	<c:forEach items="${selestCompanyList}" var="comList">
  	<div class="row px">
	<c:choose>
	<c:when test="${comList.cmimg == null }">
	    <img  alt="" style="width: 200px; padding-right: 30px; padding-left: 30px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS011.png">
	</c:when>
	<c:otherwise>
    <img alt="" style="width: 200px; padding-right: 30px; padding-left: 30px;" src="${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/${comList.cmimg.split('/')[1]}">
	</c:otherwise>
	</c:choose>
    <img class="img-responsive" alt="" src="./assets/images/img-12.jpg">
  	
  	<div class="item">
    <h2>${comList.cmname }</h2>
    <p>주소 : ${comList.cmaddress }</p>
    <p>${comList.cmtel }</p>
    <a href="./contact.html" class="btn btn-primary" title="">상세보기</a>
	</div>
  	</div>
	</c:forEach>
		<div style="font-size: 20px;">
  		<c:choose>
       			
       				<c:when test="${pagedto.page <= 1 }">
       					[이전]
       				</c:when>
       			
       				<c:otherwise>	
       						<a href="companyList?page=${pagedto.page - 1}">[이전]</a>
       				</c:otherwise>
       			
       			</c:choose>
       			
       			<c:forEach begin="${pagedto.startPage }" end="${pagedto.endPage }" var="num" step="1">
       				<c:choose>
       					<c:when test="${pagedto.page == num }">
       							<span style="font-size:20px;">${num }</span>
       					</c:when>
       					
       					<c:otherwise>
       					
			       				<a href="companyList?page=${num}"> ${num } </a>&nbsp;&nbsp;
       					</c:otherwise>
       				</c:choose>
       			</c:forEach>
       			
       			<c:choose>
       			
       				<c:when test="${pagedto.page >= pagedto.maxPate }">
       					[다음]
       				</c:when>
       			
       				<c:otherwise>	
       						<a href="companyList?page=${pagedto.page + 1}">[다음]</a>
       				</c:otherwise>
       			
       			</c:choose>
       			</div>
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