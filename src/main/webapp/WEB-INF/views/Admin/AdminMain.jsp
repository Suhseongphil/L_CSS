<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>
<style>
.container {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	background-color: tan;
}

.items {
	flex-basis: auto;
	margin-top: 5px;
	margin-bottom: 5px;
}

.box {
	display: block;
}

.borderOn {
	border: solid 1px black;
}
.bc-white{
	background-color: white;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/sb-admin-2.css" type="text/css">
</head>

<body>
	<div class="text-center">
		<h1>관리자페이지</h1>
	</div>
	<div class="box">
		<form action="insertCompanyInfo" method="post" enctype="multipart/form-data" onsubmit="">
			<div class="container text-center borderOn bc-white">
				<div class="col-6">
					<div class="items">
						<a href="admincompanyInsert">회사정보 입력페이지</a>
					</div>
				</div>
				<div class="col-6">
					<div class="items">
						<a href="admincafeInsert">카페정보 입력페이지</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>

</html>