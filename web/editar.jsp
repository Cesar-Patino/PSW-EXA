<%-- 
    Document   : agregarH
    Created on : 2/05/2021, 04:13:21 PM
    Author     : EmilianoDev12
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edición helado fallido</title>
        <link rel="stylesheet" href="./css/const.css"/>
        <link rel="stylesheet" href="./css/index.css"/>
        <link rel="stylesheet" href="./css/formularios.css"/>
    </head>
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
               
            url = "jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_5a49af62a75744f";
            userName = "b3be4caf7283ff";
            password = "d8f5d01c";
               
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    set = con.createStatement();
                    
                    String nomHelado, precioHel, descripHel;
                    nomHelado = request.getParameter("nomHelado");
                    precioHel = request.getParameter("precio");
                    descripHel = request.getParameter("descripcion");

                    if(! "".equals(precioHel)){
                        String q = "update mhelados set precio_hel='" + precioHel + "' where nom_hel='" +nomHelado+"'";
                        set.executeUpdate(q);

                        System.out.println("Registro actualizado");
                        out.println("<h1>Costo actualizado</h1>");
                    }else{
                        out.println("<h1>Costo no actualizado</h1>");
                    }
                    if(! "".equals(precioHel)){
                        String q = "update mhelados set descrip_hel='" + descripHel + "' where nom_hel='" +nomHelado+"'";
                        set.executeUpdate(q);

                        RequestDispatcher rd;
                        rd=request.getRequestDispatcher("./productoAdmin.jsp");
                        rd.forward(request, response);
                        
                        System.out.println("Registro actualizado");
                        out.println("<h1>Descripcion actualizado</h1>");
                    }else{
                        out.println("<h1>Descripcion no actualizado</h1>");
                    }
                    
                    con.close();
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
