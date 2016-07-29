-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: test_yunmengyanjin
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `addresses_address`
--

DROP TABLE IF EXISTS `addresses_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses_address` (
  `baseaddress_ptr_id` int(11) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`baseaddress_ptr_id`),
  CONSTRAINT `baseaddress_ptr_id_3baf2a4b248c76f7_fk_addresses_baseaddress_id` FOREIGN KEY (`baseaddress_ptr_id`) REFERENCES `addresses_baseaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses_address`
--

LOCK TABLES `addresses_address` WRITE;
/*!40000 ALTER TABLE `addresses_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses_baseaddress`
--

DROP TABLE IF EXISTS `addresses_baseaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses_baseaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `line1` varchar(100) DEFAULT NULL,
  `line2` varchar(100) DEFAULT NULL,
  `zip_code` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_baseaddress_93bfec8a` (`country_id`),
  KEY `addresses_baseaddress_cb24373b` (`customer_id`),
  KEY `addresses_baseaddress_69dfcb07` (`order_id`),
  CONSTRAINT `addresses_baseaddres_order_id_5542e721a01e79f2_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `addresses_baseadd_country_id_43fc49c9c9191dfa_fk_core_country_id` FOREIGN KEY (`country_id`) REFERENCES `core_country` (`id`),
  CONSTRAINT `addresses_b_customer_id_52a7ef0e3f2fb675_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses_baseaddress`
--

LOCK TABLES `addresses_baseaddress` WRITE;
/*!40000 ALTER TABLE `addresses_baseaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses_baseaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add flat page',8,'add_flatpage'),(23,'Can change flat page',8,'change_flatpage'),(24,'Can delete flat page',8,'delete_flatpage'),(25,'Can add redirect',9,'add_redirect'),(26,'Can change redirect',9,'change_redirect'),(27,'Can delete redirect',9,'delete_redirect'),(28,'Can add review',10,'add_review'),(29,'Can change review',10,'change_review'),(30,'Can delete review',10,'delete_review'),(31,'Can add portlet assignment',11,'add_portletassignment'),(32,'Can change portlet assignment',11,'change_portletassignment'),(33,'Can delete portlet assignment',11,'delete_portletassignment'),(34,'Can add portlet blocking',12,'add_portletblocking'),(35,'Can change portlet blocking',12,'change_portletblocking'),(36,'Can delete portlet blocking',12,'delete_portletblocking'),(37,'Can add portlet registration',13,'add_portletregistration'),(38,'Can change portlet registration',13,'change_portletregistration'),(39,'Can delete portlet registration',13,'delete_portletregistration'),(40,'Can add slot',14,'add_slot'),(41,'Can change slot',14,'change_slot'),(42,'Can delete slot',14,'delete_slot'),(43,'Can add base address',15,'add_baseaddress'),(44,'Can change base address',15,'change_baseaddress'),(45,'Can delete base address',15,'delete_baseaddress'),(46,'Can add address',16,'add_address'),(47,'Can change address',16,'change_address'),(48,'Can delete address',16,'delete_address'),(49,'Can add cart',17,'add_cart'),(50,'Can change cart',17,'change_cart'),(51,'Can delete cart',17,'delete_cart'),(52,'Can add cart item',18,'add_cartitem'),(53,'Can change cart item',18,'change_cartitem'),(54,'Can delete cart item',18,'delete_cartitem'),(55,'Can add cart item property value',19,'add_cartitempropertyvalue'),(56,'Can change cart item property value',19,'change_cartitempropertyvalue'),(57,'Can delete cart item property value',19,'delete_cartitempropertyvalue'),(58,'Can add Category',20,'add_category'),(59,'Can change Category',20,'change_category'),(60,'Can delete Category',20,'delete_category'),(61,'Can add product',21,'add_product'),(62,'Can change product',21,'change_product'),(63,'Can delete product',21,'delete_product'),(64,'Can add product accessories',22,'add_productaccessories'),(65,'Can change product accessories',22,'change_productaccessories'),(66,'Can delete product accessories',22,'delete_productaccessories'),(67,'Can add property group',23,'add_propertygroup'),(68,'Can change property group',23,'change_propertygroup'),(69,'Can delete property group',23,'delete_propertygroup'),(70,'Can add property',24,'add_property'),(71,'Can change property',24,'change_property'),(72,'Can delete property',24,'delete_property'),(73,'Can add filter step',25,'add_filterstep'),(74,'Can change filter step',25,'change_filterstep'),(75,'Can delete filter step',25,'delete_filterstep'),(76,'Can add groups properties relation',26,'add_groupspropertiesrelation'),(77,'Can change groups properties relation',26,'change_groupspropertiesrelation'),(78,'Can delete groups properties relation',26,'delete_groupspropertiesrelation'),(79,'Can add products properties relation',27,'add_productspropertiesrelation'),(80,'Can change products properties relation',27,'change_productspropertiesrelation'),(81,'Can delete products properties relation',27,'delete_productspropertiesrelation'),(82,'Can add property option',28,'add_propertyoption'),(83,'Can change property option',28,'change_propertyoption'),(84,'Can delete property option',28,'delete_propertyoption'),(85,'Can add product property value',29,'add_productpropertyvalue'),(86,'Can change product property value',29,'change_productpropertyvalue'),(87,'Can delete product property value',29,'delete_productpropertyvalue'),(88,'Can add image',30,'add_image'),(89,'Can change image',30,'change_image'),(90,'Can delete image',30,'delete_image'),(91,'Can add file',31,'add_file'),(92,'Can change file',31,'change_file'),(93,'Can delete file',31,'delete_file'),(94,'Can add static block',32,'add_staticblock'),(95,'Can change static block',32,'change_staticblock'),(96,'Can delete static block',32,'delete_staticblock'),(97,'Can add delivery time',33,'add_deliverytime'),(98,'Can change delivery time',33,'change_deliverytime'),(99,'Can delete delivery time',33,'delete_deliverytime'),(100,'Can add product attachment',34,'add_productattachment'),(101,'Can change product attachment',34,'change_productattachment'),(102,'Can delete product attachment',34,'delete_productattachment'),(103,'Can add country',35,'add_country'),(104,'Can change country',35,'change_country'),(105,'Can delete country',35,'delete_country'),(106,'Can add action group',36,'add_actiongroup'),(107,'Can change action group',36,'change_actiongroup'),(108,'Can delete action group',36,'delete_actiongroup'),(109,'Can add action',37,'add_action'),(110,'Can change action',37,'change_action'),(111,'Can delete action',37,'delete_action'),(112,'Can add shop',38,'add_shop'),(113,'Can change shop',38,'change_shop'),(114,'Can delete shop',38,'delete_shop'),(115,'Manage shop',38,'manage_shop'),(116,'Can add application',39,'add_application'),(117,'Can change application',39,'change_application'),(118,'Can delete application',39,'delete_application'),(119,'Can add criterion',40,'add_criterion'),(120,'Can change criterion',40,'change_criterion'),(121,'Can delete criterion',40,'delete_criterion'),(122,'Can add cart price criterion',41,'add_cartpricecriterion'),(123,'Can change cart price criterion',41,'change_cartpricecriterion'),(124,'Can delete cart price criterion',41,'delete_cartpricecriterion'),(125,'Can add combined length and girth criterion',42,'add_combinedlengthandgirthcriterion'),(126,'Can change combined length and girth criterion',42,'change_combinedlengthandgirthcriterion'),(127,'Can delete combined length and girth criterion',42,'delete_combinedlengthandgirthcriterion'),(128,'Can add country criterion',43,'add_countrycriterion'),(129,'Can change country criterion',43,'change_countrycriterion'),(130,'Can delete country criterion',43,'delete_countrycriterion'),(131,'Can add height criterion',44,'add_heightcriterion'),(132,'Can change height criterion',44,'change_heightcriterion'),(133,'Can delete height criterion',44,'delete_heightcriterion'),(134,'Can add length criterion',45,'add_lengthcriterion'),(135,'Can change length criterion',45,'change_lengthcriterion'),(136,'Can delete length criterion',45,'delete_lengthcriterion'),(137,'Can add payment method criterion',46,'add_paymentmethodcriterion'),(138,'Can change payment method criterion',46,'change_paymentmethodcriterion'),(139,'Can delete payment method criterion',46,'delete_paymentmethodcriterion'),(140,'Can add shipping method criterion',47,'add_shippingmethodcriterion'),(141,'Can change shipping method criterion',47,'change_shippingmethodcriterion'),(142,'Can delete shipping method criterion',47,'delete_shippingmethodcriterion'),(143,'Can add weight criterion',48,'add_weightcriterion'),(144,'Can change weight criterion',48,'change_weightcriterion'),(145,'Can delete weight criterion',48,'delete_weightcriterion'),(146,'Can add width criterion',49,'add_widthcriterion'),(147,'Can change width criterion',49,'change_widthcriterion'),(148,'Can delete width criterion',49,'delete_widthcriterion'),(149,'Can add customer',50,'add_customer'),(150,'Can change customer',50,'change_customer'),(151,'Can delete customer',50,'delete_customer'),(152,'Can add bank account',51,'add_bankaccount'),(153,'Can change bank account',51,'change_bankaccount'),(154,'Can delete bank account',51,'delete_bankaccount'),(155,'Can add credit card',52,'add_creditcard'),(156,'Can change credit card',52,'change_creditcard'),(157,'Can delete credit card',52,'delete_creditcard'),(158,'Can add customer tax',53,'add_customertax'),(159,'Can change customer tax',53,'change_customertax'),(160,'Can delete customer tax',53,'delete_customertax'),(161,'Can add discount',54,'add_discount'),(162,'Can change discount',54,'change_discount'),(163,'Can delete discount',54,'delete_discount'),(164,'Can add export',55,'add_export'),(165,'Can change export',55,'change_export'),(166,'Can delete export',55,'delete_export'),(167,'Can add script',56,'add_script'),(168,'Can change script',56,'change_script'),(169,'Can delete script',56,'delete_script'),(170,'Can add category option',57,'add_categoryoption'),(171,'Can change category option',57,'change_categoryoption'),(172,'Can delete category option',57,'delete_categoryoption'),(173,'Can add topseller',58,'add_topseller'),(174,'Can change topseller',58,'change_topseller'),(175,'Can delete topseller',58,'delete_topseller'),(176,'Can add product sales',59,'add_productsales'),(177,'Can change product sales',59,'change_productsales'),(178,'Can delete product sales',59,'delete_productsales'),(179,'Can add featured product',60,'add_featuredproduct'),(180,'Can change featured product',60,'change_featuredproduct'),(181,'Can delete featured product',60,'delete_featuredproduct'),(182,'Can add order rating mail',61,'add_orderratingmail'),(183,'Can change order rating mail',61,'change_orderratingmail'),(184,'Can delete order rating mail',61,'delete_orderratingmail'),(185,'Can add manufacturer',62,'add_manufacturer'),(186,'Can change manufacturer',62,'change_manufacturer'),(187,'Can delete manufacturer',62,'delete_manufacturer'),(188,'Can add order',63,'add_order'),(189,'Can change order',63,'change_order'),(190,'Can delete order',63,'delete_order'),(191,'Can add order item',64,'add_orderitem'),(192,'Can change order item',64,'change_orderitem'),(193,'Can delete order item',64,'delete_orderitem'),(194,'Can add order item property value',65,'add_orderitempropertyvalue'),(195,'Can change order item property value',65,'change_orderitempropertyvalue'),(196,'Can delete order item property value',65,'delete_orderitempropertyvalue'),(197,'Can add Order delivery time',66,'add_orderdeliverytime'),(198,'Can change Order delivery time',66,'change_orderdeliverytime'),(199,'Can delete Order delivery time',66,'delete_orderdeliverytime'),(200,'Can add page',67,'add_page'),(201,'Can change page',67,'change_page'),(202,'Can delete page',67,'delete_page'),(203,'Can add payment method',68,'add_paymentmethod'),(204,'Can change payment method',68,'change_paymentmethod'),(205,'Can delete payment method',68,'delete_paymentmethod'),(206,'Can add payment method price',69,'add_paymentmethodprice'),(207,'Can change payment method price',69,'change_paymentmethodprice'),(208,'Can delete payment method price',69,'delete_paymentmethodprice'),(209,'Can add average rating portlet',70,'add_averageratingportlet'),(210,'Can change average rating portlet',70,'change_averageratingportlet'),(211,'Can delete average rating portlet',70,'delete_averageratingportlet'),(212,'Can add cart portlet',71,'add_cartportlet'),(213,'Can change cart portlet',71,'change_cartportlet'),(214,'Can delete cart portlet',71,'delete_cartportlet'),(215,'Can add categories portlet',72,'add_categoriesportlet'),(216,'Can change categories portlet',72,'change_categoriesportlet'),(217,'Can delete categories portlet',72,'delete_categoriesportlet'),(218,'Can add delivery time portlet',73,'add_deliverytimeportlet'),(219,'Can change delivery time portlet',73,'change_deliverytimeportlet'),(220,'Can delete delivery time portlet',73,'delete_deliverytimeportlet'),(221,'Can add pages portlet',74,'add_pagesportlet'),(222,'Can change pages portlet',74,'change_pagesportlet'),(223,'Can delete pages portlet',74,'delete_pagesportlet'),(224,'Can add recent products portlet',75,'add_recentproductsportlet'),(225,'Can change recent products portlet',75,'change_recentproductsportlet'),(226,'Can delete recent products portlet',75,'delete_recentproductsportlet'),(227,'Can add related products portlet',76,'add_relatedproductsportlet'),(228,'Can change related products portlet',76,'change_relatedproductsportlet'),(229,'Can delete related products portlet',76,'delete_relatedproductsportlet'),(230,'Can add text portlet',77,'add_textportlet'),(231,'Can change text portlet',77,'change_textportlet'),(232,'Can delete text portlet',77,'delete_textportlet'),(233,'Can add topseller portlet',78,'add_topsellerportlet'),(234,'Can change topseller portlet',78,'change_topsellerportlet'),(235,'Can delete topseller portlet',78,'delete_topsellerportlet'),(236,'Can add filter portlet',79,'add_filterportlet'),(237,'Can change filter portlet',79,'change_filterportlet'),(238,'Can delete filter portlet',79,'delete_filterportlet'),(239,'Can add forsale portlet',80,'add_forsaleportlet'),(240,'Can change forsale portlet',80,'change_forsaleportlet'),(241,'Can delete forsale portlet',80,'delete_forsaleportlet'),(242,'Can add featured portlet',81,'add_featuredportlet'),(243,'Can change featured portlet',81,'change_featuredportlet'),(244,'Can delete featured portlet',81,'delete_featuredportlet'),(245,'Can add latest portlet',82,'add_latestportlet'),(246,'Can change latest portlet',82,'change_latestportlet'),(247,'Can delete latest portlet',82,'delete_latestportlet'),(248,'Can add shipping method',83,'add_shippingmethod'),(249,'Can change shipping method',83,'change_shippingmethod'),(250,'Can delete shipping method',83,'delete_shippingmethod'),(251,'Can add shipping method price',84,'add_shippingmethodprice'),(252,'Can change shipping method price',84,'change_shippingmethodprice'),(253,'Can delete shipping method price',84,'delete_shippingmethodprice'),(254,'Can add supplier',85,'add_supplier'),(255,'Can change supplier',85,'change_supplier'),(256,'Can delete supplier',85,'delete_supplier'),(257,'Can add tax',86,'add_tax'),(258,'Can change tax',86,'change_tax'),(259,'Can delete tax',86,'delete_tax'),(260,'Can add voucher options',87,'add_voucheroptions'),(261,'Can change voucher options',87,'change_voucheroptions'),(262,'Can delete voucher options',87,'delete_voucheroptions'),(263,'Can add voucher group',88,'add_vouchergroup'),(264,'Can change voucher group',88,'change_vouchergroup'),(265,'Can delete voucher group',88,'delete_vouchergroup'),(266,'Can add voucher',89,'add_voucher'),(267,'Can change voucher',89,'change_voucher'),(268,'Can delete voucher',89,'delete_voucher'),(269,'Can add order number generator',90,'add_ordernumbergenerator'),(270,'Can change order number generator',90,'change_ordernumbergenerator'),(271,'Can delete order number generator',90,'delete_ordernumbergenerator'),(272,'Can add PayPal IPN',91,'add_paypalipn'),(273,'Can change PayPal IPN',91,'change_paypalipn'),(274,'Can delete PayPal IPN',91,'delete_paypalipn'),(275,'Can add PayPal PDT',92,'add_paypalpdt'),(276,'Can change PayPal PDT',92,'change_paypalpdt'),(277,'Can delete PayPal PDT',92,'delete_paypalpdt');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$Am2l40Bn4sUa$zzMzAeTgab5eM5tsPTDFyV46sf24E4gMMPpW6yJJs6w=','2016-05-09 00:18:17',1,'ymyj','','','daniel48@126.com',1,1,'2016-05-09 00:17:53');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(100) NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_user_id_26e59656ec19db37_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cart_cart_user_id_26e59656ec19db37_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartitem`
--

DROP TABLE IF EXISTS `cart_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cartitem_cart_id_1591a08360e8c0b3_fk_cart_cart_id` (`cart_id`),
  KEY `cart_cartitem_product_id_77a53c68ca8495a5_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `cart_cartitem_product_id_77a53c68ca8495a5_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `cart_cartitem_cart_id_1591a08360e8c0b3_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartitem`
--

LOCK TABLES `cart_cartitem` WRITE;
/*!40000 ALTER TABLE `cart_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartitempropertyvalue`
--

DROP TABLE IF EXISTS `cart_cartitempropertyvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cartitempropertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `cart_item_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `property_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cartitemp_cart_item_id_7c0e473dee4f1139_fk_cart_cartitem_id` (`cart_item_id`),
  KEY `cart_cartite_property_id_32d0bc33a40cda6d_fk_catalog_property_id` (`property_id`),
  KEY `c_property_group_id_6943245757f2c477_fk_catalog_propertygroup_id` (`property_group_id`),
  CONSTRAINT `c_property_group_id_6943245757f2c477_fk_catalog_propertygroup_id` FOREIGN KEY (`property_group_id`) REFERENCES `catalog_propertygroup` (`id`),
  CONSTRAINT `cart_cartitemp_cart_item_id_7c0e473dee4f1139_fk_cart_cartitem_id` FOREIGN KEY (`cart_item_id`) REFERENCES `cart_cartitem` (`id`),
  CONSTRAINT `cart_cartite_property_id_32d0bc33a40cda6d_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartitempropertyvalue`
--

LOCK TABLES `cart_cartitempropertyvalue` WRITE;
/*!40000 ALTER TABLE `cart_cartitempropertyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cartitempropertyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category`
--

DROP TABLE IF EXISTS `catalog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `show_all_products` tinyint(1) NOT NULL,
  `short_description` longtext NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `exclude_from_navigation` tinyint(1) NOT NULL,
  `template` smallint(5) unsigned DEFAULT NULL,
  `active_formats` tinyint(1) NOT NULL,
  `product_rows` int(11) NOT NULL,
  `product_cols` int(11) NOT NULL,
  `category_cols` int(11) NOT NULL,
  `meta_title` varchar(100) NOT NULL,
  `meta_keywords` longtext NOT NULL,
  `meta_description` longtext NOT NULL,
  `level` smallint(5) unsigned NOT NULL,
  `uid` varchar(50) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `static_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `uid` (`uid`),
  KEY `catalog_catego_parent_id_58dfaf012cf88d68_fk_catalog_category_id` (`parent_id`),
  KEY `catalog_category_0b071eca` (`static_block_id`),
  CONSTRAINT `catalo_static_block_id_3cede38c5128a32_fk_catalog_staticblock_id` FOREIGN KEY (`static_block_id`) REFERENCES `catalog_staticblock` (`id`),
  CONSTRAINT `catalog_catego_parent_id_58dfaf012cf88d68_fk_catalog_category_id` FOREIGN KEY (`parent_id`) REFERENCES `catalog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category`
--

LOCK TABLES `catalog_category` WRITE;
/*!40000 ALTER TABLE `catalog_category` DISABLE KEYS */;
INSERT INTO `catalog_category` VALUES (1,'testCatalog','testcatalog',1,'<p>short description for testCatalog</p>','<p>description for testCatalog</p>','images/1.jpg',10,0,NULL,0,3,3,3,'<name>','','',1,'81145b59-4044-4062-adbf-4198e0433e80',NULL,NULL);
/*!40000 ALTER TABLE `catalog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_category_products`
--

DROP TABLE IF EXISTS `catalog_category_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_category_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_id` (`category_id`,`product_id`),
  KEY `catalog_catego_product_id_7f3ebf98ad63651e_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `catalog_catego_product_id_7f3ebf98ad63651e_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalog_cate_category_id_4707e3ed51c73048_fk_catalog_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_category_products`
--

LOCK TABLES `catalog_category_products` WRITE;
/*!40000 ALTER TABLE `catalog_category_products` DISABLE KEYS */;
INSERT INTO `catalog_category_products` VALUES (1,1,1);
/*!40000 ALTER TABLE `catalog_category_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_deliverytime`
--

DROP TABLE IF EXISTS `catalog_deliverytime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_deliverytime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` double NOT NULL,
  `max` double NOT NULL,
  `unit` smallint(5) unsigned NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_deliverytime`
--

LOCK TABLES `catalog_deliverytime` WRITE;
/*!40000 ALTER TABLE `catalog_deliverytime` DISABLE KEYS */;
INSERT INTO `catalog_deliverytime` VALUES (1,1,4,2,'<p>description for delivery time</p>');
/*!40000 ALTER TABLE `catalog_deliverytime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_file`
--

DROP TABLE IF EXISTS `catalog_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content_id` int(10) unsigned DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  `description` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catal_content_type_id_7cd4b8845d72b476_fk_django_content_type_id` (`content_type_id`),
  KEY `catalog_file_2dbcba41` (`slug`),
  CONSTRAINT `catal_content_type_id_7cd4b8845d72b476_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_file`
--

LOCK TABLES `catalog_file` WRITE;
/*!40000 ALTER TABLE `catalog_file` DISABLE KEYS */;
INSERT INTO `catalog_file` VALUES (1,'10.jpg','',1,10,'','files/10.jpg',32);
/*!40000 ALTER TABLE `catalog_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_filterstep`
--

DROP TABLE IF EXISTS `catalog_filterstep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_filterstep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` double NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_filterstep_6bb837ff` (`property_id`),
  CONSTRAINT `catalog_filt_property_id_341e43624f3e845b_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_filterstep`
--

LOCK TABLES `catalog_filterstep` WRITE;
/*!40000 ALTER TABLE `catalog_filterstep` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_filterstep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_groupspropertiesrelation`
--

DROP TABLE IF EXISTS `catalog_groupspropertiesrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_groupspropertiesrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_groupspropertiesrelation_group_id_5b569e55b8429236_uniq` (`group_id`,`property_id`),
  KEY `catalog_groupspropertiesrelation_0e939a4f` (`group_id`),
  KEY `catalog_groupspropertiesrelation_6bb837ff` (`property_id`),
  CONSTRAINT `catalog_grou_property_id_674fc49abd26927a_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`),
  CONSTRAINT `catalog_gr_group_id_6a38edb644b316d5_fk_catalog_propertygroup_id` FOREIGN KEY (`group_id`) REFERENCES `catalog_propertygroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_groupspropertiesrelation`
--

LOCK TABLES `catalog_groupspropertiesrelation` WRITE;
/*!40000 ALTER TABLE `catalog_groupspropertiesrelation` DISABLE KEYS */;
INSERT INTO `catalog_groupspropertiesrelation` VALUES (1,10,1,1);
/*!40000 ALTER TABLE `catalog_groupspropertiesrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_image`
--

DROP TABLE IF EXISTS `catalog_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catal_content_type_id_643e9926b9c4eea6_fk_django_content_type_id` (`content_type_id`),
  CONSTRAINT `catal_content_type_id_643e9926b9c4eea6_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_image`
--

LOCK TABLES `catalog_image` WRITE;
/*!40000 ALTER TABLE `catalog_image` DISABLE KEYS */;
INSERT INTO `catalog_image` VALUES (1,1,'3.jpg','images/3.jpg',10,21),(2,1,'2.jpg','images/2.jpg',20,21),(3,1,'7.jpg','images/7.jpg',30,21);
/*!40000 ALTER TABLE `catalog_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product`
--

DROP TABLE IF EXISTS `catalog_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `sku` varchar(30) NOT NULL,
  `price` double NOT NULL,
  `price_calculator` varchar(255) DEFAULT NULL,
  `effective_price` double NOT NULL,
  `price_unit` varchar(20) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `short_description` longtext NOT NULL,
  `description` longtext NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `meta_keywords` longtext NOT NULL,
  `meta_description` longtext NOT NULL,
  `for_sale` tinyint(1) NOT NULL,
  `for_sale_price` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `deliverable` tinyint(1) NOT NULL,
  `manual_delivery_time` tinyint(1) NOT NULL,
  `ordered_at` date DEFAULT NULL,
  `manage_stock_amount` tinyint(1) NOT NULL,
  `stock_amount` double NOT NULL,
  `active_packing_unit` smallint(5) unsigned NOT NULL,
  `packing_unit` double DEFAULT NULL,
  `packing_unit_unit` varchar(30) NOT NULL,
  `weight` double NOT NULL,
  `height` double NOT NULL,
  `length` double NOT NULL,
  `width` double NOT NULL,
  `sub_type` varchar(10) NOT NULL,
  `category_variant` smallint(6) DEFAULT NULL,
  `variants_display_type` int(11) NOT NULL,
  `variant_position` int(11) NOT NULL,
  `active_name` tinyint(1) NOT NULL,
  `active_sku` tinyint(1) NOT NULL,
  `active_short_description` tinyint(1) NOT NULL,
  `active_static_block` tinyint(1) NOT NULL,
  `active_description` tinyint(1) NOT NULL,
  `active_price` tinyint(1) NOT NULL,
  `active_for_sale` smallint(5) unsigned NOT NULL,
  `active_for_sale_price` tinyint(1) NOT NULL,
  `active_images` tinyint(1) NOT NULL,
  `active_related_products` tinyint(1) NOT NULL,
  `active_accessories` tinyint(1) NOT NULL,
  `active_meta_title` tinyint(1) NOT NULL,
  `active_meta_description` tinyint(1) NOT NULL,
  `active_meta_keywords` tinyint(1) NOT NULL,
  `active_dimensions` tinyint(1) NOT NULL,
  `template` smallint(5) unsigned DEFAULT NULL,
  `active_price_calculation` tinyint(1) NOT NULL,
  `price_calculation` varchar(100) NOT NULL,
  `active_base_price` smallint(5) unsigned NOT NULL,
  `base_price_unit` varchar(30) NOT NULL,
  `base_price_amount` double DEFAULT NULL,
  `sku_manufacturer` varchar(100) NOT NULL,
  `type_of_quantity_field` smallint(5) unsigned DEFAULT NULL,
  `uid` varchar(50) NOT NULL,
  `default_variant_id` int(11) DEFAULT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `order_time_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `static_block_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `uid` (`uid`),
  KEY `catalog_product_d21968a8` (`default_variant_id`),
  KEY `catalog_product_f0bc8d5b` (`delivery_time_id`),
  KEY `catalog_product_4d136c4a` (`manufacturer_id`),
  KEY `catalog_product_25d6926f` (`order_time_id`),
  KEY `catalog_product_6be37982` (`parent_id`),
  KEY `catalog_product_0b071eca` (`static_block_id`),
  KEY `catalog_product_c5bcd634` (`supplier_id`),
  KEY `catalog_product_59fc14e7` (`tax_id`),
  CONSTRAINT `catalog_product_tax_id_271863b69c9dee0_fk_tax_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax_tax` (`id`),
  CONSTRAINT `a4b3cd06da105d0982d8c81ed233d722` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer_manufacturer` (`id`),
  CONSTRAINT `catalog_product_parent_id_76205fd2cdd0f27a_fk_catalog_product_id` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalog_pro_supplier_id_7713dd4e3453411c_fk_supplier_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier_supplier` (`id`),
  CONSTRAINT `catalo_default_variant_id_18e2091e40b7045e_fk_catalog_product_id` FOREIGN KEY (`default_variant_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalo_order_time_id_4dd9b8407854a42a_fk_catalog_deliverytime_id` FOREIGN KEY (`order_time_id`) REFERENCES `catalog_deliverytime` (`id`),
  CONSTRAINT `catal_static_block_id_3d1375f9cfb2ab04_fk_catalog_staticblock_id` FOREIGN KEY (`static_block_id`) REFERENCES `catalog_staticblock` (`id`),
  CONSTRAINT `cat_delivery_time_id_71bc698c13e0d783_fk_catalog_deliverytime_id` FOREIGN KEY (`delivery_time_id`) REFERENCES `catalog_deliverytime` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product`
--

LOCK TABLES `catalog_product` WRITE;
/*!40000 ALTER TABLE `catalog_product` DISABLE KEYS */;
INSERT INTO `catalog_product` VALUES (1,'testProduct1','testproduct1','testproduct1',10,'lfs.gross_price.GrossPriceCalculator',9,'m','qm','<p>short description for&nbsp;testProduct1</p>','<p>description for&nbsp;testProduct1</p>','<name>','','',1,9,1,'2016-05-09 00:28:22',1,1,NULL,1,10,1,1,'m',1,2,4,3,'0',NULL,0,999,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,'',0,'',0,'f4035c18-e5a1-4753-8947-ed00b741c97a',NULL,1,1,NULL,NULL,NULL,NULL,1),(2,'testProduct2','testproduct2','testproduct2',20,'lfs.net_price.NetPriceCalculator',20,'m','','<p>short description for&nbsp;testproduct2</p>','<p>description for&nbsp;testproduct2</p>','<name>','','',0,0,1,'2016-05-09 00:30:12',1,0,NULL,0,0,0,NULL,'',0,0,0,0,'0',NULL,0,999,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',0,'',0,'',NULL,'2c4c91cd-4680-4fab-900e-b2e2d1af383a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `catalog_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_product_related_products`
--

DROP TABLE IF EXISTS `catalog_product_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_product_related_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_product_id` int(11) NOT NULL,
  `to_product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_product_id` (`from_product_id`,`to_product_id`),
  KEY `catalog_pro_to_product_id_4ad298847cf2585d_fk_catalog_product_id` (`to_product_id`),
  CONSTRAINT `catalog_pro_to_product_id_4ad298847cf2585d_fk_catalog_product_id` FOREIGN KEY (`to_product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalog_p_from_product_id_5ed5f09d314fa4d6_fk_catalog_product_id` FOREIGN KEY (`from_product_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_product_related_products`
--

LOCK TABLES `catalog_product_related_products` WRITE;
/*!40000 ALTER TABLE `catalog_product_related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_product_related_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_productaccessories`
--

DROP TABLE IF EXISTS `catalog_productaccessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_productaccessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `accessory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_produ_accessory_id_da0b8080ae0349e_fk_catalog_product_id` (`accessory_id`),
  KEY `catalog_produc_product_id_1d03fc9561bfefcd_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `catalog_produc_product_id_1d03fc9561bfefcd_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalog_produ_accessory_id_da0b8080ae0349e_fk_catalog_product_id` FOREIGN KEY (`accessory_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_productaccessories`
--

LOCK TABLES `catalog_productaccessories` WRITE;
/*!40000 ALTER TABLE `catalog_productaccessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_productaccessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_productattachment`
--

DROP TABLE IF EXISTS `catalog_productattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_productattachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `file` varchar(500) NOT NULL,
  `position` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_produc_product_id_14f3fd794fc0cbbd_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `catalog_produc_product_id_14f3fd794fc0cbbd_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_productattachment`
--

LOCK TABLES `catalog_productattachment` WRITE;
/*!40000 ALTER TABLE `catalog_productattachment` DISABLE KEYS */;
INSERT INTO `catalog_productattachment` VALUES (1,'9.jpg','','files/9.jpg',10,1);
/*!40000 ALTER TABLE `catalog_productattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_productpropertyvalue`
--

DROP TABLE IF EXISTS `catalog_productpropertyvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_productpropertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `value` varchar(100) NOT NULL,
  `value_as_float` double DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `property_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_productpropertyvalue_product_id_6446f787a7e481eb_uniq` (`product_id`,`property_id`,`property_group_id`,`value`,`type`),
  KEY `catalog_productpropertyvalue_6bb837ff` (`property_id`),
  KEY `catalog_productpropertyvalue_b72eb5e9` (`property_group_id`),
  CONSTRAINT `c_property_group_id_357cc3679d234722_fk_catalog_propertygroup_id` FOREIGN KEY (`property_group_id`) REFERENCES `catalog_propertygroup` (`id`),
  CONSTRAINT `catalog_produc_product_id_4303dbf8ae64b059_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `catalog_prod_property_id_1b203e350d414274_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_productpropertyvalue`
--

LOCK TABLES `catalog_productpropertyvalue` WRITE;
/*!40000 ALTER TABLE `catalog_productpropertyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_productpropertyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_productspropertiesrelation`
--

DROP TABLE IF EXISTS `catalog_productspropertiesrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_productspropertiesrelation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_productspropertiesrelat_product_id_108acc8754a8467e_uniq` (`product_id`,`property_id`),
  KEY `catalog_productspropertiesrelation_6bb837ff` (`property_id`),
  CONSTRAINT `catalog_prod_property_id_6ada2ad7d6434678_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`),
  CONSTRAINT `catalog_produc_product_id_4a3a84c1bea9da93_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_productspropertiesrelation`
--

LOCK TABLES `catalog_productspropertiesrelation` WRITE;
/*!40000 ALTER TABLE `catalog_productspropertiesrelation` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_productspropertiesrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_property`
--

DROP TABLE IF EXISTS `catalog_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `unit` varchar(15) NOT NULL,
  `display_on_product` tinyint(1) NOT NULL,
  `local` tinyint(1) NOT NULL,
  `variants` tinyint(1) NOT NULL,
  `filterable` tinyint(1) NOT NULL,
  `configurable` tinyint(1) NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `price` double DEFAULT NULL,
  `display_price` tinyint(1) NOT NULL,
  `add_price` tinyint(1) NOT NULL,
  `unit_min` double DEFAULT NULL,
  `unit_max` double DEFAULT NULL,
  `unit_step` double DEFAULT NULL,
  `decimal_places` smallint(5) unsigned NOT NULL,
  `required` tinyint(1) NOT NULL,
  `step_type` smallint(5) unsigned NOT NULL,
  `step` int(11) DEFAULT NULL,
  `uid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_property`
--

LOCK TABLES `catalog_property` WRITE;
/*!40000 ALTER TABLE `catalog_property` DISABLE KEYS */;
INSERT INTO `catalog_property` VALUES (1,'testProperty','testProperty',10,'testUnit',1,0,1,1,1,2,NULL,1,1,NULL,NULL,NULL,0,1,1,NULL,'9cf7a7af-1cda-4d12-8bf8-6e042e986e17');
/*!40000 ALTER TABLE `catalog_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_propertygroup`
--

DROP TABLE IF EXISTS `catalog_propertygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_propertygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `position` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_propertygroup`
--

LOCK TABLES `catalog_propertygroup` WRITE;
/*!40000 ALTER TABLE `catalog_propertygroup` DISABLE KEYS */;
INSERT INTO `catalog_propertygroup` VALUES (1,'testPropertyGroup',1000,'652fb9d4-954c-4173-801c-b470e8c81c6d');
/*!40000 ALTER TABLE `catalog_propertygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_propertygroup_products`
--

DROP TABLE IF EXISTS `catalog_propertygroup_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_propertygroup_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `propertygroup_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `propertygroup_id` (`propertygroup_id`,`product_id`),
  KEY `catalog_proper_product_id_435fa7b244e4e477_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `catalog_proper_product_id_435fa7b244e4e477_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `ca_propertygroup_id_7de0c9831b6d25e6_fk_catalog_propertygroup_id` FOREIGN KEY (`propertygroup_id`) REFERENCES `catalog_propertygroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_propertygroup_products`
--

LOCK TABLES `catalog_propertygroup_products` WRITE;
/*!40000 ALTER TABLE `catalog_propertygroup_products` DISABLE KEYS */;
INSERT INTO `catalog_propertygroup_products` VALUES (1,1,2);
/*!40000 ALTER TABLE `catalog_propertygroup_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_propertyoption`
--

DROP TABLE IF EXISTS `catalog_propertyoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_propertyoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` double DEFAULT NULL,
  `position` int(11) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `catalog_prop_property_id_282ea4dce6b1a6d7_fk_catalog_property_id` (`property_id`),
  CONSTRAINT `catalog_prop_property_id_282ea4dce6b1a6d7_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_propertyoption`
--

LOCK TABLES `catalog_propertyoption` WRITE;
/*!40000 ALTER TABLE `catalog_propertyoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_propertyoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_staticblock`
--

DROP TABLE IF EXISTS `catalog_staticblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog_staticblock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `display_files` tinyint(1) NOT NULL,
  `html` longtext NOT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_staticblock`
--

LOCK TABLES `catalog_staticblock` WRITE;
/*!40000 ALTER TABLE `catalog_staticblock` DISABLE KEYS */;
INSERT INTO `catalog_staticblock` VALUES (1,'test static block',1,'<p>test static block</p>',1000);
/*!40000 ALTER TABLE `catalog_staticblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_action`
--

DROP TABLE IF EXISTS `core_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `title` varchar(40) NOT NULL,
  `link` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_action_0e939a4f` (`group_id`),
  KEY `core_action_6be37982` (`parent_id`),
  CONSTRAINT `core_action_parent_id_70e1fa595de1a9f7_fk_core_action_id` FOREIGN KEY (`parent_id`) REFERENCES `core_action` (`id`),
  CONSTRAINT `core_action_group_id_53498774116ced89_fk_core_actiongroup_id` FOREIGN KEY (`group_id`) REFERENCES `core_actiongroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_action`
--

LOCK TABLES `core_action` WRITE;
/*!40000 ALTER TABLE `core_action` DISABLE KEYS */;
INSERT INTO `core_action` VALUES (1,1,'Contact','/contact',10,1,NULL),(2,1,'Terms and Conditions','/page/terms-and-conditions',10,2,NULL),(3,1,'Imprint','/page/imprint',20,2,NULL),(4,0,'test tabs','testtabs',20,1,NULL),(5,0,'test footer','testfooter',30,2,NULL);
/*!40000 ALTER TABLE `core_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_actiongroup`
--

DROP TABLE IF EXISTS `core_actiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_actiongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_actiongroup`
--

LOCK TABLES `core_actiongroup` WRITE;
/*!40000 ALTER TABLE `core_actiongroup` DISABLE KEYS */;
INSERT INTO `core_actiongroup` VALUES (2,'Footer'),(1,'Tabs');
/*!40000 ALTER TABLE `core_actiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_application`
--

DROP TABLE IF EXISTS `core_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_application`
--

LOCK TABLES `core_application` WRITE;
/*!40000 ALTER TABLE `core_application` DISABLE KEYS */;
INSERT INTO `core_application` VALUES (1,'0.7');
/*!40000 ALTER TABLE `core_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_country`
--

DROP TABLE IF EXISTS `core_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_country`
--

LOCK TABLES `core_country` WRITE;
/*!40000 ALTER TABLE `core_country` DISABLE KEYS */;
INSERT INTO `core_country` VALUES (1,'zh','China');
/*!40000 ALTER TABLE `core_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_shop`
--

DROP TABLE IF EXISTS `core_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `shop_owner` varchar(100) NOT NULL,
  `from_email` varchar(254) NOT NULL,
  `notification_emails` longtext NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `product_cols` int(11) NOT NULL,
  `product_rows` int(11) NOT NULL,
  `category_cols` int(11) NOT NULL,
  `google_analytics_id` varchar(20) NOT NULL,
  `ga_site_tracking` tinyint(1) NOT NULL,
  `ga_ecommerce_tracking` tinyint(1) NOT NULL,
  `use_international_currency_code` tinyint(1) NOT NULL,
  `price_calculator` varchar(255) NOT NULL,
  `checkout_type` smallint(5) unsigned NOT NULL,
  `confirm_toc` tinyint(1) NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `meta_keywords` longtext NOT NULL,
  `meta_description` longtext NOT NULL,
  `default_country_id` int(11) NOT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `static_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `core_shop_default_country_id_3fc316e0887e40a8_fk_core_country_id` (`default_country_id`),
  KEY `cor_delivery_time_id_3773c15330f00982_fk_catalog_deliverytime_id` (`delivery_time_id`),
  KEY `core__static_block_id_19cd57586addb509_fk_catalog_staticblock_id` (`static_block_id`),
  CONSTRAINT `core__static_block_id_19cd57586addb509_fk_catalog_staticblock_id` FOREIGN KEY (`static_block_id`) REFERENCES `catalog_staticblock` (`id`),
  CONSTRAINT `core_shop_default_country_id_3fc316e0887e40a8_fk_core_country_id` FOREIGN KEY (`default_country_id`) REFERENCES `core_country` (`id`),
  CONSTRAINT `cor_delivery_time_id_3773c15330f00982_fk_catalog_deliverytime_id` FOREIGN KEY (`delivery_time_id`) REFERENCES `catalog_deliverytime` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_shop`
--

LOCK TABLES `core_shop` WRITE;
/*!40000 ALTER TABLE `core_shop` DISABLE KEYS */;
INSERT INTO `core_shop` VALUES (1,'云梦盐津','ymyj','john@doe.com','john@doe.com','<h1 class=\"first-heading\">Welcome to 云梦盐津!</h1>\n<p>LFS is an online shop based on <a href=\"http://www.python.org/\" target=\"_blank\">Python</a>, <a href=\"http://www.djangoproject.com/\" target=\"_blank\">Django</a> and <a href=\"http://jquery.com/\" target=\"_blank\">jQuery</a>.</p>\n<h1>Login</h1>\n<p>Go to the <a href=\"/manage\">management interface</a> to start to add content.</p>\n<h1>Information &amp; Help</h1>\n<p>You can find more information and help on following places:</p>\n<ul>\n<li><a href=\"http://www.getlfs.com\" target=\"_blank\">Official page</a></li>\n<li><a href=\"http://packages.python.org/django-lfs/index.html\" target=\"_blank\">Documentation on PyPI</a></li>\n<li><a href=\"http://pypi.python.org/pypi/django-lfs\" target=\"_blank\">Releases on PyPI</a></li>\n<li><a href=\"http://bitbucket.org/diefenbach/django-lfs\" target=\"_blank\">Source code on bitbucket.org</a></li>\n<li><a href=\"http://groups.google.com/group/django-lfs\" target=\"_blank\">Google Group</a></li>\n<li><a href=\"http://twitter.com/lfsproject\" target=\"_blank\">lfsproject on Twitter</a></li>\n<li><a href=\"irc://irc.freenode.net/django-lfs\" target=\"_blank\">IRC</a></li>\n</ul>','images/deemo.jpg',1,10,1,'',0,0,0,'lfs.gross_price.GrossPriceCalculator',0,0,'<name>','','',1,1,NULL);
/*!40000 ALTER TABLE `core_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_shop_invoice_countries`
--

DROP TABLE IF EXISTS `core_shop_invoice_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_shop_invoice_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_id` (`shop_id`,`country_id`),
  KEY `core_shop_invoice_country_id_5024e79a0b8ce41f_fk_core_country_id` (`country_id`),
  CONSTRAINT `core_shop_invoice_country_id_5024e79a0b8ce41f_fk_core_country_id` FOREIGN KEY (`country_id`) REFERENCES `core_country` (`id`),
  CONSTRAINT `core_shop_invoice_count_shop_id_6365200c25821d7a_fk_core_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `core_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_shop_invoice_countries`
--

LOCK TABLES `core_shop_invoice_countries` WRITE;
/*!40000 ALTER TABLE `core_shop_invoice_countries` DISABLE KEYS */;
INSERT INTO `core_shop_invoice_countries` VALUES (2,1,1);
/*!40000 ALTER TABLE `core_shop_invoice_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_shop_shipping_countries`
--

DROP TABLE IF EXISTS `core_shop_shipping_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_shop_shipping_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_id` (`shop_id`,`country_id`),
  KEY `core_shop_shippin_country_id_7bf7ff25da6a3bd3_fk_core_country_id` (`country_id`),
  CONSTRAINT `core_shop_shippin_country_id_7bf7ff25da6a3bd3_fk_core_country_id` FOREIGN KEY (`country_id`) REFERENCES `core_country` (`id`),
  CONSTRAINT `core_shop_shipping_coun_shop_id_42309b45b69a6294_fk_core_shop_id` FOREIGN KEY (`shop_id`) REFERENCES `core_shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_shop_shipping_countries`
--

LOCK TABLES `core_shop_shipping_countries` WRITE;
/*!40000 ALTER TABLE `core_shop_shipping_countries` DISABLE KEYS */;
INSERT INTO `core_shop_shipping_countries` VALUES (2,1,1);
/*!40000 ALTER TABLE `core_shop_shipping_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_cartpricecriterion`
--

DROP TABLE IF EXISTS `criteria_cartpricecriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_cartpricecriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_37fe2c6bb7bfdcce_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_cartpricecriterion`
--

LOCK TABLES `criteria_cartpricecriterion` WRITE;
/*!40000 ALTER TABLE `criteria_cartpricecriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_cartpricecriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_combinedlengthandgirthcriterion`
--

DROP TABLE IF EXISTS `criteria_combinedlengthandgirthcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_combinedlengthandgirthcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_670c323f5e054338_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_combinedlengthandgirthcriterion`
--

LOCK TABLES `criteria_combinedlengthandgirthcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_combinedlengthandgirthcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_combinedlengthandgirthcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_countrycriterion`
--

DROP TABLE IF EXISTS `criteria_countrycriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_countrycriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_496f727a8be630df_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_countrycriterion`
--

LOCK TABLES `criteria_countrycriterion` WRITE;
/*!40000 ALTER TABLE `criteria_countrycriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_countrycriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_countrycriterion_value`
--

DROP TABLE IF EXISTS `criteria_countrycriterion_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_countrycriterion_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countrycriterion_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countrycriterion_id` (`countrycriterion_id`,`country_id`),
  KEY `criteria_countryc_country_id_708f3f997c754241_fk_core_country_id` (`country_id`),
  CONSTRAINT `criteria_countryc_country_id_708f3f997c754241_fk_core_country_id` FOREIGN KEY (`country_id`) REFERENCES `core_country` (`id`),
  CONSTRAINT `D701c194b0a2acb855a7db957c24d3f9` FOREIGN KEY (`countrycriterion_id`) REFERENCES `criteria_countrycriterion` (`criterion_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_countrycriterion_value`
--

LOCK TABLES `criteria_countrycriterion_value` WRITE;
/*!40000 ALTER TABLE `criteria_countrycriterion_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_countrycriterion_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_criterion`
--

DROP TABLE IF EXISTS `criteria_criterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_criterion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL,
  `sub_type` varchar(100) NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `operator` int(10) unsigned DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `criteria_criterion_417f1b1c` (`content_type_id`),
  CONSTRAINT `criter_content_type_id_5080e37bfe6aebb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_criterion`
--

LOCK TABLES `criteria_criterion` WRITE;
/*!40000 ALTER TABLE `criteria_criterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_criterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_heightcriterion`
--

DROP TABLE IF EXISTS `criteria_heightcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_heightcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_5237856cd8b10b49_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_heightcriterion`
--

LOCK TABLES `criteria_heightcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_heightcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_heightcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_lengthcriterion`
--

DROP TABLE IF EXISTS `criteria_lengthcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_lengthcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_7ce084e1fbb51fc6_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_lengthcriterion`
--

LOCK TABLES `criteria_lengthcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_lengthcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_lengthcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_paymentmethodcriterion`
--

DROP TABLE IF EXISTS `criteria_paymentmethodcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_paymentmethodcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_744e23a5a6ff597e_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_paymentmethodcriterion`
--

LOCK TABLES `criteria_paymentmethodcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_paymentmethodcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_paymentmethodcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_paymentmethodcriterion_value`
--

DROP TABLE IF EXISTS `criteria_paymentmethodcriterion_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_paymentmethodcriterion_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentmethodcriterion_id` int(11) NOT NULL,
  `paymentmethod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `paymentmethodcriterion_id` (`paymentmethodcriterion_id`,`paymentmethod_id`),
  KEY `cr_paymentmethod_id_37b69218a5b0a97d_fk_payment_paymentmethod_id` (`paymentmethod_id`),
  CONSTRAINT `cr_paymentmethod_id_37b69218a5b0a97d_fk_payment_paymentmethod_id` FOREIGN KEY (`paymentmethod_id`) REFERENCES `payment_paymentmethod` (`id`),
  CONSTRAINT `ffda375193cf35fa4ddbd75fbc9a0619` FOREIGN KEY (`paymentmethodcriterion_id`) REFERENCES `criteria_paymentmethodcriterion` (`criterion_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_paymentmethodcriterion_value`
--

LOCK TABLES `criteria_paymentmethodcriterion_value` WRITE;
/*!40000 ALTER TABLE `criteria_paymentmethodcriterion_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_paymentmethodcriterion_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_shippingmethodcriterion`
--

DROP TABLE IF EXISTS `criteria_shippingmethodcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_shippingmethodcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_3d4535dfa4fa0891_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_shippingmethodcriterion`
--

LOCK TABLES `criteria_shippingmethodcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_shippingmethodcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_shippingmethodcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_shippingmethodcriterion_value`
--

DROP TABLE IF EXISTS `criteria_shippingmethodcriterion_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_shippingmethodcriterion_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingmethodcriterion_id` int(11) NOT NULL,
  `shippingmethod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shippingmethodcriterion_id` (`shippingmethodcriterion_id`,`shippingmethod_id`),
  KEY `D2b5859e9512b078386f33dee24f8907` (`shippingmethod_id`),
  CONSTRAINT `D2b5859e9512b078386f33dee24f8907` FOREIGN KEY (`shippingmethod_id`) REFERENCES `shipping_shippingmethod` (`id`),
  CONSTRAINT `ffc03a1db87979c553cb281cb8cd0c5d` FOREIGN KEY (`shippingmethodcriterion_id`) REFERENCES `criteria_shippingmethodcriterion` (`criterion_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_shippingmethodcriterion_value`
--

LOCK TABLES `criteria_shippingmethodcriterion_value` WRITE;
/*!40000 ALTER TABLE `criteria_shippingmethodcriterion_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_shippingmethodcriterion_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_weightcriterion`
--

DROP TABLE IF EXISTS `criteria_weightcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_weightcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_428732f060aaadde_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_weightcriterion`
--

LOCK TABLES `criteria_weightcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_weightcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_weightcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria_widthcriterion`
--

DROP TABLE IF EXISTS `criteria_widthcriterion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria_widthcriterion` (
  `criterion_ptr_id` int(11) NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`criterion_ptr_id`),
  CONSTRAINT `crite_criterion_ptr_id_4b877f9b48258e6d_fk_criteria_criterion_id` FOREIGN KEY (`criterion_ptr_id`) REFERENCES `criteria_criterion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria_widthcriterion`
--

LOCK TABLES `criteria_widthcriterion` WRITE;
/*!40000 ALTER TABLE `criteria_widthcriterion` DISABLE KEYS */;
/*!40000 ALTER TABLE `criteria_widthcriterion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_bankaccount`
--

DROP TABLE IF EXISTS `customer_bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_bankaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_number` varchar(30) NOT NULL,
  `bank_identification_code` varchar(30) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `depositor` varchar(100) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_bankaccount_cb24373b` (`customer_id`),
  CONSTRAINT `customer_ban_customer_id_c7c936f8e22e404_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_bankaccount`
--

LOCK TABLES `customer_bankaccount` WRITE;
/*!40000 ALTER TABLE `customer_bankaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_creditcard`
--

DROP TABLE IF EXISTS `customer_creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_creditcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `number` varchar(30) NOT NULL,
  `expiration_date_month` int(11) DEFAULT NULL,
  `expiration_date_year` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_creditcard_cb24373b` (`customer_id`),
  CONSTRAINT `customer_cre_customer_id_4aff2a817ff54af_fk_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_creditcard`
--

LOCK TABLES `customer_creditcard` WRITE;
/*!40000 ALTER TABLE `customer_creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_customer`
--

DROP TABLE IF EXISTS `customer_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(100) NOT NULL,
  `sa_object_id` int(10) unsigned DEFAULT NULL,
  `dsa_object_id` int(10) unsigned DEFAULT NULL,
  `ia_object_id` int(10) unsigned DEFAULT NULL,
  `dia_object_id` int(10) unsigned DEFAULT NULL,
  `ia_content_type_id` int(11) DEFAULT NULL,
  `sa_content_type_id` int(11) DEFAULT NULL,
  `selected_bank_account_id` int(11) DEFAULT NULL,
  `selected_country_id` int(11) DEFAULT NULL,
  `selected_credit_card_id` int(11) DEFAULT NULL,
  `selected_payment_method_id` int(11) DEFAULT NULL,
  `selected_shipping_method_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `D85586a4d248ea3f52a94dea7f4a35e7` (`selected_bank_account_id`),
  KEY `customer_selected_country_id_62af3ea928dd6e24_fk_core_country_id` (`selected_country_id`),
  KEY `D694b3870486e668f4410ba05224c133` (`selected_credit_card_id`),
  KEY `D8dca74db5065c3a822ba30c1092fb68` (`selected_payment_method_id`),
  KEY `D74ace6eda4639511d5c1ca55d0144cb` (`selected_shipping_method_id`),
  KEY `customer_customer_user_id_482ced6557101913_fk_auth_user_id` (`user_id`),
  KEY `cu_ia_content_type_id_559c6423c7e72ef0_fk_django_content_type_id` (`ia_content_type_id`),
  KEY `cu_sa_content_type_id_413fe002407319fe_fk_django_content_type_id` (`sa_content_type_id`),
  CONSTRAINT `customer_customer_user_id_482ced6557101913_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `customer_selected_country_id_62af3ea928dd6e24_fk_core_country_id` FOREIGN KEY (`selected_country_id`) REFERENCES `core_country` (`id`),
  CONSTRAINT `cu_ia_content_type_id_559c6423c7e72ef0_fk_django_content_type_id` FOREIGN KEY (`ia_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `cu_sa_content_type_id_413fe002407319fe_fk_django_content_type_id` FOREIGN KEY (`sa_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `D694b3870486e668f4410ba05224c133` FOREIGN KEY (`selected_credit_card_id`) REFERENCES `customer_creditcard` (`id`),
  CONSTRAINT `D74ace6eda4639511d5c1ca55d0144cb` FOREIGN KEY (`selected_shipping_method_id`) REFERENCES `shipping_shippingmethod` (`id`),
  CONSTRAINT `D85586a4d248ea3f52a94dea7f4a35e7` FOREIGN KEY (`selected_bank_account_id`) REFERENCES `customer_bankaccount` (`id`),
  CONSTRAINT `D8dca74db5065c3a822ba30c1092fb68` FOREIGN KEY (`selected_payment_method_id`) REFERENCES `payment_paymentmethod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_customer`
--

LOCK TABLES `customer_customer` WRITE;
/*!40000 ALTER TABLE `customer_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_tax_customertax`
--

DROP TABLE IF EXISTS `customer_tax_customertax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_tax_customertax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tax_customertax`
--

LOCK TABLES `customer_tax_customertax` WRITE;
/*!40000 ALTER TABLE `customer_tax_customertax` DISABLE KEYS */;
INSERT INTO `customer_tax_customertax` VALUES (1,1,'<p>description for customer tax</p>');
/*!40000 ALTER TABLE `customer_tax_customertax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discount`
--

DROP TABLE IF EXISTS `discounts_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `value` double NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `sku` varchar(50) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_discount_tax_id_18c7fa91f7b8fc52_fk_tax_tax_id` (`tax_id`),
  CONSTRAINT `discounts_discount_tax_id_18c7fa91f7b8fc52_fk_tax_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax_tax` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discount`
--

LOCK TABLES `discounts_discount` WRITE;
/*!40000 ALTER TABLE `discounts_discount` DISABLE KEYS */;
INSERT INTO `discounts_discount` VALUES (1,'test discount',1,1,0,'testdiscount',1);
/*!40000 ALTER TABLE `discounts_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_discount_products`
--

DROP TABLE IF EXISTS `discounts_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts_discount_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discount_id` (`discount_id`,`product_id`),
  KEY `discounts_disc_product_id_2b901ae99865daaa_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `discounts_disc_product_id_2b901ae99865daaa_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `discounts__discount_id_7b8507c9c7655211_fk_discounts_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discounts_discount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_discount_products`
--

LOCK TABLES `discounts_discount_products` WRITE;
/*!40000 ALTER TABLE `discounts_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-09 00:18:35','1','??',2,'??? code ? name ?',35,1),(2,'2016-05-09 00:18:44','1','China',2,'??? name ?',35,1),(3,'2016-05-09 00:18:49','1','??',2,'??? name ?',35,1),(4,'2016-05-09 00:18:52','1','??',2,'????????',35,1),(5,'2016-05-09 00:20:14','1','China',2,'??? name ?',35,1),(6,'2016-05-09 00:20:21','1','??',2,'??? name ?',35,1),(7,'2016-05-09 00:20:24','1','China',2,'??? name ?',35,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (16,'addresses','address'),(15,'addresses','baseaddress'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(17,'cart','cart'),(18,'cart','cartitem'),(19,'cart','cartitempropertyvalue'),(20,'catalog','category'),(33,'catalog','deliverytime'),(31,'catalog','file'),(25,'catalog','filterstep'),(26,'catalog','groupspropertiesrelation'),(30,'catalog','image'),(21,'catalog','product'),(22,'catalog','productaccessories'),(34,'catalog','productattachment'),(29,'catalog','productpropertyvalue'),(27,'catalog','productspropertiesrelation'),(24,'catalog','property'),(23,'catalog','propertygroup'),(28,'catalog','propertyoption'),(32,'catalog','staticblock'),(5,'contenttypes','contenttype'),(37,'core','action'),(36,'core','actiongroup'),(39,'core','application'),(35,'core','country'),(38,'core','shop'),(41,'criteria','cartpricecriterion'),(42,'criteria','combinedlengthandgirthcriterion'),(43,'criteria','countrycriterion'),(40,'criteria','criterion'),(44,'criteria','heightcriterion'),(45,'criteria','lengthcriterion'),(46,'criteria','paymentmethodcriterion'),(47,'criteria','shippingmethodcriterion'),(48,'criteria','weightcriterion'),(49,'criteria','widthcriterion'),(51,'customer','bankaccount'),(52,'customer','creditcard'),(50,'customer','customer'),(53,'customer_tax','customertax'),(54,'discounts','discount'),(57,'export','categoryoption'),(55,'export','export'),(56,'export','script'),(8,'flatpages','flatpage'),(91,'ipn','paypalipn'),(90,'lfs_order_numbers','ordernumbergenerator'),(62,'manufacturer','manufacturer'),(60,'marketing','featuredproduct'),(61,'marketing','orderratingmail'),(59,'marketing','productsales'),(58,'marketing','topseller'),(63,'order','order'),(66,'order','orderdeliverytime'),(64,'order','orderitem'),(65,'order','orderitempropertyvalue'),(67,'page','page'),(68,'payment','paymentmethod'),(69,'payment','paymentmethodprice'),(92,'pdt','paypalpdt'),(70,'portlet','averageratingportlet'),(71,'portlet','cartportlet'),(72,'portlet','categoriesportlet'),(73,'portlet','deliverytimeportlet'),(81,'portlet','featuredportlet'),(79,'portlet','filterportlet'),(80,'portlet','forsaleportlet'),(82,'portlet','latestportlet'),(74,'portlet','pagesportlet'),(75,'portlet','recentproductsportlet'),(76,'portlet','relatedproductsportlet'),(77,'portlet','textportlet'),(78,'portlet','topsellerportlet'),(11,'portlets','portletassignment'),(12,'portlets','portletblocking'),(13,'portlets','portletregistration'),(14,'portlets','slot'),(9,'redirects','redirect'),(10,'reviews','review'),(6,'sessions','session'),(83,'shipping','shippingmethod'),(84,'shipping','shippingmethodprice'),(7,'sites','site'),(85,'supplier','supplier'),(86,'tax','tax'),(89,'voucher','voucher'),(88,'voucher','vouchergroup'),(87,'voucher','voucheroptions');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_572d4e42` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flatpage_id` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_site_id_481dafa7c6e850d9_fk_django_site_id` (`site_id`),
  CONSTRAINT `django_flatpage_sites_site_id_481dafa7c6e850d9_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `django_flatpa_flatpage_id_7b4e76c0a3a9d13a_fk_django_flatpage_id` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'tax','0001_initial','2016-05-09 00:13:04'),(2,'contenttypes','0001_initial','2016-05-09 00:13:04'),(3,'auth','0001_initial','2016-05-09 00:13:04'),(4,'supplier','0001_initial','2016-05-09 00:13:04'),(5,'manufacturer','0001_initial','2016-05-09 00:13:04'),(6,'contenttypes','0002_remove_content_type_name','2016-05-09 00:13:05'),(7,'catalog','0001_initial','2016-05-09 00:13:07'),(8,'shipping','0001_initial','2016-05-09 00:13:07'),(9,'payment','0001_initial','2016-05-09 00:13:07'),(10,'order','0001_initial','2016-05-09 00:13:07'),(11,'core','0001_initial','2016-05-09 00:13:08'),(12,'customer','0001_initial','2016-05-09 00:13:08'),(13,'addresses','0001_initial','2016-05-09 00:13:09'),(14,'admin','0001_initial','2016-05-09 00:13:09'),(15,'auth','0002_alter_permission_name_max_length','2016-05-09 00:13:09'),(16,'auth','0003_alter_user_email_max_length','2016-05-09 00:13:09'),(17,'auth','0004_alter_user_username_opts','2016-05-09 00:13:09'),(18,'auth','0005_alter_user_last_login_null','2016-05-09 00:13:10'),(19,'auth','0006_require_contenttypes_0002','2016-05-09 00:13:10'),(20,'cart','0001_initial','2016-05-09 00:13:10'),(21,'criteria','0001_initial','2016-05-09 00:13:10'),(22,'customer','0002_set_null_to_address_fields','2016-05-09 00:13:12'),(23,'customer_tax','0001_initial','2016-05-09 00:13:12'),(24,'discounts','0001_initial','2016-05-09 00:13:12'),(25,'export','0001_initial','2016-05-09 00:13:13'),(26,'sites','0001_initial','2016-05-09 00:13:13'),(27,'flatpages','0001_initial','2016-05-09 00:13:13'),(28,'lfs_order_numbers','0001_initial','2016-05-09 00:13:13'),(29,'marketing','0001_initial','2016-05-09 00:13:13'),(30,'page','0001_initial','2016-05-09 00:13:13'),(31,'portlet','0001_initial','2016-05-09 00:13:14'),(32,'portlets','0001_initial','2016-05-09 00:13:15'),(33,'redirects','0001_initial','2016-05-09 00:13:15'),(34,'reviews','0001_initial','2016-05-09 00:13:15'),(35,'sessions','0001_initial','2016-05-09 00:13:15'),(36,'voucher','0001_initial','2016-05-09 00:13:16');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_redirect`
--

DROP TABLE IF EXISTS `django_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `old_path` varchar(200) NOT NULL,
  `new_path` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `site_id` (`site_id`,`old_path`),
  KEY `django_redirect_91a0b591` (`old_path`),
  CONSTRAINT `django_redirect_site_id_121a4403f653e524_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_redirect`
--

LOCK TABLES `django_redirect` WRITE;
/*!40000 ALTER TABLE `django_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bg9ivw94h3py1no4vfdrppfjjokuu42y','ZDMxYWNkMTcyODA2YzllYjQ4NTUwOThlYzg1NDFkMDc5ZTRiZmFmMTqAAn1xAShVGXRvcHNlbGxlcl9jYXRlZ29yeV9maWx0ZXJOVRFtYW51ZmFjdHVyZXJfcGFnZUsBVRdyZWxhdGVkLXByb2R1Y3RzLWFtb3VudEsZVRhmZWF0dXJlZF9jYXRlZ29yeV9maWx0ZXJOVQ1sYXN0X2NhdGVnb3J5cQJjZGphbmdvLmRiLm1vZGVscy5iYXNlCm1vZGVsX3VucGlja2xlCnEDWAcAAABjYXRhbG9ncQRVCENhdGVnb3J5cQWGXWNkamFuZ28uZGIubW9kZWxzLmJhc2UKc2ltcGxlX2NsYXNzX2ZhY3RvcnkKcQaHUnEHfXEIKFUNbWV0YV9rZXl3b3Jkc3EJWAAAAABVA3VpZHEKWCQAAAA4MTE0NWI1OS00MDQ0LTQwNjItYWRiZi00MTk4ZTA0MzNlODBVBWltYWdlcQtYDAAAAGltYWdlcy8xLmpwZ1UGX3N0YXRlcQxjZGphbmdvLmRiLm1vZGVscy5iYXNlCk1vZGVsU3RhdGUKcQ0pgXEOfXEPKFUGYWRkaW5ncRCJVQJkYnERVQdkZWZhdWx0cRJ1YlUTX3N0YXRpY19ibG9ja19jYWNoZU5VD3N0YXRpY19ibG9ja19pZHETTlUNX3BhcmVudF9jYWNoZU5VAmlkcRSKAQFVC2Rlc2NyaXB0aW9ucRVYIgAAADxwPmRlc2NyaXB0aW9uIGZvciB0ZXN0Q2F0YWxvZzwvcD5VEG1ldGFfZGVzY3JpcHRpb25xFlgAAAAAVRdleGNsdWRlX2Zyb21fbmF2aWdhdGlvbnEXiVUJcGFyZW50X2lkcRhOVQh0ZW1wbGF0ZXEZTlURc2hvcnRfZGVzY3JpcHRpb25xGlgoAAAAPHA+c2hvcnQgZGVzY3JpcHRpb24gZm9yIHRlc3RDYXRhbG9nPC9wPlUKbWV0YV90aXRsZXEbWAYAAAA8bmFtZT5VEXNob3dfYWxsX3Byb2R1Y3RzcRyIVQ5hY3RpdmVfZm9ybWF0c3EdiVUMcHJvZHVjdF9yb3dzcR6KAQNVBHNsdWdxH1gLAAAAdGVzdGNhdGFsb2dVBG5hbWVxIFgLAAAAdGVzdENhdGFsb2dVBWxldmVscSFLAVUPX2RqYW5nb192ZXJzaW9ucSJVAzEuOFUMcHJvZHVjdF9jb2xzcSOKAQNVCHBvc2l0aW9ucSSKAQpVDWNhdGVnb3J5X2NvbHNxJYoBA3ViVQ1kaXNjb3VudF9wYWdlSwFVG2FjY2Vzc29yaWVzX2NhdGVnb3J5X2ZpbHRlck5VEGFjY2Vzc29yaWVzX3BhZ2VLAVUSX2F1dGhfdXNlcl9iYWNrZW5kVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZFUWZmVhdHVyZWRfcHJvZHVjdHNfcGFnZUsBVRxtYW51ZmFjdHVyZXJfY2F0ZWdvcnlfZmlsdGVyVQBVDV9hdXRoX3VzZXJfaWSKAQFVHHByb2R1Y3RzX21hbnVmYWN0dXJlcl9maWx0ZXJOVRhjYXRlZ29yeS1wcm9kdWN0cy1hbW91bnRLGVUPY2F0ZWdvcnlfZmlsdGVyVQBVIHJlbGF0ZWRfcHJvZHVjdHNfY2F0ZWdvcnlfZmlsdGVyTlUcbWFudWZhY3R1cmVyLXByb2R1Y3RzLWFtb3VudEsZVQhmaWx0ZXJfMlUAVRNtYW51ZmFjdHVyZXJfcGFnZV8ySwFVF3RvcHNlbGxlcl9wcm9kdWN0c19wYWdlSwFVEHRvcHNlbGxlci1hbW91bnRLGVUVcmVsYXRlZF9wcm9kdWN0c19wYWdlSwFVE21hbnVmYWN0dXJlcl9maWx0ZXJVAFUYcHJvZHVjdHNfY2F0ZWdvcnlfZmlsdGVyTlUSYWNjZXNzb3JpZXMtYW1vdW50SxlVFW1hbnVmYWN0dXJlcl9maWx0ZXJfMlUAVQZmaWx0ZXJOVQZwYWdlXzJLAVUPZmVhdHVyZWQtYW1vdW50SxlVE3Byb3BlcnR5X2dyb3VwX3BhZ2VLAVUEcGFnZUsBdS4=','2016-05-23 00:35:27');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_categoryoption`
--

DROP TABLE IF EXISTS `export_categoryoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_categoryoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variants_option` smallint(5) unsigned NOT NULL,
  `category_id` int(11) NOT NULL,
  `export_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `export_categ_category_id_42a73c21aa045a55_fk_catalog_category_id` (`category_id`),
  KEY `export_categoryoption_eebf80ab` (`export_id`),
  CONSTRAINT `export_categoryopt_export_id_c401fbfadadf74b_fk_export_export_id` FOREIGN KEY (`export_id`) REFERENCES `export_export` (`id`),
  CONSTRAINT `export_categ_category_id_42a73c21aa045a55_fk_catalog_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalog_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_categoryoption`
--

LOCK TABLES `export_categoryoption` WRITE;
/*!40000 ALTER TABLE `export_categoryoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_categoryoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_export`
--

DROP TABLE IF EXISTS `export_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `variants_option` smallint(5) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  `script_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `export_export_a19ff0c0` (`script_id`),
  CONSTRAINT `export_export_script_id_3337bad64fd86ddb_fk_export_script_id` FOREIGN KEY (`script_id`) REFERENCES `export_script` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_export`
--

LOCK TABLES `export_export` WRITE;
/*!40000 ALTER TABLE `export_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_export_products`
--

DROP TABLE IF EXISTS `export_export_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_export_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `export_id` (`export_id`,`product_id`),
  KEY `export_export__product_id_534b3a0f2b2067c0_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `export_export__product_id_534b3a0f2b2067c0_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `export_export_pro_export_id_25f57e1e11e9168a_fk_export_export_id` FOREIGN KEY (`export_id`) REFERENCES `export_export` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_export_products`
--

LOCK TABLES `export_export_products` WRITE;
/*!40000 ALTER TABLE `export_export_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_export_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `export_script`
--

DROP TABLE IF EXISTS `export_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `export_script_module_668f04c1812ca200_uniq` (`module`,`method`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `export_script`
--

LOCK TABLES `export_script` WRITE;
/*!40000 ALTER TABLE `export_script` DISABLE KEYS */;
INSERT INTO `export_script` VALUES (1,'lfs.export.generic','export','Generic');
/*!40000 ALTER TABLE `export_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lfs_order_numbers_ordernumbergenerator`
--

DROP TABLE IF EXISTS `lfs_order_numbers_ordernumbergenerator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lfs_order_numbers_ordernumbergenerator` (
  `id` varchar(20) NOT NULL,
  `last` int(11) NOT NULL,
  `format` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lfs_order_numbers_ordernumbergenerator`
--

LOCK TABLES `lfs_order_numbers_ordernumbergenerator` WRITE;
/*!40000 ALTER TABLE `lfs_order_numbers_ordernumbergenerator` DISABLE KEYS */;
INSERT INTO `lfs_order_numbers_ordernumbergenerator` VALUES ('order_number',0,'');
/*!40000 ALTER TABLE `lfs_order_numbers_ordernumbergenerator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer_manufacturer`
--

DROP TABLE IF EXISTS `manufacturer_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer_manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `short_description` longtext NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `active_formats` tinyint(1) NOT NULL,
  `product_rows` int(11) NOT NULL,
  `product_cols` int(11) NOT NULL,
  `meta_title` varchar(100) NOT NULL,
  `meta_keywords` longtext NOT NULL,
  `meta_description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer_manufacturer`
--

LOCK TABLES `manufacturer_manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer_manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer_manufacturer` VALUES (1,'testManufacturer','testmanufacturer','<p>short description for manufacturer</p>','<p>description for manufacturer</p>','images/413970EC4B79BD87592E548BBA09D1CE.jpg',1000,0,3,3,'<name>','','');
/*!40000 ALTER TABLE `manufacturer_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_featuredproduct`
--

DROP TABLE IF EXISTS `marketing_featuredproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_featuredproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(5) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_feat_product_id_4f289090d5c70643_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `marketing_feat_product_id_4f289090d5c70643_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_featuredproduct`
--

LOCK TABLES `marketing_featuredproduct` WRITE;
/*!40000 ALTER TABLE `marketing_featuredproduct` DISABLE KEYS */;
INSERT INTO `marketing_featuredproduct` VALUES (1,10,1,1);
/*!40000 ALTER TABLE `marketing_featuredproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_orderratingmail`
--

DROP TABLE IF EXISTS `marketing_orderratingmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_orderratingmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_date` datetime NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_orderratin_order_id_777bbbae36ae6255_fk_order_order_id` (`order_id`),
  CONSTRAINT `marketing_orderratin_order_id_777bbbae36ae6255_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_orderratingmail`
--

LOCK TABLES `marketing_orderratingmail` WRITE;
/*!40000 ALTER TABLE `marketing_orderratingmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_orderratingmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_productsales`
--

DROP TABLE IF EXISTS `marketing_productsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_productsales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_prod_product_id_52bddfe32d796732_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `marketing_prod_product_id_52bddfe32d796732_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_productsales`
--

LOCK TABLES `marketing_productsales` WRITE;
/*!40000 ALTER TABLE `marketing_productsales` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_productsales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_topseller`
--

DROP TABLE IF EXISTS `marketing_topseller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_topseller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(5) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_tops_product_id_45225ab7eaae7b0e_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `marketing_tops_product_id_45225ab7eaae7b0e_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_topseller`
--

LOCK TABLES `marketing_topseller` WRITE;
/*!40000 ALTER TABLE `marketing_topseller` DISABLE KEYS */;
INSERT INTO `marketing_topseller` VALUES (1,1,2);
/*!40000 ALTER TABLE `marketing_topseller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(30) NOT NULL,
  `session` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `state` smallint(5) unsigned NOT NULL,
  `state_modified` datetime NOT NULL,
  `price` double NOT NULL,
  `tax` double NOT NULL,
  `customer_firstname` varchar(50) NOT NULL,
  `customer_lastname` varchar(50) NOT NULL,
  `customer_email` varchar(75) NOT NULL,
  `sa_object_id` int(10) unsigned NOT NULL,
  `ia_object_id` int(10) unsigned NOT NULL,
  `shipping_price` double NOT NULL,
  `shipping_tax` double NOT NULL,
  `payment_price` double NOT NULL,
  `payment_tax` double NOT NULL,
  `account_number` varchar(30) NOT NULL,
  `bank_identification_code` varchar(30) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `depositor` varchar(100) NOT NULL,
  `voucher_number` varchar(100) NOT NULL,
  `voucher_price` double NOT NULL,
  `voucher_tax` double NOT NULL,
  `message` longtext NOT NULL,
  `pay_link` longtext NOT NULL,
  `uuid` varchar(50) NOT NULL,
  `requested_delivery_date` datetime DEFAULT NULL,
  `ia_content_type_id` int(11) NOT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `sa_content_type_id` int(11) NOT NULL,
  `shipping_method_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `or_ia_content_type_id_34b0137adc33ff2c_fk_django_content_type_id` (`ia_content_type_id`),
  KEY `o_payment_method_id_3da35583a192b13c_fk_payment_paymentmethod_id` (`payment_method_id`),
  KEY `or_sa_content_type_id_77c5a1af1e754566_fk_django_content_type_id` (`sa_content_type_id`),
  KEY `D597819c8d762f8a65958be5bda39980` (`shipping_method_id`),
  KEY `order_order_user_id_350d9d363b4b7f2f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `order_order_user_id_350d9d363b4b7f2f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `D597819c8d762f8a65958be5bda39980` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_shippingmethod` (`id`),
  CONSTRAINT `or_ia_content_type_id_34b0137adc33ff2c_fk_django_content_type_id` FOREIGN KEY (`ia_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `or_sa_content_type_id_77c5a1af1e754566_fk_django_content_type_id` FOREIGN KEY (`sa_content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `o_payment_method_id_3da35583a192b13c_fk_payment_paymentmethod_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_paymentmethod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdeliverytime`
--

DROP TABLE IF EXISTS `order_orderdeliverytime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdeliverytime` (
  `deliverytime_ptr_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`deliverytime_ptr_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `order_orderdeliveryt_order_id_4f97f49832ad4a9e_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  CONSTRAINT `deliverytime_ptr_id_7d68a9c458705663_fk_catalog_deliverytime_id` FOREIGN KEY (`deliverytime_ptr_id`) REFERENCES `catalog_deliverytime` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdeliverytime`
--

LOCK TABLES `order_orderdeliverytime` WRITE;
/*!40000 ALTER TABLE `order_orderdeliverytime` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderdeliverytime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderitem`
--

DROP TABLE IF EXISTS `order_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price_net` double NOT NULL,
  `price_gross` double NOT NULL,
  `tax` double NOT NULL,
  `product_amount` double DEFAULT NULL,
  `product_sku` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price_net` double NOT NULL,
  `product_price_gross` double NOT NULL,
  `product_tax` double NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderitem_order_id_106c2c8cde864eb4_fk_order_order_id` (`order_id`),
  KEY `order_orderite_product_id_60f2917df56d825b_fk_catalog_product_id` (`product_id`),
  CONSTRAINT `order_orderite_product_id_60f2917df56d825b_fk_catalog_product_id` FOREIGN KEY (`product_id`) REFERENCES `catalog_product` (`id`),
  CONSTRAINT `order_orderitem_order_id_106c2c8cde864eb4_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderitem`
--

LOCK TABLES `order_orderitem` WRITE;
/*!40000 ALTER TABLE `order_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderitempropertyvalue`
--

DROP TABLE IF EXISTS `order_orderitempropertyvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderitempropertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_order_item_id_2647d5abfe57e0cc_fk_order_orderitem_id` (`order_item_id`),
  KEY `order_orderi_property_id_7f867df872268ba9_fk_catalog_property_id` (`property_id`),
  CONSTRAINT `order_orderi_property_id_7f867df872268ba9_fk_catalog_property_id` FOREIGN KEY (`property_id`) REFERENCES `catalog_property` (`id`),
  CONSTRAINT `order_order_order_item_id_2647d5abfe57e0cc_fk_order_orderitem_id` FOREIGN KEY (`order_item_id`) REFERENCES `order_orderitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderitempropertyvalue`
--

LOCK TABLES `order_orderitempropertyvalue` WRITE;
/*!40000 ALTER TABLE `order_orderitempropertyvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderitempropertyvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_page`
--

DROP TABLE IF EXISTS `page_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `exclude_from_navigation` tinyint(1) NOT NULL,
  `short_text` longtext NOT NULL,
  `body` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `meta_title` varchar(80) NOT NULL,
  `meta_keywords` longtext NOT NULL,
  `meta_description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_page`
--

LOCK TABLES `page_page` WRITE;
/*!40000 ALTER TABLE `page_page` DISABLE KEYS */;
INSERT INTO `page_page` VALUES (1,1,'Root','',10,1,'','','','<title>','',''),(2,1,'Terms and Conditions','terms-and-conditions',20,0,'','Enter your terms and conditions here.','','<title>','',''),(3,1,'Imprint','imprint',30,0,'','Enter your imprint here.','','<title>','',''),(4,1,'testHtmlPage','testhtmlpage',40,0,'<p>short text for testHtmlPage</p>','<p>文本 for testHtmlPage</p>','files/6.jpg','<title>','','');
/*!40000 ALTER TABLE `page_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymentmethod`
--

DROP TABLE IF EXISTS `payment_paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paymentmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `note` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` double NOT NULL,
  `deletable` tinyint(1) NOT NULL,
  `module` varchar(100) NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_paymentmethod_tax_id_206a23064bfc17b3_fk_tax_tax_id` (`tax_id`),
  CONSTRAINT `payment_paymentmethod_tax_id_206a23064bfc17b3_fk_tax_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax_tax` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymentmethod`
--

LOCK TABLES `payment_paymentmethod` WRITE;
/*!40000 ALTER TABLE `payment_paymentmethod` DISABLE KEYS */;
INSERT INTO `payment_paymentmethod` VALUES (1,1,1,'Direct debit','','','',0,0,'',1,NULL),(2,1,2,'Cash on delivery','','','',0,0,'',0,NULL),(3,1,3,'PayPal','','','',0,0,'lfs_paypal.PayPalProcessor',0,NULL),(4,1,4,'Prepayment','','','',0,0,'',0,NULL);
/*!40000 ALTER TABLE `payment_paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymentmethodprice`
--

DROP TABLE IF EXISTS `payment_paymentmethodprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paymentmethodprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `priority` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pa_payment_method_id_2d94e5661622313_fk_payment_paymentmethod_id` (`payment_method_id`),
  CONSTRAINT `pa_payment_method_id_2d94e5661622313_fk_payment_paymentmethod_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_paymentmethod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymentmethodprice`
--

LOCK TABLES `payment_paymentmethodprice` WRITE;
/*!40000 ALTER TABLE `payment_paymentmethodprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_paymentmethodprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(32) NOT NULL,
  `custom` varchar(255) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(127) NOT NULL,
  `receiver_id` varchar(127) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(19) NOT NULL,
  `txn_type` varchar(128) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(11) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(9) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(10) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(9) NOT NULL,
  `payment_type` varchar(7) NOT NULL,
  `pending_reason` varchar(14) NOT NULL,
  `protection_eligibility` varchar(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(15) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(7) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(32) NOT NULL,
  `period_type` varchar(32) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_type` varchar(128) NOT NULL,
  `profile_status` varchar(32) NOT NULL,
  `recurring_payment_id` varchar(128) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(32) NOT NULL,
  `period2` varchar(32) NOT NULL,
  `period3` varchar(32) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(14) NOT NULL,
  `case_type` varchar(24) NOT NULL,
  `receipt_id` varchar(64) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(255) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_8e113603` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_pdt`
--

DROP TABLE IF EXISTS `paypal_pdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_pdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(32) NOT NULL,
  `custom` varchar(255) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(127) NOT NULL,
  `receiver_id` varchar(127) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(19) NOT NULL,
  `txn_type` varchar(128) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(11) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(9) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(10) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(9) NOT NULL,
  `payment_type` varchar(7) NOT NULL,
  `pending_reason` varchar(14) NOT NULL,
  `protection_eligibility` varchar(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(15) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(7) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(32) NOT NULL,
  `period_type` varchar(32) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_type` varchar(128) NOT NULL,
  `profile_status` varchar(32) NOT NULL,
  `recurring_payment_id` varchar(128) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(32) NOT NULL,
  `period2` varchar(32) NOT NULL,
  `period3` varchar(32) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(14) NOT NULL,
  `case_type` varchar(24) NOT NULL,
  `receipt_id` varchar(64) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(255) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `amt` decimal(64,2) DEFAULT NULL,
  `cm` varchar(255) NOT NULL,
  `sig` varchar(255) NOT NULL,
  `tx` varchar(255) NOT NULL,
  `st` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_pdt_8e113603` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_pdt`
--

LOCK TABLES `paypal_pdt` WRITE;
/*!40000 ALTER TABLE `paypal_pdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_pdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_averageratingportlet`
--

DROP TABLE IF EXISTS `portlet_averageratingportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_averageratingportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_averageratingportlet`
--

LOCK TABLES `portlet_averageratingportlet` WRITE;
/*!40000 ALTER TABLE `portlet_averageratingportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_averageratingportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_cartportlet`
--

DROP TABLE IF EXISTS `portlet_cartportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_cartportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_cartportlet`
--

LOCK TABLES `portlet_cartportlet` WRITE;
/*!40000 ALTER TABLE `portlet_cartportlet` DISABLE KEYS */;
INSERT INTO `portlet_cartportlet` VALUES (1,'Cart');
/*!40000 ALTER TABLE `portlet_cartportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_categoriesportlet`
--

DROP TABLE IF EXISTS `portlet_categoriesportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_categoriesportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `start_level` smallint(5) unsigned NOT NULL,
  `expand_level` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_categoriesportlet`
--

LOCK TABLES `portlet_categoriesportlet` WRITE;
/*!40000 ALTER TABLE `portlet_categoriesportlet` DISABLE KEYS */;
INSERT INTO `portlet_categoriesportlet` VALUES (1,'Categories',1,1);
/*!40000 ALTER TABLE `portlet_categoriesportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_deliverytimeportlet`
--

DROP TABLE IF EXISTS `portlet_deliverytimeportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_deliverytimeportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_deliverytimeportlet`
--

LOCK TABLES `portlet_deliverytimeportlet` WRITE;
/*!40000 ALTER TABLE `portlet_deliverytimeportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_deliverytimeportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_featuredportlet`
--

DROP TABLE IF EXISTS `portlet_featuredportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_featuredportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `limit` int(11) NOT NULL,
  `current_category` tinyint(1) NOT NULL,
  `slideshow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_featuredportlet`
--

LOCK TABLES `portlet_featuredportlet` WRITE;
/*!40000 ALTER TABLE `portlet_featuredportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_featuredportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_filterportlet`
--

DROP TABLE IF EXISTS `portlet_filterportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_filterportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `show_product_filters` tinyint(1) NOT NULL,
  `show_price_filters` tinyint(1) NOT NULL,
  `show_manufacturer_filters` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_filterportlet`
--

LOCK TABLES `portlet_filterportlet` WRITE;
/*!40000 ALTER TABLE `portlet_filterportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_filterportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_forsaleportlet`
--

DROP TABLE IF EXISTS `portlet_forsaleportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_forsaleportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `limit` int(11) NOT NULL,
  `current_category` tinyint(1) NOT NULL,
  `slideshow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_forsaleportlet`
--

LOCK TABLES `portlet_forsaleportlet` WRITE;
/*!40000 ALTER TABLE `portlet_forsaleportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_forsaleportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_latestportlet`
--

DROP TABLE IF EXISTS `portlet_latestportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_latestportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `limit` int(11) NOT NULL,
  `current_category` tinyint(1) NOT NULL,
  `slideshow` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_latestportlet`
--

LOCK TABLES `portlet_latestportlet` WRITE;
/*!40000 ALTER TABLE `portlet_latestportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_latestportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_pagesportlet`
--

DROP TABLE IF EXISTS `portlet_pagesportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_pagesportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_pagesportlet`
--

LOCK TABLES `portlet_pagesportlet` WRITE;
/*!40000 ALTER TABLE `portlet_pagesportlet` DISABLE KEYS */;
INSERT INTO `portlet_pagesportlet` VALUES (1,'Information');
/*!40000 ALTER TABLE `portlet_pagesportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_recentproductsportlet`
--

DROP TABLE IF EXISTS `portlet_recentproductsportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_recentproductsportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_recentproductsportlet`
--

LOCK TABLES `portlet_recentproductsportlet` WRITE;
/*!40000 ALTER TABLE `portlet_recentproductsportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_recentproductsportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_relatedproductsportlet`
--

DROP TABLE IF EXISTS `portlet_relatedproductsportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_relatedproductsportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_relatedproductsportlet`
--

LOCK TABLES `portlet_relatedproductsportlet` WRITE;
/*!40000 ALTER TABLE `portlet_relatedproductsportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_relatedproductsportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_textportlet`
--

DROP TABLE IF EXISTS `portlet_textportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_textportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_textportlet`
--

LOCK TABLES `portlet_textportlet` WRITE;
/*!40000 ALTER TABLE `portlet_textportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_textportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlet_topsellerportlet`
--

DROP TABLE IF EXISTS `portlet_topsellerportlet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlet_topsellerportlet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `limit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlet_topsellerportlet`
--

LOCK TABLES `portlet_topsellerportlet` WRITE;
/*!40000 ALTER TABLE `portlet_topsellerportlet` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlet_topsellerportlet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlets_portletassignment`
--

DROP TABLE IF EXISTS `portlets_portletassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlets_portletassignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL,
  `portlet_id` int(10) unsigned NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `portlet_type_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portle_content_type_id_293a82a1debb819_fk_django_content_type_id` (`content_type_id`),
  KEY `portl_portlet_type_id_7f1d3911ec63350a_fk_django_content_type_id` (`portlet_type_id`),
  KEY `portlets_portletassignment_717c1a74` (`slot_id`),
  CONSTRAINT `portlets_portletass_slot_id_190d127087b18d5d_fk_portlets_slot_id` FOREIGN KEY (`slot_id`) REFERENCES `portlets_slot` (`id`),
  CONSTRAINT `portle_content_type_id_293a82a1debb819_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `portl_portlet_type_id_7f1d3911ec63350a_fk_django_content_type_id` FOREIGN KEY (`portlet_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlets_portletassignment`
--

LOCK TABLES `portlets_portletassignment` WRITE;
/*!40000 ALTER TABLE `portlets_portletassignment` DISABLE KEYS */;
INSERT INTO `portlets_portletassignment` VALUES (1,1,1,999,38,71,2),(2,1,1,999,38,72,1),(3,1,1,999,38,74,1);
/*!40000 ALTER TABLE `portlets_portletassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlets_portletblocking`
--

DROP TABLE IF EXISTS `portlets_portletblocking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlets_portletblocking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portlets_portletblocking_slot_id_3909ecad7b1b983b_uniq` (`slot_id`,`content_id`,`content_type_id`),
  KEY `portle_content_type_id_37ce275e61e360b_fk_django_content_type_id` (`content_type_id`),
  KEY `portlets_portletblocking_717c1a74` (`slot_id`),
  CONSTRAINT `portlets_portletblo_slot_id_1cbf2531d6c43d69_fk_portlets_slot_id` FOREIGN KEY (`slot_id`) REFERENCES `portlets_slot` (`id`),
  CONSTRAINT `portle_content_type_id_37ce275e61e360b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlets_portletblocking`
--

LOCK TABLES `portlets_portletblocking` WRITE;
/*!40000 ALTER TABLE `portlets_portletblocking` DISABLE KEYS */;
/*!40000 ALTER TABLE `portlets_portletblocking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlets_portletregistration`
--

DROP TABLE IF EXISTS `portlets_portletregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlets_portletregistration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlets_portletregistration`
--

LOCK TABLES `portlets_portletregistration` WRITE;
/*!40000 ALTER TABLE `portlets_portletregistration` DISABLE KEYS */;
INSERT INTO `portlets_portletregistration` VALUES (1,'averageratingportlet','Average Rating',1),(2,'cartportlet','Cart',1),(3,'categoriesportlet','Categories',1),(4,'deliverytimeportlet','Delivery Time',1),(5,'filterportlet','Filter',1),(6,'pagesportlet','Pages',1),(7,'recentproductsportlet','Recent Products',1),(8,'relatedproductsportlet','Related Products',1),(9,'textportlet','Text',1),(10,'topsellerportlet','Topseller',1),(11,'forsaleportlet','For sale',1),(12,'featuredportlet','Featured Products',1),(13,'latestportlet','Latest Products',1);
/*!40000 ALTER TABLE `portlets_portletregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portlets_slot`
--

DROP TABLE IF EXISTS `portlets_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portlets_slot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portlets_slot`
--

LOCK TABLES `portlets_slot` WRITE;
/*!40000 ALTER TABLE `portlets_slot` DISABLE KEYS */;
INSERT INTO `portlets_slot` VALUES (1,'Left'),(2,'Right');
/*!40000 ALTER TABLE `portlets_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_review`
--

DROP TABLE IF EXISTS `reviews_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned DEFAULT NULL,
  `session_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `comment` longtext NOT NULL,
  `score` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revie_content_type_id_634530b94c765640_fk_django_content_type_id` (`content_type_id`),
  KEY `reviews_review_user_id_a4f605f1515de63_fk_auth_user_id` (`user_id`),
  CONSTRAINT `reviews_review_user_id_a4f605f1515de63_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `revie_content_type_id_634530b94c765640_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_review`
--

LOCK TABLES `reviews_review` WRITE;
/*!40000 ALTER TABLE `reviews_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_shippingmethod`
--

DROP TABLE IF EXISTS `shipping_shippingmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_shippingmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `priority` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `note` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` double NOT NULL,
  `price_calculator` varchar(200) NOT NULL,
  `delivery_time_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shi_delivery_time_id_2d677d3ae9fe737c_fk_catalog_deliverytime_id` (`delivery_time_id`),
  KEY `shipping_shippingmethod_tax_id_46dec60718454d9_fk_tax_tax_id` (`tax_id`),
  CONSTRAINT `shipping_shippingmethod_tax_id_46dec60718454d9_fk_tax_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax_tax` (`id`),
  CONSTRAINT `shi_delivery_time_id_2d677d3ae9fe737c_fk_catalog_deliverytime_id` FOREIGN KEY (`delivery_time_id`) REFERENCES `catalog_deliverytime` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_shippingmethod`
--

LOCK TABLES `shipping_shippingmethod` WRITE;
/*!40000 ALTER TABLE `shipping_shippingmethod` DISABLE KEYS */;
INSERT INTO `shipping_shippingmethod` VALUES (1,1,1,'Standard','<p>description for standard shipping method</p>','<p>note&nbsp;<span style=\"font-size: 10px;\">for standard shipping method</span></p>','images/QQ??20151117134316.jpg',1,'lfs.shipping.GrossShippingMethodPriceCalculator',1,NULL);
/*!40000 ALTER TABLE `shipping_shippingmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_shippingmethodprice`
--

DROP TABLE IF EXISTS `shipping_shippingmethodprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_shippingmethodprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `priority` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `shipping_method_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `e7b1d528df11d15f8e72660c2bdf6065` (`shipping_method_id`),
  CONSTRAINT `e7b1d528df11d15f8e72660c2bdf6065` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_shippingmethod` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_shippingmethodprice`
--

LOCK TABLES `shipping_shippingmethodprice` WRITE;
/*!40000 ALTER TABLE `shipping_shippingmethodprice` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_shippingmethodprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_supplier`
--

DROP TABLE IF EXISTS `supplier_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `supplier_supplier_user_id_4c28ea4c1ec47d25_fk_auth_user_id` (`user_id`),
  CONSTRAINT `supplier_supplier_user_id_4c28ea4c1ec47d25_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_supplier`
--

LOCK TABLES `supplier_supplier` WRITE;
/*!40000 ALTER TABLE `supplier_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_tax`
--

DROP TABLE IF EXISTS `tax_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_tax` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rate` double NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_tax`
--

LOCK TABLES `tax_tax` WRITE;
/*!40000 ALTER TABLE `tax_tax` DISABLE KEYS */;
INSERT INTO `tax_tax` VALUES (1,1,'<p>description for product tax</p>');
/*!40000 ALTER TABLE `tax_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucher`
--

DROP TABLE IF EXISTS `voucher_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(100) NOT NULL,
  `creation_date` datetime NOT NULL,
  `start_date` date DEFAULT NULL,
  `effective_from` double NOT NULL,
  `end_date` date DEFAULT NULL,
  `kind_of` smallint(5) unsigned NOT NULL,
  `value` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `used_amount` smallint(5) unsigned NOT NULL,
  `last_used_date` datetime DEFAULT NULL,
  `limit` smallint(5) unsigned DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `tax_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `voucher_voucher_creator_id_1309986416611bdd_fk_auth_user_id` (`creator_id`),
  KEY `voucher_voucher_0e939a4f` (`group_id`),
  KEY `voucher_voucher_59fc14e7` (`tax_id`),
  CONSTRAINT `voucher_voucher_tax_id_696404c2c3550e6c_fk_tax_tax_id` FOREIGN KEY (`tax_id`) REFERENCES `tax_tax` (`id`),
  CONSTRAINT `voucher_voucher_creator_id_1309986416611bdd_fk_auth_user_id` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `voucher_vou_group_id_5e21901aaa5b8e58_fk_voucher_vouchergroup_id` FOREIGN KEY (`group_id`) REFERENCES `voucher_vouchergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucher`
--

LOCK TABLES `voucher_voucher` WRITE;
/*!40000 ALTER TABLE `voucher_voucher` DISABLE KEYS */;
INSERT INTO `voucher_voucher` VALUES (1,'HSXDK','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(2,'EJAGE','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(3,'SYTRH','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(4,'BLXFU','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(5,'SJWHH','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(6,'KFOXS','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(7,'XBPME','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(8,'MVAFE','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(9,'PLIVN','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1),(10,'YMEVD','2016-05-09 00:34:51','2016-05-09',1,'2017-07-29',0,1,1,0,NULL,2,1,1,1);
/*!40000 ALTER TABLE `voucher_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_vouchergroup`
--

DROP TABLE IF EXISTS `voucher_vouchergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_vouchergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `creation_date` datetime NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_vouchergroup_creator_id_477d885501158d79_fk_auth_user_id` (`creator_id`),
  CONSTRAINT `voucher_vouchergroup_creator_id_477d885501158d79_fk_auth_user_id` FOREIGN KEY (`creator_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_vouchergroup`
--

LOCK TABLES `voucher_vouchergroup` WRITE;
/*!40000 ALTER TABLE `voucher_vouchergroup` DISABLE KEYS */;
INSERT INTO `voucher_vouchergroup` VALUES (1,'test voucher group','2016-05-09 00:34:17',10,1);
/*!40000 ALTER TABLE `voucher_vouchergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_voucheroptions`
--

DROP TABLE IF EXISTS `voucher_voucheroptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_voucheroptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_prefix` varchar(20) NOT NULL,
  `number_suffix` varchar(20) NOT NULL,
  `number_length` int(11) DEFAULT NULL,
  `number_letters` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_voucheroptions`
--

LOCK TABLES `voucher_voucheroptions` WRITE;
/*!40000 ALTER TABLE `voucher_voucheroptions` DISABLE KEYS */;
INSERT INTO `voucher_voucheroptions` VALUES (1,'','',5,'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
/*!40000 ALTER TABLE `voucher_voucheroptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-08 16:45:06
