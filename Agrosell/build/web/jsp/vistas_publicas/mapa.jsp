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
    <title>Agrosell Nova - Mapa del sitio</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="body-mapa">

<!-- Encabezado -->
<header class="mapa-header">
    <h1 class="mapa-titulo">Mapa del Sitio</h1>
</header>

<!-- Contenido principal -->
<main class="mapa-contenedor">
    <nav aria-label="Mapa del sitio">
        <ul class="mapa-lista">
            <li class="mapa-item">
                <a href="inicio.jsp" class="mapa-enlace"><i class="fas fa-home mapa-icono"></i>Inicio</a>
            </li>
            <li class="mapa-item">
                <a href="index.jsp" class="mapa-enlace"><i class="fas fa-user mapa-icono"></i>Login y Registro</a>
            </li>
            <li class="mapa-item">
                <a href="${pageContext.request.contextPath}/MostrarProductoServlet" class="mapa-enlace"><i class="fas fa-box mapa-icono"></i>Productos</a>
                <ul class="mapa-sublista">
                    <li class="mapa-subitem">
                        <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=categoria_frutas" class="mapa-enlace"><i class="fas fa-apple-alt mapa-icono"></i>Frutas</a>
                    </li>
                    <li class="mapa-subitem">
                        <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=categoria_verduras" class="mapa-enlace"><i class="fas fa-carrot mapa-icono"></i>Verduras</a>
                    </li>
                    <li class="mapa-subitem">
                        <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=categoria_granos" class="mapa-enlace"><i class="fas fa-seedling mapa-icono"></i>Granos</a>
                    </li>
                </ul>
            </li>
            <li class="mapa-item">
                <a href="reservas.jsp" class="mapa-enlace"><i class="fas fa-bookmark mapa-icono"></i>Reservas</a>
            </li>
            <li class="mapa-item">
                <a href="categorias.jsp" class="mapa-enlace"><i class="fas fa-list mapa-icono"></i>Categorías</a>
            </li>
            <li class="mapa-item">
                <a href="about_us.jsp" class="mapa-enlace"><i class="fas fa-info-circle mapa-icono"></i>Sobre nosotros</a>
            </li>
            <li class="mapa-item">
                <a href="contactanos.jsp" class="mapa-enlace"><i class="fas fa-envelope mapa-icono"></i>Contáctanos</a>
            </li>
            <li class="mapa-item">
                <a href="ayuda.jsp" class="mapa-enlace"><i class="fas fa-question-circle mapa-icono"></i>Ayuda</a>
            </li>
        </ul>
    </nav>
</main>

<!-- Pie de página -->
<footer class="mapa-footer">
    <p class="mapa-pie">&copy; 2024 Agrosell Nova. Todos los derechos reservados.</p>
</footer>

</body>
</html>
