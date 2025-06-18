<%-- 
    Document   : about_us
    Created on : 12/06/2025, 8:31:08 p. m.
    Author     : USUARIO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sobre nosotros - Agrosell Nova</title>
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
                        <a href="panel/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
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
                    <% if (usuario != null) {%>
                    <a href="cerrar_sesion.jsp"><%= usuario%></a>
                    <% } else { %>
                    <a href="index.jsp">Iniciar sesión / Registrarse</a>
                    <% }%>
                </span>
                <a href="panel/perfil.jsp" class="menu-icon">
                    <i class="bi bi-person-circle" style="font-size: 30px;"></i>
                </a>
            </div>
        </header>

        <!-- Segunda barra -->
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
            <section class="about-section">
                <div class="about-us-info">
                    <h2>SOBRE NOSOTROS</h2>
                    <p>
                        En <strong>AGROSELL NOVA</strong>, creemos en la fuerza de la tierra y en el trabajo incansable de quienes la cultivan. 
                        Somos una plataforma dedicada a conectar directamente a los pequeños productores agropecuarios con los consumidores, 
                        eliminando los intermediarios y garantizando que cada venta beneficie directamente a quienes trabajan el campo.
                    </p>
                    <p>
                        Nuestra misión es apoyar a los campesinos, empoderándolos para que puedan obtener un precio justo por sus productos, 
                        mientras ofrecemos a los clientes alimentos frescos, de alta calidad, y cultivados de manera responsable. 
                        Queremos crear un sistema más justo y transparente, donde tanto el productor como el consumidor se beneficien.
                    </p>
                    <a href="../formularios/formulario_reseña.jsp" class="btn-aboutUs">Dejar una reseña</a>
                </div>
                <div class="about-imagen">
                    <img src="https://aneia.uniandes.edu.co/wp-content/uploads/2023/06/1.bp_.blogspot.com_-ejp4ZzPrp7Y_UiAm2BvvUHI_AAAAAAAAWQA_3hzdS0Y05Ag_s1600_Campesino-huila.jpg" alt="Imagen sobre nosotros">
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
            document.getElementById('notificationButton').addEventListener('click', function () {
                alert("No tienes notificaciones pendientes");
            });

            function debounce(func, wait) {
                let timeout;
                return function (...args) {
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