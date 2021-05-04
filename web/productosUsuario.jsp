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
                        <li><a href="index.html">Menu</a></li>
                        <li><a href="productosUsuario.jsp">Productos</a></li>
                </nav>
            </header>
            <section>
                <div align="center">
                    <%
                        Connection con = null;
                        Statement set = null;
                        ResultSet rs = null;

                        String url, userName, password, driver, q;

                        url = "jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_5a49af62a75744f";
                        userName = "b3be4caf7283ff";
                        password = "d8f5d01c";

                        driver = "com.mysql.jdbc.Driver";
                        
                        try{
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, userName, password);
                            
                            try{
                                set = con.createStatement();
                                
                                q = "select * from mhelados";
                                
                                rs = set.executeQuery(q);
                                
                                while(rs.next()){
                                    %>
                                <div class="producto">
                                    <div class="producto__informacion">
                                        <p class="producto__nombre"><%=rs.getString("nom_hel")%></p>
                                        <p class="producto__precio">$<%=rs.getString("precio_hel")%></p>
                                        <p class="producto__precio"><%=rs.getString("descrip_hel")%></p> 
                                    </div>
                                </div><!--.prodcuto-->
                                    <%
                                }
                                
                                
                            }catch(SQLException ed){
                                System.out.println("Lectura de datos incorrecta");
                                System.out.println(ed.getMessage());
                            }
                            
                        }catch(Exception e){
                            System.out.println("Error al conectar databse");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                            %>
                            <center><h2>Sitio en Construccion</h2></center>
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