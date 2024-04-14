<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.ctbc.eportal.model.Employee"%>
<%@ page import="com.ctbc.eportal.model.Department"%>
<%@ page import="java.util.List"%>
<html>
<head>
    <title>更新員工</title>
</head>
<body>
    <h2>更新員工資料</h2>
    <form action="${pageContext.request.contextPath}/edit/save" method="post">
        <input type="hidden" name="id" value="${employee.id}">
        <label for="name">姓名:</label>
        <input type="text" id="name" name="name" value="${employee.name}"><br>
        <label for="email">信箱:</label>
        <input type="text" id="email" name="email" value="${employee.email}"><br>
        <label for="sex">性別:</label>
        <input type="text" id="sex" name="sex" value="${employee.sex}"><br>
        <label for="department">部門:</label>
        <select id="department" name="department">
            <%            
            List<Department> departments = (List<Department>) request.getAttribute("departments");
            if (departments != null) {
                for (Department department : departments) {
            %>
            <option value="<%=department.getId()%>"><%=department.getName()%></option>
            <% }
            }
            %>
        </select>
        <input type="submit" value="保存">
    </form>
</body>
</html>