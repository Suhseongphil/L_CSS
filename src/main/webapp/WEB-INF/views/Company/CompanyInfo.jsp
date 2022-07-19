<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="blog-details spad">
        <div class="container">
            <div class="row">
             
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <c:choose>
                        <c:when test="${comInfo.cmimg == null }">
                        <img alt="" style="width: 50%;" src="${pageContext.request.contextPath }/resources/fileUpLoad/MenuFile/BasicMenu/BS011.png">
                        </c:when>
                        <c:otherwise>
                        <img style="width: 50%;" src="${pageContext.request.contextPath }/resources/fileUpLoad/CompanyFile/${comInfo.cmimg}" alt="">
                        </c:otherwise>
                        
                        </c:choose>
                        <p>${comInfo.cmname}</p>
                        <h3>${comInfo.cmtel}</h3>
                        <p>${comInfo.cmaddress}</p>
                    </div>
                    <div class="blog__details__content">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
             <c:forEach items="${proInfo }" var="pdList"  begin="0" end="5">
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        
                        <img style="width: 150px;" src="${pdList.pdimg }" alt="">

                        <p>${pdList.pdname }</p>
                        <h3>${pdList.pdprice }</h3>
                        <p>${pdList.pdtype }</p>
                    </div>
                    <div class="blog__details__content">
                        
                    </div>
                </div>
             </c:forEach>
            </div>
        </div>
    </section>
</body>
</html>