<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Employee Details</title>
</head>
<body>
	<h2>新增員工成功</h2>
	<p>員工姓名: ${employees.name}</p>
	<p>信箱: ${employees.email}</p>
	<p>性別: ${employees.sex == 1 ? '男' : '女'}</p>
	<p>部門: ${employees.department.name}</p>
	<nav>
		<ul>
			<li><a href="../">Home</a></li>
		</ul>
	</nav>
</body>
</html>