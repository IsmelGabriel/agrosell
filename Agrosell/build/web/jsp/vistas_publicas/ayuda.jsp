<%-- 
    Document   : ayuda
    Created on : 12/06/2025, 8:29:01 p. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ayuda - Agrosell Nova</title>
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
                <span class="username">
                    <% if (usuario != null) {%>
                    <a href="cerrar_sesion.jsp"><%= usuario%></a>
                    <% } else { %>
                    <a href="index.jsp">Iniciar sesión / Registrarse</a>
                    <% }%>
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
            <section class="ayuda-section">
                <div class="ayuda-info">
                    <div class="faq-section mb-5">
                        <h2 class="text-center mb-4">Preguntas Frecuentes</h2>
                        <div class="accordion" id="faqAccordion">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        ¿Cómo puedo registrarme en el sitio?
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                     data-bs-parent="#faqAccordion">
                                    <div class="accordion-body">
                                        Para registrarte, haz clic en el botón "Registrarse" en la parte superior y completa el formulario.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        ¿Cómo puedo recuperar mi contraseña?
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                     data-bs-parent="#faqAccordion">
                                    <div class="accordion-body">
                                        Haz clic en "Olvidé mi contraseña" en la página de inicio de sesión y sigue las instrucciones.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        ¿Cómo contacto al servicio de soporte?
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                     data-bs-parent="#faqAccordion">
                                    <div class="accordion-body">
                                        Puedes contactarnos utilizando el formulario de PQRS disponible a continuación.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Formulario de PQRS -->
                    <div class="ayuda-form">
                        <h3 class="text-center mb-4">Registrar PQRS</h3>
                        <form action="../guardar_pqrs.jsp" method="post" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="NOMBRE" class="form-label">Nombre completo</label>
                                <input type="text" class="form-control" id="NOMBRE" name="NOMBRE" required />
                                <div class="invalid-feedback">Por favor ingresa tu nombre completo.</div>
                            </div>
                            <div class="mb-3">
                                <label for="CORREO" class="form-label">Correo electrónico</label>
                                <input type="email" class="form-control" id="CORREO" name="CORREO" required />
                                <div class="invalid-feedback">Por favor ingresa un correo válido.</div>
                            </div>
                            <div class="mb-3">
                                <label for="TELEFONO" class="form-label">Teléfono</label>
                                <input type="number" class="form-control" id="TELEFONO" name="TELEFONO" required />
                                <div class="invalid-feedback">Por favor ingresa tu número de teléfono.</div>
                            </div>
                            <div class="mb-3">
                                <label for="MENSAJE" class="form-label">Consulta o solicitud</label>
                                <textarea class="form-control" id="MENSAJE" name="MENSAJE" rows="4" required></textarea>
                                <div class="invalid-feedback">Por favor describe tu consulta o solicitud.</div>
                            </div>
                            <button type="submit" class="ayuda-form-enviar">Enviar</button>
                        </form>
                    </div>
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
            // Validación Bootstrap
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
                menuBar.classList.toggle("scrolled", window.scrollY > 50);
            }, 100));
        </script>
    </body>
</html>
