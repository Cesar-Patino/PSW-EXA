<%-- 
    Document   : iniciar
    Created on : 2/05/2021, 12:19:45 PM
    Author     : EmilianoDev12
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
        <link rel="stylesheet" href="./css/General.css"/>
    </head>
    <body>
        <header> 
                <nav class="navegacion" style="width: 100%;">
                    <ul class="menu">
                        <li class="logo"><a href="index.html"><img src="./img/logo.png"></a></li>
                        <li><a href="login.html">Log in Administrador</a></li>
                        <li><a href="login.html">Log in Usuario</a></li>
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
                    
                    String correo, cont, q, cmp = "", nom = "";
                    int tipo = 0;
                    correo = request.getParameter("correo");
                    cont = request.getParameter("contrasena");
                    System.out.println(correo);
                    
                    q = "select * from musuarios";
                    
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                        if(rs.getString("correo_usu").equals(correo)){
                            cmp = rs.getString("cont_usu");
                            nom = rs.getString("nom_usu");
                            tipo = Integer.parseInt(rs.getString("admin"));
                            System.out.println(cmp);
                            System.out.println(cont);
                            break;
                        }
                    }
                    if(cmp.equals(cont)){
                        %>
                        <h2>Sesion iniciada</h2>
                        <%
                        RequestDispatcher rd;
                        if(tipo == 1){
                            rd=request.getRequestDispatcher("./indexAdmin.html");
                            rd.forward(request, response);
                        }else{
                            rd=request.getRequestDispatcher("./indexUsuario.html");
                            rd.forward(request, response);
                        }
                    }else{
                        %>
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <center><h2>Contraseña o correo incorrectos</h2></center>
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                        <%
                    }
                    con.close();
                }catch(SQLException ed){
                    System.out.println("Lectura de datos incorrecta");
                    System.out.println(ed.getMessage());
                }
                
            }catch(Exception e){
                System.out.println("Error al conectar databse");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                <div align="center">
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <center><h2 align="center">>Sitio en Construccion</h2></center>
                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </div>
                <%
            }
        %>
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
