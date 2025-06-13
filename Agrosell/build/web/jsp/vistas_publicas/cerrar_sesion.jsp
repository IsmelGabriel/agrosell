<%-- 
    Document   : cerrar_sesion
    Created on : 12/06/2025, 10:15:18 a. m.
    Author     : USUARIO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(false);

    if (sesion != null) {
        sesion.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cerrando sesión...</title>
    <script>
        localStorage.removeItem('usuario');

        const referer = document.referrer;
        const paginasPermitidas = [
            'inicio.jsp',
            'productos.jsp',
            'categorias.jsp',
            'reservas.jsp',
            'about_us.jsp',
            'contactanos.jsp',
            'ayuda.jsp',
            'panel/perfil.jsp'
        ];
        const esValida = paginasPermitidas.some(p => referer.includes(p));
        window.location.href = esValida ? referer : 'inicio.jsp';
    </script>
</head>
<body>
    Cerrando sesión...
</body>
</html>
