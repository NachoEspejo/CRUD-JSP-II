<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Materialize -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
    <link rel="stylesheet" href="Basico.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <title>DETALLES</title>
  </head>
  <body id="D">
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/StarTrek","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      ResultSet listado = s.executeQuery ("SELECT * FROM tripulante WHERE IdTrip='" + request.getParameter("IdTrip") +"'");

      listado.next();
    %>
    
    <%
           
            String Historia = listado.getString("Historia");
            String Equipo = listado.getString("Equipo");

            List<String> infopj = new ArrayList();
            infopj.add(
                    0, Equipo);
            infopj.add(
                    1, Historia);

    %> 
        
    <div class="container">
      <div class="row"></div>
      <div class="row">
        <div class="row col m3"></div>
        <div class="col m6 card-panel grey lighten-5">
          <h5 class="center"><%=listado.getString("nombre") %></h5>
            <p>
              <i class="material-icons teal-text">label_outline</i> Historia: 
              <b><%=infopj.get(1)%></b>
            </p>
            <br>
            <p>
                <i class="material-icons teal-text">label_outline</i> Equipo: 
                <b><%=infopj.get(0)%></b>
            </p><br>
            <p class="center">
              <a href="Plantilla.jsp" class="btn waves-effect waves-light center">
                Aceptar
                <i class="material-icons">check_circle</i>
              </a>
            </p>
            <br>
          </form>
        </div>
      </div>
    </div>
    <% conexion.close(); %>

    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>

  </body>
</html>
