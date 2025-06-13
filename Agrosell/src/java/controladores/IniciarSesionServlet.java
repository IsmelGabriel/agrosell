/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;
import util.Conexion; // Asegúrate de tener esta clase

@WebServlet("/IniciarSesionServlet")
public class IniciarSesionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        if (usuario != null && password != null && !usuario.isEmpty() && !password.isEmpty()) {
            try (Connection conn = Conexion.getConnection()) {
                String sql = "SELECT CONTRASEÑA, ROL FROM usuarios WHERE USUARIO = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, usuario);
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            String hashAlmacenado = rs.getString("CONTRASEÑA");
                            hashAlmacenado = hashAlmacenado.replace("$2y$", "$2a$").trim();
                            String rol = rs.getString("ROL");

                            if (BCrypt.checkpw(password, hashAlmacenado)) {
                                HttpSession session = request.getSession();
                                session.setAttribute("usuario", usuario);
                                session.setAttribute("rol", rol);
                                response.sendRedirect("jsp/vistas_publicas/inicio.jsp"); // ajusta según la vista real
                            } else {
                                redireccionarConError(response, "Contraseña incorrecta.");
                            }
                        } else {
                            redireccionarConError(response, "Usuario no encontrado.");
                        }
                    }
                }
            } catch (Exception e) {
                redireccionarConError(response, "");
            }
        } else {
            redireccionarConError(response, "Debe completar todos los campos.");
        }
    }

    private void redireccionarConError(HttpServletResponse response, String mensaje) throws IOException {
        response.sendRedirect("jsp/vistas_publicas/session_fallida.jsp?error=" + mensaje);
    }
}
