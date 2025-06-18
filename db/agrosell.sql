`usuarios`/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.32-MariaDB : Database - agrosell
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`agrosell` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `agrosell`;

/*Table structure for table `facturas` */

DROP TABLE IF EXISTS `facturas`;

CREATE TABLE `facturas` (
  `ID_factura` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(120) NOT NULL,
  `metodo_pago` VARCHAR(120) NOT NULL,
  `correo` VARCHAR(255) NOT NULL,
  `telefono` INT(20) NOT NULL,
  `valor_compra` INT(120) NOT NULL,
  `descuento` DECIMAL(50,0) DEFAULT NULL,
  `productos` VARCHAR(255) NOT NULL,
  `cantidad` INT(50) NOT NULL,
  `fecha` DATE NOT NULL,
  `impuesto` DECIMAL(50,0) NOT NULL,
  PRIMARY KEY (`ID_factura`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `facturas` */

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `ID_inventario` INT(11) NOT NULL AUTO_INCREMENT,
  `ID_producto` INT(11) NOT NULL,
  `Nombre_producto` VARCHAR(120) NOT NULL,
  `productor` VARCHAR(120) NOT NULL,
  `Precio` DECIMAL(10,0) NOT NULL,
  `Fecha_cosecha` DATE NOT NULL,
  `Peso_kg` DECIMAL(10,0) NOT NULL,
  `stock` INT(11) NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  `Numero_referencia` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`ID_inventario`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `inventario` */

/*Table structure for table `metodo_pago` */

DROP TABLE IF EXISTS `metodo_pago`;

CREATE TABLE `metodo_pago` (
  `id_metodo` INT(11) NOT NULL AUTO_INCREMENT,
  `metodo` ENUM('no definido','efectivo','tranferencia','tarjeta','PSE') NOT NULL DEFAULT 'no definido',
  `id_usuario` INT(11) NOT NULL,
  `facturas_ID_factura` INT(11) NOT NULL,
  PRIMARY KEY (`id_metodo`),
  KEY `fk_metodo_pago_facturas1` (`facturas_ID_factura`),
  CONSTRAINT `fk_metodo_pago_facturas1` FOREIGN KEY (`facturas_ID_factura`) REFERENCES `facturas` (`ID_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `metodo_pago` */

/*Table structure for table `ofertas_productos` */

DROP TABLE IF EXISTS `ofertas_productos`;

CREATE TABLE `ofertas_productos` (
  `ID_OFERTA_PRODUCTO` INT(11) NOT NULL AUTO_INCREMENT,
  `USUARIO_CAMPESINO` VARCHAR(50) NOT NULL,
  `FECHA_INICIO_OFERTA` DATE NOT NULL,
  `FECHA_FIN_OFERTA` DATE NOT NULL,
  `ID_PRODUCTO` INT(11) NOT NULL,
  `precio_oferta` DECIMAL(10,2) NOT NULL,
  `descripcion_oferta` TEXT NOT NULL,
  PRIMARY KEY (`ID_OFERTA_PRODUCTO`),
  KEY `idx_ID_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `fk_ID_PRODUCTO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ofertas_productos` */

/*Table structure for table `ofertas_productos_has_producto` */

DROP TABLE IF EXISTS `ofertas_productos_has_producto`;

CREATE TABLE `ofertas_productos_has_producto` (
  `oferta_ID` INT(11) NOT NULL,
  `producto_ID` INT(11) NOT NULL,
  PRIMARY KEY (`oferta_ID`,`producto_ID`),
  KEY `fk_producto_oferta` (`producto_ID`),
  CONSTRAINT `fk_oferta_producto` FOREIGN KEY (`oferta_ID`) REFERENCES `ofertas_productos` (`ID_OFERTA_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_oferta` FOREIGN KEY (`producto_ID`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ofertas_productos_has_producto` */

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `ID_PAGO` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(120) NOT NULL,
  `CORREO` VARCHAR(250) NOT NULL,
  `TELEFONO` INT(16) NOT NULL,
  `METODO_PAGO` ENUM('Tarjeta de Credito','Tarjeta de Debito','PayPal','Transferencia Bancaria','Nequi','Efectivo') NOT NULL,
  `DIRECCION` VARCHAR(120) NOT NULL,
  `FECHA_EMISION` DATETIME DEFAULT NULL,
  PRIMARY KEY (`ID_PAGO`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pagos` */

INSERT  INTO `pagos`(`ID_PAGO`,`NOMBRE`,`CORREO`,`TELEFONO`,`METODO_PAGO`,`DIRECCION`,`FECHA_EMISION`) VALUES (1,'Alicia Sandra Betancur Escobar','asdasd@alskdlas.com',1231231232,'PayPal','Calle 106a 22','2025-04-10 04:45:17'),(2,'ismel salazar','ssismel28@gmail.com',2147483647,'Nequi','Calle 81f 40','2025-04-10 05:09:36'),(3,'ismel salazar','ssismel28@gmail.com',2147483647,'Nequi','Calle 81f 40','2025-04-10 05:10:09');

/*Table structure for table `pqrs` */

DROP TABLE IF EXISTS `pqrs`;

CREATE TABLE `pqrs` (
  `ID_PQRS` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(120) NOT NULL,
  `CORREO` VARCHAR(250) NOT NULL,
  `TELEFONO` INT(16) DEFAULT NULL,
  `MENSAJE` TEXT NOT NULL,
  PRIMARY KEY (`ID_PQRS`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pqrs` */

INSERT  INTO `pqrs`(`ID_PQRS`,`NOMBRE`,`CORREO`,`TELEFONO`,`MENSAJE`) VALUES (2,'Ismel Gabriel Salazar Suniaga','ssismel28@gmail.com',2147483647,'sirves?'),(3,'Ismel Gabriel Salazar Suniaga','gabriel@gmail.com',0,'hola'),(4,'Ismel Gabriel Salazar Suniaga','gabriel@gmail.com',1,'me pueden ayudar? por favor'),(5,'ismel salazar','gabriel@gmail.com',0,'Quiero asesorarme en algo'),(6,'Ismel Gabriel Salazar Suniaga','ssismel28@gmail.com',0,'Hola me gustaría entrar en negocio con ustedes');

/*Table structure for table `privilegio` */

DROP TABLE IF EXISTS `privilegio`;

CREATE TABLE `privilegio` (
  `ID_PRIVILEGIO` INT(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_PRIVILEGIO`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `privilegio` */

/*Table structure for table `privilegio_has_usuarios` */

DROP TABLE IF EXISTS `privilegio_has_usuarios`;

CREATE TABLE `privilegio_has_usuarios` (
  `privilegio_ID_privilegio` INT(11) NOT NULL,
  `usuarios_ID_USUARIO` INT(11) NOT NULL,
  PRIMARY KEY (`privilegio_ID_privilegio`,`usuarios_ID_USUARIO`),
  KEY `fk_privilegio_has_usuarios_usuarios` (`usuarios_ID_USUARIO`),
  CONSTRAINT `fk_privilegio_has_usuarios_privilegio` FOREIGN KEY (`privilegio_ID_privilegio`) REFERENCES `privilegio` (`ID_PRIVILEGIO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_privilegio_has_usuarios_usuarios` FOREIGN KEY (`usuarios_ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `privilegio_has_usuarios` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `ID_PRODUCTO` INT(11) NOT NULL AUTO_INCREMENT,
  `USUARIO_CAMPESINO` VARCHAR(120) NOT NULL,
  `PRODUCTO_IMAGEN` VARCHAR(255) NOT NULL,
  `NOMBRE_PRODUCTO` VARCHAR(120) NOT NULL,
  `DESCRIPCION` TEXT DEFAULT NULL,
  `PRECIO` DECIMAL(10,2) NOT NULL,
  `PESO_KG` DECIMAL(10,2) NOT NULL,
  `STOCK` INT(11) NOT NULL,
  `FECHA_COSECHA` DATE DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`)
) ENGINE=INNODB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `producto` */

INSERT  INTO `producto`(`ID_PRODUCTO`,`USUARIO_CAMPESINO`,`PRODUCTO_IMAGEN`,`NOMBRE_PRODUCTO`,`DESCRIPCION`,`PRECIO`,`PESO_KG`,`STOCK`,`FECHA_COSECHA`) VALUES (7,'gabriel','../img/67f69c4626b0a_arroz.jpg','Arroz','Arroz blanco',3500.00,1.00,84,NULL),(8,'gabriel','../img/67f6a38b9d67d_ahuyama.jpg','Ahuyama','Ahuyama en venta',14000.00,1.00,30,NULL),(9,'gabriel','../img/67f6a5a04babf_apio.jpg','Apio','Apios recién cosechados',4600.00,1.00,40,NULL),(10,'gabriel','../img/67f6ad1aeadd9_arverja.jpg','Arverja','Alverjas verdes por kg',3600.00,1.00,83,NULL),(11,'gabriel','../img/67f6b1fb40801_banano.jpg','Banano','Bananos listos para la venta',3800.00,5.00,75,NULL),(12,'gabriel','../img/67f6b2bf9ced8_berenjena.jpg','Berenjena','Berenjenas recién cultivadas',6700.00,4.00,46,NULL),(13,'gabriel','../img/67f6b397b4f57_brevas.jpg','Brevas','Brevas listas para la venta y el consumo',22000.00,8.00,86,NULL),(14,'gabriel','../img/67f6b49a28adb_cebolla.jpg','Cebolla','Cebollas cabezonas',3700.00,12.00,102,NULL),(15,'gabriel','../img/67f6b5280cae2_cuajada.jpg','Cuajada','Queso cuajada en colombia',16000.00,4.00,64,NULL),(16,'gabriel','../img/67f6bc6b1d747_dragon_fruit.jpg','Pitahaya','Pitahaya de cascarón espinoso y sabor dulce',2300.00,4.00,90,NULL),(17,'gabriel','../img/67f6bdfca6951_fresas.jpg','Fresas','Fresas rojas y jugosas',12000.00,6.00,47,NULL),(18,'gabriel','../img/67f6befbe3578_frijol.jpg','Frijoles','Frijoles rojos en venta',6500.00,3.00,36,NULL),(19,'gabriel','../img/67f6c1e2f0f2c_garbanzo.jpg','Garbanzo','GARBANZO EN GRANO',12650.00,5.00,90,NULL),(20,'gabriel','../img/67f6ca341e846_leche.jpg','Leche','Leche entera por lt',5200.00,10.00,100,NULL),(21,'gabriel','../img/67f6ca82d62d7_lechuga.jpg','Lechuga','Lechuga fresca',1200.00,3.00,42,NULL),(22,'gabriel','../img/67f6cfabcc0b9_lenteja.jpg','Lentejas','Una fuente abundante de fibra, ácido fólico y potasio',5200.00,2.00,28,NULL),(23,'gabriel','../img/67f6d028733a3_mandarina.jpg','Mandarinas','Deliciosas mandarinas jugosas y dulces',4350.00,7.00,42,NULL),(24,'gabriel','../img/67f6d15b2a5d8_mango.jpg','Mango','Mango tommy pintón',6700.00,5.00,45,NULL),(25,'gabriel','../img/67f6d25622799_mantequilla.jpg','Mantequilla','Mantequilla en venta',15000.00,1.00,50,NULL),(26,'gabriel','../img/67f6f262592b1_papaya.jpg','Papaya','Deliciosas papayas en venta',2550.00,4.00,24,NULL),(27,'gabriel','../img/67f7e37f57526_uva.jpg','Uva','Uvas deliciosas',5400.00,2.00,35,NULL),(28,'gabriel','../img/67f7e547c6240_pera.jpg','Pera','Peras en oferta',9200.00,2.00,31,NULL),(29,'gabriel','../img/67f7e5949f48b_pimenton.jpg','Pimenton','Pimentón a buen precio',8600.00,1.00,63,NULL),(30,'karol bur24','../img/67f861509da47_piña.jpg','Piña','Piñas jugosas y dulces',7200.00,1.00,70,NULL);

/*Table structure for table `resenas` */

DROP TABLE IF EXISTS `resenas`;

CREATE TABLE `resenas` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `USUARIO` VARCHAR(120) NOT NULL,
  `CORREO` VARCHAR(250) NOT NULL,
  `PUNTUACION` DECIMAL(10,0) NOT NULL,
  `COMENTARIO` TEXT NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `resenas` */

INSERT  INTO `resenas`(`ID`,`USUARIO`,`CORREO`,`PUNTUACION`,`COMENTARIO`) VALUES (1,'gabriel','gabriel@gmail.com',3,'BIEN'),(2,'karol','karol@gmail.com',3,'Muy buenas comunicación pero falta de profesionalismo');

/*Table structure for table `reservas` */

DROP TABLE IF EXISTS `reservas`;

CREATE TABLE `reservas` (
  `ID_Reservas` INT(11) NOT NULL AUTO_INCREMENT,
  `USUARIO_CLIENTE` VARCHAR(50) NOT NULL,
  `USUARIO_DOCUMENTO` VARCHAR(50) NOT NULL,
  `USUARIO_TELEFONO` INT(80) NOT NULL,
  `USUARIO_CORREO` VARCHAR(250) NOT NULL,
  `PRODUCTO` VARCHAR(100) NOT NULL,
  `CANTIDAD_KG` DECIMAL(10,2) NOT NULL,
  `METODO_PAGO` ENUM('DE CONTADO','EFECTIVO','TARJETA','TRANSFERENCIA') NOT NULL,
  `FECHA_RESERVA` DATE DEFAULT NULL,
  PRIMARY KEY (`ID_Reservas`),
  KEY `fk_reservas_producto` (`PRODUCTO`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reservas` */

INSERT  INTO `reservas`(`ID_Reservas`,`USUARIO_CLIENTE`,`USUARIO_DOCUMENTO`,`USUARIO_TELEFONO`,`USUARIO_CORREO`,`PRODUCTO`,`CANTIDAD_KG`,`METODO_PAGO`,`FECHA_RESERVA`) VALUES (1,'ismel gabriel salazar suniaga','5979141',2147483647,'ssismel28@gmail.com','producto2',2.00,'EFECTIVO',NULL),(2,'Laura Lopez','542903',2147483647,'laura_0711@gmail.com','Mango',15.00,'',NULL),(3,'Karol Estela','98232323',2147483647,'karolestela@gmail.com','Mango',2.00,'EFECTIVO',NULL),(4,'Karol Estela','98232323',2147483647,'karolestela@gmail.com','Mango',2.00,'EFECTIVO',NULL),(5,'Laura Lopez','98232323',2147483647,'laura_0711@gmail.com','Manzana',5.00,'TARJETA',NULL),(6,'manuel','987654321',2147483647,'manu_sa@gmail.com','Tomate',30.00,'TARJETA',NULL),(7,'manuel','987654321',2147483647,'manu_sa@gmail.com','Fresa',14.00,'EFECTIVO',NULL);

/*Table structure for table `reservas_has_producto` */

DROP TABLE IF EXISTS `reservas_has_producto`;

CREATE TABLE `reservas_has_producto` (
  `reservas_ID_Reservas` INT(11) NOT NULL,
  `producto_ID_producto` INT(11) NOT NULL,
  `cantidad` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`reservas_ID_Reservas`,`producto_ID_producto`),
  KEY `fk_reservas_has_producto_producto` (`producto_ID_producto`),
  CONSTRAINT `fk_reservas_has_producto_producto` FOREIGN KEY (`producto_ID_producto`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reservas_has_producto_reservas` FOREIGN KEY (`reservas_ID_Reservas`) REFERENCES `reservas` (`ID_Reservas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reservas_has_producto` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `ID_ROL` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ROL` ENUM('administrador','cliente','productor') NOT NULL,
  PRIMARY KEY (`ID_ROL`),
  UNIQUE KEY `NOMBRE_ROL` (`NOMBRE_ROL`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

INSERT  INTO `roles`(`ID_ROL`,`NOMBRE_ROL`) VALUES (1,'administrador'),(2,'cliente'),(3,'productor');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `ID_USUARIO` INT(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(120) NOT NULL,
  `USUARIO` VARCHAR(100) NOT NULL,
  `DOCUMENTO` VARCHAR(50) DEFAULT NULL,
  `DIRECCION` VARCHAR(255) DEFAULT NULL,
  `CORREO` VARCHAR(100) NOT NULL,
  `METODO_PAGO` VARCHAR(50) DEFAULT NULL,
  `FECHA_NACIMIENTO` DATE DEFAULT NULL,
  `ROL` ENUM('administrador','cliente','productor') DEFAULT 'cliente',
  `roles_ID_roles` INT(11) DEFAULT 2,
  `CONTRASEÑA` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `CORREO` (`CORREO`),
  UNIQUE KEY `NOMBRE` (`NOMBRE`),
  UNIQUE KEY `USUARIO` (`USUARIO`),
  UNIQUE KEY `DOCUMENTO` (`DOCUMENTO`),
  KEY `roles_ID_roles` (`roles_ID_roles`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `usuarios` */

INSERT  INTO `usuarios`(`ID_USUARIO`,`NOMBRE`,`USUARIO`,`DOCUMENTO`,`DIRECCION`,`CORREO`,`METODO_PAGO`,`FECHA_NACIMIENTO`,`ROL`,`roles_ID_roles`,`CONTRASEÑA`) VALUES (1,'Ismel Gabriel Salazar Suniaga','ismel salazar','59791412','Carrera 81g #73f-40sur','ssismel28@gmail.com','Transferencia','2024-10-17','administrador',1,'$2y$10$MDjW1Hpxson3lCaDqe5UAOjc8fHen9WjaDYIBqCbPazvk9xU/fp6y'),(2,'gabriel ismel suniaga salazar','gabriel','5979141','Carrera 81g #73f-40sur','gabriel@gmail.com','Efectivo','2006-11-28','productor',3,'$2y$10$d1K6GNlHgEjVRvLLAsNXHOB5KqEtOKJfMuVKl3Q1XJYc3Sfa9uL.O'),(3,'Karol Estela Burbano Lopez','karol bur24','2832352123','Calle 106a 22','esletabur24@gmail.com','Nequi','1998-10-14','productor',3,'$2y$10$Fj92QWQ.rk2Nel9L2.KlM.x9xJ9jWL8wFfSogBqwhEkje0pOVt0Ly'),(4,'Juan Pérez Manuel','juanPe',NULL,NULL,'juanma@gmail.com',NULL,NULL,'productor',3,'$2y$10$fe8GPZEJGctNjrImi/.CN.vPGU7O2ti4yWOzcIKs0oA8UjG3mQ.wK'),(5,'Juan Manuel Salazar','manuel',NULL,NULL,'manu_sa@gmail.com',NULL,NULL,'cliente',2,'$2y$10$OUYUQGklFAfss9.g3Wk7xumFMrSxe2bGZsEL8s0vokuwYvxjihVqq'),(6,'administrador','admin','3454545458','Carrera 15 #45','admin@gmail.com','Efectivo','1994-06-21','administrador',1,'$2y$10$HZj47J1WDzcE3yiP9bpZCu.LDoARwFMAceGELYp.YxbN6F8piT4yq'),(7,'Productor','productor',NULL,NULL,'productor@gmail.com',NULL,NULL,'productor',3,'$2a$10$sF.OjciEmfsqovelT/6GnuBq2glBWWVOSym8bVZ8el1gpu8x8VaKW');

/*Table structure for table `ventas` */

DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas` (
  `ID_venta` INT(11) NOT NULL AUTO_INCREMENT,
  `ID_Producto` INT(11) NOT NULL,
  `CANTIDAD_Kg` DECIMAL(10,2) NOT NULL,
  `FECHA_VENTA` DATE NOT NULL,
  `TOTAL_VENTA` DECIMAL(10,2) NOT NULL,
  `usuarios_ID_USUARIO` INT(11) NOT NULL,
  `usuarios_ID_VENDEDOR` INT(11) NOT NULL,
  `facturas_ID_factura` INT(11) NOT NULL,
  PRIMARY KEY (`ID_venta`),
  KEY `fk_ventas_producto` (`ID_Producto`),
  KEY `fk_ventas_cliente` (`usuarios_ID_USUARIO`),
  KEY `fk_ventas_vendedor` (`usuarios_ID_VENDEDOR`),
  KEY `fk_ventas_facturas` (`facturas_ID_factura`),
  CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`usuarios_ID_USUARIO`) REFERENCES `usuarios` (`ID_USUARIO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ventas_facturas` FOREIGN KEY (`facturas_ID_factura`) REFERENCES `facturas` (`ID_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ventas_producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ventas` */

/* Trigger structure for table `usuarios` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `actualizar_idrol` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `actualizar_idrol` BEFORE UPDATE ON `usuarios` FOR EACH ROW BEGIN
    IF NEW.ROL = 'administrador' THEN
        SET NEW.roles_ID_roles = 1;
    ELSEIF NEW.ROL = 'cliente' THEN
        SET NEW.roles_ID_roles = 2;
    ELSEIF NEW.ROL = 'productor' THEN
        SET NEW.roles_ID_roles = 3;
    ELSE
        SET NEW.roles_ID_roles = NEW.roles_ID_roles; -- Si no coincide, mantiene el valor actual
    END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
