-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 14-11-2023 a las 17:21:51
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafiobd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`dni`, `nombre`, `apellido`) VALUES
('101010', 'Elena', 'Vargas'),
('111111', 'Juan', 'Perez'),
('222222', 'Ana', 'Gomez'),
('333333', 'Carlos', 'Lopez'),
('444444', 'Laura', 'Martinez'),
('555555', 'Pedro', 'Rodriguez'),
('666666', 'Isabel', 'Sanchez'),
('777777', 'Miguel', 'Fernandez'),
('888888', 'Sofia', 'Diaz'),
('999999', 'Luis', 'Hernandez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) DEFAULT NULL,
  `cliente_dni` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `cliente_dni`) VALUES
(1, 'Compra 1', '111111'),
(2, 'Compra 2', '222222'),
(3, 'Compra 3', '333333'),
(4, 'Compra 4', '444444'),
(5, 'Compra 5', '555555'),
(6, 'Compra 6', '666666'),
(7, 'Compra 7', '777777'),
(8, 'Compra 8', '888888'),
(9, 'Compra 9', '999999'),
(10, 'Compra 10', '101010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` varchar(20) NOT NULL,
  `compras_id` int(11) DEFAULT NULL,
  `producto` varchar(20) DEFAULT NULL,
  `importe` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
('LC1', 1, 'Producto 1', 100),
('LC10', 10, 'Producto 10', 110),
('LC2', 2, 'Producto 2', 150),
('LC3', 3, 'Producto 3', 200),
('LC4', 4, 'Producto 4', 120),
('LC5', 5, 'Producto 5', 180),
('LC6', 6, 'Producto 6', 90),
('LC7', 7, 'Producto 7', 250),
('LC8', 8, 'Producto 8', 130),
('LC9', 9, 'Producto 9', 170);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_dni` (`cliente_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cliente_dni`) REFERENCES `cliente` (`dni`);

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
