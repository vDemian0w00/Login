<%-- 
    Document   : bienvenida
    Created on : 23/08/2022, 08:37:22 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>

<%

    HttpSession ses = request.getSession();
    
    if(ses.getAttribute("ses")==null){
    response.sendRedirect("./index.jsp");
    }
    
    String correo=(String)ses.getAttribute("correo");
    String contra = (String)ses.getAttribute("contra");
    String rol = (String)ses.getAttribute("rol");

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenida</title>
    </head>
    <body>
        <h1>
            Sesion iniciada con éxito<br>
            Correo: <%=correo%><br>
            Contraseña: <%=contra%><br>
            Tu rol es de: <%=rol%>
        </h1>
        <a href="./logout.jsp">Cerrar sesión</a>
    </body>
</html>
