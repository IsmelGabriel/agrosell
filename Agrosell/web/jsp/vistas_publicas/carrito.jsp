<%-- 
    Document   : carrito
    Created on : 12/06/2025, 8:36:16 p. m.
    Author     : USUARIO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);
    String usuario = (sesion != null && sesion.getAttribute("usuario") != null) ? (String) sesion.getAttribute("usuario") : null;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito - Agrosell Nova</title>
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
                    <i class="fas fa-bell menu-icon"></i>
                </button>
            </span>
            <span  class="username">
                <% if (usuario != null) { %>
                    <a href="../vistas_privadas/perfil.jsp"><%= usuario %></a>
                <% } else { %>
                    <a href="index.jsp">Iniciar sesión/Registrarse</a>
                <% } %>
            </span>
            <a href="../vistras_privadas/perfil.jsp" class="menu-icon">
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
        <section class="carrito-compra">
            <div class="seccion-carrito">
                <div class="carrito-titulo">
                    <h2>Carrito de compras</h2>
                </div>
                <div id="carrito" class="carrito-productos"></div>
                <div id="total-carrito" class="total-carrito">
                    <p>Total: $0</p>
                </div>
                <a href="../formularios/formulario_pago.jsp" class="boton-pago">Realizar pago</a>
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
                    <li><a href="contacto.jsp">Contáctanos</a></li>
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

        window.addEventListener("scroll", function () {
            const menuBar = document.querySelector(".menu-bar");
            if (window.scrollY > 50) {
                menuBar.classList.add("scrolled");
            } else {
                menuBar.classList.remove("scrolled");
            }
        });

        // Inicializar el total del carrito
        let total = 0;

        // Obtener elementos del DOM
        const carrito = document.getElementById("carrito");
        const totalCarrito = document.getElementById("total-carrito");

        // Cargar productos desde el localStorage
        const productosCarrito = JSON.parse(localStorage.getItem('carrito')) || [];

        productosCarrito.forEach(producto => {
            const productoElemento = document.createElement('div');
            productoElemento.classList.add('producto-carrito');
            productoElemento.innerHTML = `
                <img src="${producto.imagen}" alt="${producto.nombre}" class="producto-imagen-carrito">
                <div class="info-producto-carrito">
                    <p>${producto.nombre}</p>
                    <p>$${producto.precio.toLocaleString()}</p>
                    <p>Cantidad: ${producto.cantidad.toLocaleString()}</p>
                </div>
                <button class="boton-eliminar-carrito">Eliminar</button>
            `;
            carrito.appendChild(productoElemento);
            total += producto.precio * producto.cantidad;
        });

        totalCarrito.innerHTML = <p>Total: $${total.toLocaleString()}</p>;

        carrito.addEventListener("click", (e) => {
            if (e.target.classList.contains("boton-eliminar-carrito")) {
                const producto = e.target.closest(".producto-carrito");

                const precioTexto = producto.querySelector(".info-producto-carrito p:nth-child(2)").textContent;
                const precio = parseInt(precioTexto.replace(/[^0-9]/g, ""), 10);

                const cantidadTexto = producto.querySelector(".info-producto-carrito p:nth-child(3)").textContent;
                const cantidad = parseInt(cantidadTexto.replace(/[^0-9]/g, ""), 10);

                total -= precio * cantidad;
                producto.remove();
                totalCarrito.innerHTML = <p>Total: $${total.toLocaleString()}</p>;

                const nombreProducto = producto.querySelector(".info-producto-carrito p:first-child").textContent;
                const carritoActualizado = productosCarrito.filter(p => p.nombre !== nombreProducto);
                localStorage.setItem('carrito', JSON.stringify(carritoActualizado));
            }
        });
    </script>
</body>
</html>