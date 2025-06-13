/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/agrosell";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // O usa "com.mysql.jdbc.Driver" si es viejo
        } catch (ClassNotFoundException e) {
            throw new SQLException("Error cargando el driver de MySQL", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
