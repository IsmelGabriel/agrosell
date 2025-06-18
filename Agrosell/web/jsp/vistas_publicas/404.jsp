<%-- 
    Document   : 404
    Created on : 17/06/2025, 7:37:37 p. m.
    Author     : USUARIO
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 404</title>
    <link rel="icon" href="../../img/favicon.png" type="image/png">
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: white;
            font-family: Arial, sans-serif;
            color: #333;
        }
        h1 {
            font-size: 5em;
            margin: 0;
        }
        p {
            font-size: 1.2em;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
        img {
            width: 300px;
        }
        .username {
            position: absolute;
            top: 20px;
            right: 30px;
            font-size: 1rem;
        }
    </style>
</head>
<body>

    <img src="../../img/logo.png" alt="logo">
    <h1>404 Página no encontrada</h1>
    <p>La página que buscas no está disponible.</p>

    <button onclick="goBack()">Volver atrás</button>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
