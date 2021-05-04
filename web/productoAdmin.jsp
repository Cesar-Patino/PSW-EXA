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
        <link rel="stylesheet" href="./css/const.css"/>
        <link rel="stylesheet" href="./css/index.css"/>
    </head>
    <body>
        <main>
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
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <circle cx="12" cy="7" r="4" />
                        <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" />
                    </svg>
                </div>
            </nav>
            <section class="principal">
                <div class="productos">
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
                            <h2>Sitio en Construccion</h2>
                            <%
                        }
                    %>
                </div>
            </section>
        </main>
        <br>
        <footer>
            <div>
                <h2>Developers:</h2>
                <p>Asch García Jan Albert</p>
                <p>Casillas Avina Gael Emiliano</p>
                <p>Cote de la Rosa José Carlos</p>
                <p>Jiménez Rodríguez Alejandro Martin</p>
            </div>
            <div>
                <h2>Grupo:</h2>
                <p>4IV8</p>
            </div>
            <div>
                <h2>Repositorio:</h2>
                <p><a href="https://github.com/EmilianoDev12/4IV8-Examen-Practico">4IV8-Examen-P2</a></p>
            </div>
        </footer>
    </body>
</html>