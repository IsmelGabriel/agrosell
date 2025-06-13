/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import modelos.Usuario;
import util.Conexion;
import java.sql.*;

public class UsuarioDAO {

    public Usuario validarUsuario(String correo, String contraseña) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND contraseña = ?";

        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, correo);
            ps.setString(2, contraseña); // Aquí iría la contraseña hasheada si usas MD5 o BCrypt

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setRol(rs.getString("rol"));
            }

        } catch (SQLException e) {
            System.out.println("Error al registrar al usuario" + e);
        }
        return usuario;
    }

    public boolean existeUsuarioOCorreo(String usuario, String correo) {
        String sql = "SELECT 1 FROM usuarios WHERE usuario = ? OR correo = ?";
        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, correo);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // true si encuentra algún resultado
        } catch (SQLException e) {
            System.out.println("Error verificando usuario/correo: " + e);
            return true; // por seguridad, asumimos que sí existe
        }
    }

    public boolean registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, usuario, correo, contraseña, rol) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = Conexion.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getContraseña());
            ps.setString(5, "cliente"); // o el rol predeterminado

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al registrar usuario: " + e);
            return false;
        }
    }

}
