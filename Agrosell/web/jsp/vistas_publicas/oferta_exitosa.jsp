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
    <title>Oferta exitosa</title>
    <link rel="stylesheet" href="../../css/styles.css">
</head>
<body class="page-exitoso">
    <div class="exito-container">
        <h1 class="msj-exitoso">¡Oferta exitosa!</h1>
        <p>Su producto se ha ofertado con éxito.</p>
        <a href="ofertar_producto.jsp" class="btn-exitoso">Volver</a>
    </div>
</body>
</html>

