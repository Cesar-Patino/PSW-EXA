<%-- 
    Document   : actualizar
    Created on : 2/05/2021, 08:25:49 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./CSS/estilo.css">
        <link rel="shortcut icon" href="./IMG/icon.jpg" />
        <link rel="stylesheet" href="./CSS/imagenes.css">
        <title>JSP Page</title>
    </head>
    <body>

        <% 
        //aqui ya puedo incorporar codigo java
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
        <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
               
            String url, userName, password, driver;
               
            url = "jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_5a49af62a75744f";
            userName = "b3be4caf7283ff";
            password = "d8f5d01c";
               
            driver = "com.mysql.jdbc.Driver";

            
            //diferentes vistas para los errores
            //error exclusivo de sql
            try{
                set = con.createStatement();
                //necesito los parametros del formulario
                    String nom, am,dom,fecha,numero;
                int edad;

                nom = request.getParameter("nom");
                
               int ap = Integer.parseInt(request.getParameter("p"));
               am = request.getParameter("t");
                dom = request.getParameter("ti");

                
                int id = Integer.parseInt(request.getParameter("ideliminar"));

               
            
                
                  String q = "UPDATE helado \n"
                        + "SET nom_p = '"+nom+"', pre_p = '"+ap+"', tam_p = '"+am+"', tipo_p = '"+dom+"' \n"
                        + "WHERE id_p ="+id+" ;";
                
                set.executeUpdate(q);
                %>
                <header> 
                    <nav class="navegacion" style="width: 100%;">
                        <ul class="menu"> 
                            <li class="logo"><img src="./IMG/logo.png"></li>
                            <li ><a href="index.html">Principal</a></li>
                            <li ><a href="iniciars.html">Productos</a></li>
                            <li><a href="iniciars.html">Registrarme</a></li>
                        </ul>
                    </nav>
                </header>
                    <center>
                        <h1>Registro Exitoso</h1>
                    </center>
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
