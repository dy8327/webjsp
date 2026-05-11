<%@ page contentType = "text/html; charset = utf-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Action Tag</title>
</head>
<body>
    <h3><%=request.getParameter("title") %></h3>
    Today is :<%=request.getParameter("date") %>
</body>
</html>