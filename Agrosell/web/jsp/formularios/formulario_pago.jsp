<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
    <title>Agrosell Nova - Pago</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <script src="../../js/mostrarNombre.js" defer></script>
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
                    <i class="fas fa-bell menu-icon"></i>
                </button>
            </span>
            <span>
                <% if (usuario != null) { %>
                    <a href="../../php/cerrarSesion.jsp" class="username"><%= usuario %></a>
                <% } else { %>
                    <a href="../index.jsp" class="username">Iniciar sesión/Registrarse</a>
                <% } %>
            </span>
            <a href="panel/perfil.jsp" class="menu-icon">
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

    
    <main class="formulario-pago-container">
        <div class="cuadro-pago">
            <h2 class="realizar-pago">Realizar pago</h2>
            <form action="../../GuardarPagoSer" method="post" class="needs-validation" novalidate>
                <div class="formulario-pago">
                    <label for="NOMBRE" class="form-label">Nombre Completo</label>
                    <input type="text" class="form-control" id="NOMBRE" name="NOMBRE" placeholder="Juan Pérez" required>
                    <div class="invalid-feedback">Por favor, ingrese su nombre completo.</div>
                </div>
                <div class="formulario-pago">
                    <label for="CORREO" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control" id="CORREO" name="CORREO" placeholder="ejemplo@correo.com" required>
                    <div class="invalid-feedback">Por favor, ingrese un correo electrónico válido.</div>
                </div>
                <div class="formulario-pago">
                    <label for="TELEFONO" class="form-label">Número de Teléfono</label>
                    <input type="number" class="form-control" id="TELEFONO" name="TELEFONO" placeholder="Ingresa tu numero de telefono" required>
                    <div class="invalid-feedback">Por favor, ingrese un número de teléfono válido (10 dígitos).</div>
                </div>
                <div class="formulario-pago">
                    <label for="METODO_PAGO" class="form-label">Método de Pago</label>
                    <select class="form-select" id="metodo-pago" name="METODO_PAGO" required>
                        <option value="" disabled selected>Seleccione un método</option>
                        <option value="Tarjeta de Credito">Tarjeta de Crédito</option>
                        <option value="Tarjeta de Debito">Tarjeta de Débito</option>
                        <option value="PayPal">PayPal</option>
                        <option value="Transferencia Bancaria">Transferencia Bancaria</option>
                        <option value="Nequi">Nequi</option>
                        <option value="Efectivo">Efectivo</option>
                    </select>
                    <div class="invalid-feedback">Por favor, seleccione un método de pago.</div>
                </div>
                <div class="formulario-pago">
                    <label for="tarjeta" class="form-label">Número de Tarjeta</label>
                    <input type="text" class="form-control" id="tarjeta" name="TARJETA" minlength="16" maxlength="16" required>
                    <div class="invalid-feedback">Por favor, ingrese un número de tarjeta válido (16 dígitos).</div>
                </div>
                <div class="formulario-pago">
                    <label for="expiracion" class="form-label">Fecha de Expiración</label>
                    <input type="month" class="form-control" id="expiracion" name="FECHA_EXPIRACION" required>
                    <div class="invalid-feedback">Por favor, ingrese una fecha de expiración válida.</div>
                </div>
                <div class="formulario-pago">
                    <label for="cvv" class="form-label">Código de Seguridad (CVV)</label>
                    <input type="text" class="form-control" id="cvv" name="CVV" minlength="3" maxlength="3" required>
                    <div class="invalid-feedback">Por favor, ingrese el código de seguridad (3 dígitos).</div>
                </div>
                <div class="formulario-pago">
                    <label for="DIRECCION" class="form-label">Dirección</label>
                    <input type="text" class="form-control" id="direccion" name="DIRECCION" required>
                    <div class="invalid-feedback">Por favor, ingrese su dirección.</div>
                </div>
                <button type="submit" class="confirmar-pago-btn">Confirmar pago</button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <h3>Enlaces rápidos</h3>
                <ul>
                    <li><a href="../vistas_publicas/inicio.jsp">Inicio</a></li>
                    <li><a href="../vistas_publicas/categorias.jsp">Categorías</a></li>
                    <li><a href="../vistas_publicas/contactanos.jsp">Contáctanos</a></li>
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

    <!-- Scripts -->
    <script>
        document.getElementById('notificationButton').addEventListener('click', () => alert("No tienes notificaciones pendientes"));
        window.addEventListener("scroll", () => {
            const menuBar = document.querySelector(".menu-bar");
            menuBar.classList.toggle("scrolled", window.scrollY > 50);
        });
        (() => {
            'use strict';
            document.querySelectorAll('.needs-validation').forEach(form => {
                form.addEventListener('submit', event => {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                });
            });
        })();
    </script>
</body>
</html>
