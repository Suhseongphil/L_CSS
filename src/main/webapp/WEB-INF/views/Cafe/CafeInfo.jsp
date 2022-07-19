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
                        <c:when test="${cafeInfo.cfimg}">
                        </c:when>
                        <c:otherwise>
                        <img style="width: 50%" src="${pageContext.request.contextPath }/resources/fileUpLoad/CafeFile/${cafeInfo.cfimg}" alt="">
                        </c:otherwise>
                        
                        </c:choose>
                        <p>${cafeInfo.cfname}</p>
                        <h3>${cafeInfo.cftel}</h3>
                        <p>${cafeInfo.cfaddress}</p>
                    </div>
                    <div class="blog__details__content">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>