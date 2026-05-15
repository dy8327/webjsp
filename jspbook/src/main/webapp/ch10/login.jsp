<%@ page contentType = "text/html; charset = utf-8" pageEncoding="UTF-8" %>
<html>
<head>
<title>Security</title>
</head>
<body>
    <form name="loginForm" action="j_security_check" method="post">
    <!-- action은 서블릿에서 지원하는 것으로 오타 절대안됨. mothod는 무조건 post방식-->
        <p> 사용자명 : <input type="text" name="j_username">
        <p> 비밀번호 : <input type="password" name="j_password">
        <p> <input type="submit" value="전송">
    </form>
</body>
</html>