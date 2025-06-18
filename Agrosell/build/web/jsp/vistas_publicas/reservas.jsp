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
    <title>Reservas</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <script src="../../js/mostrarNombre.js"></script>
</head>
<body>
    <header class="top-bar">
        <div class="header-content">
            <img src="https://i.ibb.co/cvj3qCk/agrosell-logo-removebg-preview-1.png" alt="Agrosell Nova" class="logo">
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
                    <i class="fas fa-bell"></i>
                </button>
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
    </header>SS

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
        <section class="titulo-reservas">
            <h1>Reserva tus productos próximos a salir</h1>
        </section>

        <section id="reservas" class="reserva-info-section">
            <div class="producto-reserva">
                <img src="https://static.compreloadomicilio.com/grupomonterosas/products/02427/638e7be1852e9759181748.webp" alt="Cebolla" class="producto-imagen-reserva">
                <h3>Cebolla</h3>
                <p>Precio: 15.000</p>
                <p>Disponible desde: 01/12/2024</p>
                <a href="../formulario/formulario_reserva.jsp" class="btn-reserva">Reservar</a>
            </div>

            <div class="producto-reserva">
                <img src="https://solofruver.com/wp-content/uploads/2022/10/tomate-daniela.webp" alt="Tomate" class="producto-imagen-reserva">
                <h3>Tomate</h3>
                <p>Precio: 12.000</p>
                <p>Disponible desde: 05/12/2024</p>
                <a href="../formulario/formulario_reserva.jsp" class="btn-reserva">Reservar</a>
            </div>

            <div class="producto-reserva">
                <img src="https://static.libertyprim.com/files/familles/carotte-large.jpg?1569271734" alt="Zanahoria" class="producto-imagen-reserva">
                <h3>Zanahoria</h3>
                <p>Precio: 18.500</p>
                <p>Disponible desde: 08/12/2024</p>
                <a href="../formulario/formulario_reserva.jsp" class="btn-reserva">Reservar</a>
            </div>

            <div class="producto-reserva">
                <img src="https://static.libertyprim.com/files/familles/fraise-large.jpg?1569271765" alt="Fresa" class="producto-imagen-reserva">
                <h3>Fresa</h3>
                <p>Precio: 10.000</p>
                <p>Disponible desde: 10/12/2024</p>
                <a href="../formulario/formulario_reserva.jsp" class="btn-reserva">Reservar</a>
            </div>

            <div class="producto-reserva">
                <img src="https://static.libertyprim.com/files/familles/mangue-large.jpg?1569271798" alt="Mango" class="producto-imagen-reserva">
                <h3>Mango</h3>
                <p>Precio: 25.000</p>
                <p>Disponible desde: 15/12/2024</p>
                <a href="../formulario/formulario_reserva.jsp" class="btn-reserva">Reservar</a>
            </div>

            <div class="producto-reserva">
                <img src="https://www.supermercadosantamaria.com/documents/10180/10504/31400_G.jpg" alt="Manzana" class="producto-imagen-reserva">
                <h3>Manzana</h3>
                <p>Precio: 20.000</p>
                <p>Disponible desde: 20/12/2024</p>
                <a href="../formulario/formulario_reserva.jsp" class="btn-reserva">Reservar</a>
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
