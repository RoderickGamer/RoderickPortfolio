-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.32 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para manga_storage
CREATE DATABASE IF NOT EXISTS `manga_storage` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `manga_storage`;

-- Volcando estructura para tabla manga_storage.editor
CREATE TABLE IF NOT EXISTS `editor` (
  `Editor_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Editor_Name` varchar(60) NOT NULL COMMENT 'Nombre de la editorial',
  `Editor_Country` char(2) NOT NULL COMMENT 'Código de país ISO de dos carácteres',
  `Editor_WebSite` varchar(255) DEFAULT NULL COMMENT 'Url de la página para comprar mangas',
  PRIMARY KEY (`Editor_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Muestra la casa editorial y el pais en que se imprio el volumen comprado';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla manga_storage.manga_storage
CREATE TABLE IF NOT EXISTS `manga_storage` (
  `MS_Id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id unico para cada nombre de manga diferente',
  `MS_Name` varchar(60) NOT NULL COMMENT 'Nombre del Manga en cuestión',
  `MS_Author` varchar(45) NOT NULL COMMENT 'Autor del manga',
  `MS_EditorId` tinyint unsigned NOT NULL COMMENT 'Casa editorial del manga',
  `MS_StatusId` tinyint unsigned NOT NULL COMMENT 'Publishing = 1\nFinished = 2\nCanceled = 3',
  `MS_ReadingStatus` tinyint unsigned NOT NULL COMMENT 'Reading = 1\nFinished = 2\nDropped = 3',
  PRIMARY KEY (`MS_Id`),
  KEY `MS_EditorId` (`MS_EditorId`),
  KEY `MS_Status` (`MS_StatusId`),
  KEY `MS_ReadingStatus` (`MS_ReadingStatus`),
  CONSTRAINT `FK_MS_Editor` FOREIGN KEY (`MS_EditorId`) REFERENCES `editor` (`Editor_Id`),
  CONSTRAINT `FK_MS_RS` FOREIGN KEY (`MS_ReadingStatus`) REFERENCES `reading_status` (`RS_Id`),
  CONSTRAINT `FK_MS_Status` FOREIGN KEY (`MS_StatusId`) REFERENCES `status` (`Status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COMMENT='Tabla para los datos de la serie de manga en general';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla manga_storage.ms_detail
CREATE TABLE IF NOT EXISTS `ms_detail` (
  `MSD_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `MSD_MSId` smallint unsigned NOT NULL COMMENT 'PK de la tabla Manga_Storage',
  `MSD_Volume` tinyint unsigned NOT NULL COMMENT 'Numero de volumen',
  `MSD_Year` date NOT NULL COMMENT 'Fecha de publicacion',
  PRIMARY KEY (`MSD_Id`),
  KEY `MSD_MSId` (`MSD_MSId`),
  KEY `MSD_Volume` (`MSD_Volume`),
  CONSTRAINT `FK_MSD_MS` FOREIGN KEY (`MSD_MSId`) REFERENCES `manga_storage` (`MS_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla manga_storage.purchase
CREATE TABLE IF NOT EXISTS `purchase` (
  `P_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `P_Date` date NOT NULL COMMENT 'Fecha de compra',
  `P_NumMangas` smallint unsigned NOT NULL COMMENT 'Cuántos Mangas se compraron',
  `P_TotalPrice` decimal(10,2) NOT NULL COMMENT 'Precio total',
  `P_Discount` decimal(3,2) DEFAULT NULL COMMENT 'Descuento, puede ser 0',
  `P_FinalPrice` decimal(10,2) NOT NULL COMMENT 'Precio con descuento',
  PRIMARY KEY (`P_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla manga_storage.p_detail
CREATE TABLE IF NOT EXISTS `p_detail` (
  `PD_Id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `PD_PId` smallint unsigned NOT NULL COMMENT 'PK de la tabla Purchase',
  `PD_MSId` smallint unsigned NOT NULL COMMENT 'PK de la tabla Manga_Storage',
  `PD_MSDVolume` tinyint unsigned NOT NULL COMMENT 'PK de la tabla MS_Detail',
  `PD_UnitPrice` decimal(10,2) DEFAULT NULL COMMENT 'Precio original de cada volumen',
  PRIMARY KEY (`PD_Id`),
  KEY `PD_PId` (`PD_PId`),
  KEY `PD_MSId` (`PD_MSId`) /*!80000 INVISIBLE */,
  KEY `PD_MSDVolume` (`PD_MSDVolume`),
  CONSTRAINT `FK_PD_MS` FOREIGN KEY (`PD_MSId`) REFERENCES `manga_storage` (`MS_Id`),
  CONSTRAINT `FK_PD_MSD` FOREIGN KEY (`PD_MSDVolume`) REFERENCES `ms_detail` (`MSD_Volume`),
  CONSTRAINT `FK_PD_P` FOREIGN KEY (`PD_PId`) REFERENCES `purchase` (`P_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla manga_storage.reading_status
CREATE TABLE IF NOT EXISTS `reading_status` (
  `RS_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `RS_Description` varchar(10) DEFAULT NULL COMMENT 'Reading = 1\nFinished = 2\nDropped = 3',
  PRIMARY KEY (`RS_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla manga_storage.status
CREATE TABLE IF NOT EXISTS `status` (
  `Status_Id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Status_Description` varchar(15) NOT NULL COMMENT 'Publishing = 1\nFinished = 2\nCanceled = 3',
  PRIMARY KEY (`Status_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
