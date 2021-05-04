<%-- 
    Document   : agregarH
    Created on : 2/05/2021, 04:13:21 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso helado fallido</title>
        <link rel="stylesheet" href="./css/const.css"/>
        <link rel="stylesheet" href="./css/index.css"/>
        <link rel="stylesheet" href="./css/formularios.css"/>
        <style>
            a{
                color: black;
            }
        </style>
    </head>
    <body>
        <nav>
                <div>
                    <a href="index.html">BEN&JERRY'S</a>
                </div>
                <div class="links">
                    <a href="indexAdmin.html">About</a>
                    <a href="productoAdmin.jsp">Productos</a>
                    <a href="anadirProduct.html">Añadir Producto</a>
                    <a href="eliminarH.html">Eliminar Producto</a>
                    <a href="editar.html">Editar Producto</a>
                </div>

            </nav>
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
               
            String url, userName, password, driver;
               
            url = "jdbc:mysql://localhost/registropsw";             
            userName = "root";
            password = "Dante@23$";
               
            driver = "com.mysql.jdbc.Driver";
            
            try{
                  Class.forName(driver);
                   con = DriverManager.getConnection(url, userName, password);
                   
                   try{
                       set = con.createStatement();
                //necesito los parametros del formulario
                    String nom, am,dom,fecha,numero;

                nom = request.getParameter("nom");
                int ap = Integer.parseInt(request.getParameter("p"));
                am = request.getParameter("t");
                dom = request.getParameter("ti");

               
               
            
                
                  String q = "insert into helado "
                        + "(nom_p, pre_p, tam_p, tipo_p) "
                        + "values ('"+nom+"', '"+ap+"', '"+am+"', '"+dom+"')";
                
                set.executeUpdate(q);;
                     
                       %>
                       <h2>Registro Existoso</h2>
                       <%
                 
                      
                       set.close();
                    
                }catch(SQLException ed){
                    System.out.println("Lectura de datos incorrecta");
                    System.out.println(ed.getMessage());
                    if(ed.getMessage().contains("Duplicate entry")){
                        out.println("<h1>Helado ya registrado, usar uno nuevo</h1>");
                    }else{
                        out.println("<h1>Error en la lectura de la tabla</h1>");
                    }
                }
                
            }catch(Exception e){
                System.out.println("Error al conectar databse");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                <h2>Sitio en Construccion</h2>
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
