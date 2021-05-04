<%-- 
    Document   : guardar
    Created on : 2/05/2021, 10:49:49 AM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="./css/const.css"/>
        <link rel="stylesheet" href="./css/index.css"/>
    </head>
    <body>
        <main>
            <nav>
                <div>
                    <a href="index.html">BEN&JERRY'SS</a>
                </div>
                <div class="links">
                    <a href="">About</a>
                </div>
                <div>
                    <a href="login.html"><button>Log in</button></a>
                    <a href="registrarUsuario.html"><button>Sign in</button></a>
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
                    String nom, ap, am,dom,fecha,numero;
                int edad;

                nom = request.getParameter("nom");
                ap = request.getParameter("ap");
                am = request.getParameter("am");
                dom = request.getParameter("domicilio");

                edad = Integer.parseInt(request.getParameter("edad"));
                fecha = request.getParameter("fecha");
                numero =request.getParameter("numero");

               
            
                
                  String q = "insert into mregistro "
                        + "(nom_usu, ap_usu, am_usu, edad_usu, fec_usu,dom_usu, numero_usu) "
                        + "values ('"+nom+"', '"+ap+"', '"+am+"', "+edad+", '"+fecha+"', '"+dom+"', '"+numero+"')";
                
                set.executeUpdate(q);;
                     
                       %>
                       <h2>Registro Existoso</h2>
                       <%
                 
                      
                       set.close();
                   }catch(SQLException ed){
                       System.out.println("Error al registrar en la tabla");
                       System.out.println(ed.getMessage());
                       if(ed.getMessage().contains("Duplicate entry")){
                          out.println("<h1>Correo ya registrado, usar uno nuevo</h1>");
                       }else{
                          out.println("<h1>Error en la lectura de la tabla</h1>");
                       }
                   }
                   con.close();
               }catch(Exception e){
                    System.out.println("Error al conectar databse");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                    %>
                    <h2>Sitio en Construccion</h2>
                    <%
               }
            %>
            
        </main>
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
