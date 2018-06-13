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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="Basico.css">

        <title>MODIFICA</title>
    </head>
    <body id="M">
        <% request.setCharacterEncoding("UTF-8");%>
        <div class="container">
            <br><br>
            <div class="panel panel-info">
                <div class="panel-heading text-center">Modificación de tripulantes</div>
                <form method="get" action="editTripulante.jsp">
                    <div class="form-group" style="display: none;">
                        <label>&nbsp;&nbsp;Codigo:&nbsp;</label><input type="text" size="20" name="IdTrip" value="<%= request.getParameter("IdTrip")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nombre:&nbsp;</label><input type="text" size="20" name="nombre" value="<%= request.getParameter("nombre")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Apellidos:&nbsp;</label><input type="text" size="15" name="apellidos" value="<%= request.getParameter("apellidos")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Facción:&nbsp;</label><select name="IdFacc" multiple="multiple">
                                    <option value="1" selected="selected">Federación</option>
                                    <option value="2">Klingon</option>
                                    <option value="3">Rebeldes</option>
                                </select>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Historia:&nbsp;</label><input type="text" size="100" name="Historia" value="<%= request.getParameter("Historia")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Equipo:&nbsp;</label><input type="text" size="100" name="Equipo" value="<%= request.getParameter("Equipo")%>">
                    </div>
                    <hr>
                    &nbsp;&nbsp;<a href="Plantilla.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Anular</a>
                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                </form>

            </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
