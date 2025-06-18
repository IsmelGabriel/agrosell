<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserva Exitosa</title>
    <link rel="stylesheet" href="../../css/styles.css">
</head>
<body class="page-exitoso">
    <div class="exito-container">
        <h1 class="msj-exitoso">¡Reserva Exitosa!</h1>
        <p>Los detalles de tu reserva llegarán a tu correo.</p>
        <a href="reservas.jsp" class="btn-exitoso">Volver</a>
    </div>

    <div class="usuario-info">
        <span class="username">
            <% if (usuario != null) { %>
                <a href="cerrar_sesion.jsp"><%= usuario %></a>
            <% } else { %>
                <a href="index.jsp">Iniciar sesión</a>
            <% } %>
        </span>
    </div>
</body>
</html>
