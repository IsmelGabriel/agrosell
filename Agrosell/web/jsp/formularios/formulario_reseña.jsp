<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String nombreUsuario = (String) session.getAttribute("nombre_usuario");
    String rol = (String) session.getAttribute("rol");
    if (nombreUsuario == null) {
        nombreUsuario = "Iniciar sesión/Registrarse";
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agrosell Nova - Reseña</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <script src="../../js/mostrarNombre.js" defer></script>
</head>
<body>
    <header class="top-bar">
        <div class="header-content">
            <img src="../../img/logo.png" alt="Agrosell Nova" class="logo">
            <h1 class="menu-title">AGROSELL NOVA</h1>
            <div class="panel-option">
                <button id="panelControl">
                    <a href="../../vistas_privadas/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
                </button>
            </div>
            <a href="../carrito.jsp" class="menu-icon">
                <i class="fas fa-shopping-cart"></i>
            </a>
            <span class="notification">
                <button id="notificationButton">
                    <i class="fas fa-bell"></i>
                </button>
            </span>
            <span><a href="../../php/cerrarSesion.jsp" class="username" id="usuario"><%= nombreUsuario %></a></span>
            <a href="../../vistas_privadas/perfil.jsp" class="menu-icon">
                <i class="bi bi-person-circle" style="font-size: 30px;"></i>
            </a>
        </div>
    </header>

    <nav class="menu-bar">
        <ul>
            <li><a href="../inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
            <li><a href="../productos.jsp"><i class="fas fa-box icon"></i> Productos</a></li>
            <li><a href="../categorias.jsp"><i class="fas fa-list"></i> Categorías</a></li>
            <li><a href="../reservas.jsp"><i class="fas fa-bookmark"></i> Reservas</a></li>
            <li><a href="../about_us.jsp"><i class="fas fa-info-circle"></i> Sobre nosotros</a></li>
            <li><a href="../contactanos.jsp"><i class="fas fa-envelope"></i> Contáctanos</a></li>
            <li><a href="../ayuda.jsp"><i class="fas fa-question-circle"></i> Ayuda</a></li>
        </ul>
    </nav>

    <main class="reseña-producto-container">
        <div class="reseña-container">
            <h2>Deja tu reseña</h2>
            <form action="formulario_reseña.jsp" method="post" class="needs-validation" novalidate>
                <div class="formulario-reseña">
                    <label for="name" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Ingresa tu nombre" required>
                    <div class="invalid-feedback">Por favor ingresa tu nombre.</div>
                </div>
                <div class="formulario-reseña">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Ingresa tu correo electrónico" required>
                    <div class="invalid-feedback">Por favor ingresa un correo electrónico válido.</div>
                </div>
                <div class="formulario-reseña">
                    <label for="rating" class="form-label">Puntuación</label>
                    <select class="form-select" id="rating" name="rating" required>
                        <option value="" disabled selected>Selecciona una puntuación</option>
                        <option value="1">1 - Muy mala</option>
                        <option value="2">2 - Mala</option>
                        <option value="3">3 - Aceptable</option>
                        <option value="4">4 - Buena</option>
                        <option value="5">5 - Excelente</option>
                    </select>
                    <div class="invalid-feedback">Por favor selecciona una puntuación.</div>
                </div>
                <div class="formulario-reseña">
                    <label for="comments" class="form-label">Comentarios</label>
                    <textarea class="form-control" id="comments" name="comments" rows="4" placeholder="Escribe tus comentarios aquí" required></textarea>
                    <div class="invalid-feedback">Por favor ingresa tus comentarios.</div>
                </div>
                <button type="submit" class="confirmar-reseña-btn">Enviar Reseña</button>
            </form>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <h3>Enlaces rápidos</h3>
                <ul>
                    <li><a href="../inicio.jsp">Inicio</a></li>
                   <li><a href="../inicio.jsp"></a></li>
                    <li><a href="../categorias.jsp">Categorías</a></li>
                    <li><a href="../contacto.jsp">Contáctanos</a></li>
                    <li><a href="../about_us.jsp">Sobre nosotros</a></li>
                    <li><a href="../mapa.jsp">Mapa del sitio</a></li>
                    <li><a href="../404.jsp">Error 404</a></li>
                    <li><a href="../500.jsp">Error 500</a></li>
                    <li><a href="../dashboard.jsp">Dashboard</a></li>
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
            <p>&copy; 2024 Agrosell Nova. Todos los derechos reservados. <a href="../terminos.jsp">Términos y condiciones</a></p>
        </div>
    </footer>

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
