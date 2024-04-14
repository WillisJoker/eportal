<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Department</title>
</head>
<body>
	<h1>新增部門</h1>
	<form action="${pageContext.request.contextPath}/department/add"
		method="post">
		部門名稱: <input type="text" name="name"> <input type="submit"
			value="Submit">
	</form>

</body>
</html>