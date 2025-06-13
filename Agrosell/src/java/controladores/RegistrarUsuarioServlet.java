/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controladores;

import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Usuario;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/RegistrarUsuarioServlet")
public class RegistrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("password");
        String correo = request.getParameter("correo");

        if (nombre != null && usuario != null && contraseña != null && correo != null &&
            !nombre.isEmpty() && !usuario.isEmpty() && !contraseña.isEmpty() && !correo.isEmpty()) {

            UsuarioDAO dao = new UsuarioDAO();

            if (dao.existeUsuarioOCorreo(usuario, correo)) {
                // Usuario o correo ya registrado
                response.sendRedirect("jsp/vistas_publicas/registro_fallido.jsp");
            } else {
                // Encriptar contraseña
                String contraseñaEncriptada = BCrypt.hashpw(contraseña, BCrypt.gensalt());

                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setNombre(nombre);
                nuevoUsuario.setUsuario(usuario);
                nuevoUsuario.setCorreo(correo);
                nuevoUsuario.setContraseña(contraseñaEncriptada);

                boolean registrado = dao.registrarUsuario(nuevoUsuario);

                if (registrado) {
                    response.sendRedirect("jsp/vistas_publicas/registro_exitoso.jsp");
                } else {
                    response.sendRedirect("jsp/vistas_publicas/registro_fallido.jsp");
                }
            }

        } else {
            response.sendRedirect("jsp/vistas_publicas/registro_fallido.jsp");
        }
    }
}
