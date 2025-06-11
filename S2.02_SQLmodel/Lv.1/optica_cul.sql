-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2025 a las 13:47:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_clientes` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `recomendado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_clientes`, `nombre`, `direccion`, `telefono`, `email`, `fecha_registro`, `recomendado_por`) VALUES
(1, 'jacinto', 'C/sin fin 666', '666666666', 'asdfhjkl', '2025-06-11 08:53:49', 1),
(5, 'marisa guti', 'Av.con fin 663', '486248621', 'qerty', '2025-06-11 08:54:23', 1),
(6, 'Oriol Perez', 'Ronda San fin s/n', '622929292', 'oriol@sinfin.com', '2025-06-11 08:55:13', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_proveedores`
--

CREATE TABLE `direccion_proveedores` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(100) NOT NULL,
  `piso` varchar(10) NOT NULL,
  `puerta` varchar(10) NOT NULL,
  `ciudad` varchar(40) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `pais` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `direccion_proveedores`
--

INSERT INTO `direccion_proveedores` (`id_direccion`, `calle`, `numero`, `piso`, `puerta`, `ciudad`, `cp`, `pais`) VALUES
(1, 'Sant Just del fin', '2', '6', '3', 'Catalunya', '08000', 'España'),
(2, 'Av.rancho viejo', 's/n', '8', '0', 'Jerez', '08642', 'Burkina Faso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleados` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleados`, `nombre`) VALUES
(1, 'Jessica'),
(2, 'Pau');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gafas`
--

CREATE TABLE `gafas` (
  `id_gafas` int(11) NOT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `graduacion_lente_izq` decimal(4,2) NOT NULL,
  `graduacion_lente_der` decimal(4,2) NOT NULL,
  `montura` enum('flotante','pasta','metalica') NOT NULL,
  `color_montura` tinytext NOT NULL,
  `color_lente_izq` tinytext NOT NULL,
  `color_lente_der` tinytext NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `gafas`
--

INSERT INTO `gafas` (`id_gafas`, `marca_id`, `graduacion_lente_izq`, `graduacion_lente_der`, `montura`, `color_montura`, `color_lente_izq`, `color_lente_der`, `precio`) VALUES
(3, 2, 4.00, 5.00, 'pasta', 'amarillo', 'rojo', 'rojo', 350.00),
(4, 1, 5.00, 5.00, 'metalica', 'gris', 'negro', 'negro', 400.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nombre`, `proveedor_id`) VALUES
(1, 'Rayban', NULL),
(2, 'Multiopticas', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion_id` int(11) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `nif` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `direccion_id`, `telefono`, `fax`, `nif`) VALUES
(1, 'Deojo', 1, '689679798', '936879451', 'M8462146L'),
(2, 'Multirayos', 2, '936222224', '936222223', 'P846246E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `gafas_id` int(11) DEFAULT NULL,
  `fecha_venta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_ventas`, `cliente_id`, `empleado_id`, `gafas_id`, `fecha_venta`) VALUES
(1, 1, 1, 4, '2025-06-11 11:04:38'),
(2, 6, 2, 3, '2025-06-11 11:04:38');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_clientes`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indices de la tabla `direccion_proveedores`
--
ALTER TABLE `direccion_proveedores`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleados`);

--
-- Indices de la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD PRIMARY KEY (`id_gafas`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `nif_UNIQUE` (`nif`),
  ADD KEY `direccion_id` (`direccion_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `cliente_id` (`cliente_id`,`empleado_id`,`gafas_id`),
  ADD KEY `empleado_id` (`empleado_id`),
  ADD KEY `gafas_id` (`gafas_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `direccion_proveedores`
--
ALTER TABLE `direccion_proveedores`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gafas`
--
ALTER TABLE `gafas`
  MODIFY `id_gafas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`direccion_id`) REFERENCES `direccion_proveedores` (`id_direccion`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_clientes`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id_empleados`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`gafas_id`) REFERENCES `gafas` (`id_gafas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
