<%-- 
    Document   : iniciar
    Created on : 2/05/2021, 12:19:45 PM
    Author     : EmilianoDev12
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de sesión</title>
        <link rel="stylesheet" href="./css/const.css"/>
        <link rel="stylesheet" href="./css/index.css"/>
    </head>
    <body>
        <nav>
            <div>
                <a href="index.html">BEN&JERRY'S</a>
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
               
            url = "jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_5a49af62a75744f";
            userName = "b3be4caf7283ff";
            password = "d8f5d01c";
               
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    set = con.createStatement();
                    
                    String correo, cont, q, cmp = "", nom = "";
                    int tipo = 0;
                    correo = request.getParameter("correo");
                    cont = request.getParameter("contrasena");
                    System.out.println(correo);
                    
                    q = "select * from musuarios";
                    
                    rs = set.executeQuery(q);
                    
                    while(rs.next()){
                        if(rs.getString("correo_usu").equals(correo)){
                            cmp = rs.getString("cont_usu");
                            nom = rs.getString("nom_usu");
                            tipo = Integer.parseInt(rs.getString("admin"));
                            System.out.println(cmp);
                            System.out.println(cont);
                            break;
                        }
                    }
                    if(cmp.equals(cont)){
                        %>
                        <h2>Sesion iniciada</h2>
                        <%
                        RequestDispatcher rd;
                        if(tipo == 1){
                            rd=request.getRequestDispatcher("./indexAdmin.html");
                            rd.forward(request, response);
                        }else{
                            rd=request.getRequestDispatcher("./indexUsuario.html");
                            rd.forward(request, response);
                        }
                    }else{
                        %>
                        <h2>Contraseña o correo están mal</h2>
                        <%
                    }
                    con.close();
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
