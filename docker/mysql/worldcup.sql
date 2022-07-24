-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2018 a las 07:10:08
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quiniela-luis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos_log`
--

CREATE TABLE `accesos_log` (
  `id` bigint(20) NOT NULL,
  `user` int(11) NOT NULL,
  `perfil` enum('user','admin') NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente_info` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `accesos_log`
--

INSERT INTO `accesos_log` (`id`, `user`, `perfil`, `fecha`, `cliente_info`) VALUES
(1, 2, '', '2018-05-03 22:19:28', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(2, 2, '', '2018-05-03 23:17:21', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(3, 2, '', '2018-05-03 23:51:12', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(4, 2, '', '2018-05-04 08:56:15', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(5, 2, '', '2018-05-04 09:30:18', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(6, 2, '', '2018-05-04 10:36:02', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(7, 2, '', '2018-05-04 15:22:28', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(8, 2, '', '2018-05-04 15:44:56', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(9, 2, '', '2018-05-05 20:02:04', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(10, 2, '', '2018-05-07 22:06:39', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(11, 2, '', '2018-05-07 22:07:13', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(12, 3, '', '2018-05-07 22:09:22', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(13, 3, '', '2018-05-07 22:09:56', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(14, 4, '', '2018-05-07 22:12:18', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(15, 2, '', '2018-05-07 23:36:50', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(16, 2, '', '2018-05-08 00:03:40', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(17, 2, '', '2018-05-08 00:04:34', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(18, 2, '', '2018-05-08 00:23:48', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(19, 2, '', '2018-05-08 13:28:11', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Mobile Safari/537.36'),
(20, 2, '', '2018-05-08 18:52:41', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(21, 2, '', '2018-05-09 09:35:24', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(22, 2, '', '2018-05-09 09:49:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(23, 2, '', '2018-05-09 14:47:25', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(24, 2, '', '2018-05-09 15:40:12', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(25, 2, '', '2018-05-09 15:42:18', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(26, 2, '', '2018-05-09 18:52:29', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(27, 2, '', '2018-05-09 19:03:56', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(28, 2, 'admin', '2018-05-09 19:46:18', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(29, 2, '', '2018-05-09 20:47:15', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(30, 2, 'admin', '2018-05-09 20:50:29', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(31, 2, 'admin', '2018-05-09 21:34:13', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(32, 2, 'admin', '2018-05-09 21:51:00', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(33, 7, '', '2018-05-09 22:32:41', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(34, 8, '', '2018-05-09 23:05:45', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(35, 9, '', '2018-05-09 23:37:18', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(36, 8, '', '2018-05-09 23:48:45', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(37, 10, '', '2018-05-09 23:51:04', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(38, 8, 'admin', '2018-05-10 00:04:58', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(39, 10, '', '2018-05-10 00:06:01', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(40, 11, '', '2018-05-10 00:31:35', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(41, 8, 'admin', '2018-05-10 02:21:55', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(42, 8, 'admin', '2018-05-10 22:20:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(43, 11, '', '2018-05-11 13:10:07', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(44, 10, '', '2018-05-11 17:38:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(45, 11, '', '2018-05-11 21:56:57', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(46, 11, '', '2018-05-11 22:59:02', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(47, 11, '', '2018-05-11 23:58:59', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(48, 11, '', '2018-05-12 00:26:00', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(49, 11, '', '2018-05-12 02:35:20', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.126 Mobile Safari/537.36'),
(50, 10, '', '2018-05-12 17:23:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36'),
(51, 11, '', '2018-05-14 23:29:09', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(52, 11, '', '2018-05-14 23:29:09', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36'),
(53, 11, '', '2018-05-15 00:24:14', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.158 Mobile Safari/537.36'),
(54, 10, '', '2018-05-15 00:59:36', 'Mozilla/5.0 (Linux; Android 4.4.2; HUAWEI P7-L12 Build/HuaweiP7-L12) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.158 Mobile Safari/537.36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `bandera` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES
(1, 'Rusia', 'rus.png'),
(2, 'Arabia S.', 'sau.png'),
(3, 'Egipto', 'egi.png'),
(4, 'Uruguay', 'uru.png'),
(5, 'Maruecos', 'mar.png'),
(6, 'Iran', 'irn.png'),
(7, 'Portugal', 'por.png'),
(8, 'España', 'esp.png'),
(9, 'Francia', 'fra.png'),
(10, 'Australia', 'aus.png'),
(11, 'Argentina', 'arg.png'),
(12, 'Islandia', 'isl.png'),
(13, 'Perú', 'per.png'),
(14, 'Dinamarca', 'din.png'),
(15, 'Croacia', 'cro.png'),
(16, 'Nigeria', 'nig.png'),
(17, 'Costa Rica', 'crc.png'),
(18, 'Serbia', 'ser.png'),
(19, 'Alemania', 'ger.png'),
(20, 'México', 'mex.png'),
(21, 'Brasil', 'bra.png'),
(22, 'Suiza', 'sui.png'),
(23, 'Suecia', 'sue.png'),
(24, 'Corea del Sur', 'cor.png'),
(25, 'Bélgica', 'bel.png'),
(26, 'Panamá', 'pan.png'),
(27, 'Túnez', 'tun.png'),
(28, 'Inglaterra', 'ing.png'),
(29, 'Colombia', 'col.png'),
(30, 'Japon', 'jap.png'),
(31, 'Polonia', 'pol.png'),
(32, 'Senegal', 'sen.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `id` int(11) NOT NULL,
  `ronda_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `equipo1_id` int(11) NOT NULL,
  `marcador1` tinyint(3) DEFAULT NULL,
  `equipo2_id` int(11) NOT NULL,
  `marcador2` tinyint(3) DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL COMMENT 'id de equipo ganador',
  `estatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 por efectuar, 1 terminado, 2 aplicado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `partido`
--

INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES
(1, 1, '2018-06-14 10:00:00', 1, NULL, 2, NULL, NULL, 0),
(2, 1, '2018-06-15 07:00:00', 3, NULL, 4, NULL, NULL, 0),
(3, 1, '2018-06-15 10:00:00', 5, NULL, 6, NULL, NULL, 0),
(4, 1, '2018-06-15 13:00:00', 7, NULL, 8, NULL, NULL, 0),
(5, 1, '2018-06-16 05:00:00', 9, NULL, 10, NULL, NULL, 0),
(6, 1, '2018-06-16 08:00:00', 11, NULL, 12, NULL, NULL, 0),
(7, 1, '2018-06-16 11:00:00', 13, NULL, 14, NULL, NULL, 0),
(8, 1, '2018-06-16 14:00:00', 15, NULL, 16, NULL, NULL, 0),
(9, 1, '2018-06-17 07:00:00', 17, NULL, 18, NULL, NULL, 0),
(10, 1, '2018-06-17 10:00:00', 19, NULL, 20, NULL, NULL, 0),
(11, 1, '2018-06-17 13:00:00', 21, NULL, 22, NULL, NULL, 0),
(12, 1, '2018-06-18 07:00:00', 23, NULL, 24, NULL, NULL, 0),
(13, 1, '2018-06-18 10:00:00', 25, NULL, 26, NULL, NULL, 0),
(14, 1, '2018-06-18 13:00:00', 27, NULL, 28, NULL, NULL, 0),
(15, 1, '2018-06-19 07:00:00', 29, NULL, 30, NULL, NULL, 0),
(16, 1, '2018-06-19 10:00:00', 31, NULL, 32, NULL, NULL, 0),
(17, 1, '2018-06-19 13:00:00', 1, NULL, 3, NULL, NULL, 0),
(18, 1, '2018-06-20 07:00:00', 7, NULL, 5, NULL, NULL, 0),
(19, 1, '2018-06-20 10:00:00', 4, NULL, 2, NULL, NULL, 0),
(20, 1, '2018-06-20 13:00:00', 6, NULL, 8, NULL, NULL, 0),
(21, 1, '2018-06-21 07:00:00', 14, NULL, 10, NULL, NULL, 0),
(22, 1, '2018-06-21 10:00:00', 9, NULL, 13, NULL, NULL, 0),
(23, 1, '2018-06-21 13:00:00', 11, NULL, 15, NULL, NULL, 0),
(24, 1, '2018-06-22 07:00:00', 21, NULL, 17, NULL, NULL, 0),
(25, 1, '2018-06-22 10:00:00', 16, NULL, 12, NULL, NULL, 0),
(26, 1, '2018-06-22 13:00:00', 18, NULL, 22, NULL, NULL, 0),
(27, 1, '2018-06-23 07:00:00', 25, NULL, 27, NULL, NULL, 0),
(28, 1, '2018-06-23 10:00:00', 24, NULL, 20, NULL, NULL, 0),
(29, 1, '2018-06-23 13:00:00', 19, NULL, 23, NULL, NULL, 0),
(30, 1, '2018-06-24 07:00:00', 28, NULL, 26, NULL, NULL, 0),
(31, 1, '2018-06-24 10:00:00', 30, NULL, 32, NULL, NULL, 0),
(32, 1, '2018-06-24 13:00:00', 31, NULL, 29, NULL, NULL, 0),
(33, 1, '2018-06-25 09:00:00', 2, NULL, 3, NULL, NULL, 0),
(34, 1, '2018-06-25 09:00:00', 4, NULL, 1, NULL, NULL, 0),
(35, 1, '2018-06-25 13:00:00', 6, NULL, 7, NULL, NULL, 0),
(36, 1, '2018-06-25 13:00:00', 8, NULL, 5, NULL, NULL, 0),
(37, 1, '2018-06-26 09:00:00', 10, NULL, 13, NULL, NULL, 0),
(38, 1, '2018-06-26 09:00:00', 14, NULL, 9, NULL, NULL, 0),
(39, 1, '2018-06-26 13:00:00', 16, NULL, 11, NULL, NULL, 0),
(40, 1, '2018-06-26 13:00:00', 12, NULL, 15, NULL, NULL, 0),
(41, 1, '2018-06-27 09:00:00', 24, NULL, 19, NULL, NULL, 0),
(42, 1, '2018-06-27 09:00:00', 20, NULL, 23, NULL, NULL, 0),
(43, 1, '2018-06-27 13:00:00', 22, NULL, 17, NULL, NULL, 0),
(44, 1, '2018-06-27 13:00:00', 18, NULL, 21, NULL, NULL, 0),
(45, 1, '2018-06-28 09:00:00', 32, NULL, 29, NULL, NULL, 0),
(46, 1, '2018-06-28 09:00:00', 30, NULL, 31, NULL, NULL, 0),
(47, 1, '2018-06-28 13:00:00', 28, NULL, 25, NULL, NULL, 0),
(48, 1, '2018-06-28 13:00:00', 26, NULL, 27, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ronda`
--

CREATE TABLE `ronda` (
  `id` int(11) NOT NULL,
  `ronda` varchar(100) DEFAULT NULL,
  `npartidos` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `ronda`
--

INSERT INTO `ronda` (`id`, `ronda`, `npartidos`) VALUES
(1, 'primera ronda', 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `profile` enum('user','admin') NOT NULL DEFAULT 'user',
  `contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `email`, `usuario`, `clave`, `profile`, `contacto`) VALUES
(8, 'Anthony Monsalve', '22anthony.monsalve@gmail.com', '4243039869', '3872e8e8788088895d9bac4eaf85cb5a', 'admin', 'ThonyAn'),
(9, 'Anthony THO', 'monsalve@gmail.com', '4243039869', '3872e8e8788088895d9bac4eaf85cb5a', 'user', 'thony'),
(10, 'Jhoanny', 'Jhoanny@me.com', '456545888', '3872e8e8788088895d9bac4eaf85cb5a', 'user', 'Jhoa'),
(11, 'Gabriel ConcepciÃ³n', 'Gabo@me.com', '424303986555', '3872e8e8788088895d9bac4eaf85cb5a', 'user', 'Gacho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_partido`
--

CREATE TABLE `usuario_partido` (
  `usuario_id` int(11) NOT NULL,
  `partido_id` int(11) NOT NULL,
  `ronda_id` int(11) NOT NULL,
  `marcador1` tinyint(3) DEFAULT NULL,
  `marcador2` tinyint(3) DEFAULT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,1',
  `puntaje` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuario_partido`
--

INSERT INTO `usuario_partido` (`usuario_id`, `partido_id`, `ronda_id`, `marcador1`, `marcador2`, `estatus`, `puntaje`) VALUES
(11, 1, 1, 1, 1, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos_log`
--
ALTER TABLE `accesos_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equi1` (`equipo1_id`),
  ADD KEY `fk_equi2` (`equipo2_id`),
  ADD KEY `fk_ronda` (`ronda_id`);

--
-- Indices de la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ronda` (`ronda`) USING BTREE;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `usuario_partido`
--
ALTER TABLE `usuario_partido`
  ADD PRIMARY KEY (`usuario_id`,`partido_id`) USING BTREE,
  ADD KEY `fk_partido` (`partido_id`) USING BTREE,
  ADD KEY `idx_ronda` (`ronda_id`) USING BTREE,
  ADD KEY `idx_estatus` (`estatus`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos_log`
--
ALTER TABLE `accesos_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ronda`
--
ALTER TABLE `ronda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `fk_equi1` FOREIGN KEY (`equipo1_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `fk_equi2` FOREIGN KEY (`equipo2_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `fk_ronda` FOREIGN KEY (`ronda_id`) REFERENCES `ronda` (`id`);

--
-- Filtros para la tabla `usuario_partido`
--
ALTER TABLE `usuario_partido`
  ADD CONSTRAINT `fk_partido` FOREIGN KEY (`partido_id`) REFERENCES `partido` (`id`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
