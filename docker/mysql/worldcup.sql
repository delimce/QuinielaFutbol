/*
 Navicat Premium Data Transfer

 Source Server         : worldcup_mysql
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : 127.0.0.1:3306
 Source Schema         : worldcup_db

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 09/10/2022 18:06:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accesos_log
-- ----------------------------
DROP TABLE IF EXISTS `accesos_log`;
CREATE TABLE `accesos_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `perfil` enum('user','admin') NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente_info` mediumtext,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_user_access` (`user`),
  CONSTRAINT `fk_user_access` FOREIGN KEY (`user`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of accesos_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for equipo
-- ----------------------------
DROP TABLE IF EXISTS `equipo`;
CREATE TABLE `equipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `bandera` varchar(70) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of equipo
-- ----------------------------
BEGIN;
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (1, 'Qatar', 'qat.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (2, 'Ecuador', 'ecu.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (3, 'Senegal', 'sen.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (4, 'Paises Bajos', 'net.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (5, 'Inglaterra', 'ing.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (6, 'Iran', 'irn.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (7, 'Estados Unidos', 'usa.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (8, 'Gales', 'gal.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (9, 'Argentina', 'arg.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (10, 'Arabia Saudí', 'sau.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (11, 'México', 'mex.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (12, 'Polonia', 'pol.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (13, 'Francia', 'fra.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (14, 'Australia', 'aus.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (15, 'Dinamarca', 'din.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (16, 'Túnez', 'tun.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (17, 'España', 'esp.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (18, 'Costa Rica', 'crc.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (19, 'Alemania', 'ger.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (20, 'Japón', 'jap.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (21, 'Bélgica', 'bel.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (22, 'Canadá', 'can.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (23, 'Marruecos', 'mar.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (24, 'Croacia', 'cro.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (25, 'Brazil', 'bra.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (26, 'Serbia', 'ser.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (27, 'Suiza', 'sui.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (28, 'Camerún', 'cam.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (29, 'Portugal', 'por.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (30, 'Ghana', 'gha.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (31, 'Uruguay', 'uru.png');
INSERT INTO `equipo` (`id`, `nombre`, `bandera`) VALUES (32, 'Corea del Sur', 'cor.png');
COMMIT;

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `responsable` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of grupo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for grupo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `grupo_usuario`;
CREATE TABLE `grupo_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `grupo_id` int NOT NULL,
  `fecha` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`) USING BTREE /*!80000 INVISIBLE */,
  KEY `grupo_id` (`grupo_id`),
  CONSTRAINT `grupo_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `grupo_usuario_ibfk_2` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of grupo_usuario
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for partido
-- ----------------------------
DROP TABLE IF EXISTS `partido`;
CREATE TABLE `partido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ronda_id` int DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `equipo1_id` int NOT NULL,
  `marcador1` tinyint DEFAULT NULL,
  `equipo2_id` int NOT NULL,
  `marcador2` tinyint DEFAULT NULL,
  `ganador` int DEFAULT NULL COMMENT 'id de equipo ganador',
  `estatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 por efectuar, 1 terminado, 2 aplicado',
  PRIMARY KEY (`id`),
  KEY `fk_equi1` (`equipo1_id`),
  KEY `fk_equi2` (`equipo2_id`),
  KEY `fk_ronda` (`ronda_id`),
  CONSTRAINT `fk_equi1` FOREIGN KEY (`equipo1_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `fk_equi2` FOREIGN KEY (`equipo2_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `fk_ronda` FOREIGN KEY (`ronda_id`) REFERENCES `ronda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of partido
-- ----------------------------
BEGIN;
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (1, 1, '2022-11-21 04:00:00', 3, NULL, 4, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (2, 1, '2022-11-21 07:00:00', 5, NULL, 6, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (3, 1, '2022-11-20 17:00:00', 1, NULL, 2, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (4, 1, '2022-11-21 13:00:00', 7, NULL, 8, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (5, 1, '2022-11-22 04:00:00', 9, NULL, 10, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (6, 1, '2022-11-22 07:00:00', 15, NULL, 16, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (7, 1, '2022-11-22 10:00:00', 11, NULL, 12, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (8, 1, '2022-11-22 13:00:00', 13, NULL, 14, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (9, 1, '2022-11-23 04:00:00', 23, NULL, 24, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (10, 1, '2022-11-23 07:00:00', 19, NULL, 20, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (11, 1, '2022-11-23 10:00:00', 17, NULL, 18, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (12, 1, '2022-11-23 13:00:00', 21, NULL, 22, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (13, 1, '2022-11-24 04:00:00', 27, NULL, 28, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (14, 1, '2022-11-24 07:00:00', 31, NULL, 32, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (15, 1, '2022-11-24 10:00:00', 29, NULL, 30, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (16, 1, '2022-11-24 13:00:00', 25, NULL, 26, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (17, 1, '2022-11-25 04:00:00', 8, NULL, 6, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (18, 1, '2022-11-25 07:00:00', 1, NULL, 3, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (19, 1, '2022-11-25 10:00:00', 4, NULL, 2, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (20, 1, '2022-11-25 13:00:00', 5, NULL, 7, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (21, 1, '2022-11-26 07:00:00', 12, NULL, 10, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (22, 1, '2022-11-26 10:00:00', 13, NULL, 15, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (23, 1, '2022-11-26 13:00:00', 9, NULL, 11, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (24, 1, '2022-11-26 00:00:00', 16, NULL, 14, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (25, 1, '2022-11-27 04:00:00', 20, NULL, 18, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (26, 1, '2022-11-27 07:00:00', 21, NULL, 23, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (27, 1, '2022-11-27 10:00:00', 24, NULL, 22, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (28, 1, '2022-11-27 13:00:00', 17, NULL, 19, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (29, 1, '2022-11-28 04:00:00', 28, NULL, 26, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (30, 1, '2022-11-28 07:00:00', 32, NULL, 30, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (31, 1, '2022-11-28 10:00:00', 25, NULL, 27, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (32, 1, '2022-11-28 13:00:00', 29, NULL, 31, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (33, 1, '2022-11-29 09:00:00', 4, NULL, 1, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (34, 1, '2022-11-29 09:00:00', 2, NULL, 3, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (35, 1, '2022-11-29 13:00:00', 8, NULL, 5, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (36, 1, '2022-11-29 13:00:00', 6, NULL, 7, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (37, 1, '2022-11-30 09:00:00', 16, NULL, 13, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (38, 1, '2022-11-30 09:00:00', 14, NULL, 15, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (39, 1, '2022-11-30 13:00:00', 12, NULL, 9, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (40, 1, '2022-11-30 13:00:00', 10, NULL, 11, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (41, 1, '2022-12-01 09:00:00', 24, NULL, 21, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (42, 1, '2022-12-01 09:00:00', 22, NULL, 23, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (43, 1, '2022-12-01 13:00:00', 20, NULL, 17, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (44, 1, '2022-12-01 13:00:00', 18, NULL, 19, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (45, 1, '2022-12-02 09:00:00', 32, NULL, 29, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (46, 1, '2022-12-02 09:00:00', 30, NULL, 31, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (47, 1, '2022-12-02 13:00:00', 28, NULL, 25, NULL, NULL, 0);
INSERT INTO `partido` (`id`, `ronda_id`, `fecha`, `equipo1_id`, `marcador1`, `equipo2_id`, `marcador2`, `ganador`, `estatus`) VALUES (48, 1, '2022-12-02 13:00:00', 26, NULL, 27, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for ronda
-- ----------------------------
DROP TABLE IF EXISTS `ronda`;
CREATE TABLE `ronda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ronda` varchar(100) DEFAULT NULL,
  `npartidos` smallint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ronda` (`ronda`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ronda
-- ----------------------------
BEGIN;
INSERT INTO `ronda` (`id`, `ronda`, `npartidos`) VALUES (1, 'primera ronda', 48);
COMMIT;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `profile` enum('user','admin') NOT NULL DEFAULT 'user',
  `pais` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `usuario` (`usuario`) USING BTREE /*!80000 INVISIBLE */,
  UNIQUE KEY `email` (`email`) USING BTREE /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuario
-- ----------------------------
BEGIN;
INSERT INTO `usuario` (`id`, `nombre`, `email`, `usuario`, `clave`, `profile`, `pais`, `fecha`) VALUES (1, 'Administrador', 'admin@nomail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for usuario_partido
-- ----------------------------
DROP TABLE IF EXISTS `usuario_partido`;
CREATE TABLE `usuario_partido` (
  `usuario_id` int NOT NULL,
  `partido_id` int NOT NULL,
  `ronda_id` int NOT NULL,
  `marcador1` tinyint DEFAULT NULL,
  `marcador2` tinyint DEFAULT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,1',
  `puntaje` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_id`,`partido_id`) USING BTREE,
  KEY `fk_partido` (`partido_id`) USING BTREE,
  KEY `idx_ronda` (`ronda_id`) USING BTREE,
  KEY `idx_estatus` (`estatus`) USING BTREE,
  KEY `idx_usuario_id` (`usuario_id`) USING BTREE,
  CONSTRAINT `fk_partido` FOREIGN KEY (`partido_id`) REFERENCES `partido` (`id`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of usuario_partido
-- ----------------------------

-- ----------------------------
-- Table structure for timezone
-- ----------------------------
DROP TABLE IF EXISTS `timezone`;
CREATE TABLE `timezone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `utc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `country` (`country`,`default`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of timezone
-- ----------------------------
BEGIN;
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (1, 'AF', 'Afghanistan', 'Asia/Kabul', 'UTC +04:36', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (2, 'AL', 'Albania', 'Europe/Tirane', 'UTC +01:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (3, 'DZ', 'Algeria', 'Africa/Algiers', 'UTC +00:12', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (4, 'AS', 'American Samoa', 'Pacific/Pago_Pago', 'UTC +12:37', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (5, 'AD', 'Andorra', 'Europe/Andorra', 'UTC +00:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (6, 'AO', 'Angola', 'Africa/Luanda', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (7, 'AI', 'Anguilla', 'America/Anguilla', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (8, 'AQ', 'Antarctica', 'Antarctica/Casey', 'UTC', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (9, 'CL', 'Chile', 'America/Punta_Arenas', 'UTC -04:43', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (10, 'CL', 'Chile', 'America/Santiago', 'UTC -04:42', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (11, 'AQ', 'Antarctica', 'Antarctica/Davis', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (12, 'CL', 'Chile', 'Pacific/Easter', 'UTC -07:17', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (13, 'AQ', 'Antarctica', 'Antarctica/DumontDUrville', 'UTC +09:48', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (14, 'AQ', 'Antarctica', 'Antarctica/Mawson', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (15, 'CN', 'China', 'Asia/Shanghai', 'UTC +08:05', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (16, 'AQ', 'Antarctica', 'Antarctica/McMurdo', 'UTC +11:39', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (17, 'CN', 'China', 'Asia/Urumqi', 'UTC +05:50', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (18, 'CX', 'Christmas Island', 'Indian/Christmas', 'UTC +06:42', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (19, 'CC', 'Cocos (Keeling) Islands', 'Indian/Cocos', 'UTC +06:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (20, 'AQ', 'Antarctica', 'Antarctica/Palmer', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (21, 'CO', 'Colombia', 'America/Bogota', 'UTC -04:56', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (22, 'AQ', 'Antarctica', 'Antarctica/Rothera', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (23, 'AQ', 'Antarctica', 'Antarctica/Syowa', 'UTC +03:06', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (24, 'AQ', 'Antarctica', 'Antarctica/Troll', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (25, 'AQ', 'Antarctica', 'Antarctica/Vostok', 'UTC +05:50', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (26, 'AG', 'Antigua and Barbuda', 'America/Antigua', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (27, 'AR', 'Argentina', 'America/Argentina/Buenos_Aires', 'UTC -03:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (28, 'KM', 'Comoros', 'Indian/Comoro', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (29, 'AR', 'Argentina', 'America/Argentina/Catamarca', 'UTC -04:23', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (30, 'CG', 'Congo', 'Africa/Brazzaville', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (31, 'AR', 'Argentina', 'America/Argentina/Cordoba', 'UTC -04:16', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (32, 'CD', 'Congo, the Democratic Republic of the', 'Africa/Kinshasa', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (33, 'CD', 'Congo, the Democratic Republic of the', 'Africa/Lubumbashi', 'UTC +02:10', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (34, 'SX', 'Sint Maarten (Dutch part)', 'America/Lower_Princes', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (35, 'AR', 'Argentina', 'America/Argentina/Jujuy', 'UTC -04:21', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (36, 'AR', 'Argentina', 'America/Argentina/La_Rioja', 'UTC -04:27', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (37, 'SK', 'Slovakia', 'Europe/Bratislava', 'UTC +00:57', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (38, 'AR', 'Argentina', 'America/Argentina/Mendoza', 'UTC -04:35', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (39, 'AR', 'Argentina', 'America/Argentina/Rio_Gallegos', 'UTC -04:36', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (40, 'AR', 'Argentina', 'America/Argentina/Salta', 'UTC -04:21', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (41, 'SI', 'Slovenia', 'Europe/Ljubljana', 'UTC +01:22', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (42, 'AR', 'Argentina', 'America/Argentina/San_Juan', 'UTC -04:34', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (43, 'SB', 'Solomon Islands', 'Pacific/Guadalcanal', 'UTC +10:39', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (44, 'AR', 'Argentina', 'America/Argentina/San_Luis', 'UTC -04:25', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (45, 'SO', 'Somalia', 'Africa/Mogadishu', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (46, 'AR', 'Argentina', 'America/Argentina/Tucuman', 'UTC -04:20', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (47, 'ZA', 'South Africa', 'Africa/Johannesburg', 'UTC +01:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (48, 'GS', 'South Georgia and the South Sandwich Islands', 'Atlantic/South_Georgia', 'UTC -02:26', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (49, 'SS', 'South Sudan', 'Africa/Juba', 'UTC +02:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (50, 'AR', 'Argentina', 'America/Argentina/Ushuaia', 'UTC -04:33', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (51, 'AM', 'Armenia', 'Asia/Yerevan', 'UTC +02:58', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (52, 'ES', 'Spain', 'Africa/Ceuta', 'UTC -00:21', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (53, 'AW', 'Aruba', 'America/Aruba', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (54, 'ES', 'Spain', 'Atlantic/Canary', 'UTC -01:01', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (55, 'AU', 'Australia', 'Antarctica/Macquarie', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (56, 'ES', 'Spain', 'Europe/Madrid', 'UTC -00:14', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (57, 'AU', 'Australia', 'Australia/Adelaide', 'UTC +09:14', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (58, 'AU', 'Australia', 'Australia/Brisbane', 'UTC +10:12', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (59, 'AU', 'Australia', 'Australia/Broken_Hill', 'UTC +09:25', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (60, 'AU', 'Australia', 'Australia/Darwin', 'UTC +08:43', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (61, 'LK', 'Sri Lanka', 'Asia/Colombo', 'UTC +05:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (62, 'AU', 'Australia', 'Australia/Eucla', 'UTC +08:35', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (63, 'SD', 'Sudan', 'Africa/Khartoum', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (64, 'SR', 'Suriname', 'America/Paramaribo', 'UTC -03:40', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (65, 'SJ', 'Svalbard and Jan Mayen', 'Arctic/Longyearbyen', 'UTC +00:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (66, 'AU', 'Australia', 'Australia/Hobart', 'UTC +09:49', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (67, 'SZ', 'Swaziland', 'Africa/Mbabane', 'UTC +01:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (68, 'AU', 'Australia', 'Australia/Lindeman', 'UTC +09:55', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (69, 'SE', 'Sweden', 'Europe/Stockholm', 'UTC +00:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (70, 'AU', 'Australia', 'Australia/Lord_Howe', 'UTC +10:36', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (71, 'CH', 'Switzerland', 'Europe/Zurich', 'UTC +00:34', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (72, 'AU', 'Australia', 'Australia/Melbourne', 'UTC +09:39', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (73, 'SY', 'Syrian Arab Republic', 'Asia/Damascus', 'UTC +02:25', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (74, 'AU', 'Australia', 'Australia/Perth', 'UTC +07:43', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (75, 'TW', 'Taiwan, Province of China', 'Asia/Taipei', 'UTC +08:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (76, 'TJ', 'Tajikistan', 'Asia/Dushanbe', 'UTC +04:35', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (77, 'CK', 'Cook Islands', 'Pacific/Rarotonga', 'UTC +13:20', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (78, 'AU', 'Australia', 'Australia/Sydney', 'UTC +10:04', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (79, 'TZ', 'Tanzania, United Republic of', 'Africa/Dar_es_Salaam', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (80, 'AT', 'Austria', 'Europe/Vienna', 'UTC +01:05', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (81, 'CR', 'Costa Rica', 'America/Costa_Rica', 'UTC -05:36', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (82, 'TH', 'Thailand', 'Asia/Bangkok', 'UTC +06:42', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (83, 'HR', 'Croatia', 'Europe/Zagreb', 'UTC +01:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (84, 'TL', 'Timor-Leste', 'Asia/Dili', 'UTC +08:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (85, 'CU', 'Cuba', 'America/Havana', 'UTC -05:29', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (86, 'CW', 'Curaçao', 'America/Curacao', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (87, 'CY', 'Cyprus', 'Asia/Famagusta', 'UTC +02:15', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (88, 'CY', 'Cyprus', 'Asia/Nicosia', 'UTC +02:13', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (89, 'CZ', 'Czech Republic', 'Europe/Prague', 'UTC +00:57', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (90, 'CI', 'Côte d\'Ivoire', 'Africa/Abidjan', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (91, 'AZ', 'Azerbaijan', 'Asia/Baku', 'UTC +03:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (92, 'BS', 'Bahamas', 'America/Nassau', 'UTC -05:17', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (93, 'BH', 'Bahrain', 'Asia/Bahrain', 'UTC +03:26', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (94, 'BD', 'Bangladesh', 'Asia/Dhaka', 'UTC +06:01', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (95, 'DK', 'Denmark', 'Europe/Copenhagen', 'UTC +00:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (96, 'BB', 'Barbados', 'America/Barbados', 'UTC -03:58', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (97, 'DJ', 'Djibouti', 'Africa/Djibouti', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (98, 'BY', 'Belarus', 'Europe/Minsk', 'UTC +01:50', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (99, 'DM', 'Dominica', 'America/Dominica', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (100, 'DO', 'Dominican Republic', 'America/Santo_Domingo', 'UTC -04:39', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (101, 'BE', 'Belgium', 'Europe/Brussels', 'UTC +00:17', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (102, 'EC', 'Ecuador', 'America/Guayaquil', 'UTC -05:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (103, 'BZ', 'Belize', 'America/Belize', 'UTC -05:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (104, 'BJ', 'Benin', 'Africa/Porto-Novo', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (105, 'BM', 'Bermuda', 'Atlantic/Bermuda', 'UTC -04:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (106, 'BT', 'Bhutan', 'Asia/Thimphu', 'UTC +05:58', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (107, 'BO', 'Bolivia, Plurinational State of', 'America/La_Paz', 'UTC -04:32', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (108, 'TG', 'Togo', 'Africa/Lome', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (109, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'America/Kralendijk', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (110, 'TK', 'Tokelau', 'Pacific/Fakaofo', 'UTC -11:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (111, 'BA', 'Bosnia and Herzegovina', 'Europe/Sarajevo', 'UTC +01:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (112, 'TO', 'Tonga', 'Pacific/Tongatapu', 'UTC +12:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (113, 'BW', 'Botswana', 'Africa/Gaborone', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (114, 'TT', 'Trinidad and Tobago', 'America/Port_of_Spain', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (115, 'BR', 'Brazil', 'America/Araguaina', 'UTC -03:12', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (116, 'BR', 'Brazil', 'America/Bahia', 'UTC -02:34', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (117, 'BR', 'Brazil', 'America/Belem', 'UTC -03:13', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (118, 'BR', 'Brazil', 'America/Boa_Vista', 'UTC -04:02', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (119, 'TN', 'Tunisia', 'Africa/Tunis', 'UTC +00:40', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (120, 'TR', 'Turkey', 'Europe/Istanbul', 'UTC +01:55', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (121, 'TM', 'Turkmenistan', 'Asia/Ashgabat', 'UTC +03:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (122, 'TC', 'Turks and Caicos Islands', 'America/Grand_Turk', 'UTC -04:44', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (123, 'TV', 'Tuvalu', 'Pacific/Funafuti', 'UTC +11:32', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (124, 'EC', 'Ecuador', 'Pacific/Galapagos', 'UTC -05:58', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (125, 'UG', 'Uganda', 'Africa/Kampala', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (126, 'UA', 'Ukraine', 'Europe/Kyiv', 'UTC +02:02', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (127, 'EG', 'Egypt', 'Africa/Cairo', 'UTC +02:05', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (128, 'UA', 'Ukraine', 'Europe/Simferopol', 'UTC +02:16', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (129, 'BR', 'Brazil', 'America/Campo_Grande', 'UTC -03:38', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (130, 'SV', 'El Salvador', 'America/El_Salvador', 'UTC -05:56', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (131, 'AE', 'United Arab Emirates', 'Asia/Dubai', 'UTC +03:41', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (132, 'GB', 'United Kingdom', 'Europe/London', 'UTC -00:01', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (133, 'US', 'United States', 'America/Adak', 'UTC +12:13', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (134, 'US', 'United States', 'America/Anchorage', 'UTC +14:00', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (135, 'BR', 'Brazil', 'America/Cuiaba', 'UTC -03:44', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (136, 'US', 'United States', 'America/Boise', 'UTC -07:44', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (137, 'BR', 'Brazil', 'America/Eirunepe', 'UTC -04:39', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (138, 'US', 'United States', 'America/Chicago', 'UTC -05:50', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (139, 'GQ', 'Equatorial Guinea', 'Africa/Malabo', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (140, 'US', 'United States', 'America/Denver', 'UTC -06:59', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (141, 'ER', 'Eritrea', 'Africa/Asmara', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (142, 'BR', 'Brazil', 'America/Fortaleza', 'UTC -02:34', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (143, 'EE', 'Estonia', 'Europe/Tallinn', 'UTC +01:39', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (144, 'BR', 'Brazil', 'America/Maceio', 'UTC -02:22', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (145, 'BR', 'Brazil', 'America/Manaus', 'UTC -04:00', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (146, 'ET', 'Ethiopia', 'Africa/Addis_Ababa', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (147, 'BR', 'Brazil', 'America/Noronha', 'UTC -02:09', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (148, 'FK', 'Falkland Islands (Malvinas)', 'Atlantic/Stanley', 'UTC -03:51', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (149, 'BR', 'Brazil', 'America/Porto_Velho', 'UTC -04:15', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (150, 'FO', 'Faroe Islands', 'Atlantic/Faroe', 'UTC -00:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (151, 'BR', 'Brazil', 'America/Recife', 'UTC -02:19', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (152, 'FJ', 'Fiji', 'Pacific/Fiji', 'UTC +11:55', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (153, 'FI', 'Finland', 'Europe/Helsinki', 'UTC +01:39', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (154, 'BR', 'Brazil', 'America/Rio_Branco', 'UTC -04:31', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (155, 'FR', 'France', 'Europe/Paris', 'UTC +00:09', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (156, 'BR', 'Brazil', 'America/Santarem', 'UTC -03:38', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (157, 'US', 'United States', 'America/Detroit', 'UTC -05:32', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (158, 'GF', 'French Guiana', 'America/Cayenne', 'UTC -03:29', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (159, 'BR', 'Brazil', 'America/Sao_Paulo', 'UTC -03:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (160, 'US', 'United States', 'America/Indiana/Indianapolis', 'UTC -05:44', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (161, 'IO', 'British Indian Ocean Territory', 'Indian/Chagos', 'UTC +04:49', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (162, 'US', 'United States', 'America/Indiana/Knox', 'UTC -05:46', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (163, 'BN', 'Brunei Darussalam', 'Asia/Brunei', 'UTC +07:21', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (164, 'US', 'United States', 'America/Indiana/Marengo', 'UTC -05:45', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (165, 'BG', 'Bulgaria', 'Europe/Sofia', 'UTC +01:33', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (166, 'US', 'United States', 'America/Indiana/Petersburg', 'UTC -05:49', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (167, 'PF', 'French Polynesia', 'Pacific/Gambier', 'UTC -08:59', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (168, 'BF', 'Burkina Faso', 'Africa/Ouagadougou', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (169, 'US', 'United States', 'America/Indiana/Tell_City', 'UTC -05:47', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (170, 'BI', 'Burundi', 'Africa/Bujumbura', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (171, 'US', 'United States', 'America/Indiana/Vevay', 'UTC -05:40', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (172, 'KH', 'Cambodia', 'Asia/Phnom_Penh', 'UTC +06:42', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (173, 'US', 'United States', 'America/Indiana/Vincennes', 'UTC -05:50', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (174, 'CM', 'Cameroon', 'Africa/Douala', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (175, 'CA', 'Canada', 'America/Atikokan', 'UTC -05:18', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (176, 'CA', 'Canada', 'America/Blanc-Sablon', 'UTC -04:24', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (177, 'US', 'United States', 'America/Indiana/Winamac', 'UTC -05:46', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (178, 'US', 'United States', 'America/Juneau', 'UTC +15:02', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (179, 'US', 'United States', 'America/Kentucky/Louisville', 'UTC -05:43', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (180, 'US', 'United States', 'America/Kentucky/Monticello', 'UTC -05:39', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (181, 'CA', 'Canada', 'America/Cambridge_Bay', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (182, 'US', 'United States', 'America/Los_Angeles', 'UTC -07:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (183, 'CA', 'Canada', 'America/Creston', 'UTC -07:28', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (184, 'US', 'United States', 'America/Menominee', 'UTC -05:50', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (185, 'CA', 'Canada', 'America/Dawson', 'UTC -09:17', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (186, 'US', 'United States', 'America/Metlakatla', 'UTC +15:13', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (187, 'CA', 'Canada', 'America/Dawson_Creek', 'UTC -08:00', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (188, 'US', 'United States', 'America/New_York', 'UTC -04:56', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (189, 'CA', 'Canada', 'America/Edmonton', 'UTC -07:33', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (190, 'US', 'United States', 'America/Nome', 'UTC +12:58', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (191, 'CA', 'Canada', 'America/Fort_Nelson', 'UTC -08:10', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (192, 'CA', 'Canada', 'America/Glace_Bay', 'UTC -03:59', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (193, 'CA', 'Canada', 'America/Goose_Bay', 'UTC -04:01', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (194, 'CA', 'Canada', 'America/Halifax', 'UTC -04:14', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (195, 'CA', 'Canada', 'America/Inuvik', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (196, 'CA', 'Canada', 'America/Iqaluit', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (197, 'CA', 'Canada', 'America/Moncton', 'UTC -04:19', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (198, 'CA', 'Canada', 'America/Nipigon', 'UTC -05:53', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (199, 'PF', 'French Polynesia', 'Pacific/Marquesas', 'UTC -09:18', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (200, 'CA', 'Canada', 'America/Pangnirtung', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (201, 'PF', 'French Polynesia', 'Pacific/Tahiti', 'UTC -09:58', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (202, 'TF', 'French Southern Territories', 'Indian/Kerguelen', 'UTC +04:54', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (203, 'CA', 'Canada', 'America/Rainy_River', 'UTC -06:18', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (204, 'CA', 'Canada', 'America/Rankin_Inlet', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (205, 'GA', 'Gabon', 'Africa/Libreville', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (206, 'CA', 'Canada', 'America/Regina', 'UTC -06:58', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (207, 'CA', 'Canada', 'America/Resolute', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (208, 'CA', 'Canada', 'America/St_Johns', 'UTC -03:30', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (209, 'CA', 'Canada', 'America/Swift_Current', 'UTC -07:11', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (210, 'CA', 'Canada', 'America/Thunder_Bay', 'UTC -05:57', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (211, 'US', 'United States', 'America/North_Dakota/Beulah', 'UTC -06:47', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (212, 'CA', 'Canada', 'America/Toronto', 'UTC -05:17', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (213, 'US', 'United States', 'America/North_Dakota/Center', 'UTC -06:45', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (214, 'US', 'United States', 'America/North_Dakota/New_Salem', 'UTC -06:45', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (215, 'US', 'United States', 'America/Phoenix', 'UTC -07:28', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (216, 'US', 'United States', 'America/Sitka', 'UTC +14:58', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (217, 'US', 'United States', 'America/Yakutat', 'UTC +14:41', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (218, 'CA', 'Canada', 'America/Vancouver', 'UTC -08:12', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (219, 'CA', 'Canada', 'America/Whitehorse', 'UTC -09:00', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (220, 'US', 'United States', 'Pacific/Honolulu', 'UTC -10:31', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (221, 'UM', 'United States Minor Outlying Islands', 'Pacific/Midway', 'UTC +12:37', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (222, 'UM', 'United States Minor Outlying Islands', 'Pacific/Wake', 'UTC +11:32', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (223, 'UY', 'Uruguay', 'America/Montevideo', 'UTC -03:44', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (224, 'CA', 'Canada', 'America/Winnipeg', 'UTC -06:28', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (225, 'UZ', 'Uzbekistan', 'Asia/Samarkand', 'UTC +04:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (226, 'CA', 'Canada', 'America/Yellowknife', 'UTC', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (227, 'UZ', 'Uzbekistan', 'Asia/Tashkent', 'UTC +04:37', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (228, 'CV', 'Cape Verde', 'Atlantic/Cape_Verde', 'UTC -01:34', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (229, 'VU', 'Vanuatu', 'Pacific/Efate', 'UTC +11:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (230, 'KY', 'Cayman Islands', 'America/Cayman', 'UTC -05:18', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (231, 'CF', 'Central African Republic', 'Africa/Bangui', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (232, 'VE', 'Venezuela, Bolivarian Republic of', 'America/Caracas', 'UTC -04:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (233, 'VN', 'Viet Nam', 'Asia/Ho_Chi_Minh', 'UTC +07:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (234, 'TD', 'Chad', 'Africa/Ndjamena', 'UTC +01:00', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (235, 'VG', 'Virgin Islands, British', 'America/Tortola', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (236, 'VI', 'Virgin Islands, U.S.', 'America/St_Thomas', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (237, 'WF', 'Wallis and Futuna', 'Pacific/Wallis', 'UTC +11:32', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (238, 'YE', 'Yemen', 'Asia/Aden', 'UTC +03:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (239, 'ZM', 'Zambia', 'Africa/Lusaka', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (240, 'ZW', 'Zimbabwe', 'Africa/Harare', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (241, 'AX', 'Åland Islands', 'Europe/Mariehamn', 'UTC +01:39', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (242, 'GM', 'Gambia', 'Africa/Banjul', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (243, 'GE', 'Georgia', 'Asia/Tbilisi', 'UTC +02:59', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (244, 'DE', 'Germany', 'Europe/Berlin', 'UTC +00:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (245, 'DE', 'Germany', 'Europe/Busingen', 'UTC +00:34', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (246, 'GH', 'Ghana', 'Africa/Accra', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (247, 'GI', 'Gibraltar', 'Europe/Gibraltar', 'UTC -00:21', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (248, 'GR', 'Greece', 'Europe/Athens', 'UTC +01:34', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (249, 'GL', 'Greenland', 'America/Danmarkshavn', 'UTC -01:14', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (250, 'GL', 'Greenland', 'America/Nuuk', 'UTC -03:26', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (251, 'GL', 'Greenland', 'America/Scoresbysund', 'UTC -01:27', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (252, 'GL', 'Greenland', 'America/Thule', 'UTC -04:35', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (253, 'GD', 'Grenada', 'America/Grenada', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (254, 'GP', 'Guadeloupe', 'America/Guadeloupe', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (255, 'GU', 'Guam', 'Pacific/Guam', 'UTC -14:21', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (256, 'GT', 'Guatemala', 'America/Guatemala', 'UTC -06:02', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (257, 'GG', 'Guernsey', 'Europe/Guernsey', 'UTC -00:01', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (258, 'GN', 'Guinea', 'Africa/Conakry', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (259, 'GW', 'Guinea-Bissau', 'Africa/Bissau', 'UTC -01:02', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (260, 'GY', 'Guyana', 'America/Guyana', 'UTC -03:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (261, 'HT', 'Haiti', 'America/Port-au-Prince', 'UTC -04:49', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (262, 'VA', 'Holy See (Vatican City State)', 'Europe/Vatican', 'UTC +00:49', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (263, 'HN', 'Honduras', 'America/Tegucigalpa', 'UTC -05:48', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (264, 'HK', 'Hong Kong', 'Asia/Hong_Kong', 'UTC +07:36', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (265, 'HU', 'Hungary', 'Europe/Budapest', 'UTC +01:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (266, 'IS', 'Iceland', 'Atlantic/Reykjavik', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (267, 'IN', 'India', 'Asia/Kolkata', 'UTC +05:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (268, 'ID', 'Indonesia', 'Asia/Jakarta', 'UTC +07:07', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (269, 'ID', 'Indonesia', 'Asia/Jayapura', 'UTC +09:22', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (270, 'ID', 'Indonesia', 'Asia/Makassar', 'UTC +07:57', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (271, 'ID', 'Indonesia', 'Asia/Pontianak', 'UTC +07:17', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (272, 'IR', 'Iran, Islamic Republic of', 'Asia/Tehran', 'UTC +03:25', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (273, 'IQ', 'Iraq', 'Asia/Baghdad', 'UTC +02:57', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (274, 'IE', 'Ireland', 'Europe/Dublin', 'UTC -00:25', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (275, 'IM', 'Isle of Man', 'Europe/Isle_of_Man', 'UTC -00:01', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (276, 'IL', 'Israel', 'Asia/Jerusalem', 'UTC +02:20', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (277, 'IT', 'Italy', 'Europe/Rome', 'UTC +00:49', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (278, 'JM', 'Jamaica', 'America/Jamaica', 'UTC -05:07', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (279, 'JP', 'Japan', 'Asia/Tokyo', 'UTC +09:18', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (280, 'JE', 'Jersey', 'Europe/Jersey', 'UTC -00:01', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (281, 'JO', 'Jordan', 'Asia/Amman', 'UTC +02:23', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (282, 'KZ', 'Kazakhstan', 'Asia/Almaty', 'UTC +05:07', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (283, 'KZ', 'Kazakhstan', 'Asia/Aqtau', 'UTC +03:21', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (284, 'KZ', 'Kazakhstan', 'Asia/Aqtobe', 'UTC +03:48', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (285, 'KZ', 'Kazakhstan', 'Asia/Atyrau', 'UTC +03:27', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (286, 'KZ', 'Kazakhstan', 'Asia/Oral', 'UTC +03:25', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (287, 'KZ', 'Kazakhstan', 'Asia/Qostanay', 'UTC +04:14', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (288, 'KZ', 'Kazakhstan', 'Asia/Qyzylorda', 'UTC +04:21', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (289, 'KE', 'Kenya', 'Africa/Nairobi', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (290, 'KI', 'Kiribati', 'Pacific/Kanton', 'UTC', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (291, 'KI', 'Kiribati', 'Pacific/Kiritimati', 'UTC -10:29', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (292, 'KI', 'Kiribati', 'Pacific/Tarawa', 'UTC +11:32', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (293, 'KP', 'Korea, Democratic People\'s Republic of', 'Asia/Pyongyang', 'UTC +08:23', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (294, 'KR', 'Korea, Republic of', 'Asia/Seoul', 'UTC +08:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (295, 'KW', 'Kuwait', 'Asia/Kuwait', 'UTC +03:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (296, 'KG', 'Kyrgyzstan', 'Asia/Bishkek', 'UTC +04:58', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (297, 'LA', 'Lao People\'s Democratic Republic', 'Asia/Vientiane', 'UTC +06:42', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (298, 'LV', 'Latvia', 'Europe/Riga', 'UTC +01:36', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (299, 'LB', 'Lebanon', 'Asia/Beirut', 'UTC +02:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (300, 'LS', 'Lesotho', 'Africa/Maseru', 'UTC +01:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (301, 'LR', 'Liberia', 'Africa/Monrovia', 'UTC -00:43', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (302, 'LY', 'Libya', 'Africa/Tripoli', 'UTC +00:52', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (303, 'LI', 'Liechtenstein', 'Europe/Vaduz', 'UTC +00:34', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (304, 'LT', 'Lithuania', 'Europe/Vilnius', 'UTC +01:41', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (305, 'LU', 'Luxembourg', 'Europe/Luxembourg', 'UTC +00:17', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (306, 'MO', 'Macao', 'Asia/Macau', 'UTC +07:34', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (307, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'Europe/Skopje', 'UTC +01:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (308, 'MG', 'Madagascar', 'Indian/Antananarivo', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (309, 'MW', 'Malawi', 'Africa/Blantyre', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (310, 'MY', 'Malaysia', 'Asia/Kuala_Lumpur', 'UTC +06:55', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (311, 'MY', 'Malaysia', 'Asia/Kuching', 'UTC +07:21', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (312, 'MV', 'Maldives', 'Indian/Maldives', 'UTC +04:54', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (313, 'ML', 'Mali', 'Africa/Bamako', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (314, 'MT', 'Malta', 'Europe/Malta', 'UTC +00:58', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (315, 'MH', 'Marshall Islands', 'Pacific/Kwajalein', 'UTC +11:09', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (316, 'MH', 'Marshall Islands', 'Pacific/Majuro', 'UTC +11:32', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (317, 'MQ', 'Martinique', 'America/Martinique', 'UTC -04:04', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (318, 'MR', 'Mauritania', 'Africa/Nouakchott', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (319, 'MU', 'Mauritius', 'Indian/Mauritius', 'UTC +03:50', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (320, 'YT', 'Mayotte', 'Indian/Mayotte', 'UTC +02:27', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (321, 'MX', 'Mexico', 'America/Bahia_Banderas', 'UTC -07:01', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (322, 'MX', 'Mexico', 'America/Cancun', 'UTC -05:47', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (323, 'MX', 'Mexico', 'America/Chihuahua', 'UTC -07:04', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (324, 'MX', 'Mexico', 'America/Hermosillo', 'UTC -07:23', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (325, 'MX', 'Mexico', 'America/Matamoros', 'UTC -06:40', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (326, 'MX', 'Mexico', 'America/Mazatlan', 'UTC -07:05', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (327, 'MX', 'Mexico', 'America/Merida', 'UTC -05:58', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (328, 'MX', 'Mexico', 'America/Mexico_City', 'UTC -06:36', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (329, 'MX', 'Mexico', 'America/Monterrey', 'UTC -06:41', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (330, 'MX', 'Mexico', 'America/Ojinaga', 'UTC -06:57', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (331, 'MX', 'Mexico', 'America/Tijuana', 'UTC -07:48', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (332, 'FM', 'Micronesia, Federated States of', 'Pacific/Chuuk', 'UTC +09:48', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (333, 'FM', 'Micronesia, Federated States of', 'Pacific/Kosrae', 'UTC -13:08', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (334, 'FM', 'Micronesia, Federated States of', 'Pacific/Pohnpei', 'UTC +10:39', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (335, 'MD', 'Moldova, Republic of', 'Europe/Chisinau', 'UTC +01:55', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (336, 'MC', 'Monaco', 'Europe/Monaco', 'UTC +00:09', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (337, 'MN', 'Mongolia', 'Asia/Choibalsan', 'UTC +07:38', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (338, 'MN', 'Mongolia', 'Asia/Hovd', 'UTC +06:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (339, 'MN', 'Mongolia', 'Asia/Ulaanbaatar', 'UTC +07:07', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (340, 'ME', 'Montenegro', 'Europe/Podgorica', 'UTC +01:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (341, 'MS', 'Montserrat', 'America/Montserrat', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (342, 'MA', 'Morocco', 'Africa/Casablanca', 'UTC -00:30', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (343, 'MA', 'Morocco', 'Africa/El_Aaiun', 'UTC -00:52', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (344, 'MZ', 'Mozambique', 'Africa/Maputo', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (345, 'MM', 'Myanmar', 'Asia/Yangon', 'UTC +06:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (346, 'NA', 'Namibia', 'Africa/Windhoek', 'UTC +01:08', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (347, 'NR', 'Nauru', 'Pacific/Nauru', 'UTC +11:07', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (348, 'NP', 'Nepal', 'Asia/Kathmandu', 'UTC +05:41', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (349, 'NL', 'Netherlands', 'Europe/Amsterdam', 'UTC +00:17', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (350, 'NC', 'New Caledonia', 'Pacific/Noumea', 'UTC +11:05', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (351, 'NZ', 'New Zealand', 'Pacific/Auckland', 'UTC +11:39', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (352, 'NZ', 'New Zealand', 'Pacific/Chatham', 'UTC +12:13', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (353, 'NI', 'Nicaragua', 'America/Managua', 'UTC -05:45', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (354, 'NE', 'Niger', 'Africa/Niamey', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (355, 'NG', 'Nigeria', 'Africa/Lagos', 'UTC +00:13', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (356, 'NU', 'Niue', 'Pacific/Niue', 'UTC -11:19', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (357, 'NF', 'Norfolk Island', 'Pacific/Norfolk', 'UTC +11:11', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (358, 'MP', 'Northern Mariana Islands', 'Pacific/Saipan', 'UTC -14:21', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (359, 'NO', 'Norway', 'Europe/Oslo', 'UTC +00:53', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (360, 'OM', 'Oman', 'Asia/Muscat', 'UTC +03:41', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (361, 'PK', 'Pakistan', 'Asia/Karachi', 'UTC +04:28', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (362, 'PW', 'Palau', 'Pacific/Palau', 'UTC -15:02', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (363, 'PS', 'Palestine, State of', 'Asia/Gaza', 'UTC +02:17', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (364, 'PS', 'Palestine, State of', 'Asia/Hebron', 'UTC +02:20', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (365, 'PA', 'Panama', 'America/Panama', 'UTC -05:18', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (366, 'PG', 'Papua New Guinea', 'Pacific/Bougainville', 'UTC +10:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (367, 'PG', 'Papua New Guinea', 'Pacific/Port_Moresby', 'UTC +09:48', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (368, 'PY', 'Paraguay', 'America/Asuncion', 'UTC -03:50', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (369, 'PE', 'Peru', 'America/Lima', 'UTC -05:08', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (370, 'PH', 'Philippines', 'Asia/Manila', 'UTC -15:56', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (371, 'PN', 'Pitcairn', 'Pacific/Pitcairn', 'UTC -08:40', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (372, 'PL', 'Poland', 'Europe/Warsaw', 'UTC +01:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (373, 'PT', 'Portugal', 'Atlantic/Azores', 'UTC -01:42', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (374, 'PT', 'Portugal', 'Atlantic/Madeira', 'UTC -01:07', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (375, 'PT', 'Portugal', 'Europe/Lisbon', 'UTC -00:36', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (376, 'PR', 'Puerto Rico', 'America/Puerto_Rico', 'UTC -04:24', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (377, 'QA', 'Qatar', 'Asia/Qatar', 'UTC +03:26', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (378, 'RO', 'Romania', 'Europe/Bucharest', 'UTC +01:44', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (379, 'RU', 'Russian Federation', 'Asia/Anadyr', 'UTC +11:49', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (380, 'RU', 'Russian Federation', 'Asia/Barnaul', 'UTC +05:35', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (381, 'RU', 'Russian Federation', 'Asia/Chita', 'UTC +07:33', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (382, 'RU', 'Russian Federation', 'Asia/Irkutsk', 'UTC +06:57', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (383, 'RU', 'Russian Federation', 'Asia/Kamchatka', 'UTC +10:34', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (384, 'RU', 'Russian Federation', 'Asia/Khandyga', 'UTC +09:02', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (385, 'RU', 'Russian Federation', 'Asia/Krasnoyarsk', 'UTC +06:11', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (386, 'RU', 'Russian Federation', 'Asia/Magadan', 'UTC +10:03', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (387, 'RU', 'Russian Federation', 'Asia/Novokuznetsk', 'UTC +05:48', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (388, 'RU', 'Russian Federation', 'Asia/Novosibirsk', 'UTC +05:31', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (389, 'RU', 'Russian Federation', 'Asia/Omsk', 'UTC +04:53', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (390, 'RU', 'Russian Federation', 'Asia/Sakhalin', 'UTC +09:30', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (391, 'RU', 'Russian Federation', 'Asia/Srednekolymsk', 'UTC +10:14', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (392, 'RU', 'Russian Federation', 'Asia/Tomsk', 'UTC +05:39', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (393, 'RU', 'Russian Federation', 'Asia/Ust-Nera', 'UTC +09:32', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (394, 'RU', 'Russian Federation', 'Asia/Vladivostok', 'UTC +08:47', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (395, 'RU', 'Russian Federation', 'Asia/Yakutsk', 'UTC +08:38', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (396, 'RU', 'Russian Federation', 'Asia/Yekaterinburg', 'UTC +04:02', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (397, 'RU', 'Russian Federation', 'Europe/Astrakhan', 'UTC +03:12', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (398, 'RU', 'Russian Federation', 'Europe/Kaliningrad', 'UTC +01:22', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (399, 'RU', 'Russian Federation', 'Europe/Kirov', 'UTC +03:18', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (400, 'RU', 'Russian Federation', 'Europe/Moscow', 'UTC +02:30', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (401, 'RU', 'Russian Federation', 'Europe/Samara', 'UTC +03:20', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (402, 'RU', 'Russian Federation', 'Europe/Saratov', 'UTC +03:04', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (403, 'RU', 'Russian Federation', 'Europe/Ulyanovsk', 'UTC +03:13', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (404, 'RU', 'Russian Federation', 'Europe/Volgograd', 'UTC +02:57', 0);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (405, 'RW', 'Rwanda', 'Africa/Kigali', 'UTC +02:10', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (406, 'RE', 'Réunion', 'Indian/Reunion', 'UTC +03:41', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (407, 'BL', 'Saint Barthélemy', 'America/St_Barthelemy', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (408, 'SH', 'Saint Helena, Ascension and Tristan da Cunha', 'Atlantic/St_Helena', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (409, 'KN', 'Saint Kitts and Nevis', 'America/St_Kitts', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (410, 'LC', 'Saint Lucia', 'America/St_Lucia', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (411, 'MF', 'Saint Martin (French part)', 'America/Marigot', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (412, 'PM', 'Saint Pierre and Miquelon', 'America/Miquelon', 'UTC -03:44', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (413, 'VC', 'Saint Vincent and the Grenadines', 'America/St_Vincent', 'UTC -04:24', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (414, 'WS', 'Samoa', 'Pacific/Apia', 'UTC +12:33', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (415, 'SM', 'San Marino', 'Europe/San_Marino', 'UTC +00:49', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (416, 'ST', 'Sao Tome and Principe', 'Africa/Sao_Tome', 'UTC +00:26', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (417, 'SA', 'Saudi Arabia', 'Asia/Riyadh', 'UTC +03:06', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (418, 'SN', 'Senegal', 'Africa/Dakar', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (419, 'RS', 'Serbia', 'Europe/Belgrade', 'UTC +01:22', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (420, 'SC', 'Seychelles', 'Indian/Mahe', 'UTC +03:41', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (421, 'SL', 'Sierra Leone', 'Africa/Freetown', 'UTC -00:16', 1);
INSERT INTO `timezone` (`id`, `cod`, `country`, `timezone`, `utc`, `default`) VALUES (422, 'SG', 'Singapore', 'Asia/Singapore', 'UTC +06:55', 1);
COMMIT;

BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
