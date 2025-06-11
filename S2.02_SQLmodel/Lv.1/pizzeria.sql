-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2025 a las 13:50:22
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
-- Base de datos: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `cp` varchar(5) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `apellidos`, `direccion`, `cp`, `localidad`, `provincia`, `telefono`) VALUES
(1, 'Carlos', 'Nuñez Barreras', 'C/sin fin s/n sin na', '08000', 'Barcelona', 'Barcelona', '612300000'),
(2, 'Yemeli', 'Ab-Jarin', 'C/menendez 88, subsotano 4ª', '08032', 'Barcelona', 'Barcelona', '934654689');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `rol` enum('cocinero','repartidor') NOT NULL,
  `tienda_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellidos`, `nif`, `telefono`, `rol`, `tienda_id`) VALUES
(1, 'Yas', 'Nakpruti', 'I8642648B', '+7586426486', 'cocinero', 1),
(2, 'Naka', 'Asfghj', 'N000000N', '666459784', 'repartidor', 2),
(3, 'Pierre', 'Branteur', 'F846248F', '987654321', 'repartidor', 2),
(4, 'Manolo', 'Cardona', '87921354E', '666183465', 'repartidor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `tienda_id` int(11) DEFAULT NULL,
  `fecha_pedido` datetime NOT NULL,
  `tipo_entrega` enum('Domicilio','Tienda') NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `repartidor_id` int(11) DEFAULT NULL,
  `fecha_entrega` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `cliente_id`, `tienda_id`, `fecha_pedido`, `tipo_entrega`, `precio_total`, `repartidor_id`, `fecha_entrega`) VALUES
(1, 1, 1, '2025-06-11 11:45:03', 'Domicilio', 44.00, 2, '2025-06-11 11:45:03'),
(2, 2, 2, '2025-06-11 11:45:03', 'Tienda', 666.00, NULL, '2025-06-11 11:45:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos_productos`
--

INSERT INTO `pedidos_productos` (`pedido_id`, `producto_id`, `cantidad`) VALUES
(1, 3, 5),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` tinytext NOT NULL,
  `imagen` blob NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `tipo_producto` enum('pizza','hamburguesa','bebida') NOT NULL,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `imagen`, `precio`, `tipo_producto`, `categoria_id`) VALUES
(1, 'asdfhk', '234t5y6juhgbdwef32rt54gtrbfvd', '', 20.00, 'hamburguesa', 1),
(2, 'sdfbn', 'swdfghm', '', 30.00, 'pizza', 2),
(3, 'asdfhk', '234t5y6juhgbdwef32rt54gtrbfvd', '', 20.00, 'hamburguesa', 4),
(4, 'sdfbn', 'swdfghm', '', 30.00, 'pizza', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `id_tienda` int(11) NOT NULL,
  `direccion` text NOT NULL,
  `cp` varchar(5) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`id_tienda`, `direccion`, `cp`, `localidad`, `provincia`) VALUES
(1, 'Av.Fin feliz 32 Bajos', '08050', 'Barcelona', 'Barcelona'),
(2, 'Av/ Muere Feliz 666 Bajos muy bajos', '08666', 'Barcelona', 'Barcelona');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `nif` (`nif`,`telefono`),
  ADD KEY `tienda_id` (`tienda_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `cliente_id` (`cliente_id`,`tienda_id`,`repartidor_id`),
  ADD KEY `repartidor_id` (`repartidor_id`);

--
-- Indices de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD KEY `pedido_id` (`pedido_id`,`producto_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`id_tienda`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `id_tienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id_tienda`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`tienda_id`) REFERENCES `tiendas` (`id_tienda`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`repartidor_id`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD CONSTRAINT `pedidos_productos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `pedidos_productos_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id_pedido`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
