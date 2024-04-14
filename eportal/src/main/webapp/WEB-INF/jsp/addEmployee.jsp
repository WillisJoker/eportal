<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.ctbc.eportal.model.Department"%>
<%@ page import="java.util.List"%>
<html>
<head>
    <title>新增員工</title>
</head>
<body>
    <h2>新增員工</h2>
    <form action="${pageContext.request.contextPath}/employee/add" method="post">
        <label for="name">姓名:</label>
        <input type="text" id="name" name="name"><br>
        
        <label for="email">信箱:</label>
        <input type="text" id="email" name="email"><br>
        
        <label for="sex">性別:</label>
        <select id="sex" name="sex">
            <option value="1">男</option>
            <option value="2">女</option>
        </select><br>
        
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
        </select><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>