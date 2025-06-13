<%-- 
    Document   : panel_control
    Created on : 12/06/2025, 10:30:17 a. m.
    Author     : USUARIO
--%>

<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");

    if (usuario == null || rol == null) {
        response.sendRedirect("../../jsp/vistas_publicas/cerrar_sesion.jsp");
        return;
    }

    int id_usuario = 0;
    String nombre = "", correo = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agrosell", "root", "");

        String sql = "SELECT ID_usuario, NOMBRE, USUARIO, CORREO, ROL FROM usuarios WHERE USUARIO = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, usuario);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            id_usuario = rs.getInt("ID_usuario");
            nombre = rs.getString("NOMBRE");
            correo = rs.getString("CORREO");
        } else {
            out.println("Usuario no encontrado.");
            return;
        }

        conn.close();
    } catch (Exception e) {
        out.println("Error de conexión: " + e.getMessage());
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Control</title>
    <link rel="stylesheet" href="../../css/panel.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="panel-control">
    <header class="Bienvenido">
        <h1>Bienvenido, <%= usuario.substring(0, 1).toUpperCase() + usuario.substring(1) %></h1>
        <p>Rol: <%= rol %></p>
    </header>

    <div class="panel-container">
        <!-- Barra lateral -->
        <aside class="sidebar">
            <div class="lateral-content">
                <ul>
                    <%
                        if ("administrador".equals(rol)) {
                    %>
                        <li><a href="../vistas_publicas/inicio.jsp">Inicio</a></li>
                        <li><a href="reporte_ventas.jsp">Reporte de Ventas</a></li>
                        <li><a href="reporte_reservas.jsp">Reporte de Reservas</a></li>
                        <li><a href="reporte_pqrs.jsp">Reporte de PQRS</a></li>
                        <li><a href="actualizar_roles.jsp">Actualizar Roles</a></li>
                        <li><a href="usuarios_registrados.jsp">Reporte usuarios</a></li>
                    <%
                        } else if ("productor".equals(rol)) {
                    %>
                        <li><a href="../vistas_publicas/inicio.jsp">Inicio</a></li>
                        <li><a href="ofertar_producto.jsp">Ofertar Producto</a></li>
                        <li><a href="gestionar_productos.jsp">Gestionar productos</a></li>
                    <%
                        } else if ("cliente".equals(rol)) {
                    %>
                        <li><a href="../vistas_publicas/inicio.jsp">Inicio</a></li>
                        <li><a href="gestionar_reservas.jsp">Gestionar Reservas</a></li>
                        <li><a href="../productos.jsp">Ver Productos</a></li>
                        <li><a href="../reservas.jsp">Realizar Reserva</a></li>
                    <%
                        }
                    %>
                    <li><a href="../../jsp/vistas_publicas/cerrar_sesion.jsp">Cerrar Sesión</a></li>
                </ul>
            </div>
        </aside>

        <main class="panel-content">
            <h2>Panel de Control</h2>
            <p>Información del usuario:</p>
            <p>User ID: <%= id_usuario %></p>
            <p>Nombre: <%= nombre %></p>
            <p>Usuario: <%= usuario %></p>
            <p>Email: <%= correo %></p>
            <p>Rol: <%= rol %></p>
        </main>
    </div>
</body>
</html>
