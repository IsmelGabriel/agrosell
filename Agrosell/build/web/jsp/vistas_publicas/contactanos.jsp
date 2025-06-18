<%-- 
    Document   : contactanos
    Created on : 17/06/2025, 7:41:09 p. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contáctanos - Agrosell Nova</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header class="top-bar">
    <div class="header-content">
        <img src="../../img/logo.png" alt="Agrosell Nova" class="logo">
        <h1 class="menu-title">AGROSELL NOVA</h1>
        <div class="panel-option">
            <a href="../vistas_privadas/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
        </div>
        <a href="carrito.jsp" class="menu-icon"><i class="fas fa-shopping-cart"></i></a>
        <span class="notification">
            <button id="notificationButton"><i class="fas fa-bell"></i></button>
        </span>
        </span>
            <span class="username">
                <% if (usuario != null) { %>
                    <a href="cerrar_sesion.jsp"><%= usuario %></a>
                <% } else { %>
                    <a href="index.jsp">Iniciar sesión / Registrarse</a>
                <% } %>
            </span>
        <a href="../vistas_privadas/perfil.jsp" class="menu-icon">
            <i class="bi bi-person-circle" style="font-size: 30px;"></i>
        </a>
    </div>
</header>

<nav class="menu-bar">
    <ul>
        <li><a href="inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
        <li><a href="${pageContext.request.contextPath}/MostrarProductoServlet"><i class="fas fa-box icon"></i> Productos</a></li>
        <li><a href="categorias.jsp"><i class="fas fa-list"></i> Categorías</a></li>
        <li><a href="reservas.jsp"><i class="fas fa-bookmark"></i> Reservas</a></li>
        <li><a href="about_us.jsp"><i class="fas fa-info-circle"></i> Sobre nosotros</a></li>
        <li><a href="contactanos.jsp"><i class="fas fa-envelope"></i> Contáctanos</a></li>
        <li><a href="ayuda.jsp"><i class="fas fa-question-circle"></i> Ayuda</a></li>
    </ul>
</nav>

<main>
    <section id="contactactanos-section">
        <div class="contactanos-titulo">
            <h2>Contáctanos</h2>
        </div>
        <div class="contactanos-descripcion">
            <h1>Si tienes alguna pregunta o inquietud, no dudes en ponerte en contacto con nosotros. Estaremos encantados de ayudarte.</h1>
        </div>

        <div class="contactanos-formulario">
            <form action="${pageContext.request.contextPath}/EnviarPqrsServlet" method="POST" class="contact-form needs-validation" novalidate>
                <div class="contactanos-form-info">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" name="NOMBRE" class="form-control" required>
                    <div class="invalid-feedback">Por favor, ingrese su nombre.</div>
                </div>
                <div class="contactanos-form-info">
                    <label for="email">Correo Electrónico</label>
                    <input type="email" id="email" name="CORREO" class="form-control" required>
                    <div class="invalid-feedback">Por favor, ingrese un correo electrónico válido.</div>
                </div>
                <div class="contactanos-form-info">
                    <label for="mensaje">Mensaje</label>
                    <textarea id="mensaje" name="MENSAJE" class="form-control" rows="4" required></textarea>
                    <div class="invalid-feedback">Por favor, ingrese un mensaje.</div>
                </div>
                <button type="submit" class="contactanos-form-enviar">Enviar</button>
            </form>
        </div>

        <div class="contactanos-mapa">
            <h3>Visítanos</h3>
            <iframe src="https://www.google.com/maps/embed?pb=..." width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>

        <div class="contactanos-info">
            <h3>Información de contacto</h3>
            <p>Dirección: Calle Ficticia 123, Ciudad, País</p>
            <p>Teléfono: +123 456 789</p>
            <p>Correo electrónico: contacto@agrosellnova.com</p>
        </div>
    </section>
</main>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Enlaces rápidos</h3>
            <ul>
                <li><a href="inicio.jsp">Inicio</a></li>
                <li><a href="categorias.jsp">Categorías</a></li>
                <li><a href="contactanos.jsp">Contáctanos</a></li>
                <li><a href="about_us.jsp">Sobre nosotros</a></li>
                <li><a href="mapa.jsp">Mapa del sitio</a></li>
                <li><a href="404.jsp">Error 404</a></li>
                <li><a href="500.jsp">Error 500</a></li>
                <li><a href="dashboard.jsp">Dashboard</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h3>Contacto</h3>
            <p>📍 Dirección: Calle Principal #123</p>
            <p>📞 Teléfono: +57 123 456 789</p>
            <p>📧 Email: <a href="mailto:info@agrosellnova.com">info@agrosellnova.com</a></p>
        </div>
        <div class="footer-column">
            <h3>Síguenos</h3>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Agrosell Nova. Todos los derechos reservados. <a href="terminos.jsp">Términos y condiciones</a></p>
    </div>
</footer>

<script>
    // Validación de formulario
    (function () {
        'use strict';
        var forms = document.querySelectorAll('.needs-validation');
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();

    document.getElementById('notificationButton').addEventListener('click', function () {
        alert("No tienes notificaciones pendientes");
    });

    function debounce(func, wait) {
        let timeout;
        return function (...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }

    window.addEventListener("scroll", debounce(function () {
        const menuBar = document.querySelector(".menu-bar");
        if (window.scrollY > 50) {
            menuBar.classList.add("scrolled");
        } else {
            menuBar.classList.remove("scrolled");
        }
    }, 100));
</script>
</body>
</html>
