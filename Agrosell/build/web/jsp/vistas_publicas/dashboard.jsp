<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Agrosell Nova</title>
    <link rel="stylesheet" href="../../css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css" rel="stylesheet">
    <script src="../../js/mostrarNombre.js"></script>
</head>
<body>

<!-- Barra superior -->
<header class="top-bar">
    <div class="header-content">
        <img src="../../img/logo.png" alt="Agrosell Nova" class="logo">
        <h1 class="menu-title">AGROSELL NOVA</h1>
        <div class="panel-option">
            <button id="panelControl">
                <a href="vistas_privadas/panel_control.jsp" class="menu-icon"><i class="fa fa-cog"></i></a>
            </button>
        </div>
        <a href="carrito.jsp" class="menu-icon">
            <i class="fas fa-shopping-cart"></i>
        </a>
        <span class="notification">
            <button id="notificationButton">
                <i class="fas fa-bell"></i>
            </button>
        </span>

        <span class="username">
            <% if (usuario != null) { %>
                <a href="cerrar_sesion.jsp"><%= usuario %></a>
            <% } else { %>
                <a href="index.jsp">Iniciar sesión</a>
            <% } %>
        </span>

        <a href="../vistas_privadas/perfil.jsp" class="menu-icon">
            <i class="bi bi-person-circle" style="font-size: 30px;"></i>
        </a>
    </div>
</header>

<!-- Segunda barra -->
<nav class="menu-bar">
    <ul>
        <li><a href="inicio.jsp"><i class="fas fa-home"></i> Inicio</a></li>
        <li><a href="${pageContext.request.contextPath}/MostrarProductoServlet"><i class="fas fa-box icon"></i> Productos</a></li>
        <li><a href="categorias.jsp"><i class="fas fa-list"></i> Categorías</a></li>
        <li><a href="reservas.jsp"><i class="fas fa-bookmark"></i> Reservas</a></li>
        <li><a href="about_us.jsp"><i class="fas fa-info-circle"></i> Sobre nosotros</a></li>
        <li><a href="contactanos.jsp"><i class="fas fa-envelope"></i> Contáctanos</a></li>
        <li><a href="ayuda.jsp"><i class="fas fa-question-circle"></i> Ayuda</a></li>
    </ul>
</nav>

<!-- Contenido principal -->
<main class="dashboard-content">
    <section class="stats">
        <div class="stat-item">
            <i class="fas fa-dollar-sign"></i>
            <div class="stat-info">
                <h3>Ventas Totales</h3>
                <p>$75,450.000</p>
            </div>
        </div>
        <div class="stat-item">
            <i class="fas fa-box"></i>
            <div class="stat-info">
                <h3>Productos Vendidos</h3>
                <p>500</p>
            </div>
        </div>
        <div class="stat-item">
            <i class="fas fa-users"></i>
            <div class="stat-info">
                <h3>Clientes</h3>
                <p>200</p>
            </div>
        </div>
    </section>

    <section class="charts">
        <div class="chart">
            <h3>Ventas Mensuales</h3>
            <canvas id="monthlySalesChart"></canvas>
        </div>
        <div class="chart">
            <h3>Productos Más Vendidos</h3>
            <canvas id="topProductsChart"></canvas>
        </div>
    </section>

    <section class="recent-orders">
        <h3>Órdenes Recientes</h3>
        <table>
            <thead>
                <tr>
                    <th>ID Orden</th>
                    <th>Cliente</th>
                    <th>Producto</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#001</td>
                    <td>Juan Pérez</td>
                    <td>Tomates</td>
                    <td>10</td>
                    <td>$50</td>
                </tr>
                <tr>
                    <td>#002</td>
                    <td>Maria López</td>
                    <td>Lechuga</td>
                    <td>5</td>
                    <td>$25</td>
                </tr>
                <tr>
                    <td>#003</td>
                    <td>Carlos García</td>
                    <td>Zanahorias</td>
                    <td>8</td>
                    <td>$40</td>
                </tr>
            </tbody>
        </table>
    </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx1 = document.getElementById('monthlySalesChart').getContext('2d');
    const monthlySalesChart = new Chart(ctx1, {
        type: 'line',
        data: {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
            datasets: [{
                label: 'Ventas Mensuales',
                data: [10000000, 20000000, 15000000, 25000000, 30000000, 20000000],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    const ctx2 = document.getElementById('topProductsChart').getContext('2d');
    const topProductsChart = new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['Tomates', 'Lechuga', 'Zanahorias', 'Pepinos', 'Papas'],
            datasets: [{
                label: 'Productos Más Vendidos',
                data: [70, 30, 40, 20, 50],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>Enlaces rápidos</h3>
            <ul>
                <li><a href="inicio.jsp">Inicio</a></li>
                <li><a href="categorias.jsp">Categorías</a></li>
                <li><a href="contactanos.jsp">Contáctanos</a></li>
                <li><a href="about_us.jsp">Sobre nosotros</a></li>
                <li><a href="mapa.jsp">Mapa del sitio</a></li>
                <li><a href="404.jsp">Error 404</a></li>
                <li><a href="500.jsp">Error 500</a></li>
                <li><a href="dashboard.jsp">Dashboard</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Contacto</h3>
            <p>📍 Dirección: Calle Principal #123</p>
            <p>📞 Teléfono: +57 123 456 789</p>
            <p>📧 Email: <a href="mailto:info@agrosellnova.com">info@agrosellnova.com</a></p>
        </div>

        <div class="footer-column">
            <h3>Síguenos</h3>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Agrosell Nova. Todos los derechos reservados. <a href="terminos.jsp">Términos y condiciones</a></p>
    </div>
</footer>

</body>
</html>
