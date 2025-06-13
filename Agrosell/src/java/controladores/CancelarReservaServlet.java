/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import util.Conexion;

@WebServlet("/CancelarReservaServlet")
public class CancelarReservaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Verifica sesión
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null || session.getAttribute("rol") == null) {
            response.sendRedirect("../web/index.html");
            return;
        }

        String usuario = (String) session.getAttribute("usuario");
        String idReserva = request.getParameter("id");

        try (Connection conn = Conexion.getConnection()) {
            // Verifica si la reserva existe y pertenece al usuario
            String consulta = "SELECT * FROM reservas WHERE USUARIO_CLIENTE = ? AND ID_Reservas = ?";
            try (PreparedStatement stmt = conn.prepareStatement(consulta)) {
                stmt.setString(1, usuario);
                stmt.setString(2, idReserva);
                ResultSet rs = stmt.executeQuery();

                if (!rs.next()) {
                    response.sendRedirect("../web/vistas_privadas/gestionar_reservas.jsp?error=NoSeEncontroReserva");
                    return;
                }
            }

            // Elimina la reserva
            String eliminar = "DELETE FROM reservas WHERE ID_Reservas = ?";
            try (PreparedStatement stmt = conn.prepareStatement(eliminar)) {
                stmt.setString(1, idReserva);
                stmt.executeUpdate();
            }

            response.sendRedirect("../web/vistas_privadas/gestionar_reservas.jsp?exito=ReservaCancelada");

        } catch (Exception e) {
            response.sendRedirect("../web/vistas_privadas/gestionar_reservas.jsp?error=ErrorEliminando");
        }
    }
}
