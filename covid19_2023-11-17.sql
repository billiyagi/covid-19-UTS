# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 11.1.2-MariaDB)
# Database: covid19
# Generation Time: 2023-11-17 07:06:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table districts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `districts`;

CREATE TABLE `districts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `regency_id` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table hospitals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hospitals`;

CREATE TABLE `hospitals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;

INSERT INTO `hospitals` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'RS Umum Az-Zuhra','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(2,'RS Umum Daerah Dr. Soetomo','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(3,'RSUD Pasar Minggu','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(4,'RS Harapan Sehati','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(5,'RS Umum Dr. Iqbali Taufan','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(6,'RS Mata Bandung Eye Center','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(7,'RS Umum Daerah Fakfak','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(8,'RS Umum Daerah Bengkalis','2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(9,'RS Umum Melati Desa Pontianak','2023-11-17 06:52:50','2023-11-17 06:52:50');

/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2023_11_17_023502_create_hospitals_table',1),
	(6,'2023_11_17_023518_create_vaccination_table',1),
	(7,'2023_11_17_023716_create_patients_table',1),
	(8,'2023_11_17_024246_create_provinces_table',1),
	(9,'2023_11_17_024302_create_districts_table',1),
	(10,'2023_11_17_024310_create_regencies_table',1),
	(11,'2023_11_17_030258_create_partial_address_table',1),
	(12,'2023_11_17_035416_create_relation_patients',1),
	(13,'2023_11_17_035434_create_relation_partial_address',1),
	(14,'2023_11_17_041425_create_relation_vaccination',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table partial_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `partial_address`;

CREATE TABLE `partial_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` bigint(20) unsigned NOT NULL,
  `regency_id` bigint(20) unsigned NOT NULL,
  `district_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partial_address_province_id_foreign` (`province_id`),
  KEY `partial_address_regency_id_foreign` (`regency_id`),
  KEY `partial_address_district_id_foreign` (`district_id`),
  CONSTRAINT `partial_address_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `partial_address_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`),
  CONSTRAINT `partial_address_regency_id_foreign` FOREIGN KEY (`regency_id`) REFERENCES `regencies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_reset_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table patients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `status` enum('reaktif','sembuh','meninggal') NOT NULL,
  `in_date_at` date NOT NULL,
  `out_date_at` date NOT NULL,
  `hospital_id` bigint(20) unsigned NOT NULL,
  `partial_address_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patients_hospital_id_foreign` (`hospital_id`),
  CONSTRAINT `patients_hospital_id_foreign` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;

INSERT INTO `patients` (`id`, `name`, `phone`, `address`, `status`, `in_date_at`, `out_date_at`, `hospital_id`, `partial_address_id`, `created_at`, `updated_at`)
VALUES
	(2,'Jessika Strosin','+16513834915','9827 Kris Garden Suite 771\nPort Giovannyview, LA 25122','reaktif','2018-11-30','2019-10-18',2,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(3,'Ryann Feeney','+1-210-612-7012','38645 Jarrell Stream Apt. 592\nAngelinechester, OK 78681','sembuh','2012-02-05','2006-02-19',5,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(4,'Geoffrey Brekke','+1 (520) 219-2746','7965 Verda Mount Suite 847\nWest Kaelamouth, ID 55238','meninggal','2004-05-12','1978-05-25',8,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(5,'Lilliana Hegmann','+14845365055','550 Woodrow Corner\nBartonview, SD 29453','sembuh','2023-01-28','2015-07-23',8,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(6,'Amy Bechtelar','+1-636-259-7135','61056 Brent Point\nVincenzobury, OH 65540-8157','sembuh','1982-05-26','2002-01-07',5,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(7,'Ms. Marianna Oberbrunner','+13152282910','3062 Anderson Bypass\nToyland, TN 58027','reaktif','2010-11-29','1986-05-23',8,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(8,'Reggie Harber','+1-616-419-8520','47545 Vanessa Shoal\nEast Chelsey, SC 94837-9944','meninggal','1978-07-05','1974-04-30',2,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(9,'Prof. Gaylord Russel','+1-283-947-7180','127 Elfrieda Burgs\nKendraport, HI 65866-3436','reaktif','2004-10-08','1989-02-06',5,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(10,'Willie Gibson','+1-808-739-2389','996 Beier Tunnel Apt. 089\nSouth Saraichester, CA 07458-6101','reaktif','2008-08-28','2014-05-08',7,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(11,'Prof. Camilla Moen','283-833-6447','70520 Wolff Centers Suite 119\nJohnsstad, NJ 71817','reaktif','1983-11-10','1995-12-13',5,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(12,'Jovanny Schuppe','512.313.2918','61665 Rogers Fall Apt. 111\nPetefort, WA 36808-0847','sembuh','1991-04-12','2015-12-13',7,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(13,'Constance Koss','1-904-677-8566','5245 Dovie Skyway\nMonaport, VT 03076-6684','reaktif','2001-01-25','1996-08-03',2,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(14,'Nelle Wisozk','+1-323-982-3192','30626 Green Valley Apt. 193\nDeangelofurt, UT 17712-7254','sembuh','2008-10-19','1986-09-12',6,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(15,'Estrella Brown','213.267.5311','1265 Nitzsche Run Suite 950\nEast Salma, LA 99584-5319','sembuh','1995-12-26','1974-02-03',4,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(16,'Samara Aufderhar','+1 (308) 233-0347','87425 Eva Green\nPrincessfort, NE 88327','sembuh','1980-03-20','2017-07-04',1,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(17,'Maud Langosh','1-239-873-8398','75400 Kilback Crest Apt. 807\nSigridburgh, NE 49232','sembuh','2009-08-21','1982-01-28',2,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(18,'Dariana Von','+1-364-571-7900','81915 Rath Crossroad Apt. 133\nLake Tristianfurt, NY 59001-9028','meninggal','2004-01-08','2006-02-01',8,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(19,'Wanda Haley','1-308-664-6771','521 Justice Islands\nSwaniawskiland, IA 34824','reaktif','2012-01-05','1992-03-11',9,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(20,'Prof. John Hammes','646-606-8481','609 Stokes Coves\nNew Joseph, FL 43538-0769','reaktif','2003-03-16','1971-06-21',1,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(21,'Gaylord Upton','+1 (520) 715-6479','573 Crystal Mount Apt. 004\nPort Raul, WI 09897','meninggal','1975-01-26','2008-01-10',2,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(22,'Alyson Homenick','+1-757-764-8069','560 Hane Parkways Suite 014\nPort Osborne, WV 26960-8560','meninggal','2010-07-08','1978-02-24',5,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(23,'Fabiola Koepp','564-948-3037','32250 Corkery Stream Apt. 066\nLangoshberg, IN 92965','meninggal','2012-05-15','1987-04-14',2,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(24,'Alessandra Corwin','+1-251-402-1171','9116 Goyette Harbor\nJamisonland, MI 22721','sembuh','1992-03-03','2001-08-11',8,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(25,'Mrs. Genesis Waters II','+1-319-505-5366','35371 Raynor Summit\nLexieview, FL 02170','sembuh','2021-02-08','1975-09-24',2,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(26,'Lori Torphy','1-458-648-1810','29273 Cruickshank Cliffs Suite 981\nConroytown, TX 42635-7006','meninggal','1994-02-23','1989-12-12',6,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(27,'Terry Mayert','505-896-9067','260 Weber Lock Apt. 859\nNew Westonfort, LA 11115-7492','reaktif','1994-09-10','2020-10-07',2,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(28,'Ms. Cara Torphy','949.725.0736','8445 Lysanne Tunnel Suite 050\nNelsborough, TN 77176-0969','sembuh','1990-07-20','2008-03-31',1,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(29,'Dr. Amari Hessel','(516) 330-8737','49463 Jacobs Drives Apt. 301\nPort Missouri, MA 21506-7238','reaktif','2022-07-25','2009-08-11',1,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(30,'Loyce Bednar IV','954.396.1460','34766 Ledner Unions Apt. 520\nKacieside, CT 22661-5275','reaktif','1982-06-08','1975-11-17',7,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(31,'Prof. Nicholaus Zemlak','628-613-4838','2735 Alfonzo Garden\nNorth Tracyland, TN 17206-3962','reaktif','1978-09-12','1988-03-03',1,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(32,'Else Auer','(775) 340-0781','43522 Myrtle Landing Apt. 270\nGottliebland, NC 27086','sembuh','1997-12-21','1990-03-27',5,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(33,'Tabitha Mueller','+1 (440) 577-2344','9353 Shanahan Locks\nGottliebtown, ID 40499-1154','meninggal','2023-09-18','1998-11-04',9,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(34,'Prof. Gideon Lebsack','1-870-300-9846','4660 Gibson Grove Apt. 472\nNorth Mariah, TN 62276-5733','sembuh','1982-07-07','1991-02-15',3,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(35,'Braulio Gleason','+1.380.306.0372','42908 Molly Station Apt. 298\nPort Angelside, CT 03124','sembuh','2012-10-20','1983-10-31',9,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(36,'Esperanza Dickinson','+1-512-359-5708','889 Carolanne Mall Suite 380\nBayerton, MD 03595','meninggal','1981-02-26','1970-09-12',8,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(37,'Glennie Boyer Jr.','1-240-735-9232','183 Sipes Street Suite 654\nSpinkachester, AK 91668','meninggal','1975-06-11','2001-06-16',3,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(38,'Blaise Prohaska','1-239-285-8370','585 Gislason Turnpike\nBoehmhaven, NE 40620-1482','meninggal','1997-11-23','2000-03-12',7,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(39,'Dr. Theron Lesch Sr.','(336) 886-0854','5318 Bartoletti Haven\nLake Gardner, TN 36708','reaktif','1992-01-18','1979-12-02',5,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(40,'Dedrick Daniel','276.541.1735','545 Quentin Manor\nEzekielbury, PA 40863-1139','sembuh','1987-03-23','1980-07-30',8,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(41,'Zoila Doyle','+1-325-592-8691','879 Dakota Parkway Apt. 685\nWest Kiera, IA 62540','reaktif','2010-04-30','2023-11-11',6,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(42,'Lempi Bartoletti Jr.','1-938-388-1317','7104 Ike Spur Apt. 051\nNorth Ivyfurt, ID 00047','reaktif','1982-08-04','2023-07-02',6,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(43,'Hosea Schimmel','+17639654571','22252 Malvina Hill\nNew Jamirton, WA 26101','sembuh','1992-09-26','1982-03-23',4,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(44,'Arno Swaniawski PhD','828.969.5516','4853 Zechariah Harbor\nPort Shanelshire, MA 72899-1126','meninggal','2012-12-01','1992-08-04',7,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(45,'Dr. Charles Jaskolski','(463) 431-5322','73275 Homenick Shoals\nNorth Jessika, CO 72729','meninggal','1992-01-10','2023-01-26',1,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(46,'Pablo Reinger','(562) 976-8774','7720 Bergnaum Hill\nSouth Theodora, WY 35746','reaktif','1973-08-03','2014-09-03',5,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(47,'Tate Brakus V','+18064342018','56061 Kerluke Shore\nLake Jaydenton, VA 75364','reaktif','2006-01-19','1982-06-08',2,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(48,'Jaylon Koss','1-775-478-1128','67011 Zulauf Parkways Suite 617\nMcCulloughmouth, AR 45778-9178','reaktif','2017-04-23','2018-11-19',1,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(49,'Tristin Simonis','219.691.7766','3958 Lily Forks Apt. 758\nNorth Darrin, MT 66605','meninggal','2006-09-17','2020-11-07',1,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(50,'Triston Lueilwitz','1-706-345-0751','1796 Muhammad Hill Suite 045\nEast Maeganshire, NJ 17370-3727','meninggal','2023-01-25','2015-07-03',5,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(51,'Prof. Eloisa Rohan','858-285-5393','344 Haag Radial Apt. 693\nNew Keenanmouth, MS 89431','reaktif','2013-04-23','2001-11-27',5,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(52,'Germaine Parker II','(281) 815-3635','383 Vance Centers Suite 051\nKristofferview, KS 49891-4265','sembuh','1992-08-28','1985-12-14',4,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(53,'Quincy Pfannerstill','+15402363579','2632 Lebsack Dale Suite 686\nNorth Aliciafurt, MI 98773-5698','reaktif','1978-04-07','2006-03-15',6,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(54,'Jadon Feest','361.491.4835','25446 Naomi Villages Suite 260\nEast Vinnieside, NE 73180-0719','meninggal','1975-04-05','1982-02-05',5,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(55,'Max Shields','724.547.6375','4194 Bins Lake\nEast Sigurdberg, MO 92260-1093','meninggal','2000-01-07','1998-04-06',5,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(56,'Tanya Kohler','1-740-892-2086','2816 Crist Circle\nKenyonville, MI 64250-3400','sembuh','1986-07-31','1976-09-09',9,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(57,'Laney Abshire III','1-907-274-3790','580 Keven Key Apt. 453\nPort Londonbury, NY 12797','meninggal','2006-04-25','2020-06-18',9,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(58,'Prof. Mortimer Corwin IV','530.240.3391','8980 Olson Row Apt. 974\nHansmouth, OR 89127-8723','reaktif','1977-09-23','1985-12-18',2,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(59,'Joseph Conroy','908-834-8011','173 Schuster Turnpike Suite 200\nLake Carlottahaven, CA 86262','sembuh','1991-10-14','1986-03-02',7,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(60,'Maxine Cruickshank','562.280.3304','4849 Yost Village Suite 554\nRennermouth, MD 91780-3385','meninggal','1979-04-06','2016-01-17',1,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(61,'Sibyl Monahan','+1-603-509-3185','7525 Satterfield Lakes\nSouth Archport, FL 83295','sembuh','2006-12-23','2006-03-13',4,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(62,'Cathryn Breitenberg','+1.986.370.1692','3329 Fritsch Inlet Apt. 131\nWest Kittytown, DE 33633-1216','sembuh','1992-12-20','1986-07-21',8,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(63,'Nona Huel Jr.','484-634-2511','7225 Crystal Park\nWizamouth, DE 55326','meninggal','1982-07-28','2010-03-23',9,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(64,'Lucas Koss','949-518-9318','972 Goyette Harbor\nSouth Adrianton, NV 84771-3546','reaktif','1974-11-20','1986-06-05',7,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(65,'Jonas Homenick','(207) 751-1997','3257 Helmer Groves\nCleoside, DE 24405','meninggal','2001-10-03','1993-12-20',9,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(66,'Jessika Hermann','+1.620.397.9308','98527 Roma Pines\nNorth Wilfred, AL 89825-4637','sembuh','2010-12-14','1975-06-12',9,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(67,'Ms. Angela Barton PhD','(720) 914-7854','52117 Wyman Route\nSouth Ritaview, MO 17545','reaktif','2022-12-11','2010-09-22',2,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(68,'Sean Homenick PhD','520-967-1485','16998 Cummerata Ways Suite 262\nPort Efrainmouth, NY 87649-7795','reaktif','2019-08-23','1977-09-08',6,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(69,'Miss Pearlie Bechtelar Jr.','1-518-584-7370','580 Ellsworth Via Apt. 785\nWest Bennett, AZ 08821','sembuh','2019-07-27','2020-08-14',4,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(70,'Esther Waters','(413) 287-9893','528 Cordell Motorway Suite 907\nAntoniabury, TX 84801-5960','meninggal','2021-04-02','1979-01-08',6,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(71,'Miss Anjali Wisozk I','(689) 875-4371','494 Becker Heights Suite 600\nGwendolynborough, VA 59988','meninggal','1985-02-12','2004-08-02',7,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(72,'Mrs. Haven Heathcote Jr.','+1-347-628-9299','4966 Marcel Drive Suite 950\nJohannamouth, LA 06185-5140','meninggal','1980-08-02','2013-09-21',3,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(73,'Jovany Koelpin V','+1-563-983-7571','4071 Levi Fords\nWest Moshestad, NM 26840-4816','sembuh','1989-11-25','1994-01-31',1,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(74,'Carissa Ritchie','631.848.5686','38647 Cornelius Rue Apt. 112\nKaylinhaven, WY 77324','sembuh','1981-08-23','1972-01-10',6,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(75,'Hal Corkery','+1.351.761.8623','2556 Brad Pine Apt. 802\nLake Dionfurt, AR 44052-6832','sembuh','1993-09-15','2019-11-14',5,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(76,'Mr. Rosendo Dickinson III','667-575-4810','5819 Balistreri Oval Suite 919\nProhaskahaven, GA 00497','sembuh','2002-03-01','1977-07-24',6,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(77,'Dr. Alfred Hill','863.822.9510','74943 Murazik Orchard Suite 723\nEmardbury, ID 17689','meninggal','1970-01-18','1988-03-03',7,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(78,'Mrs. Meaghan Robel','614.991.7538','513 Greenholt Estate\nPort Robin, IA 39523','sembuh','1975-03-02','1981-03-25',4,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(79,'Meaghan Feeney','(860) 908-1754','974 Chyna Neck Apt. 052\nWisozkborough, RI 11122','meninggal','1994-03-30','1987-04-16',8,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(80,'Americo Wisoky','+1.678.673.0564','959 Jason Extension\nNew Samanta, OR 89878-6172','sembuh','1984-09-30','2011-04-28',6,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(81,'Shanie Kris','(520) 789-4661','8400 Gibson Creek\nDietrichville, DE 07979-7690','meninggal','2012-04-07','2016-02-13',5,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(82,'Mose Bosco','+1-779-910-9086','675 Lindgren Skyway\nPort Adrain, OH 62473-0739','meninggal','1974-10-17','2016-10-28',2,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(83,'Audra Little','+15737364565','60648 Smith Meadow Apt. 377\nPort Enrico, GA 75637','reaktif','1975-08-11','2022-09-24',8,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(84,'Jamal Larson','1-740-564-2190','75430 Jason Mountain Suite 065\nSouth Dillanborough, MO 84897','sembuh','1976-09-18','2002-01-15',4,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(85,'Francisca Oberbrunner','435.790.9059','26017 Izabella Mills Suite 171\nJenningsburgh, AL 13839','reaktif','2019-01-11','2007-02-21',1,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(86,'Mr. Jason Lindgren Jr.','445.203.8252','4902 Maida Coves\nJustynburgh, FL 13289-2927','reaktif','1987-10-04','1987-03-07',3,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(87,'Carissa Kub','+17199937644','39951 Price Rest Suite 759\nLake Arnaldo, DE 53512','reaktif','1972-02-14','2004-05-05',2,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(88,'Miss Karine Abernathy','1-517-841-3425','78683 Miller Meadow Suite 694\nLake Marlon, CO 58845-3572','sembuh','1990-11-01','2004-01-21',9,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(89,'Rene Daniel Sr.','1-223-954-8191','93969 Brian Brooks\nPort Amina, UT 31090','meninggal','2016-05-04','2023-02-21',7,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(90,'Ms. Camille Casper','(681) 351-6717','32790 Huel Crossroad Apt. 957\nSouth Stefaniechester, ND 09256','meninggal','1981-06-29','1978-02-21',8,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(91,'Marcellus Wunsch','272.454.1405','41810 Crona Springs Suite 700\nNorth Ceciliastad, OH 12559','sembuh','1986-07-06','1971-10-08',7,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(92,'Bradly Schamberger','1-567-325-7523','9010 Nitzsche Way\nLake Skylarhaven, AR 90004','sembuh','2011-10-28','2000-04-19',1,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(93,'Schuyler Lebsack','1-609-360-8439','8639 Ayden Fords\nAudreyland, MT 21122-9000','reaktif','1996-07-10','2018-10-12',2,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(94,'Ryder Batz','561.490.1466','61150 Stiedemann Port Apt. 925\nLeliastad, NM 30174','sembuh','2017-02-13','2005-10-30',9,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(95,'Cleo Hill','+1-830-885-5355','68318 Elias Village\nKohlerburgh, WV 00276','sembuh','2015-02-23','2005-05-22',8,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(96,'Joelle Smitham','1-281-553-7515','9684 Schaefer Heights\nNorth Lucius, NH 23446-6748','sembuh','2021-06-10','1999-03-23',7,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(97,'Stan Wyman','+12039698803','701 Towne Stream Suite 690\nBeerhaven, AK 43694-7019','sembuh','2002-06-28','1971-11-15',9,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(98,'Herta McClure IV','(575) 467-0272','4432 Adrienne Hill Suite 387\nWest Kirsten, KS 22748','meninggal','2004-09-30','2022-12-31',4,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(99,'Ms. Mozelle Kub I','+1.820.529.4178','5818 Jody Row Apt. 367\nDustinmouth, TX 99677-8322','meninggal','1977-10-08','2005-12-19',4,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(100,'Cornelius Howell','838.905.5551','2658 Cassin Causeway Suite 024\nPort Noemyton, OK 96275-9139','meninggal','1995-09-02','2023-01-22',6,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(101,'Ms. Bernice McLaughlin DVM','947.619.1410','8127 Shaun Inlet Suite 235\nVeronabury, CO 21621-5373','meninggal','2009-07-18','1998-02-28',5,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(102,'Imani Stokes','+15346330435','290 Angie Passage\nNorth Rollinview, ME 95394','meninggal','2018-03-11','1978-08-16',6,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(103,'Shanna Nikolaus','1-938-476-6374','464 Nicolas Knolls\nGrahamshire, AK 32689','sembuh','2004-07-11','1993-12-02',1,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(104,'Sunny Cole','+1-754-736-9002','635 Margie Spur Apt. 823\nPort Mercedesborough, CO 74136','meninggal','2022-11-21','1989-07-18',6,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(105,'Prof. Esta Homenick IV','(360) 726-5782','631 Melissa Tunnel Apt. 775\nKossmouth, DE 59707-5220','reaktif','1972-10-25','2002-01-17',1,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(106,'Edyth Hand','205-894-6090','3649 Leanna Cove\nPort Velvafort, OK 22809','sembuh','2015-10-05','2017-06-11',4,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(107,'Brenda Tremblay DDS','1-757-832-5003','79261 Hammes Row Suite 844\nLoniebury, IA 79116-0361','reaktif','1976-08-02','1995-11-26',5,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(108,'Oceane Senger','+12168490081','587 Darryl Groves Apt. 603\nSouth Cortez, DE 82791-4742','reaktif','2008-10-02','2002-02-16',6,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(109,'Prof. Benny Rutherford DVM','+1-718-870-7498','280 Ullrich Mountain Suite 932\nMonteton, LA 62094-7253','reaktif','1977-09-20','2023-06-13',6,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(110,'Kareem Runolfsdottir','1-936-617-7697','1335 Frederic Square Suite 374\nDibbertstad, NV 05095-3980','reaktif','2000-06-10','2004-11-20',3,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(111,'Santina Mohr','+1-910-532-7458','3160 Kirlin Pine Apt. 862\nJoliechester, AK 24238-9938','reaktif','1984-07-13','1982-04-21',1,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(112,'Dr. Gerson Emard IV','318.389.2056','821 Josiah Road Apt. 483\nNew Jessica, IL 39743-6620','meninggal','1973-04-26','1989-08-17',6,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(113,'Tamara Lindgren','+1-330-266-7679','87982 Zulauf View Apt. 313\nWest Kaitlynmouth, KS 22728','reaktif','1979-06-22','2010-05-05',4,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(114,'Mrs. Dahlia Smitham V','971.963.5170','5356 Leola Mews\nNew Jakobville, RI 22585','reaktif','1999-09-01','1986-06-28',7,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(115,'Zackery Rosenbaum','+1.315.710.8483','83244 Price Road Suite 934\nMartinamouth, NC 62947-0173','meninggal','1976-05-27','1991-06-27',9,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(116,'Prof. Eve Bayer DVM','(380) 623-4538','260 Carolyne Shore Suite 826\nRunolfsdottirton, IA 06580-4764','meninggal','1983-05-30','2016-05-31',8,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(117,'Alycia Moen','(726) 981-3211','140 Romaguera Lane Apt. 130\nMarquardthaven, DE 41872-9517','reaktif','2006-12-19','2004-05-29',1,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(118,'Miss Chaya Reynolds Jr.','+1-724-681-1106','113 Kshlerin Flats Suite 110\nLake Katelynnhaven, CT 88759-6380','sembuh','1995-02-09','1970-01-08',6,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(119,'Destiny Bosco','+1-507-547-8276','461 Bergstrom Wall Suite 268\nWest Jazmynetown, ME 92497','sembuh','1974-04-18','2002-10-07',1,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(120,'Elisabeth Jacobs V','+1.716.705.4797','24740 Else Coves\nDachton, IL 00764','reaktif','2001-07-09','1986-01-20',7,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(121,'Nolan Maggio','907-928-7453','780 Fausto Viaduct\nSimonismouth, DC 25347-0139','meninggal','1979-05-31','2012-12-18',1,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(122,'Keyshawn Hoeger','+14237911969','651 Beier Forks\nNorth Seamustown, VA 36159-1875','sembuh','2010-05-29','2020-08-02',8,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(123,'Prof. Gardner Huel PhD','(754) 937-3228','34318 Blick Shoals Apt. 694\nLake Judsonport, WV 99273','sembuh','2009-12-01','2016-01-12',1,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(124,'Kiana Schamberger','+15089252267','822 Destini Pine Suite 548\nBartolettimouth, PA 45066-8293','reaktif','1971-09-04','1993-12-13',1,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(125,'Taryn Hauck II','(201) 445-1562','53986 Adele Crossroad Apt. 175\nFabianshire, CA 16332-1646','sembuh','2020-04-16','2009-07-30',4,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(126,'Ottis Witting','341-890-1736','44697 Aufderhar Expressway\nEast Jovanside, IN 67538-0864','sembuh','1991-07-18','1973-09-27',9,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(127,'Kennith Runte','(618) 455-5261','10948 Margarita Falls Apt. 638\nPort Royal, IA 12164-1328','sembuh','2000-07-01','1984-10-13',2,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(128,'Mr. Jovan Kozey IV','1-786-387-4438','5701 Larson Turnpike Apt. 385\nMoriahmouth, FL 03496-4669','sembuh','2001-07-23','1976-04-20',3,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(129,'Mr. Tillman O\'Hara','669-902-5220','8131 Aurelia Plaza Apt. 133\nFaytown, CO 00377','sembuh','1991-02-21','1999-02-09',3,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(130,'Kyleigh Hackett','+1-980-300-2087','598 Mohr Orchard\nRoelport, WI 52444','sembuh','2005-06-02','1996-04-16',3,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(131,'Benny Padberg','949.554.0960','9190 Oral Mills Apt. 422\nDionfort, SC 67760','meninggal','1978-11-09','2021-03-23',2,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(132,'Eldridge Hintz III','+1-585-531-2222','1604 Corwin Way Apt. 438\nWeissnattown, VT 45996-0859','sembuh','2015-02-21','1989-11-25',4,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(133,'Aaron Hauck','+1-360-424-0506','74373 Piper Village\nWildermanchester, DE 98092-9718','meninggal','2009-12-11','1984-03-29',8,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(134,'Jacky Bode','757-382-6120','74467 Bertrand Lock\nWest Brycen, UT 19445-6904','sembuh','1977-03-05','1988-02-11',6,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(135,'Maribel Sawayn','1-830-783-5346','418 Willms Ridge Suite 076\nWhiteview, OR 17519-4810','reaktif','1973-02-06','1999-02-17',8,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(136,'Dr. Chet O\'Keefe MD','+1.248.674.4626','56868 Cartwright Harbors Apt. 051\nZiemannview, IA 29468-9618','sembuh','1984-02-12','1985-09-28',2,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(137,'Blaise Hermiston','573-218-7064','20403 Eda Union\nPort Kearachester, NC 51511-7414','reaktif','2001-06-02','1977-11-05',9,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(138,'Trycia Tillman V','+1-830-428-2240','647 Adams Lodge\nAidaville, MN 00751','reaktif','2002-02-14','1972-07-06',9,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(139,'Melvina Bins','775-607-5538','54722 Gleason Pike\nPort Garrettchester, OH 47753','reaktif','1985-02-21','1991-05-10',7,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(140,'Ariel Langworth','385-490-2553','508 Ortiz Point\nNorth Candace, AL 09183','reaktif','1990-01-18','2016-10-04',8,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(141,'Miss Jaida Hauck IV','+1.305.397.9102','92098 Schamberger Court\nRoobton, NJ 09523','meninggal','2020-09-19','2010-10-07',8,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(142,'Liam Johnston','+16416145442','120 Maria Alley\nEast Tristinfort, OH 63724','meninggal','1992-06-30','1994-02-12',6,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(143,'Brent Macejkovic','(707) 976-8755','14528 Tania Brook\nWuckertburgh, VT 03568','sembuh','1975-01-25','2003-09-11',7,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(144,'Prof. Cruz Bednar MD','+1-704-874-2053','6212 Zita Crossing\nLaylastad, IN 69076-5362','sembuh','1982-03-10','1998-06-27',3,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(145,'Tristian Dooley DDS','+1 (551) 985-6904','7411 Jacobi Inlet Suite 525\nSchimmelmouth, KS 67801-8578','sembuh','2021-01-07','2018-01-07',6,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(146,'Prof. Emery Bosco Sr.','859.990.5776','539 Carleton Ford Suite 214\nLennyside, IL 85027','reaktif','2011-07-27','2017-06-19',8,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(147,'Veda Kihn','(726) 996-7927','60448 Terry Meadow\nMcGlynnberg, OK 76994-8772','meninggal','1989-09-06','2002-11-01',9,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(148,'Prof. Mohamed Morar III','+1.445.681.7398','5850 Kadin Parks\nImaburgh, AK 45541-9839','meninggal','2012-09-13','2014-04-30',8,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(149,'Max Ankunding','909.844.4864','7683 Jonas Field\nWest Yessenia, NC 72060-0540','reaktif','1976-06-09','1995-03-12',7,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(150,'Alejandrin Bashirian','779.840.3645','21839 Lockman Corners Apt. 059\nLake Clemmie, NC 84258-6648','sembuh','2013-03-01','1971-06-03',3,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(151,'Gianni Bergnaum','+14308168707','49795 Treutel Cliff\nHowellberg, ME 90417-7109','meninggal','1992-05-23','1986-08-25',9,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(152,'Andre Nader','650.428.8896','73504 Little Light Apt. 856\nWest Alayna, NC 30633-4228','reaktif','1987-01-15','1972-11-25',8,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(153,'Janie Hackett','+1-845-889-5223','369 Greg Crest Suite 731\nTrevertown, IN 77845-5160','reaktif','1997-03-27','1977-09-27',1,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(154,'Dr. Dexter Ryan DDS','+19099564796','92254 Hackett Keys Apt. 448\nMayertport, VT 87946','reaktif','2009-09-17','2001-09-26',7,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(155,'Lacy Berge','+18032350119','19596 Olga Manor\nNew Osvaldo, OH 84240','reaktif','1996-05-08','2011-01-22',5,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(156,'Jewel Quitzon','518.703.2964','278 Jacobson Groves Suite 482\nNew Derek, AL 33839-9901','sembuh','2014-08-15','2007-02-18',7,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(157,'Onie Schulist','364.869.1630','89434 Magali Flats\nNorth Franciscoborough, IL 14004-2225','reaktif','1995-01-06','1978-02-09',9,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(158,'Mr. Charlie Collins Jr.','(806) 214-5141','7347 Precious Key\nEast Idastad, WA 20719','meninggal','2016-12-24','1978-12-08',8,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(159,'Mr. Austin Smith','916.992.1936','8063 Felipa Hill Apt. 070\nThieltown, PA 00982','meninggal','2022-08-18','1999-05-18',3,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(160,'Princess Hegmann','(279) 862-6969','25130 Haley Loaf Apt. 305\nNew Bettyeberg, NE 64257','sembuh','2004-01-27','2021-11-05',3,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(161,'Shaun Jacobi PhD','+1 (651) 470-5559','9762 West Mount Apt. 097\nWest Michaelaville, DC 51183-3047','sembuh','1984-08-08','1991-10-21',4,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(162,'Mckenna Durgan IV','(620) 271-5484','7822 Yost Curve Suite 831\nCicerohaven, NH 58343','sembuh','2004-04-02','2021-04-25',1,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(163,'Juliet Hayes','1-539-367-9812','143 Nienow Roads\nWest Cornellchester, DE 44166','reaktif','1997-03-25','1993-10-26',7,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(164,'Jamal Boyle','341.839.6597','1146 Gilbert Orchard\nAdolfofurt, MS 36758-8579','meninggal','1993-11-16','2000-11-20',3,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(165,'Curt Jenkins MD','+1-480-772-5866','524 Nolan Trail Apt. 360\nAnkundington, SD 62046','reaktif','2017-11-08','1994-08-27',9,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(166,'Bria Friesen','(351) 493-4959','894 Pfannerstill Flat\nNorth Lexi, ME 72037-8200','reaktif','1976-03-19','1994-10-23',8,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(167,'Lonie Roberts','458.961.4917','4238 Cremin Ramp Apt. 081\nZandershire, NE 69934-0526','sembuh','1989-10-28','1988-10-17',9,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(168,'Elisabeth Kshlerin III','941-568-7495','176 Kling Greens\nSchimmelmouth, ME 30406-1009','sembuh','2014-05-15','2022-01-02',4,9,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(169,'Araceli McKenzie V','1-480-824-2684','4095 Bethany Passage Apt. 554\nEmmystad, NE 46593','sembuh','1986-10-06','2012-08-16',2,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(170,'Dr. Casper Mills','1-463-803-3236','2296 Wyman Rapids\nWest Nola, AK 64621-6136','meninggal','2017-09-23','2022-11-17',2,5,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(171,'Aurelia Smitham','+18632807209','2560 Delfina Fall Apt. 636\nPort Krystel, RI 30942-1916','sembuh','1984-02-01','1991-09-03',8,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(172,'Mateo Fahey','+1-681-451-1187','8089 Clay Cape\nSouth Herminaside, AR 92669','sembuh','2018-08-24','1971-10-17',7,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(173,'Dr. Quentin Klocko','+1.319.224.6545','28737 Metz Land Suite 913\nNorth Rhiannonberg, TX 31230','meninggal','1973-03-04','2016-02-14',2,8,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(174,'Fanny Pollich IV','919-328-5206','49257 Georgette Union Suite 435\nHattieburgh, MN 11853-2024','sembuh','2023-07-22','2000-12-21',6,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(175,'Ilene Roob','843.961.8365','1313 Satterfield Overpass Suite 228\nZiemannville, KS 49250','sembuh','2001-07-07','2005-06-13',4,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(176,'Ismael Langworth','+14699511332','345 Candelario Skyway Suite 908\nLake Javonte, MT 45605-5121','meninggal','1995-07-11','1975-06-11',1,4,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(177,'Deven Conroy','678.204.7667','5500 Roel Parks Apt. 518\nRobynton, VT 41972','sembuh','2000-08-31','2003-02-08',2,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(178,'Mrs. Yesenia Carroll','1-331-530-8972','8073 McLaughlin Parks Suite 633\nSouth Sarai, OR 20082','meninggal','2006-02-28','1994-12-13',2,6,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(179,'Judson Klein DVM','986-363-9926','7359 Waters Ranch Apt. 384\nEast Kiarraport, ID 79002','sembuh','1998-03-27','1978-02-27',2,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(180,'Fern Buckridge','816.359.3119','9609 Freeman Cape\nNienowbury, MI 03853','sembuh','2008-11-04','2015-05-16',2,7,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(181,'Mr. Enid Fahey II','+1 (916) 389-4695','208 Keon Mall Suite 014\nMcCulloughchester, SD 22883','meninggal','2004-11-26','1970-06-19',6,3,'2023-11-17 06:52:50','2023-11-17 06:52:50');

/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`)
VALUES
	(1,'App\\Models\\User',1,'API Token','a49672f093490f92b37788347211ffc49bf907d2d6a8ccedb160417945c35f05','[\"*\"]','2023-11-17 07:03:14',NULL,'2023-11-17 07:01:48','2023-11-17 07:03:14');

/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table provinces
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table regencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `regencies`;

CREATE TABLE `regencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Billy','febry@billiyagi.space','2023-11-17 06:52:50','$2y$12$Nd24f9FrRMiWvsYTB8aeuuXpyzhwy1EvxhQiiwLi9BsJkqZZPyILS','rIXkiEm0E0','2023-11-17 06:52:50','2023-11-17 06:52:50');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vaccination
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vaccination`;

CREATE TABLE `vaccination` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `dose` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vaccination_patient_id_foreign` (`patient_id`),
  CONSTRAINT `vaccination_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `vaccination` WRITE;
/*!40000 ALTER TABLE `vaccination` DISABLE KEYS */;

INSERT INTO `vaccination` (`id`, `patient_id`, `dose`, `created_at`, `updated_at`)
VALUES
	(1,2,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(2,3,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(3,4,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(4,5,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(5,6,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(6,7,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(7,8,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(8,9,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(9,10,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(10,11,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(11,12,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(12,13,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(13,14,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(14,15,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(15,16,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(16,17,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(17,18,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(18,19,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(19,20,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(20,21,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(21,22,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(22,23,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(23,24,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(24,25,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(25,26,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(26,27,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(27,28,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(28,29,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(29,30,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(30,31,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(31,32,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(32,33,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(33,34,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(34,35,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(35,36,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(36,37,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(37,38,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(38,39,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(39,40,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(40,41,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(41,42,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(42,43,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(43,44,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(44,45,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(45,46,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(46,47,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(47,48,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(48,49,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(49,50,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(50,51,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(51,52,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(52,53,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(53,54,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(54,55,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(55,56,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(56,57,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(57,58,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(58,59,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(59,60,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(60,61,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(61,62,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(62,63,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(63,64,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(64,65,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(65,66,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(66,67,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(67,68,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(68,69,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(69,70,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(70,71,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(71,72,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(72,73,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(73,74,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(74,75,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(75,76,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(76,77,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(77,78,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(78,79,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(79,80,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(80,81,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(81,82,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(82,83,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(83,84,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(84,85,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(85,86,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(86,87,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(87,88,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(88,89,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(89,90,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(90,91,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(91,92,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(92,93,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(93,94,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(94,95,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(95,96,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(96,97,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(97,98,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(98,99,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(99,100,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(100,101,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(101,102,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(102,103,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(103,104,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(104,105,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(105,106,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(106,107,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(107,108,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(108,109,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(109,110,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(110,111,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(111,112,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(112,113,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(113,114,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(114,115,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(115,116,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(116,117,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(117,118,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(118,119,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(119,120,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(120,121,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(121,122,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(122,123,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(123,124,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(124,125,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(125,126,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(126,127,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(127,128,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(128,129,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(129,130,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(130,131,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(131,132,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(132,133,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(133,134,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(134,135,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(135,136,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(136,137,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(137,138,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(138,139,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(139,140,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(140,141,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(141,142,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(142,143,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(143,144,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(144,145,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(145,146,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(146,147,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(147,148,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(148,149,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(149,150,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(150,151,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(151,152,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(152,153,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(153,154,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(154,155,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(155,156,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(156,157,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(157,158,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(158,159,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(159,160,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(160,161,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(161,162,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(162,163,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(163,164,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(164,165,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(165,166,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(166,167,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(167,168,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(168,169,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(169,170,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(170,171,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(171,172,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(172,173,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(173,174,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(174,175,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(175,176,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(176,177,3,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(177,178,1,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(178,179,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(179,180,2,'2023-11-17 06:52:50','2023-11-17 06:52:50'),
	(180,181,3,'2023-11-17 06:52:50','2023-11-17 06:52:50');

/*!40000 ALTER TABLE `vaccination` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
