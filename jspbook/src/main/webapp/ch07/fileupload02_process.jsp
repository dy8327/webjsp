<%@ page contentType = "text/html; charset = utf-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,jakarta.servlet.http.*" %>
<html>
<head>
<title>File upload Standard API</title>
</head>
<body>
<%
    //1.저장 경로 설정 및 폴더 생성
    String savePath = "C:\\upload";
    File uploadDir = new File(savePath);
    if(!uploadDir.exists()) uploadDir.mkdir();

    //2.일반 텍스트 파라미터 읽기
    //web.xml에 multipart-config 설정이 되어 있어야 정상적으로 읽힙니다.
    String name1 = request.getParameter("name1");
    String subject1 = request.getParameter("subject1");

    String name2 = request.getParameter("name2");
    String subject2 = request.getParameter("subject2");

    String name3 = request.getParameter("name3");
    String subject3 = request.getParameter("subject3");

    //3.파일처리(Part객체 사용)
    //각 파일의 'name' 속성값(file1, file2, file3)으로 직접 접근한다.

    String filename1 = "";
    Part part1 = request.getPart("filename1");
    if(part1 != null && part1.getSubmittedFileName() != null && !part1.getSubmittedFileName().isEmpty()){
        filename1=part1.getSubmittedFileName();
        part1.write(savePath+File.separator+filename1);
    }

    String filename2 = "";
    Part part2 = request.getPart("filename2");
    if(part2 != null && part2.getSubmittedFileName() != null && !part2.getSubmittedFileName().isEmpty()){
        filename2=part2.getSubmittedFileName();
        part2.write(savePath+File.separator+filename2);
    }

    String filename3 = "";
    Part part3 = request.getPart("filename3");
    if(part3 != null && part3.getSubmittedFileName() != null && !part3.getSubmittedFileName().isEmpty()){
        filename3=part3.getSubmittedFileName();
        part3.write(savePath+File.separator+filename3);
    }
%>

<table border="1">
    <tr>
        <th width="100">이름</th>
        <th width="100">제목</th>
        <th width="100">파일</th>
    </tr>
    <tr>
        <td><%=name1 %></td>
        <td><%=subject1 %></td>
        <td><%=filename1 %></td>
    </tr>
    <tr>
        <td><%=name2 %></td>
        <td><%=subject2 %></td>
        <td><%=filename2 %></td>
    </tr>
    <tr>
        <td><%=name3 %></td>
        <td><%=subject3 %></td>
        <td><%=filename3 %></td>
    </tr>
</table>

</body>
</html>