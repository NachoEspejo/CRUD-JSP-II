<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
    <link rel="stylesheet" href="custom.css">
        <title>Verificación</title>
    </head>
    <body id="index">
        <%
          HashMap<String, String> Verificador = new HashMap();
          Verificador.put("Test", "Test");
          Verificador.put("Admin", "Admin123");
          
          String nombre = request.getParameter("usuario");
          String contraseña = request.getParameter("contrasena");
          
          
          
          if (Verificador.containsKey(nombre)) {
            if (Verificador.get(nombre).equals(contraseña)) {
              session.setAttribute("nombre", nombre);
              response.sendRedirect("Plantilla.jsp");
            } else {
              out.println("<div class='alert alert-warning' role='alert'>Lo siento, la contraseña es incorrecta</div>");
              out.println("<a href='index.jsp' class='btn btn-primary'><span class=''></span> Vuelve a intentarlo </button></a>");
            }
          } else {
            out.println("<div class='alert alert-warning' role='alert'>Lo siento, el usuario no se encuentra en la base de datos</div>");
            out.println("<a href='index.jsp' class='btn btn-primary'><span class=''></span> Vuelve a intentarlo</button></a>");
          }
        %>
       <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>