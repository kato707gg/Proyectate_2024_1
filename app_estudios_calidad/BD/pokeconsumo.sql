-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2024 a las 04:02:01
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
-- Base de datos: `pokeconsumo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudioatunes`
--

CREATE TABLE `estudioatunes` (
  `idEstudioAtunes` int(11) NOT NULL,
  `nombreProducto` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `contNeto` decimal(10,2) DEFAULT NULL,
  `contNetoVeracidad` tinyint(1) DEFAULT NULL,
  `masaDrenada` decimal(10,2) DEFAULT NULL,
  `masaDrenadaVeracidad` tinyint(1) DEFAULT NULL,
  `proteina` decimal(10,2) DEFAULT NULL,
  `soya` varchar(25) DEFAULT NULL,
  `infAlConsumidor` tinyint(1) DEFAULT NULL,
  `presentacion` tinyint(1) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `medioDeCobertura` varchar(50) DEFAULT NULL,
  `excesoCalorias` tinyint(1) DEFAULT NULL,
  `excesoAzucares` tinyint(1) DEFAULT NULL,
  `excesoGrasasSaturadas` tinyint(1) DEFAULT NULL,
  `excesoGrasasTrans` tinyint(1) DEFAULT NULL,
  `excesoSodio` tinyint(1) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudioatunes`
--

INSERT INTO `estudioatunes` (`idEstudioAtunes`, `nombreProducto`, `descripcion`, `precio`, `categoria`, `contNeto`, `contNetoVeracidad`, `masaDrenada`, `masaDrenadaVeracidad`, `proteina`, `soya`, `infAlConsumidor`, `presentacion`, `observaciones`, `medioDeCobertura`, `excesoCalorias`, `excesoAzucares`, `excesoGrasasSaturadas`, `excesoGrasasTrans`, `excesoSodio`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'AGROMAR', 'Atún blanco sólido en aceite de oliva', 250.00, 'Sólido o compacto', 230.00, 1, 160.00, 1, 25.00, '0%', 0, 1, 'Le falta el sello exceso sodio', 'Aceite de oliva', 0, 0, 0, 0, 0, 1, 5),
(2, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite', 36.00, 'Sólido o compacto', 140.00, 1, 106.00, 1, 27.30, '0%', 1, 1, NULL, 'Aceite', 0, 0, 0, 0, 0, 1, 5),
(3, 'CALMEX', 'Atún aleta amarilla sólido en aceite de oliva extra virgen', 57.00, 'Sólido o compacto', 140.00, 1, 105.00, 1, 25.00, '0%', 0, 1, 'Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso', 'Aceite de oliva extra virgen', 0, 0, 1, 0, 1, 1, 5),
(4, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite de oliva', 45.00, 'Sólido o compacto', 140.00, 1, 106.00, 1, 26.80, '0%', 1, 1, NULL, 'Aceite de oliva', 0, 0, 1, 0, 1, 1, 5),
(5, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en agua', 36.00, 'Sólido o compacto', 140.00, 1, 106.00, 1, 25.80, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(6, 'MARINA AZUL PREMIUM', 'Atún sólido en aceite de oliva extra virgen', 24.00, 'Sólido o compacto', 120.00, 1, 80.00, 1, 29.00, '0%', 1, 1, NULL, 'Aceite de oliva', 0, 0, 0, 0, 0, 1, 5),
(7, 'EL VELERO ORTIZ', 'Atún blanco en sólido en aceite de oliva', 337.00, 'Sólido o compacto', 270.00, 1, 180.00, 1, 29.00, '0%', 1, 1, NULL, 'Aceite de oliva extra virgen', 0, 0, 0, 0, 1, 1, 5),
(8, 'MARINA AZUL PREMIUM', 'Atún sólido en agua', 36.00, 'Sólido o compacto', 270.00, 1, 190.00, 1, 26.10, '0%', 0, 0, 'Rebasó el 18% de la proporción de hojuelas y trozos que establece la NOM-235 para denominarse atún sólido, ya que contiene de 20.5 a 21.6%', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(9, 'ORO DE ESPAÑA', 'Atún blanco en trozos en aceite de oliva', 232.00, 'Sólido o compacto', 230.00, 1, 150.00, 1, 18.20, '0%', 1, 1, NULL, 'Aceite de oliva', 0, 0, 0, 0, 1, 1, 5),
(10, 'TUNY GOURMET', 'Atún aleta amarilla sólido en aceite con agua', 34.00, 'Sólido o compacto', 140.00, 1, 100.00, 1, 25.00, '0%', 1, 1, NULL, 'Aceite con agua', 0, 0, 0, 0, 0, 1, 5),
(11, 'YURRITA', 'Atún blanco en sólido sin piel en aceite de oliva', 46.00, 'Sólido o compacto', 140.00, 1, 100.00, 1, 26.00, '0%', 1, 1, NULL, 'Aceite de oliva', 0, 0, 0, 0, 0, 1, 5),
(12, 'TUNY GOURMET', 'Atún aleta amarilla sólido en aceite de oliva', 385.00, 'Sólido o compacto', 225.00, 1, 150.00, 1, 27.90, '0%', 1, 1, NULL, 'Aceite de oliva', 0, 0, 1, 0, 1, 1, 5),
(13, 'DOLORES PREMIUM', 'Atún aleta amarilla en trozos en aceite de oliva', 21.00, 'En trozos', 78.00, 1, 74.00, 1, 22.80, '0%', 0, 1, NULL, 'Aceite de oliva', 0, 0, 0, 0, 0, 1, 5),
(14, 'GOLDEN HILLS', 'Atún en trozos en agua', 19.00, 'En trozos', 130.00, 1, 90.00, 1, 22.00, '0%', 0, 0, 'Rebasó el 30% de la proporción de hojuelas que establece la norma para denominarse atún en trozos, ya que tuvo 41.7% por lo que incumple la NOM-235', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(15, 'GOLDEN HILLS', 'Atún en trozos en aceite con agua', 19.00, 'En trozos', 130.00, 1, 90.00, 1, 25.30, '0%', 0, 1, 'No es veraz en la declaración del Medio de cobertura, ya que indica: Aceite con agua, y es: Agua con aceite, es decir, más agua que aceite', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(16, 'GREAT VALUE', 'Atún en trozos en agua', 15.00, 'En trozos', 74.00, 1, 70.00, 1, 19.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(17, 'MARINA AZUL', 'Atún en trozos en aceite de oliva extra virgen', 24.00, 'En trozos', 74.00, 1, 70.00, 1, 28.20, '0%', 0, 1, 'La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz.', 'Aceite de oliva extra virgen', 0, 0, 0, 0, 0, 1, 5),
(18, 'MARINA AZUL', 'Atún en trozos en agua bajo en sodio', 39.00, 'En trozos', 180.00, 1, 175.00, 1, 26.60, '0%', 0, 1, 'Su denominación al frente del empaque está incompleta, ya que debería indicar: Atún en trozos en agua bajo en grasa, y solo indica: Atún en trozos en agua, y al reverso: Bajo en grasa, por lo que incumple la NOM-235 -La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(19, 'MARINA AZUL', 'Atún en trozos en agua', 38.00, 'En trozos', 180.00, 1, 175.00, 1, 22.80, '0%', 0, 1, 'Su denominación al frente del empaque está incompleta, ya que debería indicar: Atún en trozos en agua bajo en grasa, y solo indica: Atún en trozos en agua, y al reverso: Bajo en grasa, por lo que incumple la NOM-235 -La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(20, 'TUNY', 'Atún aleta amarilla en trozos en agua bajo en sodio', 38.00, 'En trozos', 180.00, 1, NULL, NULL, 23.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(21, 'TUNY CLÁSICO', 'Atún aleta amarilla en trozos en agua', 19.00, 'En trozos', 75.00, 1, NULL, NULL, 22.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(22, 'TUNY PREMIUM', 'Atún aleta amarilla en trozos en aceite con agua', 27.00, 'En trozos', 140.00, 1, 100.00, 1, 25.30, '0%', 0, 1, 'No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 91.7 g a 98.2 g.', 'No es veraz', 0, 0, 0, 0, 0, 1, 5),
(23, 'TUNY', 'Atún en trozos en aceite de oliva', 23.00, 'En trozos', 75.00, 1, NULL, NULL, 23.00, '0%', 1, 1, NULL, 'Aceite de oliva', 0, 0, 0, 0, 0, 1, 5),
(24, 'TUNY PREMIUM', 'Atún aleta amarilla en trozos en agua', 27.00, 'En trozos', 140.00, 1, 100.00, 1, 22.00, '0%', 0, 0, 'No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 91.7 g a 98.2 g. Rebasó el 30% de la proporción de hojuelas que establece la norma para denominarse atún en trozos, ya que tuvo de 34.6 a 37.2%', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(25, 'TUNY SPORT', 'Atún en trozos en agua adicionado de vitaminas', 24.00, 'En hojuelas', 75.00, 1, NULL, NULL, 28.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(26, 'ATÚN DOLORES', 'Atún aleta amarilla en hojuelas en agua', 41.00, 'En hojuelas', 295.00, 1, 220.00, 1, 22.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 1, 1, 5),
(27, 'CALMEX', 'Atún aleta amarilla con 4% de soya en agua', 19.00, 'En hojuelas', 135.00, 1, 90.00, 1, 16.90, 'de 1 a 2%', 0, 0, '-No indica presentación, por lo que incumple la NOM-235, sin embargo, es en hojuelas. -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Le falta el sello exceso de sodio', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(28, 'EL DORADO', 'Atún con 30% de soya en agua con aceite', 12.00, 'En hojuelas', 130.00, 1, 90.00, 0, 17.30, 'de 11 a 14%', 1, 1, NULL, 'Agua con aceite', 0, 0, 0, 0, 1, 1, 5),
(29, 'GREAT VALUE', 'Atún en hojuelas en agua', 38.00, 'En hojuelas', 295.00, 1, 220.00, 1, 20.30, '0%', 0, 1, '-Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso de sodio', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(30, 'EL DORADO', 'Atún con 30% de soya en agua', 12.00, 'En hojuelas', 130.00, 1, 90.00, 1, 17.60, '18% a 23%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 1, 1, 5),
(31, 'GREAT VALUE', 'Atún en hojuelas en agua', 18.00, 'En hojuelas', 140.00, 1, 100.00, 0, 19.80, '0%', 0, 1, '-No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 87 g a 95.4 g -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(32, 'HERDEZ', 'Atún aleta amarilla en Hojuelas en Aceite con agua', 18.00, 'En hojuelas', 130.00, 1, 90.00, 0, 22.00, '0%', 0, 1, '-No es veraz en la declaración de Masa drenada, indica 90 g y tuvo 83 g -No es veraz en la declaración del Medio de cobertura, ya que indica: Aceite con agua y es Agua con aceite, es decir, más agua que aceite', 'No es veraz', 0, 0, 0, 0, 0, 1, 5),
(33, 'HERDEZ', 'Atún aleta amarilla en Hojuelas en Agua', 42.00, 'En hojuelas', 280.00, 1, 200.00, 0, 19.00, '0%', 0, 1, '-No es veraz en la declaración de Masa drenada, ya que indica 200g y tuvo 197.3g', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(34, 'HERDEZ', 'Atún aleta amarilla en Hojuelas en Aceite con agua', 42.00, 'En hojuelas', 280.00, 1, 200.00, 1, 19.40, '0%', 0, 1, 'No es veraz en la declaración de Medio de cobertura, ya que indica: Aceite con agua y es Agua con aceite, es decir, más agua que aceite', 'No es veraz', 0, 0, 0, 0, 0, 1, 5),
(35, 'KE PRECIO!', 'Atún con 14% de proteína de soya en agua con aceite', 12.00, 'En hojuelas', 140.00, 1, 91.00, 1, 19.00, 'de 8 a 12%', 0, 1, 'Le falta el sello exceso sodio', 'Agua con aceite', 0, 0, 0, 0, 0, 1, 5),
(36, 'MAZATÚN', 'Atún en hojuelas en agua con aceite', 17.00, 'En hojuelas', 130.00, 1, 90.00, 1, 17.10, '0%', 0, 1, '-La imagen en su etiqueta (atún sólido) no corresponde a su presentación (atún en hojuelas), por lo que no es veraz -Le falta el sello exceso de sodio', 'Agua con aceite', 0, 0, 0, 0, 0, 1, 5),
(37, 'NAIR', 'Atún en hojuelas en agua', 19.00, 'En hojuelas', 120.00, 1, 80.00, 1, 19.80, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(38, 'MAZATÚN', 'Atún en hojuelas en agua', 18.00, 'En hojuelas', 130.00, 1, 90.00, 1, 22.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 1, 1, 5),
(39, 'PRECISSIMO', 'Atún con 30% de soya en agua con aceite', 25.00, 'En hojuelas', 285.00, 1, 205.00, 0, 13.00, 'de 11 a 18%', 0, 1, 'No es veraz en la declaración de Masa drenada, ya que indica 205g y tuvo 201.4g -Le falta el sello exceso de sodio', 'Agua con aceite', 0, 0, 0, 0, 0, 1, 5),
(40, 'TUNY JUMBO', 'Atún Aleta amarilla en hojuelas en agua', 39.00, 'En hojuelas', 295.00, 1, 220.00, 1, 21.00, '0%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 0, 1, 5),
(41, 'VALLEY FOODS', 'Atún en hojuelas en agua', 18.00, 'En hojuelas', 140.00, 1, 100.00, 1, 20.00, '0%', 0, 1, 'Le falta el sello exceso sodio', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(42, 'VALLEY FOODS', 'Atún en hojuelas en agua con aceite', 38.00, 'En hojuelas', 295.00, 1, 220.00, 1, 20.00, '0%', 0, 1, 'Le falta el sello exceso sodio', 'Agua con aceite', 0, 0, 0, 0, 0, 1, 5),
(43, 'ANCLA', 'Atún con 20% de proteína de soya en agua con aceite', 12.00, 'Desmenuzado', 120.00, 1, 80.00, 1, 8.00, '14%', 1, 1, NULL, 'Agua con aceite', 0, 0, 0, 0, 1, 1, 5),
(44, 'AURRERA', 'Atún con 14% de soya en agua con aceite', 31.00, 'Desmenuzado', 295.00, 1, 220.00, 1, 18.20, 'No es veraz', 0, 1, 'No es veraz en la declaración de Porcentaje de soya en masa drenada, ya que indica 14% y obtuvo de 21 a 22% -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente', 'Agua con aceite', 0, 0, 0, 0, 1, 1, 5),
(45, 'ANCLA', 'Atún con 20% de proteína de soya en agua', 12.00, 'Desmenuzado', 120.00, 1, 80.00, 1, 9.00, 'de 13 a 25%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 1, 1, 5),
(46, 'AURRERA', 'Atún con 14% de soya en agua', 29.00, 'Desmenuzado', 295.00, 1, 220.00, 1, 20.00, 'de 11 a 13%', 0, 1, 'Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente', 'Agua', 0, 0, 0, 0, 1, 1, 5),
(47, 'CHEDRAUI', 'Atún con 20% de soya en agua', 12.00, 'Desmenuzado', 130.00, 1, 90.00, 1, 14.00, 'de 11 a 13%', 1, 1, NULL, 'Agua', 0, 0, 0, 0, 1, 1, 5),
(48, 'FRESH LABEL', 'Atún desmenuzado en aceite', 11.00, 'Desmenuzado', 140.00, 1, 100.00, 1, 21.00, '0%', 0, 1, '-Declara Medio de cobertura, en Aceite y tiene Agua con aceite, es decir, más agua que aceite. -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso sodio', 'No es veraz', 0, 0, 1, 1, 1, 1, 5),
(49, 'CHEDRAUI', 'Atún con 20% de soya en agua con aceite', 12.00, 'Desmenuzado', 130.00, 1, 90.00, 1, 16.00, 'de 10 a 12%', 1, 1, NULL, 'Agua con aceite', 0, 0, 0, 0, 1, 1, 5),
(50, 'FRESH LABEL', 'Atún desmenuzado en agua', 11.00, 'Desmenuzado', 140.00, 1, 100.00, 0, 21.00, '0%', 0, 1, '-No es veraz en la declaración de Masa drenada, ya que indica 100g y tuvo de 92.3g a 95.9g -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso sodio', 'Agua', 0, 0, 0, 0, 0, 1, 5),
(51, 'KE PRECIO!', 'Atún con 14% de proteína de soya en agua', 12.00, 'Desmenuzado', 130.00, 1, 90.00, 0, 20.00, 'de 9 a 12%', 0, 1, 'No es veraz en la declaración de Masa drenada ya que indica 90g y tuvo 86.6g', 'Agua', 0, 0, 0, 0, 1, 1, 5),
(52, 'PRECISSIMO', 'Atún con 30% de proteína en agua', 12.00, 'Desmenuzado', 140.00, 1, 91.00, 1, 11.00, 'de 15 a 19%', 0, 1, 'Le falta el sello exceso sodio', 'Agua', 0, 0, 0, 0, 0, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiocafeterasgoteo`
--

CREATE TABLE `estudiocafeterasgoteo` (
  `idEstudioCafeterasGoteo` int(11) DEFAULT NULL,
  `nombreProducto` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `informacion` varchar(100) DEFAULT NULL,
  `garantia` int(11) DEFAULT NULL,
  `calentamiento` varchar(100) DEFAULT NULL,
  `potenciaW` int(11) DEFAULT NULL,
  `seguridad` tinyint(1) DEFAULT NULL,
  `derramamientoCafe` tinyint(1) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `calificacionGeneral` varchar(5) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiocafeterasgoteo`
--

INSERT INTO `estudiocafeterasgoteo` (`idEstudioCafeterasGoteo`, `nombreProducto`, `region`, `precio`, `informacion`, `garantia`, `calentamiento`, `potenciaW`, `seguridad`, `derramamientoCafe`, `observaciones`, `calificacionGeneral`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'BLACK+DECKER', 'China', 752, 'Completa', 2, 'Excelente', 650, 1, 1, NULL, 'MB', 3, 4),
(2, 'PROCTOR SILEX', 'China', 369, 'Completa', 3, 'Suficiente', 700, 1, 0, 'No cuenta con filtro', 'B', 3, 4),
(3, 'OSTER', 'China', 384, 'Completa', 1, 'Muy Bueno', 600, 1, 1, NULL, 'B', 3, 4),
(4, 'CUISINART', 'China', 1198, 'Completa', 3, 'Bueno', 600, 1, 0, 'Tanque de agua y portafiltros removible', 'B', 3, 4),
(5, 'TAURUS', 'China', 349, 'Completa', 2, 'Suficiente', 650, 1, 0, NULL, 'B', 3, 4),
(6, 'TAURUS', 'China', 650, 'Completa', 2, 'Suficiente', 600, 1, 0, NULL, 'B', 3, 4),
(7, 'OSTER', 'China', 2899, 'Completa', 1, 'Excelente', 1300, 1, 0, NULL, 'E', 3, 4),
(8, 'KRUPS', 'China', 900, 'Completa', 2, 'Suficiente', 600, 1, 0, NULL, 'MB', 3, 4),
(9, 'KRUPS', 'China', 1839, 'Completa', 2, 'Excelente', 900, 1, 0, NULL, 'MB', 3, 4),
(10, 'SMEG', 'China', 4172, 'Completa', 1, 'Suficiente', 1050, 1, 0, NULL, 'MB', 3, 4),
(11, 'KRUPS', 'China', 2799, 'Completa', 2, 'Muy Bueno', 1000, 1, 1, 'Cuenta con contenedor y dispensador de café', 'MB', 3, 4),
(12, 'PROCTOR SILEX', 'China', 699, 'Completa', 3, 'Muy Bueno', 900, 1, 1, 'No cuenta con filtro', 'B', 3, 4),
(13, 'T-FAL', 'China', 999, 'Completa', 1, 'Muy Bueno', 1000, 1, 1, NULL, 'MB', 3, 4),
(14, 'PROCTOR SILEX', 'China', 499, 'Completa', 3, 'Excelente', 900, 1, 1, NULL, 'E', 3, 4),
(15, 'HAMILTON BEACH', 'China', 761, 'Completa', 1, 'Muy Bueno', 950, 1, 0, NULL, 'MB', 3, 4),
(16, 'KALORIK', 'China', 1096, 'Completa', 1, 'Muy Bueno', 900, 1, 0, NULL, 'MB', 3, 4),
(17, 'TAURUS', 'China', 412, 'Completa', 2, 'Muy Bueno', 700, 1, 0, 'Sistema de fácil llenado de agua', 'B', 3, 4),
(18, 'BLACK+DECKER', 'China', 919, 'Completa', 2, 'Muy Bueno', 1000, 1, 1, NULL, 'B', 3, 4),
(19, 'HAMILTON BEACH', 'China', 2124, 'Completa', 5, 'Excelente', 1350, 1, 0, 'No cuenta con filtro', 'MB', 3, 4),
(20, 'POWER XL', 'China', 1005, 'Completa', 2, 'Bueno', 1000, 1, 1, 'Declara tener la función de preparar café helado (percolado con agua fría agregándole hielo a la', 'MB', 3, 4),
(11, 'KRUPS', 'China', 2799, 'Completa', 2, 'Muy Bueno', 1000, 1, 1, 'Cuenta con contenedor y dispensador de café', 'MB', 3, 4),
(12, 'PROCTOR SILEX', 'China', 699, 'Completa', 3, 'Muy Bueno', 900, 1, 1, 'No cuenta con filtro', 'B', 3, 4),
(13, 'T-FAL', 'China', 999, 'Completa', 1, 'Muy Bueno', 1000, 1, 1, NULL, 'MB', 3, 4),
(14, 'PROCTOR SILEX', 'China', 499, 'Completa', 3, 'Excelente', 900, 1, 1, NULL, 'E', 3, 4),
(15, 'HAMILTON BEACH', 'China', 761, 'Completa', 1, 'Muy Bueno', 950, 1, 0, NULL, 'MB', 3, 4),
(16, 'KALORIK', 'China', 1096, 'Completa', 1, 'Muy Bueno', 900, 1, 0, NULL, 'MB', 3, 4),
(17, 'TAURUS', 'China', 412, 'Completa', 2, 'Muy Bueno', 700, 1, 0, 'Sistema de fácil llenado de agua', 'B', 3, 4),
(18, 'BLACK+DECKER', 'China', 919, 'Completa', 2, 'Muy Bueno', 1000, 1, 1, NULL, 'B', 3, 4),
(19, 'HAMILTON BEACH', 'China', 2124, 'Completa', 5, 'Excelente', 1350, 1, 0, 'No cuenta con filtro', 'MB', 3, 4),
(20, 'POWER XL', 'China', 1005, 'Completa', 2, 'Bueno', 1000, 1, 1, 'Declara tener la función de preparar café helado (percolado con agua fría agregándole hielo a la', 'MB', 3, 4),
(21, 'ATVIO HOME', 'China', 308, 'Completa', 1, 'Muy Bueno', 900, 1, 0, NULL, 'B', 3, 4),
(22, 'CHEFMAN ', 'China', 1399, 'Completa', 1, 'Bueno', 950, 1, 0, NULL, 'B', 3, 4),
(23, 'ATVIO ', 'China', 308, 'Completa', 1, 'Muy Bueno', 900, 1, 0, NULL, 'B', 3, 4),
(24, 'HAMILTON BEACH ', 'China', 1019, 'Completa', 1, 'Bueno', 1025, 1, 0, NULL, 'B', 3, 4),
(25, 'T-FAL', 'China', 731, 'Completa', 1, 'Suficiente', 900, 1, 1, NULL, 'B', 3, 4),
(26, 'KOBLENZ', 'China', 991, 'Completa', 2, 'Bueno', 1000, 1, 0, NULL, 'D', 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiomayonesas`
--

CREATE TABLE `estudiomayonesas` (
  `idEstudioMayonesas` int(11) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `contenidoEnergetico` int(11) DEFAULT NULL,
  `grasas` decimal(10,2) DEFAULT NULL,
  `sodio` int(11) DEFAULT NULL,
  `infAlConsumidor` varchar(100) DEFAULT NULL,
  `contNeto` varchar(100) DEFAULT NULL,
  `carbohidratos` decimal(10,2) DEFAULT NULL,
  `proteina` decimal(10,2) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `excesoCalorias` tinyint(1) DEFAULT NULL,
  `excesoAzucares` tinyint(1) DEFAULT NULL,
  `excesoGrasasSaturadas` tinyint(1) DEFAULT NULL,
  `excesoGrasasTrans` tinyint(1) DEFAULT NULL,
  `excesoSodio` tinyint(1) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiomayonesas`
--

INSERT INTO `estudiomayonesas` (`idEstudioMayonesas`, `nombreProducto`, `descripcion`, `precio`, `categoria`, `contenidoEnergetico`, `grasas`, `sodio`, `infAlConsumidor`, `contNeto`, `carbohidratos`, `proteina`, `observaciones`, `excesoCalorias`, `excesoAzucares`, `excesoGrasasSaturadas`, `excesoGrasasTrans`, `excesoSodio`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'BEST FOODS REAL', 'Mayonesa / México / 473 ml ', 67.00, 'Mayonesas', 719, 78.90, 589, '0', '0', 1.00, 1.20, 'Declara 473 ml de contenido neto y contiene 428 ml', 1, 0, 1, 0, 1, 1, 2),
(2, 'LA COSTEÑA', 'Mayonesa con jugo de limón / México / 190 g', 27.00, 'Mayonesas', 746, 81.90, 580, '1', '1', 1.00, 1.40, 'No demostró las frases:\n-\"Ingredientes de la mejor calidad\"\n-\"Su sabor único Heinz\"\nNo coloca al jugo de limón dentro de azúcares añadidos, por lo que incumple norma de etiquetado', 1, 0, 1, 0, 1, 1, 2),
(3, 'HEINZ', 'Mayonesa con limón / México / 370 g', 53.00, 'Mayonesas', 641, 69.90, 483, '0', '1', 2.20, 0.90, 'No demostró las frases:\n-\"Especialmente elaborada con ingredientes de la más alta calidad\"\n-\"Su sabor único Heinz\"\nNo coloca al jugo de limón dentro de los azúcares añadidos, por lo que incumple norma de etiquetado\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', 1, 0, 1, 0, 1, 1, 2),
(4, 'HEINZ', 'Mayonesa / México / 170 g', 26.00, 'Mayonesas', 651, 65.50, 411, '0', '1', 14.70, 0.80, '', 1, 0, 1, 0, 1, 1, 2),
(5, 'GREAT VALUE', 'Mayonesa con jugo de limón / México / 870 g', 76.00, 'Mayonesas', 617, 67.20, 650, '1', '1', 1.80, 1.30, '', 1, 0, 1, 0, 1, 1, 2),
(6, 'MCCORMICK', 'Mayonesa con jugo de limones / México / 190 g', 28.00, 'Mayonesas', 745, 81.30, 600, '0', '1', 2.00, 1.30, '', 1, 0, 1, 0, 1, 1, 2),
(7, 'MAILLE', 'Mayonesa Fina / Francia / 320 g', 126.00, 'Mayonesas', 725, 79.30, 440, '1', '1', 1.10, 1.80, '', 1, 0, 0, 0, 1, 1, 2),
(8, 'MAILLE', 'Mayonesa Fina Gourmet / Francia / 320 g', 126.00, 'Mayonesas', 717, 78.50, 560, '1', '1', 0.50, 2.10, '', 1, 0, 0, 0, 1, 1, 2),
(9, 'MEMBER´S MARK', 'Mayonesa / México / 3.35 kg', 262.00, 'MAYONESA REDUCIDA EN GRASA', 768, 84.00, 534, '1', '1', 2.10, 0.90, '', 1, 0, 1, 0, 1, 1, 2),
(10, 'AURRERA', 'Mayonesa con jugo de limón / México / 870 g', 75.00, 'MAYONESA REDUCIDA EN GRASA', 450, 47.70, 610, '1', '1', 3.80, 1.40, '', 1, 0, 1, 0, 1, 1, 2),
(11, 'HEINZ', 'Mayonesa reducida en grasa / México / 390 g', 52.00, 'MAYONESA REDUCIDA EN GRASA', 318, 34.50, 547, '0', '1', 1.40, 0.40, 'No demostró la frase:\n\"El sabor de nuestra mayonesa que conoces\"\nNo coloca al jugo de limón dentro de los azúcares añadidos, por lo que incumple norma de etiquetado\nSu nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', 1, 0, 1, 0, 1, 1, 2),
(12, 'HELLMANNS ', 'Mayonesa reducida en grasa, Clásica / México / 190 g*', 25.00, 'MAYONESA REDUCIDA EN GRASA', 399, 41.40, 737, '1', '1', 5.40, 1.10, '', 1, 0, 1, 0, 1, 1, 2),
(13, 'KRAFT ', 'Mayonesa reducida en grasa, con jugo de limón / México / 650 g', 61.00, 'MAYONESA REDUCIDA EN GRASA', 326, 33.10, 775, '1', '1', 6.20, 1.00, '', 1, 0, 1, 0, 1, 1, 2),
(14, 'KRAFT ', 'Mayonesa reducida en grasa, tipo casero / México / 650 g', 61.00, 'MAYONESA REDUCIDA EN GRASA', 327, 33.50, 755, '0', '1', 5.80, 0.70, 'No demostró la frase:\n\"Tipo Casero\"\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', 1, 0, 1, 0, 1, 1, 2),
(15, 'HELLMANNS', 'Aderezo con Aceite de Canola Liviana / México / 220 g', 31.00, 'ADEREZOS', 174, 15.20, 299, '0', '1', 8.50, 0.80, 'Usa el término \"LIVIANA\", el cual es potencialmente engañoso pues carece de sentido, por lo que incumple norma de etiquetado', 0, 0, 0, 0, 1, 1, 2),
(16, 'HELLMANNS ', 'Aderezo LIGHT / México / 355 g', 44.00, 'ADEREZOS', 201, 18.10, 734, '0', '1', 9.00, 0.50, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 1, 0, 1, 1, 2),
(17, 'HELLMANNS', 'Aderezo sabor Mayonesa, ligera, con jugo de limón / México / 190 g', 20.00, 'ADEREZOS', 236, 21.80, 748, '0', '1', 8.60, 1.30, 'Presenta la leyenda \"PRECIO ESPECIAL\" la cual, al no ser clara, es potencialmente engañosa pues no especifica a qué se refiere, por lo que incumple la norma de etiquetado\nSu nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 1, 0, 1, 1, 2),
(18, 'HELLMANNS VEGANA', 'Aderezo 100% Vegetal / Polonia / 280 ml', 95.00, 'ADEREZOS', 336, 35.60, 543, '1', '1', 3.70, 0.18, '', 1, 0, 0, 0, 1, 1, 2),
(19, 'MCCORMICK BALANCE', 'Aderezo con Aceite de almendras / México / 315 g', 51.00, 'ADEREZOS', 260, 24.10, 242, '0', '1', 10.10, 0.70, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 0, 0, 0, 1, 2),
(20, 'MCCORMICK BALANCE', 'Aderezo con Aceite de ajonjolí / México / 315g', 51.00, 'ADEREZOS', 263, 24.40, 241, '0', '1', 10.00, 0.90, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 0, 0, 0, 1, 2),
(21, 'MCCORMICK BALANCE ', 'Aderezo con Aceite de aguacate / México / 315 g', 51.00, 'ADEREZOS', 268, 25.00, 239, '0', '1', 9.90, 0.80, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 0, 0, 0, 1, 2),
(22, 'MCCORMICK BALANCE', 'Aderezo con Aceite de canola / México / 315 g', 51.00, 'ADEREZOS', 261, 24.20, 242, '0', '1', 10.00, 0.80, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 0, 0, 0, 1, 2),
(23, 'MCCORMICK ', 'Aderezo con jugo de limones light / México / 425 g', 51.00, 'ADEREZOS', 273, 25.10, 684, '0', '1', 11.10, 0.70, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', 0, 0, 1, 0, 1, 1, 2),
(24, 'LA COSTEÑA', 'Aderezo de Mayonesa Light / México / 420 g', 35.00, 'ADEREZO DE MAYONESA', 350, 34.40, 780, '0', '1', 9.00, 0.90, 'Usa el término \"Light\" para comparar el contenido de calorías entre \"Aderezo de mayonesa\" y \"Mayonesa\"; sin embargo, al ser un Aderezo, debería compararse con un Aderezo de mayonesa, por lo que incumple la norma de etiquetado', 1, 0, 1, 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiopandecaja`
--

CREATE TABLE `estudiopandecaja` (
  `idPancaja` int(11) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `gramos` int(100) NOT NULL,
  `precio` int(11) DEFAULT NULL,
  `informacionconsumidor` varchar(100) DEFAULT NULL,
  `azucarestotales` float DEFAULT NULL,
  `sodio` int(11) DEFAULT NULL,
  `Calidadsanitaria` tinyint(1) DEFAULT NULL,
  `Proteina` float DEFAULT NULL,
  `grasa` float DEFAULT NULL,
  `fibra` float DEFAULT NULL,
  `carbohidratos` float DEFAULT NULL,
  `contenidoenergetico` float DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `excesoCalorias` tinyint(1) DEFAULT NULL,
  `excesoAzucares` tinyint(1) DEFAULT NULL,
  `excesoGrasasSaturadas` tinyint(1) DEFAULT NULL,
  `excesoGrasasTrans` tinyint(1) DEFAULT NULL,
  `excesoSodio` tinyint(1) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiopandecaja`
--

INSERT INTO `estudiopandecaja` (`idPancaja`, `nombreProducto`, `descripcion`, `gramos`, `precio`, `informacionconsumidor`, `azucarestotales`, `sodio`, `Calidadsanitaria`, `Proteina`, `grasa`, `fibra`, `carbohidratos`, `contenidoenergetico`, `observacion`, `excesoCalorias`, `excesoAzucares`, `excesoGrasasSaturadas`, `excesoGrasasTrans`, `excesoSodio`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'BIMBO CERO CERO MULTIGRANO', 'Pan de harina de trigo integral', 610, 65, NULL, 4.3, 225, 1, 13.7, 2.2, 4.3, 39.9, 234, 'Declara 1.2 g de azúcares totales y contiene 4.3 g', 0, 0, 0, 0, 0, 1, 6),
(2, 'ELIZONDO', 'Pan multigrano', 500, 55, NULL, 4.7, 435, 1, 11, 7.4, 4.3, 46.6, 297, 'No cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado', 0, 0, 0, 0, 1, 1, 6),
(3, 'EL MOLINO BLANCO DE MATEO', 'Pan de linaza', 610, 37, NULL, 7.7, 393, 1, 11.1, 6.3, 6.9, 38.5, 255, 'Se denomina \"Pan de linaza\", pero en su lista de ingredientes la linaza está en décimo lugar\nPresenta el distintivo de la NOM-247, pero no comprueba su uso', 0, 0, 0, 0, 1, 1, 6),
(4, 'EXTRA SPECIAL', 'Pan de harina de trigo con 12 granos', 640, 75, NULL, 5.7, 212, 1, 9.3, 8.6, 2.8, 47.7, 305, 'Declara 3 g de azúcares totales y contiene 5.7 g', 1, 0, 0, 0, 0, 1, 6),
(5, 'FIILLER', 'Pan de siete granos', 260, 35, NULL, 3, 252, 1, 9.4, 2.6, 3.9, 47, 249, 'Declara 0.9 g de azúcares totales y contiene 3 g.\nNo indica país de origen, por lo que incumple la NOM-051.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nOstenta que contiene avena y soya, pero no las declara en la lista de ingredientes', 0, 0, 0, 0, 0, 1, 6),
(6, 'FIILLER', 'Pan rebanado con nuez y pasas', 640, 45, NULL, 8.9, 31, 1, 8.8, 3.6, 2.2, 60.4, 310, 'Su declaración de fibra está en las unidades incorrectas, por lo que incumple la NOM-051.', 0, 1, 0, 0, 0, 1, 6),
(7, 'FIILLER', 'Pan rebanado combigrano', 640, 46, NULL, 3.6, 297, 1, 9.6, 5.1, 2.7, 51.5, 290, 'NoDeclara 0.5 g de azúcares totales y contiene 3.6 g.\nDeclara 2 g de grasa y contiene 5.1 g.\nFalta de sello Exceso de Sodio ', 0, 0, 0, 0, 0, 1, 6),
(8, 'LECAROZ', 'Pan de caja multigrano', 550, 34, NULL, 6, 270, 1, 10.2, 2.5, 4, 53.4, 277, 'Declara 50 g de azúcares totales y contiene 6 g.\nEl orden de sus ingredientes no está presentado de mayor a menor contenido, por lo que incumple la NOM-051.\nFalta de sello Exceso de Sodio', 0, 0, 0, 0, 0, 1, 6),
(9, 'PAN EUROPEO ARTESANAL', 'Pan rústico 14 granos', 200, 33, NULL, 9.3, 280, 1, 9.3, 8, 4, 45.8, 293, 'Declara 7 g de azúcares totales y contiene 9.3 g.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 1, 0, 0, 0, 0, 1, 6),
(10, 'NEW YORK DELI & BAGEL PREMIUM GOLDEN GRAIN GRANOS Y SEMILLAS', 'Pan de harina de trigo y multicereales', 625, 74, NULL, 5, 263, 1, 9.9, 8.2, 2.7, 48.7, 308, 'Declara 3.6 g de azúcares totales y contiene 5 g', 0, 0, 0, 0, 0, 1, 6),
(11, 'OROWEAT MULTIGRANO', 'Pan con granos enteros', 680, 74, NULL, 10.2, 422, 1, 10.8, 5.4, 3.2, 44.2, 268, 'Declara 7.1 g de azúcares totales y contiene 10.2 g.\nResalta tener miel, pero solo contiene 3%.', 0, 0, 0, 0, 1, 1, 6),
(12, 'OROWEAT 12 GRANOS Y SEMILLAS', 'Pan con granos enteros y un toque de miel', 680, 69, NULL, 11.6, 424, 1, 11.6, 5.3, 4.1, 43.2, 267, 'Declara 7.2 g de azúcares totales y contiene 11.6 g.\nResalta tener miel, pero solo contiene 0.2%', 0, 0, 0, 0, 1, 1, 6),
(13, 'BIMBO CERO CERO', 'Pan de harina de trigo integral', 305, 38, NULL, 5.7, 215, 1, 12.4, 2, 5.8, 38.9, 223, 'Declara 1.5 g de azúcares totales y contiene 5.7 g.\nDeclara 15 g de proteína y contiene 12.4 g.', 0, 0, 0, 0, 0, 1, 6),
(14, 'BIMBO INTEGRAL', 'Pan de harina de trigo integral', 620, 54, NULL, 8.2, 605, 1, 12.9, 3.6, 5.6, 40.2, 245, 'Declara 6 g de azúcares totales y contiene 8.2 g.', 0, 0, 0, 0, 1, 1, 6),
(15, 'CANADIAN BAGELS', 'Pan extra fibra', 625, 97, NULL, 3.7, 375, 1, 9.9, 2.4, 8.9, 41.1, 226, 'Presenta pilas en la superficie frontal de exhibición las cuales no son vigentes en la actual norma de etiquetado.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 1, 0, 0, 1, 1, 6),
(16, 'ESPERANZA INTEGRAL', 'Pan de harina de trigo y salvado', 640, 37, NULL, 6.9, 2457, 1, 9, 5.7, 5, 46.4, 273, 'Se denomina \"pan de harina de trigo y salvado\", pero no indica el contenido de salvado, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1, 6),
(17, 'EL MOLINO BLANCO DE MATEO', 'Pan integral', 640, 37, NULL, 6.6, 445, 1, 9.9, 5.3, 7.1, 41.3, 252, 'Presenta el distintivo de la NOM-247, pero no comprueba su uso.\nNo indica cómo conservarlo, por lo que incumple la NOM 051', 0, 0, 0, 0, 1, 1, 6),
(18, 'GREAT VALUE PAN INTEGRAL', 'Pan de harina de trigo integral', 610, 48, NULL, 7.9, 345, 1, 11.3, 3.5, 5.5, 41.4, 243, 'Declara 4.6 g de azúcares totales y contiene 7.9 g', 0, 0, 0, 0, 1, 1, 6),
(19, 'LECAROZ', 'Pan de caja integral', 550, 34, NULL, 5.2, 250, 1, 11, 2.6, 4, 52.6, 277, 'Declara 51 g de azúcares totales y contiene 5.2 g.\nEl orden de sus ingredientes no está presentado de mayor a menor contenido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1, 6),
(20, 'NEW YORK DELI & BAGEL GOLDEN GRAIN PREMIUM INTEGRAL', 'Pan con harina de trigo integral', 625, 74, NULL, 5.6, 261, 1, 9.3, 7.5, 2.5, 53, 317, 'Declara 3.8 g de azúcares totales y contiene 5.6 g.\nDeclara 625 g de contenido neto y contiene 572 g.', 0, 0, 0, 0, 0, 1, 6),
(21, 'MEMBERS MARK PAN INTEGRAL', 'Pan de harina de trigo integral', 610, 39, NULL, 9.7, 345, 1, 11.2, 3.9, 5.5, 40.4, 241, 'Declara 4.6 g de azúcares totales y contiene 9.7 g.', 0, 0, 0, 0, 1, 1, 6),
(22, 'WONDER', 'Pan de harina de trigo integral', 567, 53, NULL, 10.3, 500, 1, 11.3, 4.6, 7.6, 38.2, 240, 'Declara 6 g de azúcares totales y contiene 10.3 g.', 0, 0, 0, 0, 1, 1, 6),
(23, 'PAN EUROPEO ARTESANAL', 'Pan de salvado integral', 750, 56, NULL, 8, 625, 1, 9.7, 4.7, 4.9, 47, 269, 'Declara 3.4 g de azúcares totales y contiene 8 g.\nSe denomina \"Pan de salvado integral\", pero en su lista de ingredientes el salvado está en tercer lugar.\nNo declara contenido energético por envase, por lo que incumple la NOM-051.\r\nNo comprobó las leyendas:\n\"Alto valor nutricional\"\n\"Alto de fibra\"\n\"Nuestros productos son elaborados con MASAS MADRE bajo la más fina tradición europea\".', 0, 0, 0, 0, 0, 1, 6),
(24, 'ESPERANZA CENTENO', 'Pan de harina de trigo con centeno', 640, 37, NULL, 7.2, 240, 1, 9.9, 4.9, 2, 48.8, 279, 'Declara 2 g de azúcares totales y contiene 7.2 g', 0, 0, 0, 0, 0, 1, 6),
(25, 'NEW YORK DELI & BAGEL PUMPERNICKEL CON MASA MADRE', 'Pan de harinas de trigo y centeno', 625, 74, NULL, 6.1, 247, 1, 8.9, 5.8, 3.4, 50, 287, 'Declara 2.9 g de azúcares totales y contiene 6.1 g.', 0, 0, 0, 0, 0, 1, 6),
(26, 'FIILLER', 'Pan de centeno con linaza', 550, 49, NULL, 5.4, 304, 1, 9.9, 4.6, 4.3, 48, 273, 'Declara 0.6 g de azúcares totales y contiene 5.4 g.\nNo indica país de origen, por lo que incumple la NOM-051. ', 0, 0, 0, 0, 1, 1, 6),
(27, 'FIILLER', 'Pan de centeno ligero con ajonjolí', 375, 37, NULL, 6.3, 327, 1, 9.7, 3.8, 4.5, 48.8, 268, 'Declara 1.6 g de azúcares totales y contiene 6.3 g.\nSe denomina pan de centeno ligero con ajonjolí, pero en su lista de ingredientes el ajonjolí está en noveno lugar', 0, 0, 0, 0, 0, 1, 6),
(28, 'FIILLER', 'Pan negro tipo rústico', 250, 41, NULL, 4.9, 227, 1, 9.1, 1.9, 3.5, 47.4, 243, 'Declara 1 g de azúcares totales y contiene 4.9 g.\nNo indica país de origen, por lo que incumple la NOM-051.', 0, 0, 0, 0, 1, 1, 6),
(29, 'FIILLER', 'Pan de centeno y cebolla', 250, 48, NULL, 3.3, 250, 1, 8.9, 2, 5.2, 49.5, 252, '• Declara 1 g de azúcares totales y contiene 3.3 g.\nSe denomina \"Pan de centeno y cebolla\", pero en su lista de ingredientes, el harina de centeno está en tercer lugar.\nNo indica país de origen, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1, 6),
(30, 'NEW YORK DELI & BAGEL DELI EUROPEO RYE BREAD', 'Pan de harinas de trigo y centeno', 625, 74, NULL, 5.5, 247, 1, 8.9, 5.6, 3.4, 49.2, 283, 'Declara 2.9 g de azúcares totales y contiene 5.5 g', 0, 0, 0, 0, 0, 1, 6),
(31, 'FIILLER PAN UNICORNIO', 'Pan de caja sabor neutro con colorantes a base de verduras como: betabel,zanahoria,achiote,clorofila', 500, 48, NULL, 4.8, 202, 1, 9.1, 4.3, 1.2, 51, 279, 'Declara 2 g de azúcares totales y contiene 4.8 g', 0, 0, 0, 0, 0, 1, 6),
(32, 'CANYON BAKEHOUSE GLUTEN FREE COUNTRY WHITE', '100% whole grain bread', 425, 131, NULL, 12.3, 393, 1, 5.8, 5.7, 0, 49.3, 272, 'No presenta su información en español, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1, 6),
(33, 'BIMBO SIN GLUTEN', 'Pan sin gluten con chía y linaza', 430, 170, NULL, 5.1, 340, 1, 3.6, 7.5, 7.3, 45, 262, NULL, 0, 0, 0, 0, 1, 1, 6),
(34, 'OROWEAT HOGAZA BLANCA', 'Pan con masa madre de centeno', 680, 86, NULL, 11.9, 387, 1, 8.9, 5.2, 2.8, 44.3, 259, 'Declara 4.7 g de azúcares totales y contiene 11.9 g.\nDeclara 12.2 g de proteína y contiene 8.9 g', 0, 0, 0, 0, 1, 1, 6),
(35, 'BIMBO ARTESANO', 'Pan de harina de trigo', 567, 54, NULL, 9.6, 440, 1, 8.4, 3.5, 2.3, 49.4, 263, 'Declara 5.9 g de azúcares totales y contiene 9.6 g', 0, 0, 0, 0, 1, 1, 6),
(36, 'BIMBO NATURAL', 'Pan de harina de trigo', 610, 61, NULL, 4.2, 222, 1, 15.5, 1.5, 2.2, 40.2, 237, 'Declara 0.9 g de azúcares totales y contiene 4.2 g.', 0, 0, 0, 0, 0, 1, 6),
(37, 'BIMBO BLANCO', 'Pan de harina de trigo', 680, 49, NULL, 10.2, 470, 1, 8.9, 2.9, 2.3, 47.3, 251, 'Declara 4.9 g de azúcares totales y contiene 10.2 g', 0, 0, 0, 0, 1, 1, 6),
(38, 'EL MOLINO BLANCO DE MATEO', 'Pan blanco', 640, 37, NULL, 8.3, 454, 1, 8.8, 4.9, 2.6, 47.4, 269, 'Presenta el distintivo de la NOM-247, pero no comprueba su uso.\nNo indica condiciones para su conservación, por lo que incumple la NOM-051.', 0, 0, 0, 0, 1, 1, 6),
(39, 'ELIZONDO', 'Pan blanco', 510, 42, NULL, 5.8, 422, 1, 10.6, 5.7, NULL, 54, 309, 'No cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado', 0, 0, 0, 0, 0, 1, 6),
(40, 'GREAT VALUE PAN BLANCO', 'Pan blanco', 567, 42, NULL, 9.4, 303, 1, 9.1, 3.2, 1.6, 48.4, 259, 'Declara 4.5 g de azúcares totales y contiene 9.4 g.', 0, 0, 0, 0, 1, 1, 6),
(41, 'LECAROZ PAN BLANCO', 'Pan de caja blanco', 550, 38, NULL, 3.9, 600, 1, 10.2, 5.7, 2, 53.5, 307, 'Declara 64 g de azúcares totales y contiene 3.9 g.\nDeclara 71 g de carbohidratos y contienen 53.5 g.\nDeclara 550 g de contenido neto y contiene 456 g.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial de la norma de etiquetado.', 1, 0, 0, 0, 1, 1, 6),
(42, 'MEMBERS MARK PAN BLANCO', 'Pan de harina de trigo', 567, 34, NULL, 6.3, 303, 1, 10.1, 3.3, 1.6, 48.1, 262, 'Declara 4.5 g de azúcares totales y contiene 6.3 g.', 0, 0, 0, 0, 1, 1, 6),
(43, 'NATURES OWN', 'Thick sliced white', 624, 72, NULL, 11.4, 548, 1, 9.5, 4.2, 2.4, 46.8, 263, 'Su información no está en español, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1, 6),
(44, 'NATURES OWN THICK SLICED BRIOCHE STYLE BREAD', 'Brioche style bread', 624, 81, NULL, 15, 405, 1, 9.6, 3.5, 2.4, 50.9, 273, 'Su información no está en español, por lo que incumple la NOM 051.\nNo presenta su información nutrimental por 100 g de producto, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1, 6),
(45, 'PAN BUENO', 'Pan blanco', 500, 39, NULL, 13, 335, 1, 8.5, 4.4, 2.3, 51.3, 278, 'Declara 6.2 g de azúcares totales y contiene 13 g\n Le falta el sello de exceso de sodio', 0, 0, 0, 0, 0, 1, 6),
(46, 'WONDER', 'Pan de harina de trigo con ajonjolí', 567, 58, NULL, 7.2, 497, 1, 10.6, 3.6, 2.3, 46.7, 262, 'Declara 5.6 g de azúcares totales y contiene 7.2 g', 0, 0, 0, 0, 1, 1, 6),
(1, 'BIMBO CERO CERO MULTIGRANO', 'Pan de harina de trigo integral', 610, 65, NULL, 4.3, 225, 1, 13.7, 2.2, 4.3, 39.9, 234, 'Declara 1.2 g de azúcares totales y contiene 4.3 g', 0, 0, 0, 0, 0, 1, 6),
(2, 'ELIZONDO', 'Pan multigrano', 500, 55, NULL, 4.7, 435, 1, 11, 7.4, 4.3, 46.6, 297, 'No cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado', 0, 0, 0, 0, 1, 1, 6),
(3, 'EL MOLINO BLANCO DE MATEO', 'Pan de linaza', 610, 37, NULL, 7.7, 393, 1, 11.1, 6.3, 6.9, 38.5, 255, 'Se denomina \"Pan de linaza\", pero en su lista de ingredientes la linaza está en décimo lugar\nPresenta el distintivo de la NOM-247, pero no comprueba su uso', 0, 0, 0, 0, 1, 1, 6),
(4, 'EXTRA SPECIAL', 'Pan de harina de trigo con 12 granos', 640, 75, NULL, 5.7, 212, 1, 9.3, 8.6, 2.8, 47.7, 305, 'Declara 3 g de azúcares totales y contiene 5.7 g', 1, 0, 0, 0, 0, 1, 6),
(5, 'FIILLER', 'Pan de siete granos', 260, 35, NULL, 3, 252, 1, 9.4, 2.6, 3.9, 47, 249, 'Declara 0.9 g de azúcares totales y contiene 3 g.\nNo indica país de origen, por lo que incumple la NOM-051.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nOstenta que contiene avena y soya, pero no las declara en la lista de ingredientes', 0, 0, 0, 0, 0, 1, 6),
(6, 'FIILLER', 'Pan rebanado con nuez y pasas', 640, 45, NULL, 8.9, 31, 1, 8.8, 3.6, 2.2, 60.4, 310, 'Su declaración de fibra está en las unidades incorrectas, por lo que incumple la NOM-051.', 0, 1, 0, 0, 0, 1, 6),
(7, 'FIILLER', 'Pan rebanado combigrano', 640, 46, NULL, 3.6, 297, 1, 9.6, 5.1, 2.7, 51.5, 290, 'NoDeclara 0.5 g de azúcares totales y contiene 3.6 g.\nDeclara 2 g de grasa y contiene 5.1 g.\nFalta de sello Exceso de Sodio ', 0, 0, 0, 0, 0, 1, 6),
(8, 'LECAROZ', 'Pan de caja multigrano', 550, 34, NULL, 6, 270, 1, 10.2, 2.5, 4, 53.4, 277, 'Declara 50 g de azúcares totales y contiene 6 g.\nEl orden de sus ingredientes no está presentado de mayor a menor contenido, por lo que incumple la NOM-051.\nFalta de sello Exceso de Sodio', 0, 0, 0, 0, 0, 1, 6),
(9, 'PAN EUROPEO ARTESANAL', 'Pan rústico 14 granos', 200, 33, NULL, 9.3, 280, 1, 9.3, 8, 4, 45.8, 293, 'Declara 7 g de azúcares totales y contiene 9.3 g.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 1, 0, 0, 0, 0, 1, 6),
(10, 'NEW YORK DELI & BAGEL PREMIUM GOLDEN GRAIN GRANOS Y SEMILLAS', 'Pan de harina de trigo y multicereales', 625, 74, NULL, 5, 263, 1, 9.9, 8.2, 2.7, 48.7, 308, 'Declara 3.6 g de azúcares totales y contiene 5 g', 0, 0, 0, 0, 0, 1, 6),
(11, 'OROWEAT MULTIGRANO', 'Pan con granos enteros', 680, 74, NULL, 10.2, 422, 1, 10.8, 5.4, 3.2, 44.2, 268, 'Declara 7.1 g de azúcares totales y contiene 10.2 g.\nResalta tener miel, pero solo contiene 3%.', 0, 0, 0, 0, 1, 1, 6),
(12, 'OROWEAT 12 GRANOS Y SEMILLAS', 'Pan con granos enteros y un toque de miel', 680, 69, NULL, 11.6, 424, 1, 11.6, 5.3, 4.1, 43.2, 267, 'Declara 7.2 g de azúcares totales y contiene 11.6 g.\nResalta tener miel, pero solo contiene 0.2%', 0, 0, 0, 0, 1, 1, 6),
(13, 'BIMBO CERO CERO', 'Pan de harina de trigo integral', 305, 38, NULL, 5.7, 215, 1, 12.4, 2, 5.8, 38.9, 223, 'Declara 1.5 g de azúcares totales y contiene 5.7 g.\nDeclara 15 g de proteína y contiene 12.4 g.', 0, 0, 0, 0, 0, 1, 6),
(14, 'BIMBO INTEGRAL', 'Pan de harina de trigo integral', 620, 54, NULL, 8.2, 605, 1, 12.9, 3.6, 5.6, 40.2, 245, 'Declara 6 g de azúcares totales y contiene 8.2 g.', 0, 0, 0, 0, 1, 1, 6),
(15, 'CANADIAN BAGELS', 'Pan extra fibra', 625, 97, NULL, 3.7, 375, 1, 9.9, 2.4, 8.9, 41.1, 226, 'Presenta pilas en la superficie frontal de exhibición las cuales no son vigentes en la actual norma de etiquetado.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 1, 0, 0, 1, 1, 6),
(16, 'ESPERANZA INTEGRAL', 'Pan de harina de trigo y salvado', 640, 37, NULL, 6.9, 2457, 1, 9, 5.7, 5, 46.4, 273, 'Se denomina \"pan de harina de trigo y salvado\", pero no indica el contenido de salvado, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1, 6),
(17, 'EL MOLINO BLANCO DE MATEO', 'Pan integral', 640, 37, NULL, 6.6, 445, 1, 9.9, 5.3, 7.1, 41.3, 252, 'Presenta el distintivo de la NOM-247, pero no comprueba su uso.\nNo indica cómo conservarlo, por lo que incumple la NOM 051', 0, 0, 0, 0, 1, 1, 6),
(18, 'GREAT VALUE PAN INTEGRAL', 'Pan de harina de trigo integral', 610, 48, NULL, 7.9, 345, 1, 11.3, 3.5, 5.5, 41.4, 243, 'Declara 4.6 g de azúcares totales y contiene 7.9 g', 0, 0, 0, 0, 1, 1, 6),
(19, 'LECAROZ', 'Pan de caja integral', 550, 34, NULL, 5.2, 250, 1, 11, 2.6, 4, 52.6, 277, 'Declara 51 g de azúcares totales y contiene 5.2 g.\nEl orden de sus ingredientes no está presentado de mayor a menor contenido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1, 6),
(20, 'NEW YORK DELI & BAGEL GOLDEN GRAIN PREMIUM INTEGRAL', 'Pan con harina de trigo integral', 625, 74, NULL, 5.6, 261, 1, 9.3, 7.5, 2.5, 53, 317, 'Declara 3.8 g de azúcares totales y contiene 5.6 g.\nDeclara 625 g de contenido neto y contiene 572 g.', 0, 0, 0, 0, 0, 1, 6),
(21, 'MEMBERS MARK PAN INTEGRAL', 'Pan de harina de trigo integral', 610, 39, NULL, 9.7, 345, 1, 11.2, 3.9, 5.5, 40.4, 241, 'Declara 4.6 g de azúcares totales y contiene 9.7 g.', 0, 0, 0, 0, 1, 1, 6),
(22, 'WONDER', 'Pan de harina de trigo integral', 567, 53, NULL, 10.3, 500, 1, 11.3, 4.6, 7.6, 38.2, 240, 'Declara 6 g de azúcares totales y contiene 10.3 g.', 0, 0, 0, 0, 1, 1, 6),
(23, 'PAN EUROPEO ARTESANAL', 'Pan de salvado integral', 750, 56, NULL, 8, 625, 1, 9.7, 4.7, 4.9, 47, 269, 'Declara 3.4 g de azúcares totales y contiene 8 g.\nSe denomina \"Pan de salvado integral\", pero en su lista de ingredientes el salvado está en tercer lugar.\nNo declara contenido energético por envase, por lo que incumple la NOM-051.\r\nNo comprobó las leyendas:\n\"Alto valor nutricional\"\n\"Alto de fibra\"\n\"Nuestros productos son elaborados con MASAS MADRE bajo la más fina tradición europea\".', 0, 0, 0, 0, 0, 1, 6),
(24, 'ESPERANZA CENTENO', 'Pan de harina de trigo con centeno', 640, 37, NULL, 7.2, 240, 1, 9.9, 4.9, 2, 48.8, 279, 'Declara 2 g de azúcares totales y contiene 7.2 g', 0, 0, 0, 0, 0, 1, 6),
(25, 'NEW YORK DELI & BAGEL PUMPERNICKEL CON MASA MADRE', 'Pan de harinas de trigo y centeno', 625, 74, NULL, 6.1, 247, 1, 8.9, 5.8, 3.4, 50, 287, 'Declara 2.9 g de azúcares totales y contiene 6.1 g.', 0, 0, 0, 0, 0, 1, 6),
(26, 'FIILLER', 'Pan de centeno con linaza', 550, 49, NULL, 5.4, 304, 1, 9.9, 4.6, 4.3, 48, 273, 'Declara 0.6 g de azúcares totales y contiene 5.4 g.\nNo indica país de origen, por lo que incumple la NOM-051. ', 0, 0, 0, 0, 1, 1, 6),
(27, 'FIILLER', 'Pan de centeno ligero con ajonjolí', 375, 37, NULL, 6.3, 327, 1, 9.7, 3.8, 4.5, 48.8, 268, 'Declara 1.6 g de azúcares totales y contiene 6.3 g.\nSe denomina pan de centeno ligero con ajonjolí, pero en su lista de ingredientes el ajonjolí está en noveno lugar', 0, 0, 0, 0, 0, 1, 6),
(28, 'FIILLER', 'Pan negro tipo rústico', 250, 41, NULL, 4.9, 227, 1, 9.1, 1.9, 3.5, 47.4, 243, 'Declara 1 g de azúcares totales y contiene 4.9 g.\nNo indica país de origen, por lo que incumple la NOM-051.', 0, 0, 0, 0, 1, 1, 6),
(29, 'FIILLER', 'Pan de centeno y cebolla', 250, 48, NULL, 3.3, 250, 1, 8.9, 2, 5.2, 49.5, 252, '• Declara 1 g de azúcares totales y contiene 3.3 g.\nSe denomina \"Pan de centeno y cebolla\", pero en su lista de ingredientes, el harina de centeno está en tercer lugar.\nNo indica país de origen, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1, 6),
(30, 'NEW YORK DELI & BAGEL DELI EUROPEO RYE BREAD', 'Pan de harinas de trigo y centeno', 625, 74, NULL, 5.5, 247, 1, 8.9, 5.6, 3.4, 49.2, 283, 'Declara 2.9 g de azúcares totales y contiene 5.5 g', 0, 0, 0, 0, 0, 1, 6),
(31, 'FIILLER PAN UNICORNIO', 'Pan de caja sabor neutro con colorantes a base de verduras como: betabel,zanahoria,achiote,clorofila', 500, 48, NULL, 4.8, 202, 1, 9.1, 4.3, 1.2, 51, 279, 'Declara 2 g de azúcares totales y contiene 4.8 g', 0, 0, 0, 0, 0, 1, 6),
(32, 'CANYON BAKEHOUSE GLUTEN FREE COUNTRY WHITE', '100% whole grain bread', 425, 131, NULL, 12.3, 393, 1, 5.8, 5.7, 0, 49.3, 272, 'No presenta su información en español, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1, 6),
(33, 'BIMBO SIN GLUTEN', 'Pan sin gluten con chía y linaza', 430, 170, NULL, 5.1, 340, 1, 3.6, 7.5, 7.3, 45, 262, NULL, 0, 0, 0, 0, 1, 1, 6),
(34, 'OROWEAT HOGAZA BLANCA', 'Pan con masa madre de centeno', 680, 86, NULL, 11.9, 387, 1, 8.9, 5.2, 2.8, 44.3, 259, 'Declara 4.7 g de azúcares totales y contiene 11.9 g.\nDeclara 12.2 g de proteína y contiene 8.9 g', 0, 0, 0, 0, 1, 1, 6),
(35, 'BIMBO ARTESANO', 'Pan de harina de trigo', 567, 54, NULL, 9.6, 440, 1, 8.4, 3.5, 2.3, 49.4, 263, 'Declara 5.9 g de azúcares totales y contiene 9.6 g', 0, 0, 0, 0, 1, 1, 6),
(36, 'BIMBO NATURAL', 'Pan de harina de trigo', 610, 61, NULL, 4.2, 222, 1, 15.5, 1.5, 2.2, 40.2, 237, 'Declara 0.9 g de azúcares totales y contiene 4.2 g.', 0, 0, 0, 0, 0, 1, 6),
(37, 'BIMBO BLANCO', 'Pan de harina de trigo', 680, 49, NULL, 10.2, 470, 1, 8.9, 2.9, 2.3, 47.3, 251, 'Declara 4.9 g de azúcares totales y contiene 10.2 g', 0, 0, 0, 0, 1, 1, 6),
(38, 'EL MOLINO BLANCO DE MATEO', 'Pan blanco', 640, 37, NULL, 8.3, 454, 1, 8.8, 4.9, 2.6, 47.4, 269, 'Presenta el distintivo de la NOM-247, pero no comprueba su uso.\nNo indica condiciones para su conservación, por lo que incumple la NOM-051.', 0, 0, 0, 0, 1, 1, 6),
(39, 'ELIZONDO', 'Pan blanco', 510, 42, NULL, 5.8, 422, 1, 10.6, 5.7, NULL, 54, 309, 'No cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado', 0, 0, 0, 0, 0, 1, 6),
(40, 'GREAT VALUE PAN BLANCO', 'Pan blanco', 567, 42, NULL, 9.4, 303, 1, 9.1, 3.2, 1.6, 48.4, 259, 'Declara 4.5 g de azúcares totales y contiene 9.4 g.', 0, 0, 0, 0, 1, 1, 6),
(41, 'LECAROZ PAN BLANCO', 'Pan de caja blanco', 550, 38, NULL, 3.9, 600, 1, 10.2, 5.7, 2, 53.5, 307, 'Declara 64 g de azúcares totales y contiene 3.9 g.\nDeclara 71 g de carbohidratos y contienen 53.5 g.\nDeclara 550 g de contenido neto y contiene 456 g.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial de la norma de etiquetado.', 1, 0, 0, 0, 1, 1, 6),
(42, 'MEMBERS MARK PAN BLANCO', 'Pan de harina de trigo', 567, 34, NULL, 6.3, 303, 1, 10.1, 3.3, 1.6, 48.1, 262, 'Declara 4.5 g de azúcares totales y contiene 6.3 g.', 0, 0, 0, 0, 1, 1, 6),
(43, 'NATURES OWN', 'Thick sliced white', 624, 72, NULL, 11.4, 548, 1, 9.5, 4.2, 2.4, 46.8, 263, 'Su información no está en español, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1, 6),
(44, 'NATURES OWN THICK SLICED BRIOCHE STYLE BREAD', 'Brioche style bread', 624, 81, NULL, 15, 405, 1, 9.6, 3.5, 2.4, 50.9, 273, 'Su información no está en español, por lo que incumple la NOM 051.\nNo presenta su información nutrimental por 100 g de producto, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1, 6),
(45, 'PAN BUENO', 'Pan blanco', 500, 39, NULL, 13, 335, 1, 8.5, 4.4, 2.3, 51.3, 278, 'Declara 6.2 g de azúcares totales y contiene 13 g\n Le falta el sello de exceso de sodio', 0, 0, 0, 0, 0, 1, 6),
(46, 'WONDER', 'Pan de harina de trigo con ajonjolí', 567, 58, NULL, 7.2, 497, 1, 10.6, 3.6, 2.3, 46.7, 262, 'Declara 5.6 g de azúcares totales y contiene 7.2 g', 0, 0, 0, 0, 1, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiopijamas`
--

CREATE TABLE `estudiopijamas` (
  `idEstudioPijamas` int(11) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `infAlConsumidor` varchar(100) DEFAULT NULL,
  `calificacionGeneral` varchar(50) DEFAULT NULL,
  `acabados` varchar(50) DEFAULT NULL,
  `verificacionDeTallas` varchar(50) DEFAULT NULL,
  `identificacionDeFibras` varchar(50) DEFAULT NULL,
  `solidezDelColor` varchar(50) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiopijamas`
--

INSERT INTO `estudiopijamas` (`idEstudioPijamas`, `nombreProducto`, `descripcion`, `precio`, `categoria`, `infAlConsumidor`, `calificacionGeneral`, `acabados`, `verificacionDeTallas`, `identificacionDeFibras`, `solidezDelColor`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'Carters', 'Talla 8', 399.00, 'Pijamas para ninos y ninas', '1', 'Excelente', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5, 8),
(2, 'Marvel - Spider Man', 'Talla 10', 229.00, 'Pijamas para ninos y ninas', '1', 'Excelente', 'Muy bueno', 'Excelente', 'Cumple', 'Excelente', 5, 8),
(3, 'Secret Treasures Girls', 'Talla 8', 234.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Excelente', 5, 8),
(4, 'Paw Patrol', 'Talla 6', 149.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5, 8),
(5, 'One for you by Creysi', 'Talla 8', 259.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Muy bueno', 5, 8),
(6, 'Hello Kitty', 'Talla 6', 150.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Excelente', 5, 8),
(7, 'Marvel Avengers', 'Talla 6', 359.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Muy bueno', 'Excelente', 'Cumple', 'Excelente', 5, 8),
(8, 'Space Exploring', 'Talla G', 149.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Bueno', 5, 8),
(9, 'CN We bare bears', 'Talla 8', 199.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5, 8),
(10, 'Disney Tim Burtons', 'Talla 6', 200.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Bueno', 5, 8),
(11, 'My little pony', 'Talla 8', 219.00, 'Pijamas para ninos y ninas', '1', 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5, 8),
(12, 'Barbie', 'Talla 10', 220.00, 'Pijamas para ninos y ninas', '1', 'Bueno', 'Muy bueno', 'Excelente', 'Cumple', 'Bueno', 5, 8),
(13, 'Hello Kitty', 'Talla 6', 210.00, 'Pijamas para ninos y ninas', '1', 'Bueno', 'Muy bueno', 'Excelente', 'No cumple', 'Muy bueno', 5, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiosalsascatsup`
--

CREATE TABLE `estudiosalsascatsup` (
  `idEstudioSalsasCatsup` int(11) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `contenidoEnergetico` int(11) DEFAULT NULL,
  `sodio` int(11) DEFAULT NULL,
  `azucaresTotales` decimal(10,2) DEFAULT NULL,
  `infAlConsumidor` varchar(100) DEFAULT NULL,
  `contNeto` varchar(100) DEFAULT NULL,
  `carbohidratos` decimal(10,2) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `colorante` tinyint(1) DEFAULT NULL,
  `saborizante` tinyint(1) DEFAULT NULL,
  `excesoCalorias` tinyint(1) DEFAULT NULL,
  `excesoAzucares` tinyint(1) DEFAULT NULL,
  `excesoGrasasSaturadas` tinyint(1) DEFAULT NULL,
  `excesoGrasasTrans` tinyint(1) DEFAULT NULL,
  `excesoSodio` tinyint(1) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiosalsascatsup`
--

INSERT INTO `estudiosalsascatsup` (`idEstudioSalsasCatsup`, `nombreProducto`, `descripcion`, `precio`, `categoria`, `contenidoEnergetico`, `sodio`, `azucaresTotales`, `infAlConsumidor`, `contNeto`, `carbohidratos`, `observaciones`, `colorante`, `saborizante`, `excesoCalorias`, `excesoAzucares`, `excesoGrasasSaturadas`, `excesoGrasasTrans`, `excesoSodio`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'Clemente Jacques', 'Salsa catsup', 24.00, 'Catsup', 93, 991, 19.70, '0', '620', 22.50, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(2, 'First Street', 'Salsa de tomate catsup', 39.00, 'Catsup', 115, 941, 23.20, '0', '567', 28.70, 'No demostro solidos provenientes del tomate', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(3, 'Clemente Jacques', 'Salsa catsup', 38.00, 'Catsup', 96, 991, 18.70, '0', '970', 23.30, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(4, 'Heinz', 'Tomate ketchup', 25.00, 'Catsup', 112, 741, 22.80, '0', '397', 26.90, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(5, 'Heinz', 'Tomate ketchup', 21.00, 'Catsup', 111, 741, 21.40, '0', '397', 26.70, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(6, 'La Selva', 'Salsa de tomate ketchup', 161.00, 'Catsup', 105, 1200, 22.30, '0', '340', 23.60, 'No identifica azucares entre su lista de ingredientes', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(7, 'La Constena', 'Salsa catsup', 15.00, 'Catsup', 101, 1300, 21.60, '0', '220', 23.30, 'No deberia denominarse salsa catsup', 0, 0, 0, 1, 0, 0, 1, 1, 7),
(8, 'Sun Harvest', 'Salsa de tomate catsup', 59.00, 'Catsup', 105, 941, 22.70, '0', '567', 26.30, 'Declara 94.12 kcal y contiene 105 kcal', 0, 0, 0, 1, 0, 0, 1, 1, 7),
(9, 'Walden Farms', 'Salsa catsup', 164.00, 'Catsup', 9, 1133, 2.30, '0', '355', 2.30, 'Declara 2.68 kcal y contiene 9 kcal', 1, 1, 0, 1, 0, 0, 1, 1, 7),
(10, 'Campo Vivo', 'Salsa catsup organica', 44.00, 'Organica', 57, 220, 16.80, '0', '380', 12.30, 'Declara 10g de azucar y contiene 16.8', 0, 0, 0, 1, 0, 0, 1, 1, 7),
(11, 'Heinz', 'Tomate ketchup sin sal anadida', 42.00, 'Sin sal', 124, 22, 22.20, '0', '397', 29.70, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 0, 1, 7),
(12, 'Heinz', 'Salsa de tomate ketchup organica', 72.00, 'Organica', 120, 1100, 25.30, '0', '397', 29.90, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(13, 'Heinz', 'Tomate ketchup sin azucar anadida', 45.00, 'Sin azucar anadida', 37, 1212, 4.00, '0', '369', 7.50, 'No deberia denominarse salsa catsup', 0, 1, 0, 0, 0, 0, 1, 1, 7),
(14, 'Clemente Jacques', 'Salsa habanero con chile habanero molido', 13.00, 'Con chile', 97, 977, 18.90, '0', '220', 24.30, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(15, 'Yo mamas', 'Salsa de tomate catsup', 95.00, 'Sin azucar anadida', 37, 490, 5.50, '0', '397', 9.20, 'Declara 0g de azucares y contiene 5.5g', 0, 0, 0, 0, 0, 0, 1, 1, 7),
(16, 'Clemente Jacques', 'Salsa catsup con japalepeno en trocitos', 14.00, 'Con chile', 83, 868, 17.10, '0', '220', 19.80, 'No deberia denominarse salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(17, 'Red Gold', 'Salsa catsup estilo Siracha', 77.00, 'Catsup', 98, 941, 21.90, '0', '567', 24.40, 'Se denomina salsa tipo catsup, pero es imitacion salsa catsup', 0, 1, 0, 1, 0, 0, 1, 1, 7),
(18, 'Embasa', 'Salsa de tomate para aderezar', 28.00, 'Salsa de tomate para aderezar', 79, 596, 15.20, '1', '1000', 19.40, 'Ninguna', 1, 0, 0, 1, 0, 0, 1, 1, 7),
(19, 'Mi Catsup', 'Salsa de tomate para aderezar', 28.00, 'Salsa de tomate para aderezar', 86, 869, 16.50, '0', '1000', 21.20, 'No es catsup, es salsa de tomate para aderezar', 1, 1, 0, 1, 0, 0, 1, 1, 7),
(20, 'Aurrera', 'Imitacion salsa de tomate', 22.00, 'Imitacion Salsa catsup', 70, 460, 11.80, '0', '1000', 15.30, 'Declara 1kg pero su contenido neto es 976g', 1, 1, 0, 1, 0, 0, 1, 1, 7),
(21, 'Members Mark', 'Imitacion salsa de catsup', 114.00, 'Imitacion Salsa catsup', 104, 1144, 20.50, '1', '3800', 25.30, 'Ninguna', 1, 1, 0, 1, 0, 0, 1, 1, 7),
(22, 'Del Monte Calidad', 'Imitacion salsa de tomate catsup', 18.00, 'Imitacion Salsa catsup', 95, 890, 21.20, '1', '370', 22.90, 'Ninguna', 0, 0, 0, 1, 0, 0, 1, 1, 7),
(23, 'Tasty DBS', 'Salsa de tomate imitacion catsup', 50.00, 'Imitacion Salsa catsup', 47, 323, 9.50, '0', '280', 9.00, 'Contiene fructosa que no declara en sus ingredientes', 1, 1, 0, 0, 0, 0, 1, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudioservilletas`
--

CREATE TABLE `estudioservilletas` (
  `idServilletas` int(11) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `precio_paq` int(11) NOT NULL,
  `precio_10_paq` int(11) NOT NULL,
  `contenido_neto` tinyint(1) NOT NULL,
  `calificacion` varchar(10) NOT NULL,
  `acabados` varchar(10) NOT NULL,
  `Resistencia_servilleta` varchar(10) NOT NULL,
  `Absorción_total` varchar(10) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `idtipoproducto` int(11) NOT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudioservilletas`
--

INSERT INTO `estudioservilletas` (`idServilletas`, `nombreProducto`, `descripcion`, `region`, `precio_paq`, `precio_10_paq`, `contenido_neto`, `calificacion`, `acabados`, `Resistencia_servilleta`, `Absorción_total`, `observaciones`, `idtipoproducto`, `idInfoRelevante`) VALUES
(1, 'BOUNTY', 'Paquete de 100 servilletas hoja sencilla', 'EUA', 117, 12, 1, 'MB', 'MB', 'B', 'E', 'Presenta agujeros (defecto mayor)\nAcumulación de celulosa (defecto menor)', 3, 3),
(2, 'RENOVA', 'Paquete de 40 servilletas hoja doble ', 'Portugal', 49, 12, 1, 'E', 'MB', 'E', 'E', 'Sin defectos', 3, 3),
(3, 'GOLDEN HILLS', 'Paquete de 200 servilletas hoja doble', 'México', 86, 4, 1, 'MB', 'MB', 'MB', 'MB', 'Dobleces no paralelos (defecto mayor)', 3, 3),
(4, 'ELITE', 'Paquete de 200 servilletas hoja doble', 'México ', 93, 5, 1, 'MB', 'B', 'MB', 'MB', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(5, 'KLEENEX', 'Paquete de 200 servilletas hoja doble', 'México', 96, 5, 1, 'MB', 'MB', 'B', 'MB', 'Dobleces no paralelos (defecto mayor)\nCortes con rebabas o sobrantes (defecto menor)', 3, 3),
(6, 'QUALITY DAY', 'Paquete de 100 servilletas hoja doble', 'México', 84, 8, 1, 'MB', 'B', 'MB', 'MB', 'Con manchas ajenas al papel (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(7, 'ELITE', 'Paquete de 225 servilletas hoja sencilla', 'México', 35, 2, 1, 'MB', 'MB', 'MB', 'MB', 'Dobleces no paralelos (defecto mayor)', 3, 3),
(8, 'GREAT VALUE', 'Paquete de 100 servilletas hoja doble', 'México', 60, 6, 1, 'MB', 'S', 'MB', 'B', 'Con manchas ajenas al papel (defecto mayor)\nPresenta agujeros (defecto mayor)\nDobleces no paralelos ', 3, 3),
(9, 'SUAVEL', 'Paquete de 180 servilletas hoja sencilla', 'México', 24, 1, 1, 'B', 'B', 'B', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(10, 'CHEDRAUI', 'Paquete de 360 servilletas hoja sencilla', 'México', 25, 1, 1, 'B', 'MB', 'S', 'E', 'Presenta agujeros (defecto mayor)', 3, 3),
(11, 'SELECTO', 'Paquete de 400 servilletas hoja sencilla', 'México', 46, 1, 1, 'B', 'MB', 'S', 'E', 'Presenta agujeros (defecto mayor)\nAcumulación de celulosa (defecto menor)', 3, 3),
(12, 'FANCY', 'Paquete de 360 servilletas hoja sencilla', 'México', 34, 1, 1, 'B', 'B', 'S', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(13, 'PÉTALO', 'Paquete de 420 servilletas hoja sencilla', 'México', 52, 1, 1, 'B', 'MB', 'MB', 'B', 'Dobleces no paralelos (defecto mayor)', 3, 3),
(14, 'ADORABLE', 'Paquete de 450 servilletas hoja sencilla', 'México', 42, 1, 1, 'B', 'B', 'B', 'B', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)\nAcumulación de celulosa (defecto menor)', 3, 3),
(15, 'GREAT VALUE', 'Paquete de 400 servilletas hoja sencilla', 'México', 51, 1, 1, 'B', 'S', 'MB', 'E', 'Con manchas ajenas al papel (defecto mayor)\nPresenta agujeros (defecto mayor),Dobleces no paralelos ', 3, 3),
(16, 'PRECISSIMO', 'Paquete de 350 servilletas hoja sencilla', 'México', 30, 1, 1, 'B', 'B', 'MB', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(17, 'GOLDEN HILLS', 'Paquete de 220 servilletas hoja sencilla', 'México', 30, 1, 1, 'B', 'B', 'B', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(18, 'QUALITY DAY', 'Paquete de 400 servilletas hoja sencilla', 'México', 51, 1, 1, 'B', 'MB', 'S', 'E', 'Dobleces no paralelos (defecto mayor)', 3, 3),
(19, 'CLOUDY', 'Paquete de 200 servilletas hoja sencilla', 'México', 49, 2, 1, 'B', 'MB', 'S', 'B', 'Dobleces no paralelos (defecto mayor)', 3, 3),
(20, 'REGIO', 'Paquete de 250 servilletas hoja sencilla', 'México', 50, 2, 1, 'B', 'B', 'B', 'B', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(21, 'BIO', 'Paquete de 250 servilletas hoja sencilla', 'México', 34, 1, 0, 'B', 'B', 'MB', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(22, 'HORTENSIA', 'Paquete de 300 servilletas hoja sencilla', 'México', 30, 1, 0, 'B', 'MB', 'MB', 'E', 'Dobleces no paralelos (defecto mayor)', 3, 3),
(23, 'KE PRECIO', 'Paquete de 200 servilletas hoja sencilla', 'No presenta', 15, 1, 1, 'B', 'B', 'S', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(24, 'SUBLIME', 'Paquete de 200 servilletas hoja sencilla', 'México', 20, 1, 0, 'B', 'B', 'B', 'MB', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(25, 'CHEDRAUI', 'Paquete de 360 servilletas hoja sencilla', 'México', 22, 1, 1, 'B', 'S', 'S', 'MB', NULL, 3, 3),
(26, 'AURRERA', 'Paquete de 360 servilletas hoja sencilla', 'México', 31, 1, 1, 'B', 'B', 'MB', 'B', NULL, 3, 3),
(27, 'REGIO', 'Paquete de 250 servilletas hoja sencilla', 'México', 37, 1, 1, 'S', 'B', 'B', 'B', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3),
(28, 'CLOUDY', 'Paquete de 400 servilletas hoja sencilla', 'México', 21, 1, 0, 'S', 'B', 'S', 'S', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiotermospersonales`
--

CREATE TABLE `estudiotermospersonales` (
  `idtermospersonales` int(11) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `informacion` tinyint(1) DEFAULT NULL,
  `calificacion` varchar(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `Diseño` text DEFAULT NULL,
  `Dimensiones` varchar(100) DEFAULT NULL,
  `Ensambledelatapa` varchar(10) DEFAULT NULL,
  `Verificada` varchar(100) DEFAULT NULL,
  `Peso` float DEFAULT NULL,
  `Hermeticidad` varchar(100) DEFAULT NULL,
  `Aguafria` varchar(10) DEFAULT NULL,
  `Aguacaliente` varchar(10) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL,
  `idInfoRelevante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiotermospersonales`
--

INSERT INTO `estudiotermospersonales` (`idtermospersonales`, `nombreProducto`, `descripcion`, `capacidad`, `precio`, `informacion`, `calificacion`, `region`, `Diseño`, `Dimensiones`, `Ensambledelatapa`, `Verificada`, `Peso`, `Hermeticidad`, `Aguafria`, `Aguacaliente`, `observaciones`, `idTipoProducto`, `idInfoRelevante`) VALUES
(1, 'TEFAL', 'BLUDROP 0.7 L SLVE BLACK TEF1', 700, 799, 1, 'E', 'China', 'Acero inoxidable con tapa de rosca para beber,con una funda de silicona en la base.', '26.4 x 8 cm', 'E', 'Es veraz y ofrece más 706 m', 420.7, 'E\nNo presenta fugas', 'E', 'E', NULL, 3, 1),
(2, 'STANLEY + STARBUCKS', '51406', 591, 720, 1, 'E', 'China', 'Acero inoxidable con aislamiento al vacío, con tapa de rosca y tapa exterior que se puede usar como taza con capacidad de 160 m', '29.7 x 7.7 cm', 'E', 'Es veraz y ofrece más 628 ml', 560.4, 'E\nNo presenta fugas', 'E', 'E', 'Ofrece garantía de la empresa STANLEY, sin embargo, no cumple con la Ley Federal de Protección al Consumido', 3, 1),
(3, 'EKCO', 'TERMO BURBUJA DE CRISTAL AZUL 17682', 600, 259, 1, 'E', 'China', 'Plástico con ampolla de vidrio, con tapa de rosca exterior y tapa exterior que se puede usar como taza con capacidad de 100 ml.', '25.9 x 9.9 cm', 'E', 'Es veraz\r\n600 ml', 362.4, 'E\nNo presenta fugas', 'E', 'MB', NULL, 3, 1),
(4, 'MR. COFFEE', '131005.01', NULL, 309, 1, 'MB', 'China', 'Acero inoxidable de doble pared con tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 100 ml y funda completa sintética con asa', '28.1 x 7.7 cm', 'E', '720 m', 479.1, 'E\nNo presenta fugas', 'E', 'E', NULL, 3, 1),
(5, 'BUILT', 'TERMO ACERO INOXIDABLE 74173', 591, 511, 1, 'MB', 'China', 'Acero inoxidable con tapa de rosca y asa de transporte', '22.9 x 7.3 cm', 'E', 'Es veraz y ofrece más\n624 ml', 346.3, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(6, 'EKCO', 'GARRAFA DE ACERO INOXIDABLE 96823', 500, 189, 1, 'MB', 'China', 'Acero inoxidable con tapa de rosca', '27 x 7.16 cm', 'E', 'Es veraz y ofrece más\n515 ml', 301, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(7, 'EKCO', 'TERMO DE DOBLE PARED 57848', 500, 449, 1, 'MB', 'China', 'Acero inoxidable de doble pared con tapa de rosca de polipropileno, silicón con boquilla para beber y seguro de abrir y cerrar.', '23.2 x 7.6 cm', 'E', 'Es veraz\n500 ml', 313.2, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(8, 'EKCO', 'TERMO ACERO INOXIDABLE DE DOBLE PARED 93617', 528, 325, 1, 'MB', 'China', 'Acero inoxidable de doble pared con tapa de rosca Flip Top y con boquilla para beber.', '21 x 7.2 cm', 'E', 'Es veraz y ofrece más\n530 ml', 283.4, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(9, 'MAINSTAYS', 'KB05AF', 500, 199, 1, 'MB', 'China', 'Acero inoxidable, tapa interior de polipropileno tipo rosca. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.4 x 6.9 cm', 'E', 'Es veraz\n500 ml', 309.3, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(10, 'MAINSTAYS', 'KB05A-SC', 500, 161, 1, 'MB', 'China', 'Acero inoxidable, tapa interior de polipropileno tipo rosca. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.5 x 6.9 cm ', 'E', 'Es veraz\n500 ml', 303.2, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(11, 'MR. COFFEE', '91879.03', 458, 328, 1, 'MB', 'China', 'Acero inoxidable con aislamiento de doble pared. Tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.2 x 7 cm', 'E', 'y ofrece más\n475 m', 328.5, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(12, 'VIVA HYDRATE', 'VHTH-9580', 500, 299, 1, 'MB', 'China', 'Acero inoxidable, tapa de rosca de polipropileno y silicón con asa para transportar.', '24.8 x 7.2 cm', 'E', 'Es veraz y ofrece más\n541 ml', 326.9, 'E\nNo presenta fugas', 'MB', 'B', NULL, 3, 1),
(13, 'STEINER', 'GL-VF50ZY', 500, 369, 1, 'B', 'China', 'Acero inoxidable de doble pared con tapa interior de polipropileno, de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 75 ml.', '24.8 x 6.9 cm', 'E', 'No es veraz\n486 ml', 284, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3, 1),
(14, 'MINISO', 'AB-289R-T21', 500, 180, 1, 'B', 'China', 'Acero inoxidable de doble pared con tapa de rosca.', '26.6 x 7.1 cm', 'E', 'No es veraz\n490 ml', 292.9, 'E\nNo presenta fugas', 'MB', 'MB', 'Le caben 10 ml menos de los que declara.', 3, 1),
(15, 'VIVA HYDRATE', 'VHTH-9771', 500, 229, 1, 'B', 'China', 'Acero inoxidable, tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.6 x 7.1 cm', 'E', 'No es veraz\n482 ml', 305.3, 'E\nNo presenta fugas', 'MB', 'MB', 'Le caben 18 ml menos de los que declara.', 3, 1),
(16, 'VIVA HYDRATE', 'VHTH-4185', 500, 209, 1, 'B', 'China', 'Acero inoxidable, tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 160 ml.', '23.7 x 6.7 cm', 'E', 'No es veraz\n451 m', 266.3, 'E\nNo presenta fugas', 'MB', 'MB', 'Le caben 49 ml menos de los que declara', 3, 1),
(17, 'CONTIGO', 'MATTERHORN', 591, 410, 1, 'B', 'China', 'Acero inoxidable aislado al vacío, tapa de rosca con boquilla removible y asa para transportar.', '26 x 7.3 cm', 'E', 'Es veraz\r\n y ofrece más\n623 ml', 309, 'E\nNo presenta fugas', 'B', 'B', NULL, 3, 1),
(18, 'TEFAL', 'TRAVEL MUG GR 0.5 L BLUE SLV TEF', 500, 899, 1, 'B', 'China', 'Acero inoxidable con tapa de rosca y botón para beber con una funda de silicona en el cuerpo del termo', '24 x 7.8 cm', 'E', 'Es veraz\n500 ml', 438.4, 'E\nNo presenta fugas', 'B', 'S', NULL, 3, 1),
(19, 'QUOKKA', '304', 630, 299, 1, 'E', 'China', 'Acero inoxidable de doble pared aislada al vacío con tapa de rosca.', '24.9 x 7.3 cm', 'E', 'No es veraz\n614 ml', 320.2, 'E\nNo presenta fugas', 'B', 'B', 'Le caben 16 ml menos de los que declara.', 3, 1),
(20, 'FUN KIDS', 'JY-1500D', 500, 263, 1, 'D', 'China', 'Doble pared con material exterior de plástico e interior de acero inoxidable. Tapa interior de polipropileno de rosca y tapa exterior que se puede usar como taza con capacidad de 100 ml', '23.5 x 7 cm', 'E', 'No es veraz\n420 m', 296.5, 'E\nNo presenta fugas', 'D', 'D', 'Le caben 80 ml menos de los que declara', 3, 1),
(21, 'SK SIMPLE KITCHEN', 'XD-6810A', 500, 149, 1, 'D', 'China', 'Acero inoxidable, tapa interior de polipropileno de rosca. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.1 x 7.1 cm', 'E', 'No es veraz\n482 ml', 301.3, 'E\nNo presenta fugas', 'D', 'D', 'Le caben 18 ml menos de los que declara.', 3, 1),
(22, 'NUVÓ', 'H165-QB', NULL, 379, 1, 'D', 'China', 'Acero inoxidable de doble pared, con tapa de polipropileno de rosca con boquilla para beber, de botón abrir/cerrar y correa para transporte', '28.3 x 7.5 cm', 'E', '628 ml', 372.9, 'E\nNo presenta fugas', 'D', 'D', NULL, 3, 1),
(23, 'RUNNING', 'TERMOLATA THERMOCAN', 500, 479, 0, 'D', 'China', 'Acero inoxidable con tapa de rosca y boquilla para beber', '18.8 x 7.2 cm', 'E', 'No es veraz\n473 ml', 259.5, 'Dpresenta fugas', 'S', 'D', '• Le caben 27 ml menos de los que declara.\nPresenta fugas con agua caliente y fría.\nEl producto de venta a granel no cuenta con la información comercial de acuerdo con la Ley Federal de Protección al Consumidor.', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inforelevante`
--

CREATE TABLE `inforelevante` (
  `idInfoRelevante` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcionEstudio` text DEFAULT NULL,
  `colorTitulo` varchar(20) DEFAULT NULL,
  `colorFondo` varchar(20) DEFAULT NULL,
  `idTipoProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inforelevante`
--

INSERT INTO `inforelevante` (`idInfoRelevante`, `titulo`, `descripcionEstudio`, `colorTitulo`, `colorFondo`, `idTipoProducto`) VALUES
(1, 'Termos personales', 'Ya sea que lleves café o té es importante conocer las características que ofrecen estos recipientes, pues en el mercado existe una amplia variedad de modelos con precios y calidades muy diferentes. Checa los resultados y elige el que no se derrame y, sobre todo, que sea seguro.', '#312F30', '#DDDDEA', 3),
(2, 'Mayonesas y aderezos', 'Al parecer, hacer en casa tu propia mayonesa tradicional ha perdido lugar ante la comodidad de simplemente abrir un envase de mayonesa industrializada. Elaborar tu mayonesa es un hábito sano, fácil y rápido. Sin embargo, si buscas solo abrir un envase para agregar sabor a tus platillos, conoce de qué están realmente hechas las mayonesas y aderezos para que consideres agregarlos o no a lo que comes.', '#C01F22', '#EFEBE2', 1),
(3, 'Servilletas', 'Las servilletas de papel son necesarias todos los días, ya sea durante el desayuno, la comida o la cena. Por ello, el laboratorio de la Profeco analizó la calidad de algunos modelos y así ayudarte a elegir de forma adecuada.', '#4D7DBF', '#F4F7FE', 3),
(4, 'Cafeteras de goteo', 'Las cafeteras de goteo, también conocidas como cafeteras de filtro, continúan siendo muy populares, pues el resultado de su desempeño es un café con:\n• Cuerpo más ligero\n• Mayor cantidad de cafeína\n• Aromas y matices más acentuados (en los modelos mejor calificados en este Estudio de Calidad)', '#7A4036', '#F6F6F6', 3),
(5, 'Atún envasado', 'El atún envasado es una fuente de proteína accesible, por ello es importante conocer las diferentes presentaciones que existen en el mercado, cuánta soya y proteína contienen y cómo le afecta la entrada en vigor de la nueva regulación a la que está sujeto.\nDe nuevo pusimos a prueba a algunos de estos productos para que no te den soya por atún. Entérate de lo que encontramos.', '#C4AC6A', '#DEEBF1', 1),
(6, 'Pan de caja', 'El pan es un alimento común en la dieta de los consumidores mexicanos. Proporciona energía al organismo, ya que contiene carbohidratos. También, aporta proteínas de origen vegetal, así como grasa, sodio y, según el cereal con el que se elabore, puede aportar fibra.\nPusimos a prueba algunas marcas de pan de caja industrializado', '#FF9013', '#F0E9DF', 1),
(7, 'Salsa cátsup', 'La cátsup es un aderezo tan cotidiano que pocas veces nos detenemos a revisar con ojo crítico sus ingredientes y creemos que solo está elaborada con jitomate, pero esto no es tan cierto como parece. Pusimos a prueba estos productos, entérate de lo que encontramos.', '#9F231D', '#F5F5F5', 1),
(8, 'Pijamas para niñas y niños', 'Conoce las características de estas prendas y haz rendir tu presupuesto.\n Pusimos a prueba la calidad, resistencia, durabilidad, entre otras características, que presentan las principales marcas y modelos de pijamas para niñas y niños y así orientarte en tu compra', '#1E304E', '#A9D2FF', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeproductos`
--

CREATE TABLE `tipodeproductos` (
  `idTipoProducto` int(11) NOT NULL,
  `nombreTipoProducto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodeproductos`
--

INSERT INTO `tipodeproductos` (`idTipoProducto`, `nombreTipoProducto`) VALUES
(1, 'Productos Alimenticios'),
(2, 'Electrodomésticos'),
(3, 'Accesorios de Cocina y Hogar'),
(4, 'Productos de Limpieza y Cuidado Personal'),
(5, 'Ropa y Accesorios'),
(6, 'Tecnología y Electrónica'),
(7, 'Útiles Escolares'),
(8, 'Belleza y Cuidado Personal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudioatunes`
--
ALTER TABLE `estudioatunes`
  ADD PRIMARY KEY (`idEstudioAtunes`),
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_EstudioAtunes_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudiocafeterasgoteo`
--
ALTER TABLE `estudiocafeterasgoteo`
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_EstudioCafeterasGoteo_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudiomayonesas`
--
ALTER TABLE `estudiomayonesas`
  ADD PRIMARY KEY (`idEstudioMayonesas`),
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_EstudioMayonesas_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudiopandecaja`
--
ALTER TABLE `estudiopandecaja`
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_estudiopandecaja_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudiopijamas`
--
ALTER TABLE `estudiopijamas`
  ADD PRIMARY KEY (`idEstudioPijamas`),
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_EstudioPijamas_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudiosalsascatsup`
--
ALTER TABLE `estudiosalsascatsup`
  ADD PRIMARY KEY (`idEstudioSalsasCatsup`),
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_EstudioSalsasCatsup_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudioservilletas`
--
ALTER TABLE `estudioservilletas`
  ADD KEY `idtipoproducto` (`idtipoproducto`),
  ADD KEY `fk_EstudioServilletas_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `estudiotermospersonales`
--
ALTER TABLE `estudiotermospersonales`
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `fk_EstudioTermosPersonales_InfoRelevante` (`idInfoRelevante`);

--
-- Indices de la tabla `inforelevante`
--
ALTER TABLE `inforelevante`
  ADD PRIMARY KEY (`idInfoRelevante`),
  ADD KEY `idTipoProducto` (`idTipoProducto`);

--
-- Indices de la tabla `tipodeproductos`
--
ALTER TABLE `tipodeproductos`
  ADD PRIMARY KEY (`idTipoProducto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudioatunes`
--
ALTER TABLE `estudioatunes`
  ADD CONSTRAINT `estudioatunes_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioAtunes_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudiocafeterasgoteo`
--
ALTER TABLE `estudiocafeterasgoteo`
  ADD CONSTRAINT `estudiocafeterasgoteo_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioCafeterasGoteo_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudiomayonesas`
--
ALTER TABLE `estudiomayonesas`
  ADD CONSTRAINT `estudiomayonesas_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioMayonesas_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudiopandecaja`
--
ALTER TABLE `estudiopandecaja`
  ADD CONSTRAINT `estudiopandecaja_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_estudiopandecaja_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudiopijamas`
--
ALTER TABLE `estudiopijamas`
  ADD CONSTRAINT `estudiopijamas_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioPijamas_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudiosalsascatsup`
--
ALTER TABLE `estudiosalsascatsup`
  ADD CONSTRAINT `estudiosalsascatsup_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioSalsasCatsup_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudioservilletas`
--
ALTER TABLE `estudioservilletas`
  ADD CONSTRAINT `estudioservilletas_ibfk_1` FOREIGN KEY (`idtipoproducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioServilletas_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `estudiotermospersonales`
--
ALTER TABLE `estudiotermospersonales`
  ADD CONSTRAINT `estudiotermospersonales_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`),
  ADD CONSTRAINT `fk_EstudioTermosPersonales_InfoRelevante` FOREIGN KEY (`idInfoRelevante`) REFERENCES `inforelevante` (`idInfoRelevante`);

--
-- Filtros para la tabla `inforelevante`
--
ALTER TABLE `inforelevante`
  ADD CONSTRAINT `inforelevante_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipodeproductos` (`idTipoProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
