<%-- 
    Document   : registrarse
    Created on : 12/06/2025, 9:20:11 a. m.
    Author     : USUARIO
--%>

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
    <title>Crear cuenta - Agrosell Nova</title>
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
                <button id="panelControl">
                    <a href="../panel/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
                </button>
            </div>
            <a href="../carrito.jsp" class="menu-icon"><i class="fas fa-shopping-cart"></i></a>
            <span class="notification">
                <button id="notificationButton"><i class="fas fa-bell"></i></button>
            </span>
                        <span class="username">
                <% if (usuario != null) { %>
                    <a href="cerrar_sesion.jsp"><%= usuario %></a>
                <% } else { %>
                    <a href="index.jsp">Iniciar sesión</a>
                <% } %>
            </span>
        </div>
    </header>

    <nav class="menu-bar">
        <ul>
            <li>Bienvenido a Agrosell Nova. Actualmente estás en la página de creación de cuenta.</li>
        </ul>
    </nav>

    <main>
        <section class="registro-section">
            <div class="registro-info">
                <h1 class="registro-titulo">Crear Cuenta</h1>
                <form action="../../RegistrarUsuarioServlet" method="post" class="needs-validation" novalidate>
                    <div class="registro-info-form">
                        <label for="nombre" class="registro-text">Nombre completo</label>
                        <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingresa tu nombre" required>
                        <div class="invalid-feedback">Por favor, ingresa tu nombre.</div>

                        <label for="usuario" class="registro-text">Nombre de usuario</label>
                        <input type="text" name="usuario" class="form-control" id="usuario" placeholder="Nombre de usuario" required>
                        <div class="invalid-feedback">Por favor, ingresa un nombre de usuario.</div>

                        <label for="correo" class="registro-text">Correo Electrónico</label>
                        <input type="email" name="correo" class="form-control" id="correo" placeholder="ejemplo@correo.com" required>
                        <div class="invalid-feedback">Por favor, ingresa un correo válido.</div>

                        <label for="password" class="registro-text">Contraseña</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Crea una contraseña" minlength="8" required>
                        <div class="invalid-feedback">La contraseña debe tener al menos 8 caracteres, incluir una letra mayúscula, un número y un carácter especial.</div>

                        <label for="confirmPassword" class="registro-text">Repite la contraseña</label>
                        <input type="password" class="form-control" id="confirmPassword" placeholder="Repite tu contraseña" required>
                        <div class="invalid-feedback">Las contraseñas no coinciden.</div>

                        <input type="checkbox" class="form-check-input" id="terminos" required>
                        <label class="form-check-label" for="terminos">Acepto los términos y condiciones</label>
                        <div class="invalid-feedback">Debes aceptar los términos y condiciones.</div>
                    </div>

                    <a href="index.jsp" class="btn btn-link text-success">¿Ya tienes cuenta? Inicia sesión</a>

                    <div class="registro-button">
                        <button class="btn btn-primary w-100" type="submit">Registrarse</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <script>
        (() => {
            'use strict';

            const forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(form => {
                form.addEventListener('submit', event => {
                    const password = document.getElementById('password').value;
                    const confirmPassword = document.getElementById('confirmPassword').value;
                    const passwordRegex = /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*\d)[A-Za-z\d!@#$%^&*]{8,}$/;

                    if (!form.checkValidity() || !passwordRegex.test(password)) {
                        event.preventDefault();
                        event.stopPropagation();

                        if (!passwordRegex.test(password)) {
                            document.getElementById('password').setCustomValidity("La contraseña debe tener al menos 8 caracteres, incluir una letra mayúscula, un número y un carácter especial.");
                        } else {
                            document.getElementById('password').setCustomValidity("");
                        }
                    }

                    if (password !== confirmPassword) {
                        event.preventDefault();
                        event.stopPropagation();
                        document.getElementById('confirmPassword').setCustomValidity("Las contraseñas no coinciden.");
                    } else {
                        document.getElementById('confirmPassword').setCustomValidity("");
                    }

                    form.classList.add('was-validated');
                }, false);
            });

            document.getElementById('notificationButton').addEventListener('click', () => {
                alert("Tienes que iniciar sesión para ver tus notificaciones");
            });
            document.getElementById('panelControl').addEventListener('click', () => {
                alert("Tienes que iniciar sesión para acceder al panel de control de la cuenta");
            });
        })();
    </script>
</body>
</html>
