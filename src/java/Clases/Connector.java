package Clases;

import java.sql.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Alumno
 */



public class Connector {
    
    public static Connection conectarBaseDatos() {
        Connection conn = null; //Instancia de Tipo conexion
        String user = "root"; // Nombre de Usuario para el acceso a la base de datos
        String pass = "n0m3l0"; // ContraseÃ±a del Usuario para el acceso a la base de datos
        String baseDatos ="login"; // Nombre de la base de datos
        String autoReconnect = "true"; // Permite autoreconectarse
        String publicKey = "true"; //Permite recuperaciÃ³n de llave Publica
        String useSSL = "false"; //Usa Certificado de seguridad  
        
        //Carga del Driver jdbc
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        } catch (Exception ex) {
            // Manejador de errores
            System.out.println("Mensaje: " + ex.getMessage());
            ex.getMessage();
        }
        
        //Establece la conexiÃ³n a la Base de Datos indicada
        try {
           //conn = DriverManager.getConnection("jdbc:mysql://localhost/"+baseDatos+"?user="+user+"&password="+pass+"&autoReconnect=true&allowPublicKeyRetrieval=true&useSSL=false");
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+baseDatos+"?user="+user+"&password="+pass+"&autoReconnect="+autoReconnect+"&allowPublicKeyRetrieval="+publicKey+"&useSSL="+useSSL);
        } catch (SQLException ex) {
        // Manejador de errores
        System.out.println("--------> ExcepciÃ³n SQL: " + ex.getMessage());
        System.out.println("--------> Estado SQL: " + ex.getSQLState());
        System.out.println("--------> Error del Proveedor: " + ex.getErrorCode());
        
        }
        return conn;
    }
    
}
