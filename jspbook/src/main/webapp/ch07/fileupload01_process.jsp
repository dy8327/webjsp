서블릿 표준 api 사용 파일 업로드
<%@ page contentType = "text/html; charset = utf-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*,java.util.*,jakarta.servlet.http.*" %>
<%
    //저장경로 설정
    String savePath = "C:\\upload";
    File uploadDir = new File(savePath);
    if(!uploadDir.exists()) uploadDir.mkdir();

    //일반 파라미터 읽기
    String title = request.getParameter("subject");
    out.print("<br>제목: "+ title +"<br>");

    //파일 데이터 처리
    Collection<Part> parts = request.getParts();
    for(Part part : parts){
        if(part.getContentType() != null){ //파일인 경우
            String fileName = part.getSubmittedFileName();
            if(fileName != null && !fileName.isEmpty()){
                part.write(savePath + File.separator + fileName);
                out.print("파라미터명: "+part.getName()+"<br>");
                out.print("파일명: "+fileName+"<br>");
                out.print("크기: "+part.getSize()+"bytes<br>");
            }
        }
    }
%>