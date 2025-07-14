/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: libreria
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `Id_Adm` int(10) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoP` varchar(50) NOT NULL,
  `ApellidoM` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Adm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `Id_Autor` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Autor`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `autores` VALUES
(1,'J. K. Rowling'),
(2,'Roald Dahi'),
(3,'Stephen King'),
(4,'David Williams'),
(5,'Octavio Paz'),
(6,'Elena Garro'),
(7,'Edgar Allan Poe'),
(8,'Mario Vargas Llosa'),
(9,'Varios (as)');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `Id_Categoria` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categorias` VALUES
(2,'Literatura'),
(3,'Ficción'),
(4,'Consulta'),
(5,'Salud y desarrollo personal'),
(6,'Estilo de vida, deporte y ocio'),
(7,'Infantiles, juveniles y didacticos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `Username` varchar(60) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `ApellidoP` varchar(50) NOT NULL,
  `ApellidoM` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `CodigoPostal` int(10) NOT NULL,
  `Rol` enum('usuario','admin') NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=881906272636180 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `clientes` VALUES
('isaigm2','admin','admin','admin','dfd@gmail.com','$2a$10$RGUQAHyek4DacNd/QI.tCejTaaumBSzB9AlHF8Ka2Jnvx37rhW6WK','ver',1233,'admin',881906272636161),
('isaigm','Isaí','García','Mendoza','isaigm23@gmail.com','','Veracruz',1234,'usuario',881906272636179);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `editoriales`
--

DROP TABLE IF EXISTS `editoriales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoriales` (
  `Id_Editorial` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `editoriales` VALUES
(1,'Letrame Grupo Editorial'),
(2,'Editorial Círculo Rojo'),
(3,'Grijalbo'),
(4,'Arlequín'),
(5,'Salamandra'),
(6,'Loqueleo'),
(7,'Debolsillo'),
(8,'MONTENA'),
(9,'EDICIONES SM'),
(10,'Alfaguara/Infantil'),
(11,'Editorial Porrua');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `Id_Libro` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(1000) NOT NULL,
  `Categoria` int(10) NOT NULL,
  `Autor` int(10) NOT NULL,
  `Anio` varchar(50) NOT NULL,
  `Editorial` int(10) NOT NULL,
  `Cantidad` int(10) NOT NULL,
  `Precio` int(10) NOT NULL,
  `Imagen` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id_Libro`),
  KEY `Categoria` (`Categoria`),
  KEY `Autor` (`Autor`),
  KEY `Editorial` (`Editorial`),
  CONSTRAINT `Libros_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `categorias` (`Id_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Libros_ibfk_2` FOREIGN KEY (`Autor`) REFERENCES `autores` (`Id_Autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Libros_ibfk_3` FOREIGN KEY (`Editorial`) REFERENCES `editoriales` (`Id_Editorial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `libros` VALUES
(1,'Animales fantásticos: Los crímenes de Grindelwald',7,1,'2018',5,50,345,'https://porrua.mx/media/catalog/product/imp/ort/l9788498389081.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(2,'Harry Potter 7 : Harry Potter y las reliquias de la muerte (tapa dura)',7,1,'2008',5,50,435,'https://porrua.mx/media/catalog/product/imp/ort/l9788498381412.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(3,'Harry Potter 6 : Harry Potter y el misterio del príncipe (tapa dura)',7,1,'2006',5,50,435,'https://porrua.mx/media/catalog/product/imp/ort/l9788478889914.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(4,'Harry Potter 5 : Harry Potter y la Orden del Fénix (tapa dura)',7,1,'2004',5,50,490,'https://porrua.mx/media/catalog/product/imp/ort/l9788478887446.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(5,'Harry Potter 2 : Harry Potter y la cámara secreta (tapa dura)',7,1,'2002',5,50,310,'https://porrua.mx/media/catalog/product/imp/ort/l9788478887606.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(6,'Harry Potter 4 : Harry Potter y el cáliz de fuego (tapa dura)',7,1,'2002',5,50,435,'https://porrua.mx/media/catalog/product/imp/ort/l9788478887620.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(7,'Vivir bien la vida',5,1,'2018',5,50,235,'https://porrua.mx/media/catalog/product/imp/ort/l9788498388435.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(8,'Animales fantásticos y dónde encontrarlos',7,1,'2014',5,50,95,'https://porrua.mx/media/catalog/product/imp/ort/l9788498382686.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(9,'Una vacante imprevista',3,1,'2012',5,50,320,'https://porrua.mx/media/catalog/product/imp/ort/l9788498384949.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(10,'Harry Potter 3 : Harry Potter y el prisionero de Azkaban (tapa dura)',7,1,'2002',5,50,350,'https://porrua.mx/media/catalog/product/imp/ort/l9788478887613.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(11,'\r\nSkip to the beginning of the images gallery\r\nHarry Potter 1 : Harry Potter y la piedra filosofal (tapa dura)\r\n',7,1,'2002',5,50,310,'https://porrua.mx/media/catalog/product/imp/ort/l9788478887590.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(12,'UNA VACANTE IMPREVISTA',2,1,'2010',5,50,230,'https://porrua.mx/media/catalog/product/imp/ort/l9788498386912.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(13,'Los mejores relatos de Roald Dahl',7,2,'2017',6,50,175,'https://porrua.mx/media/catalog/product/imp/ort/l9786070133299.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(14,'El gran gigante bonachón',7,2,'2016',10,50,209,'https://porrua.mx/media/catalog/product/imp/ort/l9786073142281.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(15,'Los cretinos',7,2,'2016',10,50,179,'https://porrua.mx/media/catalog/product/imp/ort/l9786073142069.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(16,'James y el melocotón gigante',7,2,'2015',10,50,209,'https://porrua.mx/media/catalog/product/imp/ort/l9786073137218.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(17,'Charlie y el gran ascensor de cristal',2,2,'2015',10,50,209,'https://porrua.mx/media/catalog/product/imp/ort/l9786073137157.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(18,'Las brujas',7,2,'2015',10,50,209,'https://porrua.mx/media/catalog/product/imp/ort/l9786073136563.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(19,'La maravillosa medicina de Jorge',2,2,'2015',10,50,209,'https://porrua.mx/media/catalog/product/imp/ort/l9786073136587.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(21,'Los fantastibulosos mundos de Roald Dahl',2,2,'2016',2,50,485,'https://porrua.mx/media/catalog/product/imp/ort/l9788416773206.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(22,'El Superzorro',7,2,'2015',6,50,145,'https://porrua.mx/media/catalog/product/imp/ort/l9786070128912.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(23,'Matilda',7,2,'2015',6,50,159,'https://porrua.mx/media/catalog/product/imp/ort/l9786070128714.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(24,'La Torre Oscura I: El pistolero',3,3,'2015',7,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786073128520.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(25,'La Torre Oscura IV: Mago y cristal\r\n',3,3,'2015',7,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9786073130219.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(26,'La Torre Oscura V: Lobos del Calla',3,3,'2015',7,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9786073130981.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(27,'La Torre Oscura VI: Canción de Susannah',3,3,'2015',7,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9786073132282.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(28,'La Torre Oscura VII: La Torre Oscura',3,3,'2015',7,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9786073132916.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(29,'Apocalipsis',3,3,'2014',7,50,429,'https://porrua.mx/media/catalog/product/imp/ort/l9786073123860.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(30,'La milla verde',3,3,'2013',1,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786073117302.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(31,'Misery',3,3,'2013',7,50,269,'https://porrua.mx/media/catalog/product/imp/ort/l9786073110037.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(32,'La Torre Oscura II: La llegada de los tres',3,3,'2015',7,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786073128865.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(33,'La Torre Oscura III: Las tierras baldías',3,3,'2015',7,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786071137623.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(34,'El resplandor',3,3,'2014',1,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786073110020.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(35,'Carrie',3,3,'2012',7,50,159,'https://porrua.mx/media/catalog/product/imp/ort/l9786073105507.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(36,'La increíble historia del... monstruo de hielo',7,4,'2019',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073179638.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(37,'La increíble historia de... el papá bandido',7,4,'2018',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073168700.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(38,'La increíble historia de... Los amigos de medianoche',7,4,'2017',8,50,219,'https://porrua.mx/media/catalog/product/imp/ort/l9786073157315.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(39,'La increíble historia del niño de los vestidos',3,4,'2015',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073132107.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(40,'La increíble historia de la dentista diabólica',3,4,'2014',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073123990.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(41,'La increíble historia del niño billonario',3,4,'2014',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073122054.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(42,'La increíble historia de las ratahamburguesas',3,4,'2013',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073119214.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(43,'La increíble historia de... la gran fuga del abuelo',7,4,'2017',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073154468.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(44,'La increíble historia de... mi tía terrible',7,4,'2016',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073149198.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(45,'La increíble historia del señor apestoso',3,4,'2015',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073134347.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(46,'La increíble historia de la abuelita gánster',3,4,'2013',8,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073118569.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(47,'OBRAS COMPLETAS 5 EL PEREGRINO EN SU PATRIA HISTORIA Y POLÍTICA DE MÉXICO',2,5,'2014',9,50,345,'https://porrua.mx/media/catalog/product/imp/ort/l9786071620682.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(48,'OBRAS COMPLETAS 11 OBRA POETICA I',2,5,'2006',9,50,430,'https://porrua.mx/media/catalog/product/imp/ort/l9789681639051.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(49,'Octavio Paz: la dimensión estética del ensayo',2,5,'2004',1,50,350,'https://porrua.mx/media/catalog/product/imp/ort/l9789682325274.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(50,'OBRAS COMPLETAS 6 LOS PRIVILEGIOS DE LA VISTA 1',5,5,'2004',2,50,360,'https://porrua.mx/media/catalog/product/imp/ort/l9789681638955.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(51,'OBRAS COMPLETAS 10 IDEAS Y COSTUMBRES 2 USOS Y SIMBOLOS',2,5,'2004',9,50,389,'https://porrua.mx/media/catalog/product/imp/ort/l9789681639044.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(52,'OBRAS COMPLETAS DE OCTAVIO PAZ 2',2,5,'2003',1,50,389,'https://porrua.mx/media/catalog/product/imp/ort/l9789681638986.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(53,'OBRAS COMPLETAS 13 MISCELANEA 1',2,5,'1999',2,50,371,'https://porrua.mx/media/catalog/product/imp/ort/l9789681657352.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(54,'Octavio Paz: canta y cuenta la higuera',7,5,'2015',2,50,166,'https://porrua.mx/media/catalog/product/imp/ort/l9786072413214.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(55,'LO MEJOR DE OCTAVIO PAZ',5,5,'2014',9,50,99,'https://porrua.mx/media/catalog/product/imp/ort/l9786070720468.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(56,'https://porrua.mx/media/catalog/product/imp/ort/l9786070720468.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525',5,5,'2014',1,50,69,'https://porrua.mx/media/catalog/product/imp/ort/l9786071134868.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(57,'OBRAS COMPLETAS 6 IDEAS Y COSTUMBRES LA LETRA Y EL CETRO USOS Y SÍMBOLOS',2,5,'2014',9,50,435,'https://porrua.mx/media/catalog/product/imp/ort/l9786071621375.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(58,'OBRAS COMPLETAS 7 OBRA POÉTICA',2,5,'2014',2,50,570,'https://porrua.mx/media/catalog/product/imp/ort/l9786071622464.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(59,'OBRAS COMPLETAS 4 GENERACIONES Y SEMBLANZAS DOMINIO MEXICANO',2,5,'2006',1,50,340,'https://porrua.mx/media/catalog/product/imp/ort/l9789681639006.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(60,'OBRAS COMPLETAS 7 LOS PRIVILEGIOS DE LA VISTA 2',6,5,'2006',2,50,335,'https://porrua.mx/media/catalog/product/imp/ort/l9789681638962.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(61,'Poeta con paisaje. Ensayos sobre la vida de Octavio Paz',2,5,'2004',1,50,271,'https://porrua.mx/media/catalog/product/imp/ort/l9789684115750.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(65,'Los recuerdos del porvenir\r\n',3,6,'2019',10,50,350,'https://porrua.mx/media/catalog/product/imp/ort/l9786073183376.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(66,'Reencuentro de personajes',3,6,'2019',7,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9786073183635.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(67,'Cuentos de Edgar Allan Poe',7,7,'2017',9,50,60,'https://porrua.mx/media/catalog/product/imp/ort/l9786070914676.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(68,'\r\nSkip to the beginning of the images gallery\r\nCuentos de Edgar Allan Poe\r\n',7,7,'2019',2,50,119,'https://porrua.mx/media/catalog/product/imp/ort/l9786073179430.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(69,'El escarabajo de oro',3,7,'2017',9,50,199,'https://porrua.mx/media/catalog/product/imp/ort/l9786075292168.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(70,'LA CAÍDA DE LA CASA USHER\r\n',3,7,'2013',8,50,220,'https://porrua.mx/media/catalog/product/imp/ort/l9788492840441.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(71,'LA CARTA ROBADA Y OTROS CUENTOS',6,7,'2005',3,50,330,'https://porrua.mx/media/catalog/product/imp/ort/l9789500305730.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(73,'Cuentos de Edgar Allan Poe',7,7,'2015',10,50,218,'https://porrua.mx/media/catalog/product/imp/ort/l9786078414666.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(74,'El entierro prematuro los crímenes de la calle morgue el corazón delator el gato negro el pozo y el péndulo ',3,7,'2014',2,50,155,'https://porrua.mx/media/catalog/product/imp/ort/l9786079250461.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(75,'EL ESCARABAJO DE ORO Y OTROS CUENTOS',3,7,'2010',10,50,297,'https://porrua.mx/media/catalog/product/imp/ort/l9789500397124.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(76,'EL GATO NEGRO Y OTROS CUENTOS',7,7,'2015',2,50,166,'https://porrua.mx/media/catalog/product/imp/ort/l7706894201495.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(77,'LA FILOSOFIA DE LA COMPOSICION EL CUERVO',5,7,'2007',5,50,70,'https://porrua.mx/media/catalog/product/imp/ort/l9789684766341.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(78,'Tiempos recios',3,8,'2019',9,50,349,'https://porrua.mx/media/catalog/product/imp/ort/l9786073184830.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(79,'La casa verde',3,8,'2017',7,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786073150149.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(80,'El héroe discreto',3,8,'2019',10,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9788420419886.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(81,'Cinco esquinas',3,8,'2016',10,50,309,'https://m.media-amazon.com/images/I/81VECN-YDUL._SY466_.jpg'),
(82,'Travesuras de la niña mala',3,8,'2016',10,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9788420419879.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(83,'El hablador',3,8,'2016',7,50,239,'https://porrua.mx/media/catalog/product/imp/ort/l9786073141840.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(84,'La ciudad y los perros',6,8,'2012',10,50,429,'https://porrua.mx/media/catalog/product/imp/ort/l9788420412337.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(85,'La tía julia y el escribidor',3,8,'2010',10,50,359,'https://porrua.mx/media/catalog/product/imp/ort/l9789707703285.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(86,'Pantaleón y las visitadoras',3,8,'2010',10,50,329,'https://porrua.mx/media/catalog/product/imp/ort/l9789707702486.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(87,'Historia de mayta',3,8,'2007',10,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9789707709485.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(88,'Los cuadernos de don Rigoberto',5,8,'2001',7,50,349,'https://porrua.mx/media/catalog/product/imp/ort/l9789681903299.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(89,'El Paraíso en la otra esquina\r\n',3,8,'2017',7,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9786073151085.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(90,'¿Quién mató a Palomino Molero?',3,8,'2017',7,50,168,'https://porrua.mx/media/catalog/product/imp/ort/l9786073143363.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(91,'La guerra del fin del mundo',3,8,'2016',7,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9786073141901.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(92,'La fiesta del chivo',3,8,'2015',10,50,309,'https://porrua.mx/media/catalog/product/imp/ort/l9789681906993.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(93,'El sueño del celta',3,8,'2014',8,50,229,'https://porrua.mx/media/catalog/product/imp/ort/l9786071131553.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(94,'Conversación en La Catedral',3,8,'2005',2,50,409,'https://porrua.mx/media/catalog/product/imp/ort/l9789707702127.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(107,'El alfabeto del corazón\r\n',2,9,'2019',11,50,100,'https://porrua.mx/media/catalog/product/imp/ort/l9786070933240.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(108,'Platero y yo · Trescientos poemas',2,9,'2019',11,50,70,'https://porrua.mx/media/catalog/product/imp/ort/l9789700739557.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(109,'Poesía geométrica',2,9,'2019',11,50,80,'https://porrua.mx/media/catalog/product/imp/ort/l9786070933257.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(110,'Estrategias para elaborar trabajos académicos de licenciatura y posgrado\r\n',4,9,'2019',11,50,200,'https://porrua.mx/media/catalog/product/imp/ort/l9786070933981.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(111,'Diccionario de retórica y poética',4,9,'2018',11,50,299,'https://porrua.mx/media/catalog/product/imp/ort/l9789700767680.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(112,'Los archivos públicos su organización y conservación',4,9,'2014',11,50,90,'https://porrua.mx/media/catalog/product/imp/ort/l9789700764146.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(113,'Normas de estilo bibliográfico',4,9,'2011',11,50,160,'https://porrua.mx/media/catalog/product/imp/ort/l9786070905377.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(114,'Impresores y editores de independencia de México 1808-1821 Diccionario',4,9,'2010',11,50,240,'https://porrua.mx/media/catalog/product/imp/ort/l9786070903830.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(115,'Impresores y editores de independencia 1808-1821. Diccionario',4,9,'2010',11,50,300,'https://porrua.mx/media/catalog/product/imp/ort/l9789999151863.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(116,'La organización de los expedientes públicos',4,9,'2008',11,50,110,'https://porrua.mx/media/catalog/product/imp/ort/l9786079000028.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(117,'Refranes populares de México\r\n',4,9,'2006',11,50,75,'https://porrua.mx/media/catalog/product/imp/ort/l9789700762760.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(118,'La investigación científica',4,9,'2005',11,50,75,'https://porrua.mx/media/catalog/product/imp/ort/l9789700760889.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(119,'Refranes y aforismos mexicanos',4,9,'2004',11,50,80,'https://porrua.mx/media/catalog/product/imp/ort/l9789700745381.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(120,'Diccionario médico homeopático ilustrado',4,9,'2002',11,50,230,'https://porrua.mx/media/catalog/product/imp/ort/l9789700731186.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(121,'Enciclopedia mundial de lemas publicitarios 1-2',4,9,'2000',11,50,1500,'https://porrua.mx/media/catalog/product/imp/ort/l9789700725543.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(122,'Materia médica homeopática',5,9,'2019',11,50,270,'https://porrua.mx/media/catalog/product/imp/ort/l9789700761015.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(124,'Reprogramando a tu genio interior',5,9,'2019',11,50,260,'https://porrua.mx/media/catalog/product/imp/ort/l9786070934704.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(125,'Despierta a tu diosa interior',5,9,'2017',11,50,170,'https://porrua.mx/media/catalog/product/imp/ort/l9786070924590.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(126,'Tu obra maestra',5,9,'2017',11,50,120,'https://porrua.mx/media/catalog/product/imp/ort/l9786070925504.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(127,'El poder de la palabra',5,9,'2017',11,50,70,'https://porrua.mx/media/catalog/product/imp/ort/l9786070927065.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(128,'Libro Agenda 2018 Año del Perro de Tierra',5,9,'2017',11,50,288,'https://porrua.mx/media/catalog/product/imp/ort/l9789999186445.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(129,'La Practica de la Homeopatía',5,9,'2015',11,50,180,'https://porrua.mx/media/catalog/product/imp/ort/l9789700765983.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(130,'De buen humor producimos mejor',5,9,'2015',11,50,165,'https://porrua.mx/media/catalog/product/imp/ort/l9786070920509.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(131,'Tu mejor imagen frente al cáncer',5,9,'2014',11,50,230,'https://porrua.mx/media/catalog/product/imp/ort/l9786070916304.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(132,'Compendio de terapéutica homeopática',5,9,'2013',11,50,190,'https://porrua.mx/media/catalog/product/imp/ort/l9789700749488.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(133,'Sabiduría para tiempos difíciles',5,9,'2013',11,50,190,'https://porrua.mx/media/catalog/product/imp/ort/l9786070913297.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(134,'La oración y la cocina',6,9,'2019',11,50,230,'https://porrua.mx/media/catalog/product/imp/ort/l9786070905520.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(135,'Libro-Agenda 2020 Sepan Cuantos',6,9,'2019',11,50,170,'https://porrua.mx/media/catalog/product/imp/ort/l9789999192170.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(136,'Vive mejor',6,9,'2018',11,50,165,'https://porrua.mx/media/catalog/product/imp/ort/l9786070929878.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(137,'Maratón de la Ciudad de México - X',6,9,'2018',11,50,550,'https://porrua.mx/media/catalog/product/imp/ort/l9786070930447.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(138,'La cocina en la ruta de las misiones de fray Junípero Serra',6,9,'2017',11,50,160,'https://porrua.mx/media/catalog/product/imp/ort/l9786070925191.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(139,'Etiqueta en la mesa',6,9,'2016',11,50,250,'https://porrua.mx/media/catalog/product/imp/ort/l9786070925061.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(140,'Huellas de la vida un viaje por la historia de nuestro planeta',6,9,'2009',11,50,185,'https://m.media-amazon.com/images/I/91AaazlN0DL._SL1500_.jpg'),
(141,'¿Quién dijo pomodoro?',6,9,'2007',11,50,120,'https://porrua.mx/media/catalog/product/imp/ort/l9789700775159.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(142,'Mi gimnasio exprés',6,9,'2020',9,50,165,'https://porrua.mx/media/catalog/product/imp/ort/l9786077444923.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(144,'El papá de los tres cerditos + licencia Loran',7,9,'2016',9,50,186,'https://porrua.mx/media/catalog/product/imp/ort/l9786072422391.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(145,'La abuela Filomena',7,9,'2016',9,50,186,'https://porrua.mx/media/catalog/product/imp/ort/l9786072420533.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(146,'Cuando papá y mamá estaban juntos',7,9,'2016',9,50,133,'https://porrua.mx/media/catalog/product/imp/ort/l9786072421769.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(147,'Renata y la fábrica de juguetes',7,9,'2016',9,50,154,'https://porrua.mx/media/catalog/product/imp/ort/l9786072421745.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(148,'Mozart, el niño genio',7,9,'2016',9,50,196,'https://porrua.mx/media/catalog/product/imp/ort/l9786072422582.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(149,'Manual para corregir adultos malcriados + licencia Loran',2,9,'2016',9,50,196,'https://porrua.mx/media/catalog/product/imp/ort/l9786072421660.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(150,'¡Ahora somos cuatro!',7,9,'2019',6,50,129,'http://www.librerialeon.com.mx/imagenes/9786070/978607014088.GIF'),
(151,'\r\nSkip to the beginning of the images gallery\r\nEl juego del laberinto\r\n',6,9,'2019',6,50,149,'https://porrua.mx/media/catalog/product/imp/ort/l9786070140839.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(152,'El perro del poeta\r\n',7,9,'2019',6,50,149,'https://porrua.mx/media/catalog/product/imp/ort/l9786070141379.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(153,'La casa maldita',6,9,'2019',6,50,139,'https://porrua.mx/media/catalog/product/imp/ort/l9786070133312.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(154,'Mujeres en el deporte',6,9,'2019',6,50,149,'https://porrua.mx/media/catalog/product/imp/ort/l9786070140846.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(155,'Estimado señor M.',3,9,'2016',5,50,395,'https://porrua.mx/media/catalog/product/imp/ort/l9788498387254.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(156,'Si decido quedarme (Nueva edición)',3,9,'2016',5,50,295,'https://porrua.mx/media/catalog/product/imp/ort/l9788416555024.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(157,'Lo que fue de ella (Nueva edición)',3,9,'2016',5,50,295,'https://porrua.mx/media/catalog/product/imp/ort/l9788416555031.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(158,'Listas memorables',2,9,'2015',5,50,580,'https://porrua.mx/media/catalog/product/imp/ort/l9788498387179.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(159,'Percy Jackson y los Dioses del Olimpo 2 : El Mar de los monstruos (Novela gráfica) Rústica',7,9,'2015',5,50,275,'https://porrua.mx/media/catalog/product/imp/ort/l9788498387193.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(160,'Infinity Drake. Los hijos del scarlatti\r\n',7,9,'2015',5,50,265,'https://porrua.mx/media/catalog/product/imp/ort/l9788498386752.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(161,'Y tú no regresaste',3,9,'2015',5,50,265,'https://porrua.mx/media/catalog/product/imp/ort/l9788498387117.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(162,'Aquí',3,9,'2015',5,50,590,'https://porrua.mx/media/catalog/product/imp/ort/l9788416131167.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(163,'Cementerio de pianos',3,9,'2018',4,50,269,'https://porrua.mx/media/catalog/product/imp/ort/l9786078338955.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(164,'Contratiempo\r\n',3,9,'2018',4,50,189,'https://porrua.mx/media/catalog/product/imp/ort/l9786078627011.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(165,'Libro',3,9,'2018',4,50,269,'https://porrua.mx/media/catalog/product/imp/ort/l9786078338979.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(166,'Extraño oficio',3,9,'2018',4,50,214,'https://porrua.mx/media/catalog/product/imp/ort/l9786078627059.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(167,'Carnaval Brutal',3,9,'2019',4,50,294,'https://porrua.mx/media/catalog/product/imp/ort/l9786078627127.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(168,'El fiel difunto',3,9,'2017',4,50,239,'https://porrua.mx/media/catalog/product/imp/ort/l9786078627073.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(169,'Todos y cada uno',6,9,'2018',4,50,149,'https://m.media-amazon.com/images/I/518BjategbL._SY445_SX342_.jpg'),
(171,'MANUAL DE ERRORES LINGUISTICOS',4,9,'2018',3,50,327,'https://porrua.mx/media/catalog/product/imp/ort/l9788480632256.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(172,'TEXTOS EXPOSITIVO EXPLICATIVOS Y ARGUMENTATIVOS',4,9,'2018',3,50,269,'https://porrua.mx/media/catalog/product/imp/ort/l9788480634663.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(173,'TEXTOS INFORMATIVOS BREVES Y CLAROS',4,9,'2018',3,50,327,'https://porrua.mx/media/catalog/product/imp/ort/l9788480636223.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(174,'COMO HACER UN TRABAJO ESCRITO\r\n',4,9,'2019',3,50,269,'https://porrua.mx/media/catalog/product/imp/ort/l9788480630597.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(175,'SOCIEDAD Y CULTURA EN LA FRANCIA MODERNA',4,9,'2018',3,50,200,'https://porrua.mx/media/catalog/product/imp/ort/l9788474235777.jpg?quality=80&bg-color=255,255,255&height=525&width=350&canvas=350:525'),
(178,'Bajada a la amarga esperanza',3,9,'2018',3,50,75,'https://m.media-amazon.com/images/I/51b4f4AYh4L._SY445_SX342_.jpg'),
(180,'Universo infinito',6,9,'2017',3,50,125,'https://m.media-amazon.com/images/I/71vP9OdfNPL._SL1265_.jpg'),
(181,'Transparente',5,9,'2018',2,50,75,'https://m.media-amazon.com/images/I/51PB0hWESsL._SY445_SX342_.jpg'),
(182,'El borrador (epub)',6,9,'2018',2,50,75,'https://m.media-amazon.com/images/I/51GWE88wkeL._SY445_SX342_.jpg'),
(183,'Orfandades del ser',5,9,'2020',2,50,75,'https://m.media-amazon.com/images/I/31CFWfF-QZL._SY445_SX342_.jpg'),
(184,'Poetry for our being',5,9,'2020',2,50,75,'https://m.media-amazon.com/images/I/61zNqHiAz6L._SY425_.jpg'),
(185,'Ciudad soledad',3,9,'2020',2,50,125,'https://m.media-amazon.com/images/I/51fCg0m3bkL._SY445_SX342_.jpg'),
(186,'Conexión ADN frontal. 2ª Edición (epub)',5,9,'2020',2,50,75,'https://m.media-amazon.com/images/I/412BJnr0w6L._SY445_SX342_.jpg'),
(187,'El puente',3,9,'2020',2,50,75,'https://m.media-amazon.com/images/I/61KToGQlSPS._SY425_.jpg'),
(189,'Sigo estando aquí',5,9,'2018',1,50,109,'https://m.media-amazon.com/images/I/518bwT8F2mL._SY445_SX342_.jpg'),
(190,'Nakerland',3,9,'2018',1,50,139,'https://m.media-amazon.com/images/I/41n4KzC0aEL._SY445_SX342_.jpg'),
(191,'Cómo conquistar el mundo',6,9,'2019',1,50,139,'https://m.media-amazon.com/images/I/61JZY647jNL._SY466_.jpg');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `remates`
--

DROP TABLE IF EXISTS `remates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `remates` (
  `Id_Remate` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Remate` varchar(100) NOT NULL,
  `Precio` int(3) NOT NULL,
  `Cantidad` int(3) NOT NULL,
  `Imagen` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id_Remate`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remates`
--

LOCK TABLES `remates` WRITE;
/*!40000 ALTER TABLE `remates` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `remates` VALUES
(1,'Lápiz lanza agua ',90,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190275.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(2,'Plumas glitter ',30,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190343.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(3,'Sellos emoji ',45,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190381.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(4,'Pinta pez ',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190114.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(5,'Pintar avión ',80,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190107.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(6,'Pintar mariposa',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190121.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(7,'Pintar tortuga ',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190138.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(8,'Pintar Santa ',60,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190145.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(9,'IQ Puzzles metal ',60,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190152.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(10,'Rompecabezas selva ',65,30,'https://porrua.mx/media/catalog/product/l/9/l9789999189798.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(11,'Rompecabezas granja ',65,30,'https://porrua.mx/media/catalog/product/l/9/l9789999189804.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(12,'Diseños fascinantes 56 piezas ',60,30,'https://porrua.mx/media/catalog/product/l/9/l9789999184861.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(13,'Juego de fichas derribando ',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999184878.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(14,'Juego de decoración de princessa ',90,30,'https://porrua.mx/media/catalog/product/l/9/l9789999184991.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(15,'Cuaderno de dibujo con pluma mágica ',44,30,'https://porrua.mx/media/catalog/product/l/9/l9789999185059.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(16,'Aprendiendo a escribir ',50,30,'https://porrua.mx/media/catalog/product/l/9/l9789999185219.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(17,'Plumas en forma de pizza ',45,30,'https://porrua.mx/media/catalog/product/l/9/l9789999185233.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(18,'Mini jenga de colores ',76,30,'https://porrua.mx/media/catalog/product/l/9/l9789999185318.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(19,'Mi primer reloj ',55,30,'https://porrua.mx/media/catalog/product/l/9/l9789999175944.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(20,'Kuhapilis níquel abundancia ',30,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850109.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(21,'Kuhapilis níquel salud ',30,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850116.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(22,'Kuhapilis cerámica amor',30,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850017.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(23,'Kuhapilis cerámica dinero ',50,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850062.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(24,'Kuhapilis cerámica abundancia ',50,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850031.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(25,'Kuhapilis cerámica salud ',50,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850048.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(26,'Kuhapilis cerámica suerte ',50,30,'https://porrua.mx/media/catalog/product/l/7/l7502232850024.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(27,'Pluma de forma de coche ',35,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190237.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(28,'Sellos ',60,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190374.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(29,'Fósil con insectos ',50,30,'https://porrua.mx/media/catalog/product/l/9/l9789999189866.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(30,'Kit de cerámicas de navidad para pintar ',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190169.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(31,'Mundo zoo que crece en el agua ',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999190183.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(32,'Cuaderno de dibujo con pluma mágica ',44,30,'https://porrua.mx/media/catalog/product/l/9/l9789999185059.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(33,'Plumas en forma de helado varios modelos ',45,30,'https://porrua.mx/media/catalog/product/l/9/l9789999185189.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(34,'Libreta Los Muros Limitan Los Libros Liberan Grande ',99,30,'https://porrua.mx/media/catalog/product/l/9/l9780201319675.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(35,'Bolsa Promocional de la Familia Burrón ',15,30,'https://porrua.mx/media/catalog/product/l/9/l9789999176521.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(36,'Juego de cuentas para hacer pulseras ',75,30,'https://porrua.mx/media/catalog/product/l/9/l9789999177078.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(37,'Rompecabezas encastre transportes ',51,30,'https://porrua.mx/media/catalog/product/l/9/l9789999176064.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(38,'Rompecabezas transportes',51,30,'https://porrua.mx/media/catalog/product/l/9/l9789999176071.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(39,'Rompecabezas chico tren ',26,30,'https://porrua.mx/media/catalog/product/l/9/l9789999176149.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(40,'Separador autoadherible Pumas ',31,30,'https://porrua.mx/media/catalog/product/l/7/l7506187621401.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(41,'Separador autoadherible Cruz Azul ',31,30,'https://porrua.mx/media/catalog/product/l/7/l7506187621371.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(42,'Separador autoadherible Chivas ',31,30,'https://porrua.mx/media/catalog/product/l/7/l7506187621340.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(43,'Rompecabezas el león con 7 piezas ',93,30,'https://porrua.mx/media/catalog/product/l/7/l7501941373992.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(44,'Rompecabezas silueta manzana 6 piezas ',77,30,'https://porrua.mx/media/catalog/product/l/7/l7501941373909.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(45,'Rompecabezas silueta paraguas con 5 piezas ',89,30,'https://porrua.mx/media/catalog/product/l/7/l7501941373930.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(46,'Rompecabezas sabana resaque 9 piezas con perilla ',84,30,'https://porrua.mx/media/catalog/product/l/7/l7501941373718.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(47,'Rompecabezas la familia con 25 piezas ',43,30,'https://porrua.mx/media/catalog/product/l/7/l7501941303876.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(48,'Rompecabezas animales salvajes con 25 piezas ',43,30,'https://porrua.mx/media/catalog/product/l/7/l7501941303838.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(49,'Rompecabezas cuidando las plantas con 25 piezas ',43,30,'https://porrua.mx/media/catalog/product/l/7/l7501941303807.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(50,'Rompecabezas Chiles México 2012 500 Piezas ',99,30,'https://porrua.mx/media/catalog/product/l/9/l9789999165969.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(51,'Separador de Libro Corazón Corazón ',14,30,'https://porrua.mx/media/catalog/product/l/9/l9789999140553.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(52,'Porta Llaves Virgen ',70,30,'https://porrua.mx/media/catalog/product/l/9/l9789999145022.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(53,'2 Rompecabezas descubrimiento de America Conquista de Mexico ',53,30,'https://porrua.mx/media/catalog/product/l/7/l7502241500545.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(54,'Solo para Chicas mi Diario ',99,30,'https://porrua.mx/media/catalog/product/l/7/l7798083700773.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(55,'Mis Notas Solo para Chicas (Block) ',22,30,'https://porrua.mx/media/catalog/product/l/7/l7798083700797.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(56,'Solo para Chicas Mis Notas (Cubo) ',31,30,'https://porrua.mx/media/catalog/product/l/7/l7798083700810.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(57,'Ábaco grande Anáhuac de plástico 100 cuentas ',60,30,'https://porrua.mx/media/catalog/product/l/7/l723.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(58,'Ábaco chico Anáhuac de plástico 50 cuentas ',30,30,'https://porrua.mx/media/catalog/product/l/7/l714.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds');
/*!40000 ALTER TABLE `remates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sessions` VALUES
('AZj1bYogMyGfhTAZY3jr0yNYvDPSWNda',1752605400,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('AyWGBjOzd_I_PNNgUQNok0Q12LK92kkd',1752601244,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"carrito\":{\"carrito_libros\":{},\"carrito_remates\":{},\"carrito_tecnologia\":{}},\"total\":0}'),
('MWSkVj_KqjSVzWkUH6_HkRCzpU7GOnCi',1752607854,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"carrito\":{}}'),
('VO7Jr_Ky-LE-7WS4UjM1INfi584UIz2r',1752606934,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":881906272636179},\"flash\":{},\"carrito\":{\"carrito_libros\":{},\"carrito_remates\":{},\"carrito_tecnologia\":{}}}'),
('jbjrIGo51TuaXXMRnTkH9yD3Ho1Ok8g8',1752607678,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"carrito\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tecnologia`
--

DROP TABLE IF EXISTS `tecnologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnologia` (
  `Id_Tecnologia` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Tec` varchar(60) NOT NULL,
  `Cantidad` int(3) NOT NULL,
  `Precio` int(3) NOT NULL,
  `Imagen` varchar(1000) NOT NULL,
  PRIMARY KEY (`Id_Tecnologia`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnologia`
--

LOCK TABLES `tecnologia` WRITE;
/*!40000 ALTER TABLE `tecnologia` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tecnologia` VALUES
(1,'3D Pen Pro Creativa Lab - Negro ',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52238.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(2,'Kobo Aura H2O Sleep Cover Black ',30,700,'https://porrua.mx/media/catalog/product/l/6/l681495007332.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(3,'3D Maker Kit Jr (pluma azul) ',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52235.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(4,'3D Maker Kit Jr (pluma amarilla)',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52231.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(5,'3D Maker Kit (Pluma Verde) ',30,2700,'https://porrua.mx/media/catalog/product/l/5/l52245.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(6,'3D Maker Kit (Pluma Azul) ',30,2700,'https://porrua.mx/media/catalog/product/l/5/l52244.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(7,'3D Maker Kit (Pluma Blanca) ',30,2700,'https://porrua.mx/media/catalog/product/l/5/l52247.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(8,'3D Maker Kit (Pluma Negra) ',30,2700,'https://porrua.mx/media/catalog/product/l/5/l52246.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(9,'Cable dual USB a Iphone y Micro USB Azul ',30,45,'https://porrua.mx/media/catalog/product/l/B/lBC-2240BL.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(10,'Cable dual USB a Iphone y Micro USB Negro ',30,45,'https://porrua.mx/media/catalog/product/l/B/lBC-2240BK.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(11,'Micro SD Adata con adaptador 16GB ',30,123,'https://porrua.mx/media/catalog/product/l/4/l4718050607051.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(12,'Micro SD Kingston 32 GB SDC 4/32GB ',30,292,'https://porrua.mx/media/catalog/product/l/7/l740617175011.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(13,'Pack de Filamento Claro ',30,500,'https://porrua.mx/media/catalog/product/l/5/l52130.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(14,'Pack de Filamento Obscuros ',30,500,'https://porrua.mx/media/catalog/product/l/5/l52131.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(15,'CreativaKids 3D Pen Blanco ',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52227.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(16,'CreativaKids 3D Pen Negro ',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52228.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(17,'CreativaKids 3D Pen Azul ',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52226.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(18,'CreativaKids 3D Pen Verde ',30,1500,'https://porrua.mx/media/catalog/product/l/5/l52229.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(19,'Media Case Funda para Tablet de 7 ',30,145,'https://porrua.mx/media/catalog/product/l/9/l9789999177672.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(20,'Griffin Survivor Aux Cable Black ',30,360,'https://porrua.mx/media/catalog/product/l/G/lGC36562.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(21,'FUNDA IPAD AIR MOBILITY NEGRO ',30,600,'https://porrua.mx/media/catalog/product/l/O/lOC109BK.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(22,'AMAZON PHONE WALLET ARMY GREEN ',30,150,'https://porrua.mx/media/catalog/product/l/G/lG1230.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(23,'SARAJEVO PHONE WALLET ARMY GREEN ',30,150,'https://porrua.mx/media/catalog/product/l/G/lG1227.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(24,'VISBY PHONE WALLET RED ',30,150,'https://porrua.mx/media/catalog/product/l/G/lG1221.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(25,'SHANGHAI MOBILE BAG ARMY GREEN ',30,150,'https://porrua.mx/media/catalog/product/l/G/lG1196.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(26,'SHANGHAI MOBILE BAG PINK ',30,150,'https://porrua.mx/media/catalog/product/l/G/lG1195.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(27,'BRISTOL MOBILE BAG BLACK ',30,150,'https://porrua.mx/media/catalog/product/l/G/lG1194.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(28,'Memoria USB Homero 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901718.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(29,'Memoria USB El Chavo 2d 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901664.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(30,'Memoria USB Don Cangrejo Etiqueta 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901930.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(31,'Memoria USB Angry Bird Puerco Rey 3d 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901800.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(32,'Memoria USB Angry Bird Negro 3d 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901770.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(33,'Memoria USB Zombie Patito 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293900407.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(34,'Memoria USB Zombie Gris 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293903149.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(35,'Memoria USB Superman 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901541.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(36,'Memoria USB Quico 8 Gb',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901671.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(37,'Memoria USB Mujer Maravilla 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901701.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(38,'Memoria USB Modelo Pil8 ',30,230,'https://porrua.mx/media/catalog/product/l/7/l7506293902579.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(39,'Kobo Libra H20 Sleep Cover Aqua ',30,750,'https://porrua.mx/media/catalog/product/l/6/l681495007844.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(40,'Kobo Clara HD 6\" Sleep Cover Negro ',30,700,'https://porrua.mx/media/catalog/product/l/6/l681495007547.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(41,'Cable dual USB a Iphone y Micro USB Blanco ',30,45,'https://porrua.mx/media/catalog/product/l/B/lBC-2240WH.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(42,'Cable dual USB a Iphone y Micro USB Rojo ',30,45,'https://porrua.mx/media/catalog/product/l/B/lBC-2240RD.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(43,'Soporte Metálico con imán para Smartphone azul ',30,95,'https://porrua.mx/media/catalog/product/l/S/lSTD-1015BL.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(44,'Soporte Metálico con imán para Smartphone rojo ',30,95,'https://porrua.mx/media/catalog/product/l/S/lSTD-1015RD.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(45,'USB Adata 16GB C906 negro ',30,136,'https://porrua.mx/media/catalog/product/l/4/l4718050608911.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(46,'USB Adata 8GB C906 negro ',30,121,'https://porrua.mx/media/catalog/product/l/4/l4718050608904.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(47,'USB Adata 16GB ',30,127,'https://porrua.mx/media/catalog/product/l/4/l4713218463173.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(48,'USB Adata 8GB Tiffany 2.0 ',30,121,'https://porrua.mx/media/catalog/product/l/4/l4713218463159.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(49,'USB Kingston DT50/32 GB',30,295,'https://porrua.mx/media/catalog/product/l/7/l740617255690.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(50,'USB Kingston DT50/16 GB',30,156,'https://porrua.mx/media/catalog/product/l/7/l740617255638.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(51,'USB Kingston DT50/8GB ',30,143,'https://porrua.mx/media/catalog/product/l/7/l740617255577.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(52,'USB Kingston DTIG4/16GB ',30,145,'https://porrua.mx/media/catalog/product/l/7/l740617220452.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(53,'USB Kingston Dtig4/8GB ',30,143,'https://porrua.mx/media/catalog/product/l/7/l740617220445.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(54,'Micro SD Kingston 16GB SDC4/16GB ',30,156,'https://porrua.mx/media/catalog/product/l/7/l740617173741.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(55,'Carrito escalador a control remoto',30,1276,'https://porrua.mx/media/catalog/product/l/5/l5060407524337.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(56,'Mouse en forma de carro Hot Rod ',30,400,'https://porrua.mx/media/catalog/product/l/7/l7502251705930.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(57,'Multi puerto calamar ',30,250,'https://porrua.mx/media/catalog/product/l/7/l7502251708375.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(58,'Mouse en forma de carro racer V2 ',30,400,'https://porrua.mx/media/catalog/product/l/7/l7502251705978.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(59,'Multi puerto Robot Hub ',30,350,'https://porrua.mx/media/catalog/product/l/7/l7502251707224.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(60,'Lagartija robot con sensores',30,1900,'https://porrua.mx/media/catalog/product/l/5/l5060407522883.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(61,'Estación espacial 7 en 1 ',30,1300,'https://porrua.mx/media/catalog/product/l/5/l5060407522326.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(62,'Cable Extra Largo 180 Cms Entrada USB Para Celular Colores A',30,266,'https://porrua.mx/media/catalog/product/l/6/l612615071094.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(63,'Brazo robot ',30,2320,'https://porrua.mx/media/catalog/product/l/5/l5060113893420.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(64,'Set Inteligente de Escritura SWS ',30,6700,'https://porrua.mx/media/catalog/product/l/8/l8055002851152.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(65,'Mini arcadia - Incluye 240 juegos ',30,1671,'https://porrua.mx/media/catalog/product/l/5/l5060407527062.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(66,'Block Light X Ray Blue ',30,430,'https://porrua.mx/media/catalog/product/l/5/l5035393353025.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(67,'Memoria USB Changuito Punk 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293906355.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(68,'Memoria USB Changuito NFL 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293906348.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(69,'Memoria USB Changuito MÃºsico 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293906362.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(70,'Memoria USB Calamardo 3d 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901978.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(71,'Memoria USB Bob Esponja Militar 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901923.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(72,'Memoria USB Patricio 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293900391.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(73,' Memoria USB Modelo Mt3 8 Gb ',30,229,'https://porrua.mx/media/catalog/product/l/7/l7506293902470.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(74,'Memoria USB Modelo Mt1 8 Gb',30,230,'https://porrua.mx/media/catalog/product/l/7/l7506293902463.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(75,'Memoria USB Modelo Cl1 8 Gb ',30,230,'https://porrua.mx/media/catalog/product/l/7/l7506293902449.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(76,'Memoria USB Maggie 2d 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901725.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds'),
(77,'Memoria USB Lisa 8 Gb ',30,273,'https://porrua.mx/media/catalog/product/l/7/l7506293901732.jpg?width=240&height=300&canvas=240:300&quality=80&bg-color=255,255,255&fit=bounds');
/*!40000 ALTER TABLE `tecnologia` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-07-14 13:34:03
