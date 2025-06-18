<%-- 
    Document   : productos
    Created on : 12/06/2025, 7:18:11 p. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <title>Productos - Agrosell Nova</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    </head>

    <body>
        <header class="top-bar">
            <div class="header-content">
                <img src="${pageContext.request.contextPath}/img/logo.png" alt="Agrosell Nova" class="logo">
                <h1 class="menu-title">AGROSELL NOVA</h1>
                <div class="panel-option">
                    <button id="panelControl">
                        <a href="jsp/vistas_privadas/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
                    </button>
                </div>
                <a href="jsp/vistas_publicas/carrito.jsp" class="menu-icon">
                    <i class="fas fa-shopping-cart"></i>
                </a>
                <span class="notification">
                    <button id="notificationButton">
                        <i class="fas fa-bell"></i>
                    </button>
                </span>
                <span class="username">
                    <% if (usuario != null) {%>
                    <a href="jsp/vistas_publicas/cerrar_sesion.jsp"><%= usuario%></a>
                    <% } else { %>
                    <a href="index.jsp">Iniciar sesión / Registrarse</a>
                    <% }%>
                </span>
                <a href="jsp/vistas_privadas/perfil.jsp" class="menu-icon">
                    <i class="bi bi-person-circle" style="font-size: 30px;"></i>
                </a>
            </div>
        </header>

        <nav class="menu-bar">
            <ul>
                <li><a href="jsp/vistas_publicas/inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
                <li><a href="MostrarProductoServlet"><i class="fas fa-box icon"></i> Productos</a></li>
                <li><a href="jsp/vistas_publicas/categorias.jsp"><i class="fas fa-list"></i> Categorías</a></li>
                <li><a href="jsp/vistas_publicas/reservas.jsp"><i class="fas fa-bookmark"></i> Reservas</a></li>
                <li><a href="jsp/vistas_publicas/about_us.jsp"><i class="fas fa-info-circle"></i> Sobre nosotros</a></li>
                <li><a href="jsp/vistas_publicas/contactanos.jsp"><i class="fas fa-envelope"></i> Contáctanos</a></li>
                <li><a href="jsp/vistas_publicas/ayuda.jsp"><i class="fas fa-question-circle"></i> Ayuda</a></li>
            </ul>
        </nav>

        <main>
            <section class="producto-titulo">
                <h1>¡Todos los productos que buscas están aquí!</h1>
            </section>

            <section class="filtra-productos">
                <form action="MostrarProductoServlet" method="get">
                    <label for="producto">Producto:</label>
                    <input type="text" name="producto" id="nombre_producto" placeholder="Ej: Manzanas">

                    <label for="orden">Ordenar por:</label>
                    <select name="orden" id="orden">
                        <option value="recientes">Más recientes</option>
                        <option value="precio_menor">Precio menor</option>
                        <option value="precio_mayor">Precio mayor</option>
                        <option value="nombre">A-Z</option>
                    </select>

                    <button type="submit">BUSCAR PRODUCTO</button>
                </form>
            </section>


            <section id="productos" class="productos-section">
                <c:choose>
                    <c:when test="${not empty productos}">
                        <c:forEach var="producto" items="${productos}">
                            <div class="productos-imagenes">
                                <img src="${pageContext.request.contextPath}/${producto.imagen.replace('../', '')}" alt="${producto.nombre}">
                                <div class="productos-texto">
                                    <h3>${producto.nombre}</h3>
                                    <p>$${producto.precio} Kg<br>Stock: ${producto.stock}</p>
                                    <a href="#" class="btn-añadir-carrito" 
                                       onclick="agregarAlCarrito('${producto.nombre}', ${producto.precio}, '${producto.imagen}')">
                                        Añadir al carrito
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>No hay productos disponibles.</p>
                    </c:otherwise>
                </c:choose>
            </section>

        </main>

        <footer class="footer">
            <div class="footer-container">
                <div class="footer-column">
                    <h3>Enlaces rápidos</h3>
                    <ul>
                        <li><a href="jsp/vistas_publicas/inicio.jsp">Inicio</a></li>
                        <li><a href="jsp/vistas_publicas/categorias.jsp">Categorías</a></li>
                        <li><a href="jsp/vistas_publicas/contactanos.jsp">Contáctanos</a></li>
                        <li><a href="jsp/vistas_publicas/about_us.jsp">Sobre nosotros</a></li>
                        <li><a href="jsp/vistas_publicas/mapa.jsp">Mapa del sitio</a></li>
                        <li><a href="jsp/vistas_publicas/404.jsp">Error 404</a></li>
                        <li><a href="jsp/vistas_publicas/500.jsp">Error 500</a></li>
                        <li><a href="jsp/vistas_publicas/dashboard.jsp">Dashboard</a></li>
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
                <p>&copy; 2024 Agrosell Nova. Todos los derechos reservados. <a href="jsp/vistas_publicas/terminos.jsp">Términos y condiciones</a></p>
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

            function agregarAlCarrito(nombre, precio, imagen) {
                let cantidad = prompt(`Ingrese la cantidad de "${nombre}" que desea agregar:`, "1");
                if (cantidad === null || cantidad.trim() === "" || isNaN(cantidad) || cantidad <= 0) {
                    alert("Operación cancelada o cantidad inválida. No se agregó el producto al carrito.");
                    return;
                }
                cantidad = parseInt(cantidad);
                const carrito = JSON.parse(localStorage.getItem("carrito")) || [];
                const producto = {nombre, precio, imagen, cantidad};
                carrito.push(producto);
                localStorage.setItem("carrito", JSON.stringify(carrito));
                alert(`${nombre} (${cantidad}) se ha añadido al carrito.`);
            }
        </script>
    </body>

</html>
