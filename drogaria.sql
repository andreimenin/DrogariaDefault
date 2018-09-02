CREATE DATABASE  IF NOT EXISTS `drogaria` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `drogaria`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: drogaria
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataAbertura` date NOT NULL,
  `dataFechamento` date DEFAULT NULL,
  `valorAbertura` decimal(7,2) NOT NULL,
  `funcionario_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `UK_q0kuq95kkhljs73mfc3cqgiqa` (`dataAbertura`),
  KEY `FK_21rau1s11pi6oiw9o1t6famnu` (`funcionario_codigo`),
  CONSTRAINT `FK_21rau1s11pi6oiw9o1t6famnu` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,'2018-02-01',NULL,120.00,1),(2,'2018-01-30',NULL,111.00,1),(3,'2018-02-06',NULL,120.00,1),(5,'2018-02-07',NULL,120.00,1),(6,'2018-02-22',NULL,333.00,1),(7,'2018-02-08',NULL,413.00,1);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `estado_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_3uxfxu3ar4lpub19hldftpikb` (`estado_codigo`),
  CONSTRAINT `FK_3uxfxu3ar4lpub19hldftpikb` FOREIGN KEY (`estado_codigo`) REFERENCES `estado` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Ourinhos',1),(2,'Bauru',1),(3,'Marília',1),(4,'Botucatu',1);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataCadastro` date NOT NULL,
  `liberado` tinyint(1) NOT NULL,
  `pessoa_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_mobustx1b8qkdhosqdhnog3lq` (`pessoa_codigo`),
  CONSTRAINT `FK_mobustx1b8qkdhosqdhnog3lq` FOREIGN KEY (`pessoa_codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'2018-02-07',1,3),(2,'2018-02-07',0,2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sigla` varchar(2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'SÃO PAULO','SP');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabricante` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (1,'Fabricante AA'),(2,'Fabricante B'),(4,'Fabricante Z');
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `carteiraTrabalho` varchar(15) NOT NULL,
  `dataAdmissao` date NOT NULL,
  `pessoa_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_l9i1mm6ohy2192qfudb90xhc6` (`pessoa_codigo`),
  CONSTRAINT `FK_l9i1mm6ohy2192qfudb90xhc6` FOREIGN KEY (`pessoa_codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'124141241244444','2018-02-06',1),(2,'112414124444444','2018-02-07',2);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `observacoes` varchar(250) DEFAULT NULL,
  `produto_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_mqu402bbqhf0pqy2n6nfxc31n` (`produto_codigo`),
  CONSTRAINT `FK_mqu402bbqhf0pqy2n6nfxc31n` FOREIGN KEY (`produto_codigo`) REFERENCES `produto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemvenda` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantidade` bigint(20) NOT NULL,
  `valorParcial` decimal(5,2) NOT NULL,
  `produto_codigo` bigint(20) NOT NULL,
  `venda_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_afhuh5uapr0pkljm58r86bnof` (`produto_codigo`),
  KEY `FK_34u5r6crbeyi67pm4ptlha46u` (`venda_codigo`),
  CONSTRAINT `FK_34u5r6crbeyi67pm4ptlha46u` FOREIGN KEY (`venda_codigo`) REFERENCES `venda` (`codigo`),
  CONSTRAINT `FK_afhuh5uapr0pkljm58r86bnof` FOREIGN KEY (`produto_codigo`) REFERENCES `produto` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvenda`
--

LOCK TABLES `itemvenda` WRITE;
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` VALUES (1,1,12.00,1,1),(2,1,21.00,2,1),(3,1,2.00,3,1),(4,1,15.00,4,1),(5,3,36.00,1,2),(6,1,15.00,4,2),(7,2,24.00,1,3),(8,1,21.00,2,3),(9,1,12.00,1,4),(10,1,21.00,2,4),(11,1,2.00,3,4),(18,1,15.00,4,7),(19,1,21.00,2,7),(20,1,12.00,1,7),(21,1,12.00,1,8),(23,12,180.00,4,10),(24,7,105.00,4,11);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `caminho` varchar(50) DEFAULT NULL,
  `rotulo` varchar(255) NOT NULL,
  `itensDoMenu_codigo` bigint(20) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `icone` varchar(50) DEFAULT NULL,
  `rendered` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_k1nblxekm0dty0lkdhkxw7k5y` (`itensDoMenu_codigo`),
  CONSTRAINT `FK_k1nblxekm0dty0lkdhkxw7k5y` FOREIGN KEY (`itensDoMenu_codigo`) REFERENCES `menu` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,'Arquivo',NULL,NULL,NULL,NULL),(2,NULL,'Cadastros',NULL,NULL,NULL,NULL),(3,'/pages/deslogar.xhtml','Sair',1,'','ui-icon-close',NULL),(4,'/pages/estados.xhtml','Estado',2,'',NULL,NULL),(5,'/pages/cidades.xhtml','Cidade',2,'',NULL,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacao`
--

DROP TABLE IF EXISTS `movimentacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimentacao` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `horario` datetime NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacao`
--

LOCK TABLES `movimentacao` WRITE;
/*!40000 ALTER TABLE `movimentacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimentacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `bairro` varchar(35) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `numero` varchar(3) NOT NULL,
  `rg` varchar(12) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `cidade_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `UK_gej40f8jfd5efnwlggtpwjloo` (`cpf`),
  UNIQUE KEY `UK_ip6c031cyuplfacn09ca3twtm` (`email`),
  KEY `FK_ru7rwevg7kj864u8vkyo8vbyi` (`cidade_codigo`),
  CONSTRAINT `FK_ru7rwevg7kj864u8vkyo8vbyi` FOREIGN KEY (`cidade_codigo`) REFERENCES `cidade` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'11111111','(11)11111-1111','11.111-111','11111111','111.111.111-11','11111111111111','Andrei','111','11.111.111-1','11111111111111','(11)1111-1111',1),(2,'1111111111111111111111111','(11)11111-1111','12.444-444','11111111111111111','124.214.244-44','1111111111111111111111111111@email.com','Nomecomum','111','12.444.444-4','enfiuewfh','(11)1111-1111',3),(3,'22222222222','(22)22222-2222','22.222-222','2222222222','222.222.222-22','222222222222222','Outronome','222','22.222.222-2','22222222','(22)2222-2222',2),(4,'33333333','(33)33333-3333','33.333-333','333333333333','333.333.333-33','3333333333333','Hhaiueh','333','33.333.333-3','333333','(33)3333-3333',1),(6,'44444444','(44)44444-4444','44.444-444','44444444','444.444.444-44','44444444','4444444','444','44.444.444-4','44444444','(44)4444-4444',1);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `quantidade` bigint(20) NOT NULL,
  `fabricante_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_aeqsm77xcmr8cu4ewjx0bqw6` (`fabricante_codigo`),
  CONSTRAINT `FK_aeqsm77xcmr8cu4ewjx0bqw6` FOREIGN KEY (`fabricante_codigo`) REFERENCES `fabricante` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Produto z',12.00,3,1),(2,'Produto 2',21.00,17,2),(3,'Produto 1',2.00,0,4),(4,'Produto Y',15.00,11,4),(5,'Produto K',31.00,31,4);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `ativo` bit(1) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `pessoa_codigo` bigint(20) NOT NULL,
  `tipoUsuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_s8lrxfgvascltkib6t418n5ef` (`pessoa_codigo`),
  CONSTRAINT `FK_s8lrxfgvascltkib6t418n5ef` FOREIGN KEY (`pessoa_codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (7,'\0','b857eed5c9405c1f2b98048aae506792',4,'GERENTE'),(8,'\0','b857eed5c9405c1f2b98048aae506792',6,'BALCONISTA'),(10,'','11111111',1,'ADMINISTRADOR');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `codigo` bigint(20) NOT NULL AUTO_INCREMENT,
  `horario` time DEFAULT NULL,
  `valorTotal` decimal(5,2) NOT NULL,
  `cliente_codigo` bigint(20) DEFAULT NULL,
  `funcionario_codigo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_5twcbl0srrivgeocts0y19trf` (`funcionario_codigo`),
  KEY `FK_ass4ciu3lp1ipkofx918j7nm7` (`cliente_codigo`),
  CONSTRAINT `FK_5twcbl0srrivgeocts0y19trf` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`),
  CONSTRAINT `FK_ass4ciu3lp1ipkofx918j7nm7` FOREIGN KEY (`cliente_codigo`) REFERENCES `cliente` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,'20:38:40',50.00,1,1),(2,'20:40:32',51.00,1,2),(3,'20:40:52',45.00,1,1),(4,'20:48:31',35.00,1,2),(7,'20:55:35',48.00,1,2),(8,'20:56:53',12.00,NULL,1),(10,'18:48:38',180.00,1,2),(11,'13:48:21',105.00,2,1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_itemvenda`
--

DROP TABLE IF EXISTS `venda_itemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_itemvenda` (
  `Venda_codigo` bigint(20) NOT NULL,
  `itensVenda_codigo` bigint(20) NOT NULL,
  UNIQUE KEY `UK_nhtakxu190khmpdyygh0k0dpr` (`itensVenda_codigo`),
  KEY `FK_r5lheyfur6gf1755045eo8odb` (`Venda_codigo`),
  CONSTRAINT `FK_nhtakxu190khmpdyygh0k0dpr` FOREIGN KEY (`itensVenda_codigo`) REFERENCES `itemvenda` (`codigo`),
  CONSTRAINT `FK_r5lheyfur6gf1755045eo8odb` FOREIGN KEY (`Venda_codigo`) REFERENCES `venda` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_itemvenda`
--

LOCK TABLES `venda_itemvenda` WRITE;
/*!40000 ALTER TABLE `venda_itemvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_itemvenda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-07 17:58:17
