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
                         <a class="nav-link" href="miperfil.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-circle-09"></i>
                            <p>Perfil Usuario</p>
                        </a>
                    </li>
                    <li  class="nav-item active" href="AgendacCitaUsu.jsp?cod=<%= rs.getString("id_cliente")%>">
                        <a class="nav-link" href="">
                            <i class="nc-icon nc-notes"></i>
                            <p>Citas Reservadas</p>
                        </a>
                    </li>
                    <li >
                        <a class="nav-link" href="historiaParaUsuario.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-simple-add"></i>
                            <p>Historias medicas</p>
                        </a>
                    </li>
                      <li>
                        <a class="nav-link" href="AgendaServicioUsu.jsp?cod=<%= rs.getString("id_cliente")%>">
                            <i class="nc-icon nc-notes"></i>
                            <p>Servicios Reservados</p>
                        </a>
                    </li>
                   
                    
                    <li class="nav-item active active-pro">
                        <a href="miperfil.jsp?cod=<%=cod%>" class="nav-link active"  style="float:left">
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
                    <a class="navbar-brand" href="#pablo"><i class="nc-icon nc-notes"></i> Citas Medicas Reservadas </a>
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
            <br>
    
            
            <br>
            <br>
            <div class="content" >
                <div class="container-fluid">
                    <div class="row" cellpadding="0" style="width: 90%; text-align: center;">
                        <div class="col-md-12">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-header ">
                                    <h4 class="card-title">Citas</h4>
                                </div>
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <tr><th>Nombre de Veterinaria</th>
                                            <th>Nombre de mascota</th>
                                            <th>Foto de Mascota</th>
                                            <th>M&eacute;dico</th>
                                            <th>Fecha de cita</th>
                                            <th>Hora de cita</th>
                                            <th>Estado de cita</th>
                                        </tr></thead>
                     <%ps=con.prepareStatement("select citas.id_cita,citas.nomvet_cita,citas.medico_cita,citas.id_mascota,citas.id_cita,citas.nomclient_cita,citas.nommasc_cita,citas.fech_cita,citas.hora_cita,estado.estado,estado.color FROM citas INNER JOIN estado ON citas.estado = estado.estado where id_cliente='"+cod+"'");
                           rs=ps.executeQuery();
                               while(rs.next()){%>  
                                        <tbody>
                                                <td><%= rs.getString("nomvet_cita")%></td>
                                                <td><%= rs.getString("nommasc_cita")%></td>
                                                <td><img src="CargarIMGMascota?id=<%= rs.getString("id_mascota")%>" width="100" height="100"></td>
                                                <td><%= rs.getString("medico_cita")%></td>
                                                <td><%= rs.getString("fech_cita")%></td>
                                                <td><%= rs.getString("hora_cita")%></td>
                                                <td><font style="font-weight:bold;"<%= rs.getString("color")%>><%= rs.getString("estado")%></font></td>
                                                
                                                
                                                <td><a href="deletecita.jsp?cod=<%=cod%>&idpet=<%= rs.getString("id_mascota")%>&idcita=<%= rs.getString("id_cita")%>" type="submit" class="btn btn-default" style="color: white; text-decoration: none; float: right; border-color:#13a4d4; border-radius: 15px; border: 4px solid #0016b0; background: #13a4d4;">Cancelar Cita</a></td>
                                            </tr>
                                            <%}%>
                                        </tbody> 
                                    </table>
                                </div>
                            </div>
                        </div>

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
