<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agrosell nova - Reservar</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
</head>

<body>
<header class="top-bar">
    <div class="header-content">
        <img src="https://i.ibb.co/cvj3qCk/agrosell-logo-removebg-preview-1.png" alt="Agrosell Nova" class="logo">
        <h1 class="menu-title">AGROSELL NOVA</h1>
        <div class="panel-option">
            <button id="panelControl">
                <a href="panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
            </button>
        </div>
        <a href="carrito.jsp" class="menu-icon">
            <i class="fas fa-shopping-cart"></i>
        </a>
        <span class="notification">
            <button id="notificationButton">
                <i class="fas fa-bell"></i>
            </button>
        </span>
        <span class="username" id="usuario">
            <% if (usuario != null) { %>
                <%= usuario %>
            <% } else { %>
                <a href="<%= request.getContextPath() %>/login.jsp">Iniciar sesión / Registrarse</a>
            <% } %>
        </span>
        <a href="perfil.jsp" class="menu-icon">
            <i class="bi bi-person-circle" style="font-size: 30px;"></i>
        </a>
    </div>
</header>

<nav class="menu-bar">
    <ul>
        <li><a href="../inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
        <li><a href="${pageContext.request.contextPath}/MostrarProductoServlet"><i class="fas fa-box icon"></i> Productos</a></li>
        <li><a href="../categorias.jsp"><i class="fas fa-list"></i> Categorías</a></li>
        <li><a href="../reservas.jsp"><i class="fas fa-bookmark"></i> Reservas</a></li>
        <li><a href="../about_us.jsp"><i class="fas fa-info-circle"></i> Sobre nosotros</a></li>
        <li><a href="../contactanos.jsp"><i class="fas fa-envelope"></i> Contáctanos</a
