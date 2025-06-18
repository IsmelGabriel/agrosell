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
            <li><a href="../vistas_publicas/inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/MostrarProductoServlet"><i class="fas fa-box icon"></i> Productos</a></li>
            <li><a href="../vistas_publicas/categorias.jsp"><i class="fas fa-list"></i> Categorías</a></li>
            <li><a href="../vistas_publicas/reservas.jsp"><i class="fas fa-bookmark"></i> Reservas</a></li> 
            <li><a href="../vistas_publicas/about_us.jsp"><i class="fas fa-info-circle"></i> Sobre nosotros</a></li>
            <li><a href="../vistas_publicas/contactanos.jsp"><i class="fas fa-envelope"></i> Contáctanos</a></li>
            <li><a href="../vistas_publicas/ayuda.jsp"><i class="fas fa-question-circle"></i> Ayuda</a></li>
        </ul>
</nav>

<main class="reserva-producto-container">
    <div class="form-reserva">
        <h2>Reserva tu producto</h2>
        <form action="<%= request.getContextPath() %>/ReservarProductoSer" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="USUARIO_CLIENTE" id="USUARIO_CLIENTE" value="<%= usuario != null ? usuario : "" %>">

            <div class="reservar-form">
                <label for="documento">Número de documento</label>
                <input type="text" id="USUARIO_DOCUMENTO" name="USUARIO_DOCUMENTO" class="form-control" required>
                <div class="invalid-feedback">Por favor, ingrese su número de documento.</div>
            </div>
            <div class="reservar-form">
                <label for="telefono">Teléfono</label>
                <input type="tel" id="USUARIO_TELEFONO" name="USUARIO_TELEFONO" class="form-control" required>
                <div class="invalid-feedback">Por favor, ingrese su número de teléfono.</div>
            </div>
            <div class="reservar-form">
                <label for="correo">Correo electrónico</label>
                <input type="email" id="USUARIO_CORREO" name="USUARIO_CORREO" class="form-control" required>
                <div class="invalid-feedback">Por favor, ingrese un correo electrónico válido.</div>
            </div>
            <div class="reservar-form">
                <label for="producto">Producto</label>
                <select id="PRODUCTO" name="PRODUCTO" class="form-control" required>
                    <option value="">Seleccione un producto</option>
                    <option value="Cebolla">Cebolla</option>
                    <option value="Tomate">Tomate</option>
                    <option value="Zanahoria">Zanahoria</option>
                    <option value="Fresa">Fresa</option>
                    <option value="Mango">Mango</option>
                    <option value="Manzana">Manzana</option>
                </select>
                <div class="invalid-feedback">Por favor, seleccione un producto.</div>
            </div>
            <div class="reservar-form">
                <label for="cantidad">Cantidad (kg)</label>
                <input type="number" id="CANTIDAD_KG" name="CANTIDAD_KG" class="form-control" required>
                <div class="invalid-feedback">Por favor, ingrese una cantidad válida.</div>
            </div>
            <div class="reservar-form">
                <label for="metodo_pago">Método de pago</label>
                <select id="METODO_PAGO" name="METODO_PAGO" class="form-control" required>
                    <option value="">Seleccione un método de pago</option>
                    <option value="DE_CONTADO">De contado</option>
                    <option value="EFECTIVO">Efectivo</option>
                    <option value="TARJETA">Tarjeta</option>
                    <option value="TRANSFERENCIA">Transferencia</option>
                </select>
                <div class="invalid-feedback">Por favor, seleccione un método de pago.</div>
            </div>
            <button type="submit" class="confirmar-reserva-btn">Confirmar reserva</button>
        </form>
    </div>
</main>

<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })();

    document.getElementById('notificationButton').addEventListener('click', function () {
        alert("No tienes notificaciones pendientes");
    });

    window.addEventListener("scroll", function () {
        const menuBar = document.querySelector(".menu-bar");
        if (window.scrollY > 50) {
            menuBar.classList.add("scrolled");
        } else {
            menuBar.classList.remove("scrolled");
        }
    });
</script>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Enlaces rápidos</h3>
            <ul>
                <li><a href="../vistas_publicas/inicio.jsp">Inicio</a></li>
                <li><a href="../vistas_publicas/categorias.jsp">Categorías</a></li>
                <li><a href="../vistas_publicas/contacto.jsp">Contáctanos</a></li>
                <li><a href="../vistas_publicas/about_us.jsp">Sobre nosotros</a></li>
                <li><a href="../vistas_publicas/mapa.jsp">Mapa del sitio</a></li>
                <li><a href="../vistas_publicas/404.jsp">Error 404</a></li>
                <li><a href="../vistas_publicas/500.jsp">Error 500</a></li>
                <li><a href="../vistas_publicas/dashboard.jsp">Dashboard</a></li>
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
</body>
</html>
