<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <link rel="stylesheet" href="Basico.css">

        <title>Personajes</title>
    </head>

    <body id="WP">
        <div class="container">
            <br><br>			
            <div class="panel panel-info">
                <div class="panel-heading text-center" id="WPB"><h2>P E R S O N A J E S</h2></div>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/StarTrek", "root", "");
                    Statement s = conexion.createStatement();

                    ResultSet listado = s.executeQuery("SELECT * FROM tripulante INNER JOIN faccion ON tripulante.IdFacc = faccion.IdFacc");

                %>

                <table class="table table-striped">
                    <form method="post" action="buscatripulante.jsp">
                        <tr>
                            <th>Nombre de la tripulante</th>
                            <th>
                                <div class="input-field">
                                    <input type="text" name="nombre" id="buscaNombre">
                                    <label for="buscaNombre"></label>
                                </div>
                                </td>
                            <td>
                                <button class="btn btn-primary" type="submit" name="aceptar">
                                    <i class="glyphicon glyphicon-search"></i> Buscar
                                </button>
                            </td>
                        </tr>
                    </form>

                    <tr><th>Nombre</th><th>Apellidos</th><th>Facción</th><th>Historia</th><th>Equipo</th></tr>
                    <form method="get" action="alistarTripulante.jsp">
                        <tr><td><input type="text" name="nombre" size="30"></td>
                            <td><input type="text" name="apellidos" size="15"></td>
                            <td><select name="IdFacc" multiple="multiple">
                                    <option value="1">Federación</option>
                                    <option value="2">Klingon</option>
                                    <option value="3">Rebelde</option>
                                </select></td>
                            <td><input type="text" name="Historia"/></td>
                            <td><input type="text" name="Equipo"/></td>
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-open"></span> Añadir</button></td><td></td></tr>           
                    </form>


                    <%            while (listado.next()) {
                            out.println("<tr><td style=\"display:none;\">");
                            out.println(listado.getString("IdTrip") + "</td>");
                            out.println("<td>" + listado.getString("nombre") + "</td>");
                            out.println("<td>" + listado.getString("apellidos") + "</td>");
                            out.println("<td>" + listado.getString("NombreFacc") + "</td>");
                    %>
                    <td>
                        <form method="get" action="modificaTripulante.jsp">
                            <input type="hidden" name="IdTrip" style="display: none;" value="<%=listado.getString("IdTrip")%>">
                            <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
                            <input type="hidden" name="apellidos" value="<%=listado.getString("apellidos")%>">
                            <input type="hidden" name="IdFacc" value="<%=listado.getString("IdFacc")%>">
                            <input type="hidden" name="Historia" value="<%=listado.getString("Historia")%>">
                            <input type="hidden" name="Equipo" value="<%=listado.getString("Equipo")%>">
                            <button type="submit"  class="btn btn-warning"><span class="glyphicon glyphicon-cog"></span> &nbsp; Modificar &nbsp;&nbsp;&nbsp; </button>
                        </form>

                        <form method="get" action="detalleTripulante.jsp">
                            <input type="hidden" name="IdTrip" value="<%=listado.getString("IdTrip")%>">
                            <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
                            <input type="hidden" name="apellidos" value="<%=listado.getString("apellidos")%>">
                            <input type="hidden" name="IdFacc" value="<%=listado.getString("IdFacc")%>">
                            <input type="hidden" name="Historia" value="<%=listado.getString("Historia")%>">
                            <input type="hidden" name="Equipo" value="<%=listado.getString("Equipo")%>">
                            <button type="submit"  class="btn btn-success"><span class="glyphicon glyphicon-search"></span> &nbsp; Información </button>
                        </form>
           
                        <form method="get" action="eliminarTripulante.jsp">
                            <input type="hidden" name="IdTrip" value="<%=listado.getString("IdTrip")%>"/>
                            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> &nbsp; Eliminar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </button>
                        </form>

                    </td></tr>
                    <%
                        } // while

                        conexion.close();
                    %>

                </table>
            </div>
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>