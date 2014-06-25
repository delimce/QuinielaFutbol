/*
Navicat MySQL Data Transfer

Source Server         : userver
Source Server Version : 50532
Source Host           : userver:3306
Source Database       : pollamundial

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-06-25 16:25:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accesos_log
-- ----------------------------
DROP TABLE IF EXISTS `accesos_log`;
CREATE TABLE `accesos_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `perfil` enum('edificio','distribuidor','admin') NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente_info` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=692 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for equipo
-- ----------------------------
DROP TABLE IF EXISTS `equipo`;
CREATE TABLE `equipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `bandera` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for partido
-- ----------------------------
DROP TABLE IF EXISTS `partido`;
CREATE TABLE `partido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ronda_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `equipo1_id` int(11) NOT NULL,
  `marcador1` tinyint(3) DEFAULT NULL,
  `equipo2_id` int(11) NOT NULL,
  `marcador2` tinyint(3) DEFAULT NULL,
  `ganador` int(11) DEFAULT NULL COMMENT 'id de equipo ganador',
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
-- Table structure for ronda
-- ----------------------------
DROP TABLE IF EXISTS `ronda`;
CREATE TABLE `ronda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ronda` varchar(100) DEFAULT NULL,
  `npartidos` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ronda` (`ronda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `profile` enum('user','admin') NOT NULL DEFAULT 'user',
  `contacto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for usuario_partido
-- ----------------------------
DROP TABLE IF EXISTS `usuario_partido`;
CREATE TABLE `usuario_partido` (
  `usuario_id` int(11) NOT NULL,
  `partido_id` int(11) NOT NULL,
  `ronda_id` int(11) NOT NULL,
  `marcador1` tinyint(3) DEFAULT NULL,
  `marcador2` tinyint(3) DEFAULT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,1',
  `puntaje` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usuario_id`,`partido_id`),
  KEY `fk_partido` (`partido_id`),
  KEY `idx_ronda` (`ronda_id`),
  KEY `idx_estatus` (`estatus`),
  CONSTRAINT `fk_partido` FOREIGN KEY (`partido_id`) REFERENCES `partido` (`id`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
