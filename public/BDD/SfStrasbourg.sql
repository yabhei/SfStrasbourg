-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sfstrasbourg
CREATE DATABASE IF NOT EXISTS `sfstrasbourg` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sfstrasbourg`;

-- Dumping structure for table sfstrasbourg.doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table sfstrasbourg.doctrine_migration_versions: ~0 rows (approximately)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230207085822', '2023-02-07 09:00:50', 350);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Dumping structure for table sfstrasbourg.employe
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entreprise_id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_naissance` datetime DEFAULT NULL,
  `date_embauche` datetime NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F804D3B9A4AEAFEA` (`entreprise_id`),
  CONSTRAINT `FK_F804D3B9A4AEAFEA` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sfstrasbourg.employe: ~5 rows (approximately)
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` (`id`, `entreprise_id`, `nom`, `prenom`, `date_naissance`, `date_embauche`, `ville`) VALUES
	(1, 1, 'DER', 'MHD', '1993-02-07 13:55:05', '2020-02-07 13:55:13', 'STRASBOURG'),
	(2, 2, 'NEMER', 'ABD', '1995-02-07 13:56:11', '2021-02-07 13:56:17', 'COLMAR'),
	(3, 1, 'SAWAF', 'OMAR', '1994-02-07 14:24:24', '2022-02-07 14:24:34', 'STRASBOURG'),
	(4, 2, 'REF', 'AHMD', '1992-02-07 14:25:30', '2020-02-07 14:25:39', 'COLMAR'),
	(5, 1, 'TOUS', 'ANAS', '1994-02-07 14:26:07', '2023-02-07 14:26:18', 'STRASBOURG'),
	(6, 1, 'Mickey', 'Mouse', '1990-02-10 00:00:00', '2018-01-01 00:00:00', 'Strasbourg');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;

-- Dumping structure for table sfstrasbourg.entreprise
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `adresse` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siret` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sfstrasbourg.entreprise: ~2 rows (approximately)
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
INSERT INTO `entreprise` (`id`, `raison_sociale`, `date_creation`, `adresse`, `cp`, `ville`, `siret`) VALUES
	(1, 'ELAN STRASBOURG', '1998-02-07 11:43:54', '202 Avenue dr Colmar', '67200', 'Strasbourg', '123456789'),
	(2, 'ELAN COLMAR', '2014-02-07 11:45:17', '1 place ..', '68000', 'Colmar', '987654321'),
	(3, 'Test entreprise', '2018-01-01 00:00:00', '25 rue de foot', '90000', 'TestVille', '1593574862');
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;

-- Dumping structure for table sfstrasbourg.messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sfstrasbourg.messenger_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
