#  AgroSell Nova

Desarrollar un sistema de información para los campesinos, que permita gestionar la comercialización de productos directamente a los mercados, con una mayor ganancia y mejores beneficios.


## ⚙️ Tecnologías usadas

- HTML, CSS, JavaScript
- Java (JDK 21)
- JSP y Servlets
- JDBC
- MySQL
- NetBeans 23
- Apache Tomcat 9.0+

## 🧱 Estructura básica

- `/web/` – Contiene archivos JSP, HTML, CSS, JS e imágenes.
- `/src/` – Código fuente Java (Servlets y lógica).
- `/nbproject/` – Configuración del proyecto (sin archivos privados).

## 🧱 Importante
- `/librerias/` – Contiene las librerías necesarias para el proyecto:
  - `mysql-connector-java-X.X.X.jar` (conector MySQL).
  - `jbcrypt-0.4.jar` (para encriptación de contraseñas).
  - `Apache Tomcat` o `tomEE` (servidor de aplicaciones).
- `/sql/` – Base de datos MySQL (agrosell.sql).

### 1. Clonar el repositorio

```bash
git clone https://github.com/usuario/repositorio.git

### 2. Importar el proyecto en NetBeans
- Abre NetBeans.
- Selecciona "Importar proyecto" y elige "Desde carpeta".
- Navega hasta la carpeta del repositorio clonado y selecciona la carpeta `nbproject`.

### 3. Configurar librerías
- Asegúrate de tener las librerías necesarias en tu proyecto:
  - `mysql-connector-java-X.X.X.jar`.
  - descargar el conector desde [MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/).
  - jbcrypt-0.4.jar (para encriptación de contraseñas).
  - descargar desde [BCrypt](https://www.mindrot.org/projects/jBCrypt/).
  - Apache Tomcat or tomEE
  - descargar desde [Apache Tomcat](https://tomcat.apache.org/).
  - JSTL 1.2.7 (JavaServer Pages Standard Tag Library)
  - click derecho en la capreta libraries del proyecto y seleccionar "add library" y busca JSTL 1.2.7. luego "add library".
  

### 3. Configurar la base de datos
- Asegúrate de tener MySQL instalado y en ejecución.
- Importa el archivo `agrosell.sql` en tu base de datos MySQL.

### 4. Configurar el servidor
- Asegúrate de tener Apache Tomcat instalado y configurado en NetBeans.
- En NetBeans, ve a "Servicios" y agrega tu servidor Tomcat.

### 5. Ejecutar el proyecto
- Haz clic derecho en el proyecto y selecciona "Ejecutar".

### 6. Acceder a la aplicación
- Abre tu navegador y ve a `http://localhost:8080/Agrosell/jsp/vistas_publicas/`.

## Notas
- Asegúrate de que el puerto 8080 esté libre o cambia la configuración del servidor en NetBeans.
- Realiza un git pull regularmente para mantener tu proyecto actualizado.