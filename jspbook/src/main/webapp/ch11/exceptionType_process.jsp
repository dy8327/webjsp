<%@ page contentType = "text/html; charset = utf-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Exception Error</title>
</head>
<body>
    <%
     String num1=request.getParameter("num1");
     String num1=request.getParameter("num2");
     int a=Integer.parseInt(num1);
     int b=Integer.parseInt(num2);
     int c=a/b;
     out.print(num1+"/"+num2+"="+c);
     %>
</body>
</html>