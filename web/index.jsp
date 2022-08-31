<%-- 
    Document   : login
    Created on : 23/08/2022, 08:12:21 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

    HttpSession ses = request.getSession();
    if(ses.getAttribute("ses")!=null){
        response.sendRedirect("./bienvenida.jsp");
    }
    
String error = (String)request.getAttribute("error");

%>


<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Log in</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="login-page">
  <div class="form">
      <h1><%if (request.getAttribute("error")!=null){out.println(error);}%></h1>
    <form class="login-form" action="login.jsp">
      <input type="enail" placeholder="Correo" name="email"/>
      <input type="password" placeholder="Contraseña" name="password"/>
      <button>login</button>
    </form>
  </div>
</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>

</body>
</html>