package controladores;

import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelos.Usuario;

@WebServlet("/ActualizarPerfilServlet")
public class ActualizarPerfilServlet extends HttpServlet {

    private final UsuarioDAO usuarioDAO = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect("jsp/vistas_publicas/index.jsp");
            return;
        }

        String nombreUsuario = (String) sesion.getAttribute("usuario");

        Usuario usuario = usuarioDAO.obtenerUsuarioPorNombre(nombreUsuario);

        if (usuario != null) {
            request.setAttribute("usuario", usuario);
            request.getRequestDispatcher("jsp/formularios/actualizar_datos_perfil.jsp").forward(request, response);
        } else {
            response.sendRedirect("jsp/vistas_publicas/index.jsp?error=usuario_no_encontrado");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion == null || sesion.getAttribute("usuario") == null) {
            response.sendRedirect("jsp/vistas_publicas/index.jsp");
            return;
        }

        String nombreUsuario = (String) sesion.getAttribute("usuario");
        Usuario usuarioExistente = usuarioDAO.obtenerUsuarioPorNombre(nombreUsuario);

        if (usuarioExistente != null) {
            try {
                Usuario usuario = new Usuario();
                usuario.setId(usuarioExistente.getId()); // obtenemos el ID desde la DB
                usuario.setNombre(request.getParameter("nombre"));
                usuario.setUsuario(nombreUsuario); // mantenemos el mismo nombre de usuario
                usuario.setDocumento(request.getParameter("documento"));
                usuario.setDireccion(request.getParameter("direccion"));
                usuario.setCorreo(request.getParameter("correo"));
                usuario.setMetodoPago(request.getParameter("metodo_pago"));

                String fechaParam = request.getParameter("fecha_nacimiento");
                if (fechaParam != null && !fechaParam.isEmpty()) {
                    usuario.setFechaNacimiento(fechaParam);
                }

                boolean actualizado = usuarioDAO.actualizarUsuario(usuario);

                if (actualizado) {
                    response.sendRedirect("jsp/vistas_privadas/perfil.jsp?exito=true");
                } else {
                    response.sendRedirect("jsp/vistas_privadas/perfil.jsp?error=true");
                }

            } catch (IOException e) {
                response.sendRedirect("jsp/vistas_privadas/perfil.jsp?error=excepcion");
            }
        } else {
            response.sendRedirect("jsp/vistas_privadas/perfil.jsp?error=usuario_no_valido");
        }
    }
}
