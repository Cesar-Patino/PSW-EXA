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
        <link rel="stylesheet" href="./css/General.css">
        <link rel="stylesheet" href="./css/formularios.css">
        
        <title>JSP Page</title>
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
            
            //diferentes vistas para los errores
            //error exclusivo de sql
            try{
                set = con.createStatement();
                //necesito los parametros del formulario
                    String nom, ap, am,dom,fecha,numero;
                int edad;
                nom = request.getParameter("nomn");
                ap = request.getParameter("apn");
                am = request.getParameter("amn");
                dom = request.getParameter("domicilion");
                edad = Integer.parseInt(request.getParameter("edadn"));
                fecha = request.getParameter("fechan");
                numero =request.getParameter("numeron");
                int id = Integer.parseInt(request.getParameter("idactualizar"));
               
            
                
                  String q = "UPDATE Mregistro \n"
                        + "SET nom_usu = '"+nom+"', ap_usu = '"+ap+"', am_usu = '"+am+"', edad_usu = "+edad+", fec_usu = '"+fecha+"', dom_usu = '"+dom+"', numero_usu = '"+numero+"' \n"
                        + "WHERE id_usu ="+id+" ;";
                
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
         <div id="footer">
            <table class="pie">
                <tr>
                    <h4>Integrantes:</h4>
                </tr>
                <tr></tr>
                <tr>
                    <h4>Chávez Patiño Cesar Uriel</h4>
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
