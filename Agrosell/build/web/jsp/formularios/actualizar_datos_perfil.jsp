<%-- 
    Document   : actualizar_datos_perfil
    Created on : 17/06/2025, 9:15:11 p. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.Conexion" %>

<%
    HttpSession sesion = request.getSession(false);
    String usuario = (String) sesion.getAttribute("usuario");

    if (sesion == null || usuario == null) {
        response.sendRedirect("jsp/vistas_publicas/index.jsp");
        return;
    }

    String nombre = "", documento = "", direccion = "", correo = "", metodoPago = "", fechaNacimiento = "";

    try (Connection conn = Conexion.getConnection()) {
        String sql = "SELECT NOMBRE, DOCUMENTO, DIRECCION, CORREO, METODO_PAGO, FECHA_NACIMIENTO FROM usuarios WHERE USUARIO = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usuario);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nombre = rs.getString("NOMBRE");
                    documento = rs.getString("DOCUMENTO");
                    direccion = rs.getString("DIRECCION");
                    correo = rs.getString("CORREO");
                    metodoPago = rs.getString("METODO_PAGO");
                    fechaNacimiento = rs.getString("FECHA_NACIMIENTO");
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Actualizar Perfil</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
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


        <!-- Segunda barra -->
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
        
        <main class="actualizar-perfil-container">
            <div class="actualizar-perfil-formulario">
                <h2>Actualizar Perfil</h2>
                <form class="needs-validation" action="<%=request.getContextPath()%>/ActualizarPerfilServlet?id=<%= usuario%>" method="post" novalidate>
                    <div class="form-actualizar-perfil">
                        <label for="name">Nombre Completo</label>
                        <input type="text" name="name" class="form-control" value="<%= nombre%>" required>
                    </div>
                    <div class="form-actualizar-perfil">
                        <label for="USUARIO">Usuario</label>
                        <input type="text" name="USUARIO" class="form-control" value="<%= usuario%>" required>
                    </div>
                    <div class="form-actualizar-perfil">
                        <label for="DOCUMENTO">Documento</label>
                        <input type="number" name="DOCUMENTO" class="form-control" value="<%= documento%>" required>
                    </div>
                    <div class="form-actualizar-perfil">
                        <label for="DIRECCION">Dirección</label>
                        <input type="text" name="DIRECCION" class="form-control" value="<%= direccion%>" required>
                    </div>
                    <div class="form-actualizar-perfil">
                        <label for="CORREO">Correo Electrónico</label>
                        <input type="email" name="CORREO" class="form-control" value="<%= correo%>" required>
                    </div>
                    <div class="form-actualizar-perfil">
                        <label for="METODO_PAGO">Método de Pago</label>
                        <input type="text" name="METODO_PAGO" class="form-control" value="<%= metodoPago%>" required>
                    </div>
                    <div class="form-actualizar-perfil">
                        <label for="FECHA_NACIMIENTO">Fecha de Nacimiento</label>
                        <input type="date" name="FECHA_NACIMIENTO" class="form-control" value="<%= fechaNacimiento%>" required>
                    </div>
                    <div class="actualizar-perfil-btn">
                        <a href="jsp/vistas_privadas/perfil.jsp" class="btn btn-secondary">Volver al Perfil</a>
                        <button type="submit" class="btn btn-success">Guardar Cambios</button>
                    </div>
                </form>

            </div>
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
