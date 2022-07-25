<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Board/BoardFail.jsp</h2>
	<h2>${param.msg }</h2>
</body>
<script type="text/javascript">
	var checkMsg = '${param.msg }';
	alert(checkMsg);
	history.back();
</script>
</html>