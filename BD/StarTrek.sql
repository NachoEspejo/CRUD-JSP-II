-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2018 a las 16:32:24
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `StarTrek`
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
  `IdTrip` int(5) NOT NULL,
  `nombre` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IdFacc` int(15) NOT NULL,
  `Equipo` varchar(999) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 
-- Volcado de datos para la tabla `tripulante`
-- 

INSERT INTO `tripulante` (`IdTrip`, `nombre`, `apellidos`, `IdFacc`, `Equipo`) VALUES
(1, 'Donelle', 'McLise', 1, 'Blaster XNV07'),
(2, 'Carson', 'Readitt', 1, 'Gracias a sus esfuerzos y determinación, fue reconocido como unos de los mejores efectivos de la Federación', 'Blaster XNV07'),
(3, 'Isahella', 'Hiddsley', 2, 'Primer lider de la casa Klingon',  'Blaster XNV07'),
(4, 'Porter', 'Schoffler', 2, 'Noble de alto rango de la casa Klingon',  'Blaster XNV07'),
(5, 'Magdalena', 'Kevlin', 3, 'Fue considerada una marginada en la Tierra, lo que provocó un fuerte odio hacia la Federación, conviertiendose en la primera rebelde y la más peligrosa',  'Blaster XNV07'),
(6, 'Sonnnie', 'Inglish', 3, 'Es considera la mercenaria más temeraria, en toda la galaxia, ella cualquier tarea, por el precio justo.',  'Blaster XNV07');


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
-- AUTO_INCREMENT de la tabla `recetas`
--

ALTER TABLE `tripulante`
  MODIFY `IdTrip` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

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
