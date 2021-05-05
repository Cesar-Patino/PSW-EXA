<%-- 
    Document   : productosUsuario
    Created on : 2/05/2021, 02:42:18 PM
    Author     : EmilianoDev12
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<html>
    <head>
        <title>Ben&Jerry's</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/General.css"/>
    </head>
    <body>
        <main>
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
            <section >
                <div align="center">
                    <%
                        Connection con = null;
                        Statement set = null;
                        ResultSet rs = null;

                        String url, userName, password, driver, q;

                       url = "jdbc:mysql://localhost/registropsw";
                        userName = "root";
                        password = "Dante@23$";

                        driver = "com.mysql.jdbc.Driver";
                        
                        try{
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, userName, password);
                            
                            try{
                              String nom, apmat, edad;
                                int  id,appat;
                
                //tenemos que crear la querry
                
                 q = "select * from helado";
                
                set = con.createStatement();
                rs = set.executeQuery(q);
                
                while(rs.next()){
                //mientras exista un registro hay que obtener los datos de la consulta
                    id = rs.getInt("id_p");
                    nom = rs.getString("nom_p");
                    appat = rs.getInt("pre_p");
                    apmat = rs.getString("tam_p");
                    edad = rs.getString("tipo_p");
                    
                    out.println("<tbody>"
                            + "<tr><td>"+id+"</td>"
                            + "<td>"+nom+" "+appat+" "+apmat+" </td>"
                            + "<td>"+edad+"</td>");
                }
                //hay que cerrar los hilos
                rs.close();
                set.close();
                
                System.out.println("Consulta Exitosa");
            
                                
                            }catch(SQLException ed){
                                System.out.println("Lectura de datos incorrecta");
                                System.out.println(ed.getMessage());
                            }
                            
                        }catch(Exception e){
                            System.out.println("Error al conectar databse");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                            %>
                            <center><h2>Sitio en Construccion</h2><center>
                            <%
                        }
                    %>
                </div>
            </section>
        </main>
        <br>
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