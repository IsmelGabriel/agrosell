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

@WebServlet("/EditarProductoServlet")
public class EditarProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);

        if (sesion == null || sesion.getAttribute("usuario") == null || sesion.getAttribute("rol") == null) {
            response.sendRedirect("../web/index.html");
            return;
        }

        String usuario = (String) sesion.getAttribute("usuario");
        String idProducto = request.getParameter("id");

        try (Connection conn = Conexion.getConnection()) {
            String sql = "SELECT * FROM producto WHERE USUARIO_CAMPESINO = ? AND ID_PRODUCTO = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario);
            stmt.setString(2, idProducto);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("producto", rs);
                request.getRequestDispatcher("/web/panel/editar_producto.jsp").forward(request, response);
            } else {
                response.getWriter().println("No se encontró el producto.");
            }

        } catch (SQLException e) {
            response.getWriter().println("Error de conexión o consulta.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);

        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect("../web/index.html");
            return;
        }

        String idProducto = request.getParameter("ID_PRODUCTO");
        String nombre = request.getParameter("NOMBRE_PRODUCTO");
        String precio = request.getParameter("PRECIO");
        String descripcion = request.getParameter("DESCRIPCION");
        String pesoKg = request.getParameter("PESO_KG");
        String stock = request.getParameter("STOCK");

        try (Connection conn = Conexion.getConnection()) {
            String sql = "UPDATE producto SET NOMBRE_PRODUCTO = ?, PRECIO = ?, DESCRIPCION = ?, PESO_KG = ?, STOCK = ? WHERE ID_PRODUCTO = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nombre);
            stmt.setString(2, precio);
            stmt.setString(3, descripcion);
            stmt.setString(4, pesoKg);
            stmt.setString(5, stock);
            stmt.setString(6, idProducto);

            int resultado = stmt.executeUpdate();

            if (resultado > 0) {
                response.sendRedirect("../jsp/vistas_privadas/gestionar_productos.jsp");
            } else {
                response.getWriter().println("<script>alert('Error al actualizar el producto.');</script>");
            }

        } catch (SQLException e) {
            response.getWriter().println("<script>alert('Error de conexión.');</script>");
        }
    }
}
