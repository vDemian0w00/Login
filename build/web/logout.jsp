<%-- 
    Document   : logout
    Created on : 31/08/2022, 03:36:16 AM
    Author     : demia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<%

HttpSession ses= request.getSession();

ses.invalidate();
response.sendRedirect("./index.jsp");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
