<%-- 
    Document   : guardar
    Created on : 2/05/2021, 10:49:49 AM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="./css/General.css"/>
    </head>
    <body>
        <main>
            <header> 
                <nav class="navegacion" style="width: 100%;">
                    <ul class="menu">
                        <li class="logo"><a href="index.html"><img src="./img/logo.png"></a></li>
                        <li><a href="login.html">Log in</a></li>
                        <li><a href="registrarUsuario.html">Sign in</a></li>
                    </ul>
                </nav>
            </header>
            
            <%
               Connection con = null;
               Statement set = null;
               ResultSet rs = null;
               
               String url, userName, password, driver;
               
               url = "jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_5a49af62a75744f";
                userName = "b3be4caf7283ff";
                password = "d8f5d01c";
               
               driver = "com.mysql.jdbc.Driver";
               
               try{
                   Class.forName(driver);
                   con = DriverManager.getConnection(url, userName, password);
                   
                   try{
                       set = con.createStatement();
                       
                       String correo, nombre, contrasena, cod, q;
                       boolean tipo;
                       
                       correo = request.getParameter("correo");
                       nombre = request.getParameter("nombre");
                       contrasena = request.getParameter("contrasena");
                       cod = request.getParameter("codigo");
                       
                       q = "insert into musuarios(correo_usu, nom_usu, cont_usu, admin) "
                               + "values ( '"+correo+"', '"+nombre+"','"+contrasena+"',";
                       if(cod.isEmpty()){
                           q += "'"+0+"')";
                           tipo = false;
                       }else{
                           q += "'"+1+"')";
                           tipo = true;
                       }
                       
                       int registro = set.executeUpdate(q);
                       %>
                       <h2>Registro Existoso</h2>
                       <%
                       out.println("<p>Correo: "+correo+"</p>");
                       out.println("<p>Nombre: "+nombre+"</p>");
                       if(tipo){
                           out.println("<p>Bienvenido nuevo adminsitrador</p>");
                       }else{
                           out.println("<p>Bienvenido nuevo usuario</p>");
                       }
                       set.close();
                   }catch(SQLException ed){
                       System.out.println("Error al registrar en la tabla");
                       System.out.println(ed.getMessage());
                       if(ed.getMessage().contains("Duplicate entry")){
                          out.println("<h1>Correo ya registrado, usar uno nuevo</h1>");
                       }else{
                          out.println("<h1>Error en la lectura de la tabla</h1>");
                       }
                   }
                   con.close();
               }catch(Exception e){
                    System.out.println("Error al conectar databse");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                    %>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <h2>Sitio en Construccion</h2>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <%
               }
            %>
            
        </main>
        <div id="footer">
            <table class="pie">
                <tr>
                    <h4>Integrantes</h4>
                </tr>
                <tr></tr>
                <tr>
                    <h4>Cesar Patiño</h4>
                </tr>
                <tr></tr>
                <tr>
                <h4>Ramirez Aranda Dante Israel </h4>
                </tr>
                <tr></tr>
                <tr>
                    <h4>Vilchis Cuevas Joaquin Ignacio </h4>
                </tr>
            </table>
        </div>
    </body>
</html>
