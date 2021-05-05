<%-- 
    Document   : agregarH
    Created on : 2/05/2021, 04:13:21 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
     <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="./css/formularios.css">
          <link rel="stylesheet" href="./css/General.css">


    </head>
                <nav class="navegacion" style="width: 100%;">
                    <ul class="menu">
                        <li class="logo"><a href="index.html"><img src="./img/logo.png"></a></li>
                        
                        <li><a>CRUD productos</a>
                        <ul class="sub">
                         <center>
                            <li><a href="anadirProduct.html">Añadir Producto</a></li>
                            <li><a href="eliminarH.html">Eliminar Producto</a></li>
                            <li><a href="editar.html">Editar Producto</a></li>
                            <li><a href="productoAdmin.jsp">Agregar productos</a>                           
                        </center>
                     </ul>
                            </li>
                            <li><a>CRUD usuarios</a>
                        <ul class="sub">
                         <center>
                            <li><a href="eliminausu.html">Eliminar usuario</a></li>
                            <li><a href="editarusu.html">Editar usuario</a></li>
                        </center>
                     </ul>
                            </li>

                    </ul>
                </nav>
            </header>
    <body>
       
                
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
                    String nom, ap, am,dom,fecha,numero;
                int edad;
                nom = request.getParameter("nom");
                am = request.getParameter("t");
                dom = request.getParameter("ti");
                edad = Integer.parseInt(request.getParameter("p"));
                int id = Integer.parseInt(request.getParameter("ideliminar"));
               
            
                
                  String q = "UPDATE helado \n"
                        + "SET nom_p = '"+nom+"',pre_p = "+edad+" , tam_p = '"+am+"', tipo_p = '"+dom+"' \n"
                        + "WHERE id_p ="+id+" ;";
                
                set.executeUpdate(q);
                %>
                <h1>A</h1>
                <%
                set.close();
            
            }catch(SQLException ed){
                System.out.println("Error al registrar en la tabla");
                System.out.println(ed.getMessage());
                
                %>
                <h1>Registro No Exitoso, error en la lectura de la tabla</h1>
                <%
            
            }
            con.close();
        
        }catch(Exception e){
            System.out.println("Error al conectar bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            %>
            <h1>Sitio en Construccion</h1>
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

                