/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelos.Producto;
import util.Conexion;

@WebServlet("/MostrarProductoServlet")
public class MostrarProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreProducto = request.getParameter("producto");
        String orden = request.getParameter("orden");

        ArrayList<Producto> productos = new ArrayList<>();

        try (Connection conn = Conexion.getConnection()) {
            String sql = "SELECT * FROM producto WHERE 1=1";

            boolean tieneFiltroNombre = nombreProducto != null && !nombreProducto.trim().isEmpty();
            if (tieneFiltroNombre) {
                sql += " AND NOMBRE_PRODUCTO LIKE ?";
            }

            switch (orden != null ? orden : "recientes") {
                case "precio_menor" -> sql += " ORDER BY PRECIO ASC";
                case "precio_mayor" -> sql += " ORDER BY PRECIO DESC";
                case "nombre" -> sql += " ORDER BY NOMBRE_PRODUCTO ASC";
                default -> sql += " ORDER BY ID_PRODUCTO DESC";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);

            if (tieneFiltroNombre) {
                stmt.setString(1, "%" + nombreProducto.trim() + "%");
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Producto p = new Producto(
                    rs.getInt("ID_PRODUCTO"),
                    rs.getString("NOMBRE_PRODUCTO"),
                    rs.getDouble("PRECIO"),
                    rs.getInt("STOCK"),
                    rs.getString("PRODUCTO_IMAGEN")
                );
                productos.add(p);
            }

        } catch (SQLException e) {
            throw new ServletException("Error al obtener productos", e);
        }

        request.setAttribute("productos", productos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/vistas_publicas/productos.jsp");
        dispatcher.forward(request, response);
    }
}
