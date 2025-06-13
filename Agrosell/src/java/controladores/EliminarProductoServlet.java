/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import util.Conexion;

@WebServlet("/EliminarProductoServlet")
public class EliminarProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);

        // Validación de sesión
        if (sesion == null || sesion.getAttribute("usuario") == null || sesion.getAttribute("rol") == null) {
            response.sendRedirect("../web/index.html");
            return;
        }

        String usuario = sesion.getAttribute("usuario").toString();
        String idProducto = request.getParameter("id");

        try (Connection conn = Conexion.getConnection()) {
            // Verifica que el producto pertenezca al usuario
            String sqlSelect = "SELECT * FROM producto WHERE USUARIO_CAMPESINO = ? AND ID_PRODUCTO = ?";
            PreparedStatement stmtSelect = conn.prepareStatement(sqlSelect);
            stmtSelect.setString(1, usuario);
            stmtSelect.setString(2, idProducto);
            ResultSet rs = stmtSelect.executeQuery();

            if (!rs.next()) {
                response.getWriter().println("<script>alert('Producto no encontrado o no autorizado.'); window.location='../web/panel/gestionar_productos.jsp';</script>");
                return;
            }

            // Elimina el producto
            String sqlDelete = "DELETE FROM producto WHERE ID_PRODUCTO = ?";
            PreparedStatement stmtDelete = conn.prepareStatement(sqlDelete);
            stmtDelete.setString(1, idProducto);

            int rows = stmtDelete.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("../jsp/vistas_privadas/gestionar_productos.jsp");
            } else {
                response.getWriter().println("<script>alert('Error al eliminar el producto.'); window.location='/jsp/vistas_privadas/gestionar_productos.jsp';</script>");
            }

        } catch (SQLException e) {
            response.getWriter().println("<script>alert('Error de base de datos.'); window.location='jsp/vistas_privadas/gestionar_productos.jsp';</script>");
        }
    }
}