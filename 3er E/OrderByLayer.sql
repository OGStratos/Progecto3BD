-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2024 a las 23:51:46
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
-- Base de datos: `orderbylayer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administración_check_crea`
--

CREATE TABLE `administración_check_crea` (
  `ID` int(11) NOT NULL,
  `CI` int(11) NOT NULL,
  `Cod_Lote` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `Molde` varchar(20) NOT NULL,
  `Validado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador_materia`
--

CREATE TABLE `administrador_materia` (
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador_personal`
--

CREATE TABLE `administrador_personal` (
  `ci` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `Cod_Almacen` int(11) NOT NULL,
  `Espacio` int(11) NOT NULL,
  `Ciudad` varchar(25) NOT NULL,
  `Calle` varchar(25) NOT NULL,
  `Num_Puerta` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bolsones`
--

CREATE TABLE `bolsones` (
  `ID` int(11) NOT NULL,
  `Disponible` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bolsones_se_usan_en_maquina`
--

CREATE TABLE `bolsones_se_usan_en_maquina` (
  `ID` int(11) NOT NULL,
  `ID_Bolson` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crea_se_almacena_almacen`
--

CREATE TABLE `crea_se_almacena_almacen` (
  `Cod_Lote` int(11) NOT NULL,
  `Cod_Almacen` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `Molde` varchar(20) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Cliente` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `login`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `login` (
`CI` int(11)
,`Contraseña` varchar(60)
,`Rol` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `loginupdate`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `loginupdate` (
`CI` int(11)
,`Clave` varchar(6)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `Cod_Maquina` int(11) NOT NULL,
  `Estado` varchar(25) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina_crea_producto`
--

CREATE TABLE `maquina_crea_producto` (
  `Cod_Maquina` int(11) NOT NULL,
  `Cod_Lote` int(11) NOT NULL,
  `Cantidad_def` int(11) NOT NULL,
  `Cantidad_ok` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Molde` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
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
-- Estructura de tabla para la tabla `maquinista_realiza_crea`
--

CREATE TABLE `maquinista_realiza_crea` (
  `CI` int(11) NOT NULL,
  `Cod_Maquina` int(11) NOT NULL,
  `Cod_Lote` int(11) NOT NULL,
  `Molde` varchar(20) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_prima`
--

CREATE TABLE `materia_prima` (
  `Tipo` varchar(30) NOT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_se_guarda_bolsones`
--

CREATE TABLE `materia_se_guarda_bolsones` (
  `Tipo_Materia` varchar(30) NOT NULL,
  `Cantidad_kg` decimal(10,2) NOT NULL,
  `Fecha` datetime NOT NULL,
  `ID_Bolson` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Molde` varchar(20) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Tipo` varchar(25) NOT NULL,
  `ID` int(11) NOT NULL,
  `Estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor_provee_materia`
--

CREATE TABLE `proveedor_provee_materia` (
  `Tipo_Proveedor` varchar(25) NOT NULL,
  `CI` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Tipo_Materia` varchar(30) NOT NULL,
  `Cantidad_Provee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `ci` int(11) NOT NULL,
  `Correo` varchar(20) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Horario` varchar(25) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Contraseña` varchar(60) NOT NULL,
  `Ciudad` varchar(25) NOT NULL,
  `Calle` varchar(25) NOT NULL,
  `Num_Puerta` varchar(25) NOT NULL,
  `Estado_Laboral` varchar(25) NOT NULL,
  `Rol` varchar(30) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Clave` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistaadministradormateria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistaadministradormateria` (
`ci_trabajador` int(11)
,`ci_administrador_materia` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistaadministradorpersonal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistaadministradorpersonal` (
`ci_trabajador` int(11)
,`ci_administrador_personal` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistamaquinista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistamaquinista` (
`ci_trabajador` int(11)
,`ci_maquinista` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `login`
--
DROP TABLE IF EXISTS `login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `login`  AS SELECT `trabajadores`.`ci` AS `CI`, `trabajadores`.`Contraseña` AS `Contraseña`, `trabajadores`.`Rol` AS `Rol` FROM `trabajadores` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `loginupdate`
--
DROP TABLE IF EXISTS `loginupdate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `loginupdate`  AS SELECT `trabajadores`.`ci` AS `CI`, `trabajadores`.`Clave` AS `Clave` FROM `trabajadores` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistaadministradormateria`
--
DROP TABLE IF EXISTS `vistaadministradormateria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistaadministradormateria`  AS SELECT `t`.`ci` AS `ci_trabajador`, `a`.`ci` AS `ci_administrador_materia` FROM (`trabajadores` `t` join `administrador_materia` `a`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistaadministradorpersonal`
--
DROP TABLE IF EXISTS `vistaadministradorpersonal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistaadministradorpersonal`  AS SELECT `t`.`ci` AS `ci_trabajador`, `a`.`ci` AS `ci_administrador_personal` FROM (`trabajadores` `t` join `administrador_personal` `a`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistamaquinista`
--
DROP TABLE IF EXISTS `vistamaquinista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistamaquinista`  AS SELECT `t`.`ci` AS `ci_trabajador`, `m`.`ci` AS `ci_maquinista` FROM (`trabajadores` `t` join `maquinista` `m`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administración_check_crea`
--
ALTER TABLE `administración_check_crea`
  ADD PRIMARY KEY (`ID`,`Cod_Lote`),
  ADD KEY `CI` (`CI`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`,`Cod_Lote`,`Molde`);

--
-- Indices de la tabla `administrador_materia`
--
ALTER TABLE `administrador_materia`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `administrador_personal`
--
ALTER TABLE `administrador_personal`
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
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Bolson` (`ID_Bolson`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`);

--
-- Indices de la tabla `crea_se_almacena_almacen`
--
ALTER TABLE `crea_se_almacena_almacen`
  ADD PRIMARY KEY (`Cod_Lote`,`Fecha`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`,`Cod_Lote`,`Molde`),
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
  ADD PRIMARY KEY (`Cod_Maquina`,`Cod_Lote`,`Molde`),
  ADD UNIQUE KEY `Cod_Lote` (`Cod_Lote`),
  ADD KEY `Molde` (`Molde`);

--
-- Indices de la tabla `maquinista`
--
ALTER TABLE `maquinista`
  ADD PRIMARY KEY (`ci`);

--
-- Indices de la tabla `maquinista_realiza_crea`
--
ALTER TABLE `maquinista_realiza_crea`
  ADD PRIMARY KEY (`Fecha`),
  ADD KEY `CI` (`CI`),
  ADD KEY `Cod_Maquina` (`Cod_Maquina`,`Cod_Lote`,`Molde`);

--
-- Indices de la tabla `materia_prima`
--
ALTER TABLE `materia_prima`
  ADD PRIMARY KEY (`Tipo`);

--
-- Indices de la tabla `materia_se_guarda_bolsones`
--
ALTER TABLE `materia_se_guarda_bolsones`
  ADD PRIMARY KEY (`Tipo_Materia`,`ID_Bolson`,`Fecha`),
  ADD KEY `ID_Bolson` (`ID_Bolson`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Molde`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Tipo`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indices de la tabla `proveedor_provee_materia`
--
ALTER TABLE `proveedor_provee_materia`
  ADD PRIMARY KEY (`Tipo_Proveedor`,`Tipo_Materia`,`Fecha`),
  ADD KEY `Tipo_Materia` (`Tipo_Materia`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`ci`),
  ADD UNIQUE KEY `Codigo` (`Codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administración_check_crea`
--
ALTER TABLE `administración_check_crea`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `Cod_Almacen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bolsones`
--
ALTER TABLE `bolsones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `bolsones_se_usan_en_maquina`
--
ALTER TABLE `bolsones_se_usan_en_maquina`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `Cod_Maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maquina_crea_producto`
--
ALTER TABLE `maquina_crea_producto`
  MODIFY `Cod_Lote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administración_check_crea`
--
ALTER TABLE `administración_check_crea`
  ADD CONSTRAINT `administración_check_crea_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `administrador_personal` (`ci`),
  ADD CONSTRAINT `administración_check_crea_ibfk_2` FOREIGN KEY (`Cod_Maquina`,`Cod_Lote`,`Molde`) REFERENCES `maquina_crea_producto` (`Cod_Maquina`, `Cod_Lote`, `Molde`);

--
-- Filtros para la tabla `administrador_materia`
--
ALTER TABLE `administrador_materia`
  ADD CONSTRAINT `administrador_materia_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `trabajadores` (`ci`);

--
-- Filtros para la tabla `administrador_personal`
--
ALTER TABLE `administrador_personal`
  ADD CONSTRAINT `administrador_personal_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `trabajadores` (`ci`);

--
-- Filtros para la tabla `bolsones_se_usan_en_maquina`
--
ALTER TABLE `bolsones_se_usan_en_maquina`
  ADD CONSTRAINT `bolsones_se_usan_en_maquina_ibfk_1` FOREIGN KEY (`ID_Bolson`) REFERENCES `bolsones` (`ID`),
  ADD CONSTRAINT `bolsones_se_usan_en_maquina_ibfk_2` FOREIGN KEY (`Cod_Maquina`) REFERENCES `maquina` (`Cod_Maquina`);

--
-- Filtros para la tabla `crea_se_almacena_almacen`
--
ALTER TABLE `crea_se_almacena_almacen`
  ADD CONSTRAINT `crea_se_almacena_almacen_ibfk_1` FOREIGN KEY (`Cod_Maquina`,`Cod_Lote`,`Molde`) REFERENCES `maquina_crea_producto` (`Cod_Maquina`, `Cod_Lote`, `Molde`),
  ADD CONSTRAINT `crea_se_almacena_almacen_ibfk_2` FOREIGN KEY (`Cod_Almacen`) REFERENCES `almacen` (`Cod_Almacen`);

--
-- Filtros para la tabla `maquina_crea_producto`
--
ALTER TABLE `maquina_crea_producto`
  ADD CONSTRAINT `maquina_crea_producto_ibfk_1` FOREIGN KEY (`Cod_Maquina`) REFERENCES `maquina` (`Cod_Maquina`),
  ADD CONSTRAINT `maquina_crea_producto_ibfk_2` FOREIGN KEY (`Molde`) REFERENCES `producto` (`Molde`);

--
-- Filtros para la tabla `maquinista`
--
ALTER TABLE `maquinista`
  ADD CONSTRAINT `maquinista_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `trabajadores` (`ci`);

--
-- Filtros para la tabla `maquinista_realiza_crea`
--
ALTER TABLE `maquinista_realiza_crea`
  ADD CONSTRAINT `maquinista_realiza_crea_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `maquinista` (`ci`),
  ADD CONSTRAINT `maquinista_realiza_crea_ibfk_2` FOREIGN KEY (`Cod_Maquina`,`Cod_Lote`,`Molde`) REFERENCES `maquina_crea_producto` (`Cod_Maquina`, `Cod_Lote`, `Molde`);

--
-- Filtros para la tabla `materia_se_guarda_bolsones`
--
ALTER TABLE `materia_se_guarda_bolsones`
  ADD CONSTRAINT `materia_se_guarda_bolsones_ibfk_1` FOREIGN KEY (`Tipo_Materia`) REFERENCES `materia_prima` (`Tipo`),
  ADD CONSTRAINT `materia_se_guarda_bolsones_ibfk_2` FOREIGN KEY (`ID_Bolson`) REFERENCES `bolsones` (`ID`);

--
-- Filtros para la tabla `proveedor_provee_materia`
--
ALTER TABLE `proveedor_provee_materia`
  ADD CONSTRAINT `proveedor_provee_materia_ibfk_1` FOREIGN KEY (`Tipo_Proveedor`) REFERENCES `proveedor` (`Tipo`),
  ADD CONSTRAINT `proveedor_provee_materia_ibfk_2` FOREIGN KEY (`Tipo_Materia`) REFERENCES `materia_prima` (`Tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
