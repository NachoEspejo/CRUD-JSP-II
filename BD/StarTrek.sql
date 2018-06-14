-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2018 a las 10:14:02
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `startrek`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faccion`
--

CREATE TABLE `faccion` (
  `IdFacc` int(11) NOT NULL,
  `NombreFacc` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `faccion`
--

INSERT INTO `faccion` (`IdFacc`, `NombreFacc`) VALUES
(1, 'Federación'),
(2, 'Klingon'),
(3, 'Rebeles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tripulante`
--

CREATE TABLE `tripulante` (
  `IdTrip` int(10) NOT NULL,
  `nombre` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdFacc` int(15) NOT NULL,
  `Historia` varchar(9999) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Equipo` varchar(999) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tripulante`
--

INSERT INTO `tripulante` (`IdTrip`, `nombre`, `apellidos`, `IdFacc`, `Historia`, `Equipo`) VALUES
(1, 'Donelle', 'McLise', 1, 'Esta es algo de locos', 'Blaster XNV07'),
(31, ' Test1', 'Test1', 1, 'Test1', 'Test1'),
(32, ' Test2', 'Test2', 1, 'Test2', 'Test2'),
(33, ' Test3', 'Test3', 1, 'Esto es de locos pero no hay problemas tete', 'Mag48'),
(34, ' Test4', 'Test4', 1, 'Esto es una prueba', 'LightSaber'),
(36, ' Prueba', 'Prueba', 1, 'Historia', 'Equipo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `faccion`
--
ALTER TABLE `faccion`
  ADD PRIMARY KEY (`IdFacc`);

--
-- Indices de la tabla `tripulante`
--
ALTER TABLE `tripulante`
  ADD PRIMARY KEY (`IdTrip`),
  ADD KEY `IdFacc` (`IdFacc`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tripulante`
--
ALTER TABLE `tripulante`
  MODIFY `IdTrip` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tripulante`
--
ALTER TABLE `tripulante`
  ADD CONSTRAINT `tripulante_ibfk_1` FOREIGN KEY (`IdFacc`) REFERENCES `faccion` (`IdFacc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
