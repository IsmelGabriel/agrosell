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

@WebServlet("/EditarReservaServlet")
public class EditarReservaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);
        if (sesion == null
            || sesion.getAttribute("usuario") == null
            || sesion.getAttribute("rol") == null) {
            response.sendRedirect("../jsp/vistas_privadas/index.html");
            return;
        }

        String usuario = sesion.getAttribute("usuario").toString();
        String idReserva = request.getParameter("id");

        try (Connection conn = Conexion.getConnection()) {
            String sql = "SELECT * FROM reservas WHERE USUARIO_CLIENTE = ? AND ID_Reservas = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario);
            stmt.setString(2, idReserva);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("reserva", rs);
                request.getRequestDispatcher("/jsp/vistas_privadas/editar_reserva.jsp").forward(request, response);
            } else {
                response.getWriter().println("No se encontró la reserva.");
            }

        } catch (SQLException e) {
            response.getWriter().println("Error de BD");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect("../jsp/vistas_publicas/index.html");
            return;
        }

        String idReserva = request.getParameter("ID_Reservas");
        String documento = request.getParameter("USUARIO_DOCUMENTO");
        String telefono = request.getParameter("USUARIO_TELEFONO");
        String correo = request.getParameter("USUARIO_CORREO");
        String producto = request.getParameter("NOMBRE_PRODUCTO");
        String cantidad = request.getParameter("CANTIDAD_KG");
        String metodo = request.getParameter("METODO_PAGO");

        try (Connection conn = Conexion.getConnection()) {
            String sql = "UPDATE reservas SET USUARIO_DOCUMENTO=?, USUARIO_TELEFONO=?, USUARIO_CORREO=?, PRODUCTO=?, CANTIDAD_KG=?, METODO_PAGO=? WHERE ID_Reservas=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, documento);
            stmt.setString(2, telefono);
            stmt.setString(3, correo);
            stmt.setString(4, producto);
            stmt.setString(5, cantidad);
            stmt.setString(6, metodo);
            stmt.setString(7, idReserva);

            if (stmt.executeUpdate() > 0) {
                response.sendRedirect("../jsp/vistas_privadas/gestionar_reservas.jsp");
            } else {
                response.getWriter().println("<script>alert('Error al actualizar la reserva.');</script>");
            }
        } catch (SQLException e) {
            response.getWriter().println("<script>alert('Error de conexión.');</script>");
        }
    }
}