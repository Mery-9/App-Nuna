
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>   
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Administrar Doctores</title>
    <!-- CSS Files -->
    <link href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/css/light-bootstrap-dashboard.css?v=2.0.1" rel="stylesheet" />

    <body background="img/fondo1.png">
           <%Connection con;
       String url="jdbc:mysql://localhost:3307/clientes";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       ResultSet rs;
       int cod= Integer.parseInt(request.getParameter("cod"));
%>
           <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <div class="wrapper">
        <div class="sidebar" data-image="../assets/img/sidebar-5.jpg">
       <%ps=con.prepareStatement("select * from usuarios where id_cliente='"+cod+"'");
                           rs=ps.executeQuery();
                               while(rs.next()){%>
<div class="sidebar-wrapper" style="background: #13a4d4;">
                <div class="logo">
                    <a href="" class="simple-text">
                        <img src="img/UYWADOG.png" style="width: 90px"/>
                    </a>
                    
                </div>
                <ul class="nav">
                    <li style="text-align:center;">
                      <img src="CargarIMGUsuario?id=<%= rs.getString("id_cliente")%>" width="100" height="100">  
                      <p><%= rs.getString("nom_cliente")%></p>
                    </li>
                    <li>
                        <a class="nav-link" href="admGrafico.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-tap-01"></i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a class="nav-link" href="admeditusu.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Perfil Administrador</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="admvect.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-notes"></i>
                            <p>Lista de Veterinarias</p>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="AgregarAdmVet.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-simple-add"></i>
                            <p>Agregar Admin. Vet.</p>
                        </a>
                    </li>
                    <li >
                        <a class="nav-link" href="AgregarMovVet.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-simple-add"></i>
                            <p>Movilidad de Vet.</p>
                        </a>
                    </li>
                      <li >
                        <a class="nav-link" href="admdoc2.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-notes"></i>
                            <p>Lista de Doctores</p>
                        </a>
                    </li>
                      <li>
                        <a class="nav-link" href="admusu.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-notes"></i>
                            <p>Lista de Usuarios</p>
                        </a>
                    </li>
                    
                    <li class="nav-item active active-pro">
                        <a class="nav-link active" href="principal.jsp?txtusu=<%= rs.getString("usu_cliente")%>" style="float:left">
                            <p>Volver</p>
                        </a>
                    </li><%}%>
                </ul>
            </div>
        <div class="sidebar-background" style="background-image: url(../assets/img/sidebar-5.jpg) "></div></div>
        <div class="main-panel">
           
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg " color-on-scroll="500">
                <div class=" container-fluid  ">
                    <a class="navbar-brand" href="#pablo"><i class="nc-icon nc-notes"></i> Administrador de veterinaria</a>
                    <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                        <span class="navbar-toggler-bar burger-lines"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <ul class="navbar-nav ml-auto">
                             <%ps=con.prepareStatement("select * from usuarios where id_cliente='"+cod+"'");
                           rs=ps.executeQuery();
                               while(rs.next()){%>
                                <div class="row" >
                                            <div class="col-md-5 pl-1" align="center">
                                                <div class="form-group" align="center">  
                                                <img src="CargarIMGUsuario?id=<%= rs.getString("id_cliente")%>" width="50" height="50">
                                                </div>
                                            </div>
                                        </div>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="no-icon"><%= rs.getString("nom_cliente")%></span>
                                </a> <%}%>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <div class="divider"></div>
                                    <a class="dropdown-item" href="Controlador?accion=Salir">Cerrar Sesion</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Agregar Administrador de Veterinaria</h4>
                                </div>
                                <div class="card-body">                       
                         <%ps=con.prepareStatement("select * from usuarios where id_cliente='"+cod+"'");
                           rs=ps.executeQuery();
                               while(rs.next()){%>
                                    <form name="añademascota" action="" method="post" >
                                        <div class="row">
                                            <div class="col-md-5 pr-1">
                                                <div class="form-group">
                                                    <label>Compa&ntilde;&iacute;a</label>
                                                    <input type="text" class="form-control" disabled="" placeholder="Company" value="UywaDoc Inc">
                                                </div>
                                            </div>
                                            <div class="col-md-3 px-1">
                                                <div class="form-group">
                                                    <label>Usuario</label>
                                                    <input type="text" name="usu" class="form-control" placeholder="Usuario">
                                                </div>
                                            </div>
                                            <div class="col-md-4 pl-1">
                                                <div class="form-group">
                                                    <label for="exampleInputEmail1">Password</label>
                                                    <input type="text" name="pass" class="form-control"  placeholder="Password">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Nombres</label>
                                                    <input type="text" name="nom" class="form-control"   placeholder="Nombres">
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Apellidos</label>
                                                    <input type="text" name="ape" class="form-control"  placeholder="Apellidos">
                                                </div>
                                            </div>
                                        </div>
                                           <div class="row">
                                           
                                            <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Correo</label>
                                                    <input type="email" name="correo" class="form-control"  placeholder="Email">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                                 <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Direcci&oacute;n</label>
                                                    <input type="text" name="direccion" class="form-control"  placeholder="Direccion">
                                                </div>
                                            </div>
                                            <div class="col-md-6 pl-1">
                                                <div class="form-group">
                                                    <label>Tel&eacute;fono</label>
                                                    <input type="text" name="telefono" class="form-control" placeholder="Telefono">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                                 <div class="col-md-6 pr-1">
                                                <div class="form-group">
                                                    <label>Veterinaria:</label><br> 
                                <select name="veterinaria" class="form-control">
                                    <option selected>Seleccione</option>
                          <%ps=con.prepareStatement("select * from veterinaria");
                                 rs=ps.executeQuery();
                                  while(rs.next()){
                         %>    
                                <option value="<%= rs.getString("id_veterinaria")%>"><%= rs.getString("nom_veterinaria")%></option> <%}%>
                                </select> 
                                                </div>
                                            </div>
                                        </div>
<p class="help-block"></p>
                                                <input type="submit" value="Guardar" class="btn btn-default" style="color: white; text-decoration: none;  border-color:#13a4d4; border-radius: 15px; border: 4px solid #0016b0; background: #13a4d4;"/>
                                        <div class="clearfix"></div>
                                    </form><%}%>
                                </div>
                            </div>
                        </div>
           <%
               request.setCharacterEncoding("UTF-8");
                String usuario, password,nombre,apellido,especialidad,codigo,fetch,correo,direccion,telefono,veterinaria;
       
                usuario = request.getParameter("usu");
                password = request.getParameter("pass");
                nombre = request.getParameter("nom");
                apellido = request.getParameter("ape");
                
                
                direccion = request.getParameter("direccion");
                correo = request.getParameter("correo");
                telefono = request.getParameter("telefono");
                veterinaria = request.getParameter("veterinaria");
               
                if (usuario != null && password!=null && nombre!=null && apellido!=null ) {
                    ps=con.prepareStatement("insert into admivet(usu_admi, pass_admi, nom_admi, ape_admi,correo_admi,direc_admi,telef_admi, id_veterinaria)values('"+usuario+"','"+password+"','"+nombre+"','"+apellido+"','"+correo+"','"+direccion+"','"+telefono+"','"+veterinaria+"')");
                     ps.executeUpdate();   
                     response.sendRedirect("admvect.jsp?cod="+cod);

                }
            %>
                    </div>
                </div>
            </div>


            <footer class="footer">
                <div class="container">
                    <nav>
                        <p class="copyright text-center">
                            Copyright © 2019
                            <a style="color: #13a4d4;">UywaDoc</a>, Todos los Derechos Reservados
                        </p>
                    </nav>
                </div>
            </footer>
        </div>
    </div>

</body>
<!--   Core JS Files   -->
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: https://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="../assets/js/plugins/bootstrap-switch.js"></script>

<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/plugins/jquery.sharrre.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/light-bootstrap-dashboard.js?v=2.0.1" type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="https://demos.creative-tim.com/light-bootstrap-dashboard/assets/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.showNotification();

    });
</script>

</html>

