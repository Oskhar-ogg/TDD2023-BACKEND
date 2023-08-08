-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-08-2023 a las 18:10:53
-- Versión del servidor: 8.0.34
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oscarc_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `agenda_id` int NOT NULL,
  `agenda_cliente` varchar(50) NOT NULL,
  `agenda_direccion` varchar(50) NOT NULL,
  `agenda_motivo` varchar(255) NOT NULL,
  `agenda_hora` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `agenda_fecha` date NOT NULL,
  `tecnico_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`agenda_id`, `agenda_cliente`, `agenda_direccion`, `agenda_motivo`, `agenda_hora`, `agenda_fecha`, `tecnico_id`) VALUES
(12, 'Oscar', 'Blanco Encalada 1520', 'falla calefont', '14:00', '2023-07-18', 1),
(14, 'Eduardo', 'Freire 540', 'falla red agua', '10:00', '2023-07-14', 1),
(15, 'Oscar Caro', 'Concepción Centro', 'Caldera Baxi', '09:40', '2023-07-20', 1),
(16, 'Elena', 'Hualpén', 'Revisión calefont', '18:00', '2023-07-20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacora_id` int NOT NULL,
  `bitacora_title` varchar(255) NOT NULL,
  `bitacora_description` text NOT NULL,
  `bitacora_estado` varchar(30) NOT NULL,
  `bitacora_valor_cobrado` varchar(9) NOT NULL,
  `bitacora_fecha` date NOT NULL,
  `tecnico_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`bitacora_id`, `bitacora_title`, `bitacora_description`, `bitacora_estado`, `bitacora_valor_cobrado`, `bitacora_fecha`, `tecnico_id`) VALUES
(1, 'Implementación Switch', 'Switch Apagado', 'Vigente', '0', '2023-07-20', 1),
(2, 'Implementación Switch ', 'Switch Activado', 'En proceso', '20000', '2023-07-20', 1),
(3, 'Switch Pasó la prueba', 'Ok', 'Finalizado', '0', '2023-07-20', 1),
(15, 'Refreshing Finalizado', 'Se puede refrescar la bitácora', 'Finalizado', '0', '2023-07-06', 1),
(16, 'Última prueba', 'Modificación BD / INGRESO', 'Finalizado', '0', '2023-07-20', 1),
(17, 'Texto de prueba', 'Descripcion de prueba', 'Vigente', '15000', '2023-07-07', 1),
(18, 'Link técnico con bitácora ', 'Debería guardar esta bitácora sin problemas en caso de estar correcto', 'Vigente', '0', '2023-08-08', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caldera`
--

CREATE TABLE `caldera` (
  `caldera_id` int NOT NULL COMMENT 'fijo ',
  `caldera_marca` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'fijo',
  `caldera_modelo` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'fijo',
  `caldera_pwr_calorifico` int NOT NULL COMMENT 'fijo',
  `caldera_tipo_uso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'fijo',
  `caldera_tipo_combustible` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'fijo',
  `caldera_tipo_combustible2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ocasional',
  `caldera_tipo_combustible3` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ocasional',
  `cliente_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Informacion de tipos de calderas con las que se trabaja';

--
-- Volcado de datos para la tabla `caldera`
--

INSERT INTO `caldera` (`caldera_id`, `caldera_marca`, `caldera_modelo`, `caldera_pwr_calorifico`, `caldera_tipo_uso`, `caldera_tipo_combustible`, `caldera_tipo_combustible2`, `caldera_tipo_combustible3`, `cliente_id`) VALUES
(1, 'Baxi', 'ModeloX', 25000, 'Doméstico', 'Gas Natural', 'Gas Licuado', 'Electricidad', 1),
(2, 'Roca', 'ModeloY', 35000, 'Doméstico', 'Gas Licuado', 'Gas Natural', 'Electricidad', 2),
(3, 'Ferroli', 'ModeloZ', 42000, 'Industrial', 'Gas Natural', 'Petróleo', 'Electricidad', 3),
(4, 'Junkers', 'ModeloW', 28000, 'Doméstico', 'Gas Licuado', 'Electricidad', 'Petróleo', 4),
(5, 'Vaillant', 'ModeloV', 32000, 'Doméstico', 'Gas Natural', 'Gas Licuado', 'Electricidad', 5),
(7, 'Sime', 'ModeloT', 40000, 'Doméstico', 'Gas Natural', 'Petróleo', 'Electricidad', 6),
(8, 'Wolf', 'ModeloS', 27000, 'Industrial', 'Gas Licuado', 'Electricidad', 'Petróleo', 7),
(9, 'Buderus', 'ModeloR', 38000, 'Doméstico', 'Gas Natural', 'Gas Licuado', 'Electricidad', 8),
(10, 'ACV', 'ModeloQ', 46000, 'Industrial', 'Gas Licuado', 'Petróleo', 'Electricidad', 10),
(11, 'De Dietrich', 'ModeloP', 31000, 'Doméstico', 'Gas Natural', 'Electricidad', 'Petróleo', 9),
(12, 'Beretta', 'ModeloO', 44000, 'Doméstico', 'Gas Licuado', 'Gas Natural', 'Electricidad', 11),
(13, 'Rheem', 'ModeloN', 30000, 'Industrial', 'Petróleo', 'Gas Natural', 'Electricidad', 12),
(14, 'Sole', 'ModeloM', 37000, 'Doméstico', 'Gas Licuado', 'Electricidad', 'Petróleo', 13),
(15, 'Fagor', 'ModeloL', 42000, 'Industrial', 'Gas Natural', 'Petróleo', 'Electricidad', 14),
(16, 'Immergas', 'ModeloK', 26000, 'Doméstico', 'Gas Licuado', 'Gas Natural', 'Electricidad', 18),
(17, 'Bongioanni', 'ModeloJ', 39000, 'Industrial', 'Gas Natural', 'Petróleo', 'Electricidad', 19),
(18, 'Cointra', 'ModeloI', 35000, 'Doméstico', 'Gas Licuado', 'Electricidad', 'Petróleo', 17),
(19, 'Viessmann', 'ModeloH', 43000, 'Industrial', 'Gas Licuado', 'Petróleo', 'Electricidad', 16),
(20, 'Ariston', 'ModeloG', 29000, 'Doméstico', 'Gas Natural', 'Electricidad', 'Petróleo', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calefont`
--

CREATE TABLE `calefont` (
  `calefont_id` int NOT NULL,
  `calefont_marca` varchar(30) NOT NULL,
  `calefont_modelo` varchar(30) NOT NULL,
  `calefont_pwr_calorifico` varchar(10) NOT NULL,
  `calefont_cantidad_litros` int NOT NULL,
  `calefont_tipo_gas` varchar(20) NOT NULL,
  `calefont_tipo_descarga` varchar(30) NOT NULL,
  `cliente_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `calefont`
--

INSERT INTO `calefont` (`calefont_id`, `calefont_marca`, `calefont_modelo`, `calefont_pwr_calorifico`, `calefont_cantidad_litros`, `calefont_tipo_gas`, `calefont_tipo_descarga`, `cliente_id`) VALUES
(1, 'Bosch', 'Modelo1', '5000', 10, 'Gas Natural', 'Tiro Natural', 6),
(2, 'Rheem', 'Modelo2', '6000', 12, 'Gas Licuado', 'Tiro Forzado', 7),
(3, 'Midea', 'Modelo3', '4500', 8, 'Gas Natural', 'Tiro Natural', 12),
(4, 'Calma', 'Modelo4', '5500', 10, 'Gas Licuado', 'Tiro Forzado', 15),
(5, 'Fensa', 'Modelo5', '4000', 15, 'Gas Natural', 'Tiro Forzado', 13),
(6, 'Mademsa', 'Modelo6', '5200', 7, 'Gas Licuado', 'Tiro Natural', 16),
(7, 'Dewalt', 'Modelo7', '4800', 9, 'Gas Natural', 'Tiro Forzado', 19),
(8, 'Baxi', 'Modelo8', '5100', 11, 'Gas Licuado', 'Tiro Natural', 18),
(9, 'Orbegozo', 'Modelo9', '4700', 6, 'Gas Natural', 'Tiro Forzado', 20),
(10, 'Whirlpool', 'Modelo10', '4300', 14, 'Gas Licuado', 'Tiro Natural', 5),
(11, 'Bryant', 'Modelo11', '4900', 10, 'Gas Natural', 'Tiro Natural', 17),
(12, 'Edesa', 'Modelo12', '5300', 13, 'Gas Licuado', 'Tiro Forzado', 14),
(13, 'Rinnai', 'Modelo13', '4600', 7, 'Gas Natural', 'Tiro Natural', 3),
(14, 'Junkers', 'Modelo14', '5100', 9, 'Gas Licuado', 'Tiro Forzado', 11),
(15, 'Panasonic', 'Modelo15', '4800', 11, 'Gas Natural', 'Tiro Forzado', 10),
(16, 'Ariston', 'Modelo16', '5400', 6, 'Gas Licuado', 'Tiro Natural', 4),
(17, 'Electrolux', 'Modelo17', '4700', 12, 'Gas Natural', 'Tiro Forzado', 9),
(18, 'Vaillant', 'Modelo18', '5200', 8, 'Gas Licuado', 'Tiro Forzado', 8),
(19, 'Sole', 'Modelo19', '4500', 10, 'Gas Natural', 'Tiro Natural', 2),
(20, 'Haier', 'Modelo20', '4900', 15, 'Gas Licuado', 'Tiro Natural', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL,
  `cliente_nombre` varchar(50) NOT NULL,
  `cliente_direccion` varchar(50) NOT NULL,
  `cliente_telefono` varchar(12) NOT NULL,
  `comuna_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_nombre`, `cliente_direccion`, `cliente_telefono`, `comuna_id`) VALUES
(1, 'Oscar Caro', 'Colón 1197', '931159926', 1),
(2, 'Cliente 2', 'Dirección 2', '987654321', 2),
(3, 'Cliente 3', 'Dirección 3', '956789123', 3),
(4, 'Cliente 4', 'Dirección 4', '921654987', 4),
(5, 'Cliente 5', 'Dirección 5', '989123456', 5),
(6, 'Cliente 6', 'Dirección 6', '954987321', 6),
(7, 'Cliente 7', 'Dirección 7', '921789654', 7),
(8, 'Cliente 8', 'Dirección 8', '989654321', 1),
(9, 'Cliente 9', 'Dirección 9', '956321789', 2),
(10, 'Cliente 10', 'Dirección 10', '921789456', 3),
(11, 'Cliente 11', 'Dirección 11', '989456123', 4),
(12, 'Cliente 12', 'Dirección 12', '956123789', 5),
(13, 'Cliente 13', 'Dirección 13', '923789456', 6),
(14, 'Cliente 14', 'Dirección 14', '989456789', 7),
(15, 'Cliente 15', 'Dirección 15', '956789456', 1),
(16, 'Cliente 16', 'Dirección 16', '923456123', 2),
(17, 'Cliente 17', 'Dirección 17', '987321987', 3),
(18, 'Cliente 18', 'Dirección 18', '954987654', 4),
(19, 'Cliente 19', 'Dirección 19', '921654321', 5),
(20, 'Cliente 20', 'Dirección 20', '989321789', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `comuna_id` int NOT NULL,
  `comuna_nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`comuna_id`, `comuna_nombre`) VALUES
(1, 'Talcahuano'),
(2, 'Concepción'),
(3, 'Hualpén'),
(4, 'San pedro de la paz'),
(5, 'Penco'),
(6, 'Tomé'),
(7, 'Chiguayante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_caldera`
--

CREATE TABLE `mantenimiento_caldera` (
  `mantenimiento_caldera_id` int NOT NULL,
  `tecnico_id` int NOT NULL,
  `caldera_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `mantenimiento_fecha` date NOT NULL,
  `mantenimiento_descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mantenimiento_caldera`
--

INSERT INTO `mantenimiento_caldera` (`mantenimiento_caldera_id`, `tecnico_id`, `caldera_id`, `cliente_id`, `mantenimiento_fecha`, `mantenimiento_descripcion`) VALUES
(1, 1, 1, 1, '2023-08-06', 'Cambio quemador, solución error e10, cambio de sensores de seguridad'),
(2, 1, 19, 3, '2023-08-01', 'Se hizo reemplazo de pieza de agua');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_calefont`
--

CREATE TABLE `mantenimiento_calefont` (
  `mantenimiento_calefont_id` int NOT NULL,
  `tecnico_id` int NOT NULL,
  `calefont_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `mantenimiento_fecha` date DEFAULT NULL,
  `mantenimiento_descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mantenimiento_calefont`
--

INSERT INTO `mantenimiento_calefont` (`mantenimiento_calefont_id`, `tecnico_id`, `calefont_id`, `cliente_id`, `mantenimiento_fecha`, `mantenimiento_descripcion`) VALUES
(1, 1, 1, 1, '2023-08-06', 'Reemplazo de membrana GAS'),
(2, 1, 14, 14, '2023-08-24', 'No se intervino el calefont, solo hubo que cambiar pilas');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `Mantenimiento_historico_caldera`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `Mantenimiento_historico_caldera` (
`caldera_marca` varchar(60)
,`caldera_modelo` varchar(60)
,`cliente_direccion` varchar(50)
,`cliente_nombre` varchar(50)
,`codigo_caldera` int
,`codigo_cliente` int
,`mantenimiento_descripcion` text
,`mantenimiento_fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `Mantenimiento_historico_calefont`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `Mantenimiento_historico_calefont` (
`calefont_id` int
,`calefont_marca` varchar(30)
,`calefont_modelo` varchar(30)
,`cliente_direccion` varchar(50)
,`cliente_nombre` varchar(50)
,`codigo_cliente` int
,`mantenimiento_descripcion` text
,`mantenimiento_fecha` date
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnico`
--

CREATE TABLE `tecnico` (
  `tecnico_id` int NOT NULL,
  `tecnico_nombre` varchar(30) NOT NULL,
  `tecnico_apellido` varchar(30) NOT NULL,
  `tecnico_telefono` varchar(12) NOT NULL,
  `tecnico_correo` varchar(50) NOT NULL,
  `tecnico_contraseña` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tecnico`
--

INSERT INTO `tecnico` (`tecnico_id`, `tecnico_nombre`, `tecnico_apellido`, `tecnico_telefono`, `tecnico_correo`, `tecnico_contraseña`) VALUES
(1, 'Walter', 'C', '+56911111111', 'w.caro@mdibiobio.cl', 'Passprueba');

-- --------------------------------------------------------

--
-- Estructura para la vista `Mantenimiento_historico_caldera`
--
DROP TABLE IF EXISTS `Mantenimiento_historico_caldera`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ocaro`@`%` SQL SECURITY DEFINER VIEW `Mantenimiento_historico_caldera`  AS SELECT `C`.`cliente_id` AS `codigo_cliente`, `C`.`cliente_nombre` AS `cliente_nombre`, `C`.`cliente_direccion` AS `cliente_direccion`, `ca`.`caldera_id` AS `codigo_caldera`, `ca`.`caldera_marca` AS `caldera_marca`, `ca`.`caldera_modelo` AS `caldera_modelo`, `MC`.`mantenimiento_fecha` AS `mantenimiento_fecha`, `MC`.`mantenimiento_descripcion` AS `mantenimiento_descripcion` FROM ((`cliente` `C` join `caldera` `ca` on((`C`.`cliente_id` = `ca`.`cliente_id`))) join `mantenimiento_caldera` `MC` on((`ca`.`caldera_id` = `MC`.`caldera_id`))) GROUP BY `C`.`cliente_id`, `C`.`cliente_nombre`, `C`.`cliente_direccion`, `ca`.`caldera_id`, `ca`.`caldera_marca`, `ca`.`caldera_modelo`, `MC`.`mantenimiento_fecha`, `MC`.`mantenimiento_descripcion` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `Mantenimiento_historico_calefont`
--
DROP TABLE IF EXISTS `Mantenimiento_historico_calefont`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ocaro`@`%` SQL SECURITY DEFINER VIEW `Mantenimiento_historico_calefont`  AS SELECT `C`.`cliente_id` AS `codigo_cliente`, `C`.`cliente_nombre` AS `cliente_nombre`, `C`.`cliente_direccion` AS `cliente_direccion`, `cl`.`calefont_id` AS `calefont_id`, `cl`.`calefont_marca` AS `calefont_marca`, `cl`.`calefont_modelo` AS `calefont_modelo`, `MC`.`mantenimiento_fecha` AS `mantenimiento_fecha`, `MC`.`mantenimiento_descripcion` AS `mantenimiento_descripcion` FROM ((`cliente` `C` join `calefont` `cl` on((`C`.`cliente_id` = `cl`.`cliente_id`))) join `mantenimiento_calefont` `MC` on((`cl`.`calefont_id` = `MC`.`calefont_id`))) GROUP BY `C`.`cliente_id`, `C`.`cliente_nombre`, `C`.`cliente_direccion`, `cl`.`calefont_id`, `cl`.`calefont_marca`, `cl`.`calefont_modelo`, `MC`.`mantenimiento_fecha`, `MC`.`mantenimiento_descripcion` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`agenda_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacora_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `caldera`
--
ALTER TABLE `caldera`
  ADD PRIMARY KEY (`caldera_id`),
  ADD KEY `fk_cliente_id` (`cliente_id`);

--
-- Indices de la tabla `calefont`
--
ALTER TABLE `calefont`
  ADD PRIMARY KEY (`calefont_id`),
  ADD KEY `fk_cliente_cod` (`cliente_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `fk_comuna_id` (`comuna_id`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`comuna_id`);

--
-- Indices de la tabla `mantenimiento_caldera`
--
ALTER TABLE `mantenimiento_caldera`
  ADD PRIMARY KEY (`mantenimiento_caldera_id`,`tecnico_id`,`caldera_id`,`cliente_id`),
  ADD KEY `caldera_id` (`caldera_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `mantenimiento_calefont`
--
ALTER TABLE `mantenimiento_calefont`
  ADD PRIMARY KEY (`mantenimiento_calefont_id`,`tecnico_id`,`calefont_id`,`cliente_id`),
  ADD KEY `calefont_id` (`calefont_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `tecnico_id` (`tecnico_id`);

--
-- Indices de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`tecnico_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `agenda_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacora_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `caldera`
--
ALTER TABLE `caldera`
  MODIFY `caldera_id` int NOT NULL AUTO_INCREMENT COMMENT 'fijo ', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `calefont`
--
ALTER TABLE `calefont`
  MODIFY `calefont_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `comuna_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `mantenimiento_calefont`
--
ALTER TABLE `mantenimiento_calefont`
  MODIFY `mantenimiento_calefont_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `tecnico_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`tecnico_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`tecnico_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `caldera`
--
ALTER TABLE `caldera`
  ADD CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`);

--
-- Filtros para la tabla `calefont`
--
ALTER TABLE `calefont`
  ADD CONSTRAINT `fk_cliente_cod` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_comuna_id` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`comuna_id`);

--
-- Filtros para la tabla `mantenimiento_caldera`
--
ALTER TABLE `mantenimiento_caldera`
  ADD CONSTRAINT `mantenimiento_caldera_ibfk_1` FOREIGN KEY (`caldera_id`) REFERENCES `caldera` (`caldera_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mantenimiento_caldera_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mantenimiento_caldera_ibfk_3` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`tecnico_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `mantenimiento_calefont`
--
ALTER TABLE `mantenimiento_calefont`
  ADD CONSTRAINT `mantenimiento_calefont_ibfk_1` FOREIGN KEY (`calefont_id`) REFERENCES `calefont` (`calefont_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mantenimiento_calefont_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `mantenimiento_calefont_ibfk_3` FOREIGN KEY (`tecnico_id`) REFERENCES `tecnico` (`tecnico_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
