<%@ page contentType = "text/html; charset = utf-8" pageEncoding="UTF-8" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.io.*" %>
<%@ page import="jakarta.servlet.http" %>
<%@ page import="java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String realFolder = request.getServletContext().getRealPath("/resources/images");

    File dir = new File(realFolder);
    if(!dir.exists()){
        dir.mkdirs();
    }
    String bookId=request.getParameter("bookId");
    String name=request.getParameter("name");
    String unitPrice=request.getParameter("unitPrice");
    String author=request.getParameter("author");
    String publisher=request.getParameter("publisher");
    String releaseDate=request.getParameter("releaseDate");
    String description=request.getParameter("description");
    String category=request.getParameter("category");
    String unitsInStock=request.getParameter("unitsInStock");
    String condition=request.getParameter("condition");

    Integer price;
    if(unitPrice.isEmpty())
        price=0;
    else
        price=Integer.valueOf(unitPrice);

    long stock;
    if(unitsInStock.isEmpty())
        stock=0;
    else
        stock=Long.valueOf(unitsInStock);

    //파일 업로드 처리
    String fileName="";
    Part Part=request.getPart("bookImage");
    if (Part != null && Part.getSubmittedFileName() != null && !Part.getSubmittedFileName().isEmpty()) {
        fileName = Paths.getSubmitFilename();
        part.write(realFolder + File.separator + fileName);
    }

    BookRepository dao=BookRepository.getInstance();

    Book newBook = new Book();
    newBook.setBookId(bookId);
    newBook.setName(name);
    newBook.setUnitPrice(price);
    newBook.setAuthor(author);
    newBook.setDescription(description);
    newBook.setPublisher(publisher);
    newBook.setCategory(category);
    newBook.setUnitsInStock(stock);
    newBook.setReleaseDate(releaseDate);
    newBook.setCondition(condition);
    newBook.setFileName(fileName);

    dao.addBook(newBook);

    response.sendRedirect("books.jsp");
    %>
