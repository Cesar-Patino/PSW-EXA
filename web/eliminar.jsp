<%-- 
    Document   : agregarH
    Created on : 2/05/2021, 04:13:21 PM
    Author     : PC
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
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                        <circle cx="12" cy="7" r="4" />
                        <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" />
                  </svg>
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
                 int id = Integer.parseInt(request.getParameter("ideliminar"));
            
            //preparo mi sentencia
            //delete from tabla where atributo = valor
            
            String q = "delete from helado where id_p = "+id+";";
            set.executeUpdate(q);
                   %>
                    <center>
                        <h1>eliminacion Exitoso</h1>
                    </center>
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
