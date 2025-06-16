<%-- 
    Document   : index
    Created on : 12/06/2025, 9:15:54 a. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión - Agrosell Nova</title>
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
            <a href="../carrito.jsp" class="menu-icon">
                <i class="fas fa-shopping-cart"></i>
            </a>
            <span class="notification">
                <button id="notificationButton">
                    <i class="fas fa-bell"></i>
                </button>
            </span>
            <span class="username" ><a href="registrarse.jsp" id="usuario">Crear cuenta</a></span>
        </div>
    </header>

    <nav class="menu-bar">
        <ul>
            <li>Bienvenido a Agrosell Nova. Actualmente te encuentras en la página de inicio de sesión.</li>
        </ul>
    </nav>

    <main>
        <section class="login-section">
            <div class="login-info">
                <h2>Iniciar Sesión</h2>
                <form id="loginForm" class="needs-validation" action="../../IniciarSesionServlet" method="post" novalidate>
                    <div class="login-info-form">
                        <label for="usuario" class="index-text">Usuario</label>
                        <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de usuario" required>
                        <div class="invalid-feedback">Por favor, ingresa un nombre de usuario.</div>

                        <label for="password" class="index-text">Contraseña</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="Contraseña" required minlength="6">
                        <div class="invalid-feedback">La contraseña debe tener al menos 6 caracteres.</div>

                        <div class="login-button mt-3">
                            <button type="submit" class="btn btn-success">Iniciar Sesión</button>
                        </div>
                    </div>

                    <div class="actions-buttons mt-3">
                        <a href="../formulario/recuperar_contraseña.jsp" class="btn btn-link text-success">¿Olvidaste tu contraseña?</a>
                        <a href="registrarse.jsp" class="btn btn-link text-success">¿No tienes cuenta? Regístrate</a>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <script>
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
            alert("Tienes que iniciar sesión para ver tus notificaciones");
        });
        document.getElementById('panelControl').addEventListener('click', function () {
            alert("Tienes que iniciar sesión para acceder al panel de control de la cuenta");
        });
    </script>
</body>
</html>

