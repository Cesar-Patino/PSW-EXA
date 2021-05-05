<%-- 
    Document   : agregarH
    Created on : 2/05/2021, 04:13:21 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <header> 
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
        <header> 
                <nav class="navegacion" style="width: 100%;">
                    <ul class="menu">
                        <li class="logo"><a href="index.html"><img src="./img/logo.png"></a></li>
                        <li><a href="productoAdmin.jsp">Productos</a></li>
                        <li><a href="anadirProduct.html">Añadir Producto</a></li>
                        <li><a href="eliminarH.html">Eliminar Producto</a></li>
                        <li><a href="editar.html">Editar Producto</a></li>
                    </ul>
                </nav>
            </header>
                
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
