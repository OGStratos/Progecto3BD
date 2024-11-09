-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2024 a las 01:55:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `orb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administración_check_crea`
--

CREATE TABLE `administración_check_crea` (
  `CI` int(11) NOT NULL,
  `Cod_Lote` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `ID` varchar(20) NOT NULL,
  `Validado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `Cod_Almacen` int(11) NOT NULL,
  `Espacio` varchar(25) DEFAULT NULL,
  `Direccion` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bolsones`
--

CREATE TABLE `bolsones` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bolsones_se_usan_en_maquina`
--

CREATE TABLE `bolsones_se_usan_en_maquina` (
  `ID_B` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crea_se_almacena_almacen`
--

CREATE TABLE `crea_se_almacena_almacen` (
  `Cod_Lote` int(11) NOT NULL,
  `Cod_Almacen` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `ID` varchar(20) NOT NULL,
  `Fecha` date NOT NULL,
  `Cliente` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `Cod_Maquina` int(11) NOT NULL,
  `Estado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina_crea_producto`
--

CREATE TABLE `maquina_crea_producto` (
  `Cod_Maquina` int(11) NOT NULL,
  `Cod_Lote` int(11) NOT NULL,
  `Cantidad_def` int(11) DEFAULT NULL,
  `Cantidad_ok` int(11) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinista`
--

CREATE TABLE `maquinista` (
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquinista_utiliza_maquina`
--

CREATE TABLE `maquinista_utiliza_maquina` (
  `CI` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `ID` int(11) NOT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_se_guarda_bolsones`
--

CREATE TABLE `materia_se_guarda_bolsones` (
  `ID_M` int(11) NOT NULL,
  `Cantidad_kg` decimal(10,2) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `ID_B` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID` varchar(20) NOT NULL,
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(25) DEFAULT NULL,
  `Cantidad_Kg` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_provee_materia`
--

CREATE TABLE `proveedor_provee_materia` (
  `ID_P` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `ID_M` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_materia`
--

CREATE TABLE `tipo_materia` (
  `ID_M` int(11) NOT NULL,
  `Tipo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `ci` int(11) NOT NULL,
  `correo` varchar(20) DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `horario` varchar(25) DEFAULT NULL,
  `codigo` varchar(25) DEFAULT NULL,
  `Contraseña` varchar(25) DEFAULT NULL,
  `Ciudad` varchar(25) DEFAULT NULL,
  `calle` varchar(25) DEFAULT NULL,
  `Num_Puerta` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administración_check_crea`
--
ALTER TABLE `administración_check_crea`
  ADD PRIMARY KEY (`CI`,`Cod_Lote`,`Cod_Maquina`,`ID`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`,`Cod_Lote`,`ID`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`Cod_Almacen`);

--
-- Indices de la tabla `bolsones`
--
ALTER TABLE `bolsones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `bolsones_se_usan_en_maquina`
--
ALTER TABLE `bolsones_se_usan_en_maquina`
  ADD PRIMARY KEY (`ID_B`,`Cod_Maquina`,`Fecha`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`);

--
-- Indices de la tabla `crea_se_almacena_almacen`
--
ALTER TABLE `crea_se_almacena_almacen`
  ADD PRIMARY KEY (`Cod_Lote`,`Cod_Almacen`,`Cod_Maquina`,`Fecha`,`ID`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`,`Cod_Lote`,`ID`),
  ADD KEY `Cod_Almacen` (`Cod_Almacen`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`Cod_Maquina`);

--
-- Indices de la tabla `maquina_crea_producto`
--
ALTER TABLE `maquina_crea_producto`
  ADD PRIMARY KEY (`Cod_Maquina`,`Cod_Lote`,`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indices de la tabla `maquinista`
--
ALTER TABLE `maquinista`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `maquinista_utiliza_maquina`
--
ALTER TABLE `maquinista_utiliza_maquina`
  ADD PRIMARY KEY (`CI`,`Cod_Maquina`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `materia_se_guarda_bolsones`
--
ALTER TABLE `materia_se_guarda_bolsones`
  ADD PRIMARY KEY (`ID_M`,`ID_B`,`Fecha`),
  ADD KEY `ID_B` (`ID_B`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `proveedor_provee_materia`
--
ALTER TABLE `proveedor_provee_materia`
  ADD PRIMARY KEY (`ID_P`,`ID_M`,`Fecha`),
  ADD KEY `ID_M` (`ID_M`);

--
-- Indices de la tabla `tipo_materia`
--
ALTER TABLE `tipo_materia`
  ADD PRIMARY KEY (`ID_M`,`Tipo`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`ci`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administración_check_crea`
--
ALTER TABLE `administración_check_crea`
  ADD CONSTRAINT `administración_check_crea_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `maquinista` (`ci`),
  ADD CONSTRAINT `administración_check_crea_ibfk_2` FOREIGN KEY (`Cod_Maquina`,`Cod_Lote`,`ID`) REFERENCES `maquina_crea_producto` (`Cod_Maquina`, `Cod_Lote`, `ID`);

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `trabajadores` (`ci`);

--
-- Filtros para la tabla `bolsones_se_usan_en_maquina`
--
ALTER TABLE `bolsones_se_usan_en_maquina`
  ADD CONSTRAINT `bolsones_se_usan_en_maquina_ibfk_1` FOREIGN KEY (`ID_B`) REFERENCES `bolsones` (`ID`),
  ADD CONSTRAINT `bolsones_se_usan_en_maquina_ibfk_2` FOREIGN KEY (`Cod_Maquina`) REFERENCES `maquina` (`Cod_Maquina`);

--
-- Filtros para la tabla `crea_se_almacena_almacen`
--
ALTER TABLE `crea_se_almacena_almacen`
  ADD CONSTRAINT `crea_se_almacena_almacen_ibfk_1` FOREIGN KEY (`Cod_Maquina`,`Cod_Lote`,`ID`) REFERENCES `maquina_crea_producto` (`Cod_Maquina`, `Cod_Lote`, `ID`),
  ADD CONSTRAINT `crea_se_almacena_almacen_ibfk_2` FOREIGN KEY (`Cod_Almacen`) REFERENCES `almacen` (`Cod_Almacen`);

--
-- Filtros para la tabla `maquina_crea_producto`
--
ALTER TABLE `maquina_crea_producto`
  ADD CONSTRAINT `maquina_crea_producto_ibfk_1` FOREIGN KEY (`Cod_Maquina`) REFERENCES `maquina` (`Cod_Maquina`),
  ADD CONSTRAINT `maquina_crea_producto_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `producto` (`ID`);

--
-- Filtros para la tabla `maquinista`
--
ALTER TABLE `maquinista`
  ADD CONSTRAINT `maquinista_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `trabajadores` (`ci`);

--
-- Filtros para la tabla `maquinista_utiliza_maquina`
--
ALTER TABLE `maquinista_utiliza_maquina`
  ADD CONSTRAINT `maquinista_utiliza_maquina_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `maquinista` (`ci`),
  ADD CONSTRAINT `maquinista_utiliza_maquina_ibfk_2` FOREIGN KEY (`Cod_Maquina`) REFERENCES `maquina` (`Cod_Maquina`);

--
-- Filtros para la tabla `materia_se_guarda_bolsones`
--
ALTER TABLE `materia_se_guarda_bolsones`
  ADD CONSTRAINT `materia_se_guarda_bolsones_ibfk_1` FOREIGN KEY (`ID_M`) REFERENCES `materia_prima` (`ID`),
  ADD CONSTRAINT `materia_se_guarda_bolsones_ibfk_2` FOREIGN KEY (`ID_B`) REFERENCES `bolsones` (`ID`);

--
-- Filtros para la tabla `proveedor_provee_materia`
--
ALTER TABLE `proveedor_provee_materia`
  ADD CONSTRAINT `proveedor_provee_materia_ibfk_1` FOREIGN KEY (`ID_P`) REFERENCES `proveedor` (`ID`),
  ADD CONSTRAINT `proveedor_provee_materia_ibfk_2` FOREIGN KEY (`ID_M`) REFERENCES `materia_prima` (`ID`);

--
-- Filtros para la tabla `tipo_materia`
--
ALTER TABLE `tipo_materia`
  ADD CONSTRAINT `tipo_materia_ibfk_1` FOREIGN KEY (`ID_M`) REFERENCES `materia_prima` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
