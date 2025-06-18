<%-- 
    Document   : categorias
    Created on : 12/06/2025, 8:45:43 p. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorias - Agrosell Nova</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>
    <header class="top-bar">
        <div class="header-content">
            <img src="../../img/logo.png" alt="Agrosell Nova" class="logo">
            <h1 class="menu-title">AGROSELL NOVA</h1>
            <div class="panel-option">
                <button id="panelControl">
                    <a href="../vistas_privadas/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
                </button>
            </div>
            <a href="carrito.jsp" class="menu-icon">
                <i class="fas fa-shopping-cart"></i>
            </a>
            <span class="notification">
                <button id="notificationButton">
                    <i class="fas fa-bell" class="menu-icon"></i>
                </button>
            </span>

            <span class="username">
                <% if (usuario != null) { %>
                    <a href="cerrar_sesion.jsp"><%= usuario %></a>
                <% } else { %>
                    <a href="index.jsp">Iniciar sesión/Registrarse</a>
                <% } %>
            </span>

            <a href="../vistas_privados/perfil.jsp" class="menu-icon">
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
        <h1 class="categorias-titulo">Explora nuestras categorías</h1>
        <section class="categorias-section">
            <div class="categoria-item">
                <img src="../../img/productos/imgfrutas.jpg" alt="Frutas">
                <h3>Frutas</h3>
                <p>Explora nuestras frutas frescas y orgánicas.</p>
                <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=frutas" class="btn-categoria">Ver más</a>
            </div>
            <div class="categoria-item">
                <img src="../../img/Verduras.jpg" alt="Verduras">
                <h3>Verduras</h3>
                <p>Descubre las mejores verduras recién cosechadas.</p>
                <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=verduras" class="btn-categoria">Ver más</a>
            </div>
            <div class="categoria-item">
                <img src="../../img/granos.jpg" alt="Granos">
                <h3>Granos</h3>
                <p>Gran variedad de granos para tus necesidades.</p>
                <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=granos" class="btn-categoria">Ver más</a>
            </div>
            <div class="categoria-item">
                <img src="../../img/lacteos.jpg" alt="Lácteos">
                <h3>Lácteos</h3>
                <p>Lácteos frescos y de calidad para tu hogar.</p>
                <a href="${pageContext.request.contextPath}/MostrarProductoServlet?producto=lacteos" class="btn-categoria">Ver más</a>
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
        document.getElementById('notificationButton').addEventListener('click', function() {
            alert("No tienes notificaciones pendientes");
        });

        function debounce(func, wait) {
            let timeout;
            return function(...args) {
                const later = () => {
                    clearTimeout(timeout);
                    func.apply(this, args);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
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