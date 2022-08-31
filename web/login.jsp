<%-- 
    Document   : login
    Created on : 23/08/2022, 08:16:29 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.Connection, java.sql.ResultSet, java.sql.Statement, Clases.Connector" session="true"%>
<!DOCTYPE html>

<%

    HttpSession ses = request.getSession();
    if(ses.getAttribute("ses")!=null){
        response.sendRedirect("./bienvenida.jsp");
    }
    
    String correo = request.getParameter("email");
    String contraseña = request.getParameter("password");

    Connection conn = Connector.conectarBaseDatos();
    Statement st = null;
    ResultSet rs = null;
    try{
        st = conn.createStatement();
        String query="select * from users where user_mail='"+correo+"';";
        rs=st.executeQuery(query);
        boolean sihay = false;
        
        if(rs.next()){
        out.println("entra");
            do{
                String DBcorreo=rs.getString("user_mail");
                String DBcontraseña=rs.getString("user_password");
                int id = rs.getInt("user_id");
                boolean co = (DBcorreo.equals(correo))&&(DBcontraseña.equals(contraseña));
                out.println(co);
                if(co){
                    ses.setAttribute("id", id);
                    ses.setAttribute("ses", "si");
                    ses.setAttribute("correo",DBcorreo);
                    ses.setAttribute("contra", DBcontraseña);
                    
                    rs=st.executeQuery("select rol_tipo from users, rol where users.rol_id=rol.rol_id and user_id="+id+";");
                    String rol = "";
                    if(rs.next()){rol=rs.getString("rol_tipo");}
                    ses.setAttribute("rol", rol);
                    
                    response.sendRedirect("bienvenida.jsp");
                    sihay=true;
                    break;
                }
            }while(rs.next());
            if(!sihay){
            request.setAttribute("error", "Introduzca una contraseña o correo correctos");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
    }
        }else{
            request.setAttribute("error", "Introduzca una contraseña o correo correctos");
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        
    }
    }catch(Exception e){
        out.println(e);
    }

%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=correo%><br><%=contraseña%></h1>
    </body>
</html>
