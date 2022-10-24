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
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
