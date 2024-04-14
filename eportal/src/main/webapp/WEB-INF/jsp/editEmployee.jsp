<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.ctbc.eportal.model.Employee"%>
<%@ page import="java.util.List"%>
<html>
<head>
<title>所有員工</title>
</head>
<body>
	<h2>所有員工</h2>
	<table border="1">
		<thead>
			<tr>
				<th>姓名</th>
				<th>信箱</th>
				<th>性別</th>
				<th>部門</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Employee> employees = (List<Employee>) request.getAttribute("employees");
			for (int i = 0; i < employees.size(); i++) {
				Employee employee = employees.get(i);
			%>
			<tr>
				<td><%=employee.getName()%></td>
				<td><%=employee.getEmail()%></td>
				<td><%=employee.getSex() == 1 ? '男' : '女'%></td>
				<td><%=employee.getDepartment().getName()%></td>
				<td>
					<form action="${pageContext.request.contextPath}/edit/delete"
						method="post">
						<input type="hidden" name="id" value="<%=employee.getId()%>">
						<input type="submit" value="刪除">
					</form>
				</td>
				<td>
					<form action="${pageContext.request.contextPath}/edit/update"
						method="post">
						<input type="hidden" name="id" value="<%=employee.getId()%>">
						<input type="submit" value="更新">
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<nav>
		<ul>
			<li><a href="./">Home</a></li>
		</ul>
	</nav>
</body>
</html>