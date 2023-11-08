-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: automacao
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `etapas`
--

DROP TABLE IF EXISTS `etapas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapas` (
  `pk_id_etapa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_tarefa` bigint unsigned NOT NULL,
  `ordem` int NOT NULL,
  `nome_etapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempo_execucao` int NOT NULL,
  `digitar` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caminho` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atalho` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pk_id_etapa`),
  KEY `etapas_fk_id_tarefa_foreign` (`fk_id_tarefa`),
  CONSTRAINT `etapas_fk_id_tarefa_foreign` FOREIGN KEY (`fk_id_tarefa`) REFERENCES `tarefas` (`pk_id_tarefa`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapas`
--

LOCK TABLES `etapas` WRITE;
/*!40000 ALTER TABLE `etapas` DISABLE KEYS */;
INSERT INTO `etapas` VALUES (69,8,1,'desktop','atalho',5,NULL,'hfLMWuQCjgezbQ4pwIw1XNHAxjSkpdAJ1gzBESJv.png','win,m'),(70,8,2,'service','clicar 2x',5,NULL,'UcFtlHJmWp3IqAUcrL5mT4ktDXiI2dKTi9MAMgjL.png',NULL),(72,8,4,'logar','clicar',10,NULL,'UI0FtA8jTLHHNp3wAjR5w9YUspXEX6h4IBAEVTnO.png',NULL),(73,8,3,'botar senha','digitar',15,'vini2312','i0Nhlb9ig4qUC0aCsvokXGeOXWuvNY7YLq79uYuT.png',NULL),(74,8,5,'financeiro','clicar',10,NULL,'Bbp5clpfhvmECWeTp7T02Xhyc7GSDM4uZl4N3Avf.png',NULL),(75,8,6,'processos de cartão','clicar',5,NULL,'Gx815J9vuRW0nF2G0L573PBVxMcTHH5J35sAXu6U.png',NULL),(76,8,7,'abrir os processos','clicar',5,NULL,'pMkUUuk4DeUHsyvpdQX2B6ca6UK2iSifsULeeeec.png',NULL),(80,8,8,'vencimentos','clicar',10,NULL,'KfYHn5CGmZH7j7jYdNVOPqR4yuWBOuJD6AN94ixU.png',NULL),(81,8,9,'processar os selecionados','clicar',10,NULL,'SdECGoQrCEz1sEGYpdqhzH6CCpLCzdF12Or5UU5J.png',NULL),(82,8,10,'sim','clicar',10,NULL,'knuqkRMqE4c92BTMb8lF13xiLfn7V70INMNb1viM.png',NULL),(84,8,11,'ok','clicar',10,NULL,'B8fe6RfzzexMQYpDEMiYSA5flcBZxeCKTifdboVo.png',NULL),(85,8,19,'f6','atalho',10,NULL,'L1Ld5dsHgGVoKlXxmErzEtPODhN0qLGdkoWahFqb.png','f6'),(86,8,20,'botar filial','digitar',10,'16','ktd4GtxbO4UsknwnPZtQC1tfidU3m9S3evhroUG1.png',NULL),(88,8,12,'abrir excel','clicar',10,NULL,'aA9Obn7C01wVb5BoZZuR8GYkv6pSPYQpksllqfLs.png',NULL),(89,8,13,'abrir aplicativo excel','clicar',10,NULL,'ky3n8sGpZwAS5dX5iorx64F7g4vVIrxPRluXwbvG.png',NULL),(90,8,14,'control B','atalho',10,NULL,'FZG2brZ297MSFBHdn8MsLYApycDnMntP62Sku87C.png','ctrl,b'),(92,8,17,'botao sim','clicar',5,NULL,'H25xOhdQP0tq2L2p98N0s9WXInIY1Fuw6SrzOaKR.png',NULL),(93,8,16,'botao salvar excel','clicar',5,NULL,'eBCSEyNzSSGcx2k0amhuDEvvOpSoA7nsnBwvqp4U.png',NULL),(95,8,15,'salvar pasta 1','clicar',5,NULL,'Ag0P88xuI2wRLc1i0fYhB9LfG66Iogf9kqSXFMc4.png',NULL),(97,8,21,'clicar no botao okay','clicar',10,NULL,'kXNwsJEgydjvb4MkM0EBHBRwSxE1vEWXYs7zSPDj.png',NULL),(100,8,24,'processar os selecionados','clicar',10,NULL,'eqlTZMGRlKo1XUcK0waqNgds822GC1szwqaYxEW7.png',NULL),(101,8,25,'clicar botão sim','clicar',10,NULL,'c3czVdHuWZkSF5Z0x6SSjhZDldnymnmh3YxSGNBD.png',NULL),(103,8,27,'abrir excel','clicar',10,NULL,'2djnphonMcUIzdGeAYY2gyWWbs6zVmkkFq7G2kYV.png',NULL),(104,8,28,'abrir app excel','clicar',10,NULL,'Bsmzn6Cl4R60d3cDIzRjKIYOdUYBcnMCFtqzbl8f.png',NULL),(105,8,29,'control B','atalho',5,NULL,'y0gYWzWG7UqRQToXsXd6Xsrxq325fwUQKeWHbvQW.png','ctrl,b'),(106,8,30,'salvar pasta 16','clicar',5,NULL,'8nuTK3L64SXJ0Upu0cxBPKFV98fm0hpKaYDdOQhO.png',NULL),(107,8,31,'salvar excel','clicar',5,NULL,'wCCQhiWSKERGqUGBG9nHkXjmp5VUyKt6Hmd7C6vB.png',NULL),(108,8,32,'confirmar sobrescrita','clicar',5,NULL,'IMWHNfqExj0aBfsaUA2OkTkvOaKnIdsAtRSGOD9h.png',NULL),(110,8,22,'clicar em emissão','clicar',5,NULL,'DWoNStUCrQmIPy4u2dZBdSC38vzj50f7i2Cv288o.png',NULL),(111,8,23,'clicar em vencimento','clicar',5,NULL,'zeikpOlIzaJuT1VS8qdUFPlab1NrqLO68oV73wBA.png',NULL),(114,8,34,'f6','atalho',10,NULL,'REFHqaZVCww0F1LB2Lk1YHvz2ptSsvWsEHS0FEUq.png','f6'),(115,8,35,'digitar filial 31','digitar',10,'31','1j8yyu4srNl5XZuJk4dA7012wWvALLV0GxRZRx3R.png',NULL),(116,8,36,'apertar botão ok','clicar',10,NULL,'aL46sCnFXYMlocj5K0KVLhrSJRaugC538QSWMARw.png',NULL),(117,8,37,'clicar em emissao','clicar',10,NULL,'DD5m9EiwuEB6J2pA25Wh4FDcUevNe40PUWoGzaAF.png',NULL),(118,8,38,'clicar em vencimento','clicar',10,NULL,'lWHwv6sYAxc5FtNFxqdSNeLtBKmc55WSdHCeGssZ.png',NULL),(119,8,39,'processar os selecionados','clicar',10,NULL,'BZqiXaZENsEjiHozKxf6DuFJBAqWiVabBcBcSfku.png',NULL),(120,8,40,'clicar sim','clicar',10,NULL,'vVg0awo4hDnzxsySGTOFhsdair3bD7FcMxWlsklK.png',NULL),(122,8,42,'abrir excel','clicar',10,NULL,'loN0uFoXgxKMzCg0ACpeUgQQAq2tbEjjqED0PS8b.png',NULL),(123,8,43,'abrir app excel','clicar',10,NULL,'GVEitRvcVKKE5vbISiYAfXYCrjtD86q4kImMjCCf.png',NULL),(124,8,44,'control B','atalho',5,NULL,'MKIY0vUIPIygsQqcYNBlNWt66MyGazANbli4yY7J.png','ctrl,b'),(125,8,45,'salvar pasta 31','clicar',5,NULL,'fRkHj3SEXN9qHdZUR2O3UMs1MWgekgbtsIsZHGqh.png',NULL),(126,8,46,'salvar','clicar',5,NULL,'Mo5wFdtDWC2uxxIkaojneLxnO2bKrRD8SmDfiEb4.png',NULL),(127,8,47,'sobrescrever excel','clicar',5,NULL,'xzRvkIBtA4BTfXJEvVZcxt7adWpUop4Dbkx10GSu.png',NULL),(130,8,48,'fechar excel','clicar',5,NULL,'7A5JSEieGFjPgrO85kLuxsRFR9HwN2oTvyM1mBSU.png',NULL),(131,8,18,'fechar excel','clicar',5,NULL,'Ob2IoNyGGRLSYafWsssq8p9CiR655Ypesf67Nc9W.png',NULL),(132,8,33,'fechar excel','clicar',5,NULL,'gT203XFpnf3lgCsaKRkGyYXdVr6ZLNumTjnEFkR3.png',NULL),(133,8,26,'clicar botão ok','clicar',10,NULL,'udXqe20Dsr3e0rq06bsnwU1oTRHXAD7Kf4QZq0sg.png',NULL),(134,8,41,'apertar botão ok','clicar',10,NULL,'nIkJkToHc8qyzqsOyjtMoUr6rw1C3STbFZCWNDWK.png',NULL),(135,8,49,'f6','atalho',10,NULL,'tPcjbw6fJhdllZRHM55Q58QruqoJ15nC3vjBl58N.png','f6'),(136,8,50,'clicar e digitar 34','digitar',10,'34','aoJjF7MJeiUk6J9Kum5tfVjFXIuGbz4t7c2wJqtK.png',NULL),(137,8,51,'clicar em ok','clicar',10,NULL,'7Tuxqd1u00GcJ9pXWIdU6tK3uJ6SuPMPveHH04UX.png',NULL),(138,8,52,'emissao','clicar',5,NULL,'9vrcE2pkd99q7ZFFypPYZPQTSu5tWOcimYdG8A7V.png',NULL),(139,8,53,'vencimentos','clicar',5,NULL,'fVETQ3VzjDowVIL6qvqrNMvpJa5fQCfxzkbCzEmf.png',NULL),(140,8,54,'processar os selecionados','clicar',10,NULL,'6nrZinQ89XiKzaTNoWb5vcJK4OJtUshFMOqRKZ4j.png',NULL),(141,8,55,'clicar sim','clicar',10,NULL,'VLNMAB1GaycPBy9ZwWJ9MKYrPdhfiXnawI83XB6v.png',NULL),(142,8,56,'clicar ok','clicar',10,NULL,'0bbfushcC4rpUxNFJxtt3hKzaL2T6HfdW9y1UagN.png',NULL),(143,8,57,'abrir excel','clicar',10,NULL,'Rd383aiA9vykgDaDtrGudyUR35avZeaO9q7DS00W.png',NULL),(144,8,58,'abrir app excel','clicar',10,NULL,'i814eY1gXwfCB0xNfN8FFrat4dLhqppAaR5BLOGn.png',NULL),(145,8,59,'control B','atalho',5,NULL,'oIWzyPzJJnRoW1DTApuWgLcJ9JHjNMGKf5hnsxYZ.png','ctrl,b'),(146,8,60,'salvar pasta 34','clicar',5,NULL,'BfIXVkNkyFDVjxflBC6egfo8jFATrkWWN9UZTbQx.png',NULL),(147,8,61,'salvar excel','clicar',5,NULL,'5M9drbUIy8KrqwYeQwGF42ovAdzRejzJWuRFMnQc.png',NULL),(148,8,62,'sim excel','clicar',5,NULL,'iRKTAemk0tCVzVRNUgb2lMICIkCZJGPFl10cgRC1.png',NULL),(149,8,63,'fechar excel','clicar',5,NULL,'dEhS2alZWwU3JX8CRHdJO08iTVTSQYGk35ZG96b9.png',NULL),(150,8,64,'f6','atalho',10,NULL,'s4VRwdrOpWMZaSXrw4rsSJlSmhUfqkluLRzo63bk.png','f6'),(151,8,65,'clicar e digitar 79','digitar',10,'79','PnsIRgjXrsdlWNIgAgx00cW1hXF8cEvFgXSHAgte.png',NULL),(152,8,66,'clicar ok','clicar',10,NULL,'EfxqgQJYXhLOASKCEIv8YtqbbSicae34c16lRaFD.png',NULL),(153,8,67,'emissao','clicar',10,NULL,'ltgCsxYZeDgjN1Kv1MGtIw4UHPhSaZN5AvMjGk4N.png',NULL),(154,8,68,'vencimentos','clicar',5,NULL,'d5zVHU6nNqXE4NOCV6d1NjMg2K8JB2pahyhuhNzJ.png',NULL),(155,8,69,'processar os selecionados','clicar',10,NULL,'6seTNBvdnI94l909cxlWPLz9iLQEQbRa7zb7lSPD.png',NULL),(156,8,70,'clicar sim','clicar',10,NULL,'YIRVaUaVqW14vOsewiny6rxMWKv1gPvhqKAb9MkP.png',NULL),(157,8,71,'clicar ok','clicar',10,NULL,'WSvtWQWajY4TAdSEda1eliZ4RVK8hSTlfZgNeFSm.png',NULL),(158,8,72,'abrir excel','clicar',10,NULL,'9Czl40paj63bOXdNoimfG5TqguUuLWBj3VjvBi7e.png',NULL),(159,8,73,'abrir app excel','clicar',10,NULL,'DfmgDRXMzGGSbrZ7Osz3zIwBHBrn3MKH0scE9yml.png',NULL),(165,8,74,'control B','atalho',5,NULL,'gRrZbfHvkKodZ2WoRZXo8Gik8rYA6ojT8DkPG3hT.png','ctrl,b'),(166,8,75,'salvar pasta 79','clicar',5,NULL,'a5OvIA0uGleya6zJNA9wXM5MzOP2Qe1F4mYYu9w6.png',NULL),(167,8,76,'salvar excel','clicar',5,NULL,'NNb1cGTWloHzONB0ihKxBwZjBJcfRRUsspU1Q6E8.png',NULL),(168,8,77,'clicar sim excel','clicar',5,NULL,'drReaMcMiDwpBG6B3Xnkn2M8Ue8gcHvXcLtQPntM.png',NULL),(169,8,78,'fechar excel','clicar',5,NULL,'f1aNcJjWvV3temmKabtQMk5dd2bGirwaIFOBVhKb.png',NULL),(170,8,79,'fechar processos','clicar',5,NULL,'CSGHSHI591vXU454sVRvr04LqvNN80iEIrTrwXzD.png',NULL),(173,2,2,'giroflex','clicar 2x',10,NULL,'IRfGUwpQVN39BQmOdjxm4RYmRCo3QrueDC3Fo44S.png',NULL),(183,2,3,'linguiça','clicar',5,NULL,'4W9cocyu5SskfuOGnWG2rX7dEixmHoyxezThei0w.png',NULL),(184,2,4,'laercio','clicar',5,'null','O3XGDSQxPGIBzDN6iYPfViKs2VvdNPA5eIEqJn2a.png',',,'),(185,2,1,'çççç','clicar',5,'null','0DQGQk4DKcBaSRtqQZqTAjuGV3vMZBwBUZ5PPdv5.png',',,'),(186,2,3,'lindomar3x','clicar 2x',5,'null','r1BqQO6RRzmb9MkNGtLyUmf4P6Qrph4rc09w1lcl.png',',,'),(187,2,6,'serigo','clicar com direito',15,NULL,'kb5K8uDXNQTlnJiQIA0qNSxtFC6AZC3JpV9WH8LQ.png',NULL),(188,9,1,'area de trabalho','atalho',5,NULL,'Rj4PUbRbqPsPexSJF1xwgqbSatQOSEk8bVwALxQ2.png','win,m'),(189,9,1,'botao direito','clicar com direito',10,NULL,'CkfyiajYRQRf6lR4YWnvDxGMuai4CEujTp2Kmr7G.png',NULL),(190,9,4,'clicar novo','clicar',10,NULL,'YsNgsg8zh991tZFAKJHrCYbRwSpLX2W05VVkbf3y.png',NULL),(191,9,2,'texto','digitar',10,'sdgegwew','t97frM2HymmRIqqsTZNelPMWZB6CjdjzBoaDS4hK.png',',,'),(192,12,1,'Totalmente inocente','clicar com direito',5,NULL,'komeyFqGDS62SmLUUm0SKj6zqz271c2Ro526dYzo.png',NULL);
/*!40000 ALTER TABLE `etapas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2023_02_09_132029_tarefa',1),(5,'2023_02_09_132104_etapa',1),(6,'2023_02_16_114401_tarefa_log',1),(7,'2019_12_14_000001_create_personal_access_tokens_table',2),(8,'2023_02_17_153805_add_fk_id_etapa_table_tarefa_log',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'_usuario_token','81a946ae09ac54ef9c130fc3864d8b61f6412a2132adf0817130d7746605a0d9','[\"*\"]',NULL,'2023-03-03 17:25:36','2023-03-03 17:25:36'),(2,'App\\Models\\User',1,'_usuario_token','4d1cde285e231595c1d500dc87b354b679f2278e6ffca0ec42beb61e68770008','[\"*\"]',NULL,'2023-03-03 17:26:06','2023-03-03 17:26:06'),(3,'App\\Models\\User',1,'_usuario_token','2e2f620997777b0bd7b5d1375443cc23ce47b5182bc0da22bd6ca39cd747b179','[\"*\"]',NULL,'2023-03-03 17:27:44','2023-03-03 17:27:44'),(4,'App\\Models\\User',1,'_usuario_token','d78b3315c0c9364af5f20146d60a8d98f4c711f808a35f1dcd939eef38734165','[\"*\"]',NULL,'2023-03-03 17:32:50','2023-03-03 17:32:50'),(5,'App\\Models\\User',1,'_usuario_token','a29f61795c3cfed081fce552496a858036d394d6366bf43c2f5843bbbe1ee8cc','[\"*\"]',NULL,'2023-03-03 17:54:42','2023-03-03 17:54:42'),(6,'App\\Models\\User',1,'_usuario_token','dec8c1790b8d1e858d7733f849977423bbd3b973ae16ad6915b43ea943b5e00b','[\"*\"]',NULL,'2023-03-03 18:03:14','2023-03-03 18:03:14'),(7,'App\\Models\\User',1,'_usuario_token','b01a208a67d53ecd0967c253f21dbb08e7d0a34a0c358eb64daca78d4d7be760','[\"*\"]',NULL,'2023-03-03 18:50:55','2023-03-03 18:50:55'),(8,'App\\Models\\User',1,'_usuario_token','812582ae5e335af6b976ddd552a0a6feae5bea0c76baa1af2f016ec54654fe84','[\"*\"]',NULL,'2023-03-03 19:03:20','2023-03-03 19:03:20'),(9,'App\\Models\\User',1,'_usuario_token','32af200e4d80383d1bd6174ae40d7457cf49118dab73a33439715c49e1f50971','[\"*\"]','2023-03-03 19:43:30','2023-03-03 19:14:02','2023-03-03 19:43:30'),(10,'App\\Models\\User',1,'_usuario_token','03e88a2452c86bd3794200f21e12a4bea6dc7e582c1cbbf3a88d5a5b6da630ff','[\"*\"]','2023-03-06 14:55:00','2023-03-06 14:21:16','2023-03-06 14:55:00'),(11,'App\\Models\\User',1,'_usuario_token','ef053dab77408132653cb6721f8e392705b400d0de8c5826fec55911743fbb4a','[\"*\"]','2023-03-06 15:09:42','2023-03-06 15:07:04','2023-03-06 15:09:42'),(12,'App\\Models\\User',1,'_usuario_token','f3b4272a2dbf3935e831cf5968b811f7a8abbdba9133289ad48f42a14f75bd91','[\"*\"]',NULL,'2023-03-06 15:10:49','2023-03-06 15:10:49'),(13,'App\\Models\\User',1,'_usuario_token','ba48e95bf7f95e5758a6ddba0f889ccb86ca27584c0f170491c37f291ac29483','[\"*\"]',NULL,'2023-03-06 15:17:32','2023-03-06 15:17:32'),(14,'App\\Models\\User',1,'_usuario_token','0e26c2205f8593527b3e7d1692f94a95e42afb5aac5854bdeae2800a3dfd159b','[\"*\"]','2023-03-06 17:44:26','2023-03-06 15:44:37','2023-03-06 17:44:26'),(15,'App\\Models\\User',1,'_usuario_token','f39d4ecc9414bfa2e11cf456df5f4ab940cbdc63fcd8a25262a212f0ea1d4682','[\"*\"]',NULL,'2023-03-06 18:11:32','2023-03-06 18:11:32'),(16,'App\\Models\\User',1,'_usuario_token','05f3c56d784b326e0e66319f2d219fd562fcf606b6cc2822868509f180040a50','[\"*\"]',NULL,'2023-03-06 18:13:35','2023-03-06 18:13:35'),(17,'App\\Models\\User',1,'_usuario_token','eac8ca4edb1a3d59d70d2187b2e2a2974af674b982c3890183b80303be39dffb','[\"*\"]',NULL,'2023-03-07 16:08:33','2023-03-07 16:08:33'),(18,'App\\Models\\User',1,'_usuario_token','79fde15e8b6bc2c0ee0e3c42949df79f8a5d09ae99a88d7832260f1a1f140f98','[\"*\"]','2023-03-08 16:42:45','2023-03-08 16:19:30','2023-03-08 16:42:45'),(19,'App\\Models\\User',1,'_usuario_token','da7f33f3e4db41bd0d96f16695cb7b1effb8952604cd01396245f8f80e060183','[\"*\"]','2023-03-09 19:17:55','2023-03-09 14:16:48','2023-03-09 19:17:55'),(20,'App\\Models\\User',1,'_usuario_token','af49b34f2fe252bcfe0daf919835997c019d17736a96863b5c5ca4beea997f7e','[\"*\"]','2023-03-10 19:02:51','2023-03-10 14:36:52','2023-03-10 19:02:51'),(21,'App\\Models\\User',1,'_usuario_token','5db408e95cc54006e7bcd2a3236940cb8136d0ebaa9623bdf3bc8aef0666fd00','[\"*\"]','2023-03-13 14:34:26','2023-03-13 14:34:10','2023-03-13 14:34:26'),(22,'App\\Models\\User',1,'_usuario_token','49bf0b0f624b42ffe3ee060c6460ed40c31b9b1a94410c4dd1da15df72bf378e','[\"*\"]','2023-03-13 17:46:23','2023-03-13 14:53:00','2023-03-13 17:46:23'),(23,'App\\Models\\User',1,'_usuario_token','6de89454544b7ffeab408017e24538b5c2736368bf704350d865ec58921d1819','[\"*\"]','2023-03-13 19:42:51','2023-03-13 17:58:40','2023-03-13 19:42:51'),(24,'App\\Models\\User',1,'_usuario_token','0724c680863e97ab358418cfd6ebfa071d5da695a8be0fdda95bf1d847bef7e4','[\"*\"]',NULL,'2023-03-14 14:57:17','2023-03-14 14:57:17'),(25,'App\\Models\\User',1,'_usuario_token','6c8771c3b06231963546d86dddc33530420001d7b16c57cdfdf9f82f76168375','[\"*\"]',NULL,'2023-03-15 14:34:27','2023-03-15 14:34:27'),(26,'App\\Models\\User',1,'_usuario_token','4c8442062dc3b3e55bc73e8926024eaee92752c50e1de6f6019cc6b88edc5f64','[\"*\"]','2023-03-16 18:54:44','2023-03-15 14:34:33','2023-03-16 18:54:44'),(27,'App\\Models\\User',1,'_usuario_token','19aa3fc7d5b92a7fe838d71bc454a8d6fe22995284922faf532f4551a7507e86','[\"*\"]','2023-03-17 17:40:52','2023-03-17 15:06:23','2023-03-17 17:40:52'),(28,'App\\Models\\User',1,'_usuario_token','402b7cb0f2c15f26a8baa0c25df4d325fe518bbda63354396941717af25bd2e6','[\"*\"]',NULL,'2023-03-20 16:08:25','2023-03-20 16:08:25'),(29,'App\\Models\\User',1,'_usuario_token','d55a0be2e90afbe540eaa5a09dafa939dd8422181bdb16f6060eee782c79e2c2','[\"*\"]',NULL,'2023-03-21 11:56:45','2023-03-21 11:56:45'),(30,'App\\Models\\User',1,'_usuario_token','ae12f850854f9ba473e545a50b0b36cf66fda67333dcc4642d6891c40be61077','[\"*\"]',NULL,'2023-03-21 11:56:46','2023-03-21 11:56:46'),(31,'App\\Models\\User',1,'_usuario_token','5088df3204a9ace0d4fbad6ab4cfb0d29719aad2d7d7c8e3f7ca062c52644103','[\"*\"]','2023-03-22 14:18:18','2023-03-22 12:47:51','2023-03-22 14:18:18'),(32,'App\\Models\\User',1,'_usuario_token','e69873f271178d5e3f21b70253f64ca91f0079faf1d332b4325c10d61c13f592','[\"*\"]',NULL,'2023-03-23 12:19:04','2023-03-23 12:19:04'),(33,'App\\Models\\User',1,'_usuario_token','73ae550524f984decc7c0b24927322448f449a0f47a3495fea6b90bc495d408b','[\"*\"]','2023-03-24 12:46:46','2023-03-24 11:22:52','2023-03-24 12:46:46'),(34,'App\\Models\\User',1,'_usuario_token','beca8dd9ddf06b1d90414fc50b7ddcf48f19e446c7e9eef021922c4f502572f4','[\"*\"]','2023-03-24 15:03:42','2023-03-24 14:49:03','2023-03-24 15:03:42'),(35,'App\\Models\\User',1,'_usuario_token','6646447c38a85b616d5a34e6556b78ad805374aa532ad7aa074700d5911720d4','[\"*\"]','2023-03-24 15:49:51','2023-03-24 15:38:43','2023-03-24 15:49:51'),(36,'App\\Models\\User',1,'_usuario_token','58f02e378c576500d8c6dfc06e87bb589c4d5d7662b888e930e52d3978c6b5cd','[\"*\"]','2023-03-27 15:41:24','2023-03-27 15:13:07','2023-03-27 15:41:24'),(37,'App\\Models\\User',1,'_usuario_token','c92879232e2d91ea5a83a2d6ede7ea24e7fd274bdae1ef8011f599c66ece388b','[\"*\"]',NULL,'2023-03-28 11:40:27','2023-03-28 11:40:27'),(38,'App\\Models\\User',1,'_usuario_token','deaf434b7f92ac144e4fc179983b9f1669ab7d7f04276b567f527c14717525b1','[\"*\"]',NULL,'2023-03-28 11:40:29','2023-03-28 11:40:29'),(39,'App\\Models\\User',1,'_usuario_token','1f6e639827c1cacee243bc8d97e502a45ba218b7670d2d66e3fa2ec3bb38aa8b','[\"*\"]',NULL,'2023-03-28 12:14:42','2023-03-28 12:14:42'),(40,'App\\Models\\User',1,'_usuario_token','9777c813035f35d89c958edf5fe18d1439fb63457f6822295de97d1ec0903c3d','[\"*\"]',NULL,'2023-03-29 11:24:27','2023-03-29 11:24:27'),(41,'App\\Models\\User',1,'_usuario_token','f87954d93e594b6ecc4698cbd90ae8d0de2ac9ad85a96891d54e04f501caa8f4','[\"*\"]',NULL,'2023-03-30 11:47:38','2023-03-30 11:47:38'),(42,'App\\Models\\User',1,'_usuario_token','62ac9375d0311ea9505b1c96ca1ef060daa381db5de1f43dcdc37cf1101069bd','[\"*\"]',NULL,'2023-04-04 14:37:12','2023-04-04 14:37:12');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa_horario`
--

DROP TABLE IF EXISTS `tarefa_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefa_horario` (
  `pk_id_tarefa_horario` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_tarefa` int unsigned NOT NULL,
  `data_hora_executar` timestamp NOT NULL,
  `dia_da_semana` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pk_id_tarefa_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa_horario`
--

LOCK TABLES `tarefa_horario` WRITE;
/*!40000 ALTER TABLE `tarefa_horario` DISABLE KEYS */;
INSERT INTO `tarefa_horario` VALUES (1,2,'2023-03-20 12:00:00','seg,qui','não executado');
/*!40000 ALTER TABLE `tarefa_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefa_logs`
--

DROP TABLE IF EXISTS `tarefa_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefa_logs` (
  `pk_id_tarefa_log` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fk_id_tarefa` bigint unsigned NOT NULL,
  `nome_etapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `caminho` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_hora` timestamp NOT NULL,
  `fk_id_etapa` bigint unsigned NOT NULL,
  PRIMARY KEY (`pk_id_tarefa_log`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa_logs`
--

LOCK TABLES `tarefa_logs` WRITE;
/*!40000 ALTER TABLE `tarefa_logs` DISABLE KEYS */;
INSERT INTO `tarefa_logs` VALUES (1,3,'totalmente inocente','teste','positivo','2018-02-21 15:00:00',0),(2,3,'totalmente inocente','erro/lDadcuWELYDFmyZ2rhktoSA9ly8EPFSvkafrv9hS.png','positivo','2018-02-21 15:00:00',0),(3,2,'abrir arquivo','erro/dCMbBKQLaVg7HGikvzVGWtp56i4oKfnk93RvokKB.png','Erro','2018-02-21 15:00:00',0),(4,2,'abrir arquivo','erro/nHJHPdJ2vk5RCTmUZCaxs3FAq6pzq0b5W1sj7Bpg.png','Erro','2018-02-21 15:00:00',0),(5,2,'abrir arquivo','erro/eK2Y1diAFdyAomrVsIqgEZGqeWnCJ7ovsWcPyHsp.png','Erro','2018-02-21 15:00:00',0),(6,2,'abrir arquivo','erro/gqsVxEuci9L6xBGi3Zrr0MYGd4MM8ourZpqSzu2v.png','Erro','2018-02-21 15:00:00',0),(7,2,'abrir arquivo','erro/igB5dIOOR0woOlyNQNhMWpd44hMsQ7LLyVQD9eQ8.png','Erro','2018-02-21 15:00:00',2),(8,2,'Totalmente inocente','erro/JCrg3TYsMzBI2LGtcvPNqvnJa1rrqKsYJtSao4UG.png','Erro','2018-02-21 15:00:00',5),(9,2,'abrir arquivo','erro/LlRTu7XHZ0VIVjZGVzxIvFsv5RpCuFSbRka05s5w.png','Erro','2023-02-24 12:06:30',2),(10,2,'sdasd','erro/Or4qs08zu61LXYCiFXWTR8mcHPubGtbvNa0L5hwp.png','Erro','2023-03-02 16:11:10',13),(11,2,'Totalmente inocente','erro/a8txTZxno0J3hO8Ty8g3TQ2KEjpwplC9lcNT7cLH.png','Erro','2023-03-09 13:09:06',56),(12,2,'Totalmente inocente','erro/uxnLnGB9M2KFxyud1WoPLKZeuWAZDXX2N9M2Nwmy.png','Erro','2023-03-09 13:10:23',56),(13,2,'dasd','erro/cKmrTokR68hKFIIsxtoNYyIiLC2HNn4ClFnWLFXt.png','Erro','2023-03-09 14:37:42',58),(14,8,'botar senha','erro/1E88b3KXsLWADuLSIp3qAs90Kxj9bOufmia8yLSS.png','Erro','2023-03-09 16:02:29',73),(15,8,'processos de cartão','erro/PORFRFoKFlFOTHb7aDpkEwkTr61p2wham7rHRWqc.png','Erro','2023-03-10 12:17:42',75),(16,8,'processos de cartão','erro/nNROTHJ13rB4PiIibbf8BN6sqZZxdQ3gPaJG0tib.png','Erro','2023-03-10 12:20:03',75),(17,8,'ok','erro/F7cGUxoy4Mdn0Of4sQWeK86DjG6VHqr6fzYGXcpw.png','Erro','2023-03-10 15:54:24',83),(18,8,'ok','erro/zp3MW3ZZKhH9dIhWwooy0gOiM6zHt5TukPPmBvwO.png','Erro','2023-03-10 16:07:54',87),(19,8,'salvar pasta 1','erro/030lRI6P27k26o6nTELQ42VeIbF9rUWLFWjey3hZ.png','Erro','2023-03-13 12:26:05',91),(20,8,'salvar pasta 1','erro/fHSqLkUNqthfCYfaiCWvWDL0m7FvlutOkMhZbZMA.png','Erro','2023-03-13 12:29:40',91),(21,8,'salvar pasta 1','erro/eM4fDzCf9E6akafgPVMmx5bRWnI58f7imhoAYy4Q.png','Erro','2023-03-13 12:38:25',94),(22,8,'salvar pasta 1','erro/n6w1T7XP6aKjR8YxD8ojF2ZG2YQdZZs7e2eIfPOo.png','Erro','2023-03-13 12:55:10',95),(23,8,'botar filial','erro/QCzdpG14npuK58d09pDHkDYZX2mAKV4FvsWgOh1I.png','Erro','2023-03-13 13:01:04',86),(24,8,'clicar botão sim','erro/XckNTwh6ofjJWxIFIn8gxrJG6W09JbbSvmn4TLJl.png','Erro','2023-03-13 13:37:58',101),(25,8,'fechar excel','erro/F6RIZMU1hCcKp4UM7CikdXhR4Qv3xw63NYaY9pgV.png','Erro','2023-03-13 14:35:26',113),(26,8,'clicar no botão ok','erro/lJndDS3zCQMFWoZoJ0u6RM41wkZbZu09e883FpH5.png','Erro','2023-03-13 15:03:25',102),(27,8,'clicar no botão ok','erro/aybS6UGUNEjuHplJJj7p6Y55o1uZQCCoMgwka6dt.png','Erro','2023-03-13 15:10:48',102),(28,8,'clicar ok','erro/roUkeO55TydCdog6tqtMvKpm4iac3IsQdxmlGBPV.png','Erro','2023-03-13 15:19:31',121),(29,8,'clicar e digitar 34','erro/v13HHReyQS35Sbcma6zK2al8ji6XIuzfQOvKIxKV.png','Erro','2023-03-13 15:48:37',136),(30,8,'clicar e digitar 34','erro/zUviMNPD4ZxmNAoSpLiDBqcglPN2RY5Hzud6zk6a.png','Erro','2023-03-13 16:02:50',136),(31,2,'giroflex','erro/lApl1INLLwUnjxcO8tu1v7zZGvxnu71TQ56K4fXH.png','Erro','2023-03-16 15:52:51',173),(32,8,'botar senha','erro/n3k81ha8gbysfhmGo3lXjHDiAWWImWG33t9rQYpg.png','Erro','2023-03-16 15:53:30',73),(33,2,'giroflex','erro/mhQu0UMU6KRdfiDH7jFVf33Cf1chELHGMwNA7z4S.png','Erro','2023-03-16 16:03:36',173),(34,8,'botar senha','erro/bPn7ZrtjEoJXD2m4Sseab85RwPN8uIFmLOXPXbks.png','Erro','2023-03-16 16:04:15',73),(35,2,'giroflex','erro/mfOIInWh9hvJf7z8kNaQlMl9jsiMSPquOWOIRQnD.png','Erro','2023-03-16 16:08:25',173),(36,8,'botar senha','erro/QeV6ZyHylbc2tdzxf2BhnEE64bLejGWaWy0bAQ3D.png','Erro','2023-03-16 16:09:03',73),(37,9,'botao direito','erro/o4aNuGFNpcj47iurXbW4ZowVZ8AokYbySGTgRgDP.png','Erro','2023-03-17 14:56:59',189),(38,9,'botao direito','erro/Bgsu15VbFJdrvSMGI7BobP3tzxsbLcJz8tNpUllU.png','Erro','2023-03-17 14:57:39',189),(39,2,'giroflex','erro/bpvElfRHwTdPHbZhB9JFdRscW4zVNTze9DyNgFTa.png','Erro','2023-03-17 15:52:20',173),(40,8,'processos de cartão','erro/2jHdhqSPzmreOWo28zUwg1ZPNhPBqPQlhg6ProxX.png','Erro','2023-03-17 16:03:46',75),(41,2,'giroflex','erro/Gxsws6fIkMiTcvrYUNGWZqvNvJ20DKnZevO3Bw4S.png','Erro','2023-03-20 13:47:32',173),(42,2,'giroflex','erro/Fa6Ho23Phsrerck8pRWfodQOI2Qvdem7jlDJxdXl.png','Erro','2023-03-20 14:04:46',173),(43,9,'botao direito','erro/ivHsPGkxuZSKuoLiTZ1g6pdC8ioVhD80bBGERpdW.png','Erro','2023-03-24 13:46:47',189),(44,9,'clicar novo','erro/lVNofbHsmHeIs7JW6mKKVhVIwC7jtZ6rnnpzcknd.png','Erro','2023-03-24 14:05:10',190);
/*!40000 ALTER TABLE `tarefa_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `pk_id_tarefa` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome_tarefa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dia_da_semana` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_executar` time NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pk_id_tarefa`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (2,'Celso Portiolli','não executado','qua,seg','09:05:00','2023-03-23 14:08:00','2023-03-24 09:20:25'),(8,'Processo Cartões','não executado','sex','09:00:00','2023-03-23 14:08:00','2023-03-24 12:51:17'),(9,'teste','não executado','sex','09:01:00','2023-03-23 14:08:00','2023-03-24 12:01:02'),(10,'Lincoln Lau','não executado','qua,sex','09:24:00','2023-03-23 14:08:00','2023-03-24 12:01:02'),(11,'Markito do ratinho','não executado','sex','12:21:00','2023-03-23 14:08:00','2023-03-24 09:20:25'),(12,'suiabUIABDIOU','não executado','seg,ter,qua,qui,sex,sab','11:41:00','2023-03-24 12:39:50','2023-03-24 09:39:50'),(13,'ziun','não executado','qua','07:07:00','2023-03-24 15:03:42','2023-03-24 12:30:57');
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail',NULL,'21232f297a57a5a743894a0e4a801fc3',NULL,'2023-03-03 16:24:20','2023-03-03 16:24:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08  8:27:13
