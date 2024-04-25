## Redaxo Database Dump Version 5
## Prefix rex_
## charset utf8mb4

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `rex_action`;
CREATE TABLE `rex_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presave` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postsave` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previewmode` tinyint(4) DEFAULT NULL,
  `presavemode` tinyint(4) DEFAULT NULL,
  `postsavemode` tinyint(4) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_article`;
CREATE TABLE `rex_article` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catpriority` int(10) unsigned NOT NULL,
  `startarticle` tinyint(1) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `yrewrite_url_type` enum('AUTO','CUSTOM','REDIRECTION_INTERNAL','REDIRECTION_EXTERNAL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUTO',
  `yrewrite_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_redirection` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_changefreq` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_priority` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_index` tinyint(1) NOT NULL,
  `yrewrite_canonical_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `find_articles` (`id`,`clang_id`),
  KEY `id` (`id`),
  KEY `clang_id` (`clang_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_article` WRITE;
/*!40000 ALTER TABLE `rex_article` DISABLE KEYS */;
INSERT INTO `rex_article` VALUES 
  (2,2,0,'Datenschutz / Impressum','',0,0,1,'|',0,1,1,'2021-03-03 09:03:43','luca@nulltype.ch','2021-06-01 15:27:50','Redakteur',0,'AUTO','','','','','','',0,''),
  (7,7,0,'Home','Home',1,1,1,'|',1,1,1,'2021-03-03 09:04:13','luca@nulltype.ch','2021-07-14 15:22:22','Redakteur',0,'AUTO','','','','','weekly','',1,''),
  (8,8,0,'Advokatur','Advokatur',2,1,1,'|',1,1,1,'2021-05-31 17:37:37','luca@nulltype.ch','2021-06-05 11:34:02','luca@nulltype.ch',0,'AUTO','','','','Advokatur Barmet bietet spezialisierte Rechtsdienstleistungen im öffentlichen Recht an. Wo Staat, private Institutionen und Individuen aufeinandertreffen, berät und begleitet Sie Advokatur Barmet in einem breiten Spektrum von Spezialgebieten.','weekly','0.7',0,''),
  (9,9,0,'Kompetenzen','Kompetenzen',3,1,1,'|',1,1,1,'2021-05-31 18:46:33','Redakteur','2021-06-08 08:18:45','Redakteur',0,'AUTO','','','','','weekly','0.7',0,''),
  (10,10,0,'Aktuell','Aktuell',4,1,1,'|',1,1,1,'2021-04-29 13:29:25','luca@nulltype.ch','2021-11-19 12:33:18','Redakteur',0,'AUTO','','','','','weekly','0.7',0,''),
  (11,11,0,'Untersuchungen','Untersuchungen',5,1,1,'|',1,1,1,'2021-04-29 13:29:26','luca@nulltype.ch','2021-06-22 14:02:35','Redakteur',0,'AUTO','','','','','weekly','0.7',0,''),
  (12,12,0,'Verhandlungsführung','Verhandlungsführung',6,1,1,'|',1,1,1,'2021-04-29 13:29:27','luca@nulltype.ch','2021-06-22 14:07:10','Redakteur',0,'AUTO','','','','','weekly','0.7',0,''),
  (13,13,0,'Kontakt','Kontakt',7,1,1,'|',1,1,1,'2021-04-29 13:29:28','luca@nulltype.ch','2021-05-05 15:26:44','luca@nulltype.ch',0,'AUTO','','','','','weekly','0.7',0,''),
  (14,14,0,'Footer','',0,0,2,'|',2,5,1,'2021-04-29 13:05:35','luca@nulltype.ch','2021-11-17 19:01:58','luca@nulltype.ch',0,'AUTO','','','','','','',0,'');
/*!40000 ALTER TABLE `rex_article` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_article_slice`;
CREATE TABLE `rex_article_slice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `ctype_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `revision` int(11) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `value1` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value2` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value3` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value4` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value5` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value6` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value7` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value8` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value9` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value10` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value11` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value12` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value13` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value14` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value15` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value16` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value17` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value18` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value19` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value20` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist5` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist6` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist7` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist8` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist9` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist10` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link4` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link5` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link6` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link7` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link8` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link9` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link10` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist4` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist5` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist6` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist7` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist8` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist9` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist10` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slice_priority` (`article_id`,`priority`,`module_id`),
  KEY `clang_id` (`clang_id`),
  KEY `article_id` (`article_id`),
  KEY `find_slices` (`clang_id`,`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_article_slice` WRITE;
/*!40000 ALTER TABLE `rex_article_slice` DISABLE KEYS */;
INSERT INTO `rex_article_slice` VALUES 
  (1,7,1,1,1,0,1,1,'Advokatur Barmet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-slider-1.jpg,advokatur-barmet-slider-2.jpg,advokatur-barmet-slider-3.jpg,advokatur-barmet-slider-4.jpg,advokatur-barmet-slider-5.jpg,advokatur-barmet-slider-6_retouche.jpg,advokatur-barmet-slider-7.jpg,advokatur-barmet-slider-8.jpg,advokatur-barmet-slider-9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-04-29 13:30:14','luca@nulltype.ch','2021-07-14 15:22:22','Redakteur'),
  (2,7,1,1,2,0,2,1,'<p>Als Boutiquekanzlei für spezialisierte Rechtsdienstleistungen im öffentlichen Recht berät Advokatur Barmet Staat, Wirtschaft und Privatpersonen bei rechtlichen, politischen und strategischen Herausforderungen. In enger Zusammenarbeit mit unserer Mandantschaft kreieren wir nachhaltige Strategien, die im Spannungsfeld von Recht und Politik Bestand haben. Weil wir über grosse Erfahrung in öffentlich-rechtlichen Verfahren verfügen, können wir diese effizient führen. Unsere Rechtsgutachten sind klar in Aufbau, Sprache und Konklusion. </p>\r\n<p>Den Erfolg unserer Arbeit führen wir auf eine offene und vertrauensvolle Klientenbeziehung zurück. Wir kommunizieren direkt, klar und ehrlich, sodass unsere Partner aus Wirtschaft und Verwaltung stets auf eine gründliche Chancen- und Risikoanalyse zählen dürfen.</p>\r\n<p> </p>','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-04-30 14:39:24','luca@nulltype.ch','2021-05-31 19:21:20','Ray'),
  (3,7,1,1,3,0,3,1,'[{\"REX_MEDIA_1\":\"bildschirmfoto_2021-05-07_um_18.57.28.png\",\"REX_LINK_1\":\"9\",\"external\":\"\",\"title\":\"Kompetenzen\",\"subtitle\":\"Mehr Lesen\"},{\"REX_MEDIA_1\":\"bildschirmfoto_2021-05-07_um_18.57.34.png\",\"REX_LINK_1\":\"10\",\"external\":\"\",\"title\":\"Aktuell\",\"subtitle\":\"Mehr Lesen\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-04-30 15:46:23','luca@nulltype.ch','2021-05-31 19:52:25','Ray'),
  (4,7,1,1,4,0,5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet_mood_1.jpg','advokatur-barmet_mood_2.jpg','advokatur-barmet_mood_3.jpg','advokatur-barmet_mood_4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-04-30 15:53:02','luca@nulltype.ch','2021-06-01 15:10:35','Redakteur'),
  (5,7,1,1,12,0,4,1,'ADVOKATUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 09:32:27','luca@nulltype.ch','2021-05-01 09:32:27','luca@nulltype.ch'),
  (6,7,1,1,12,0,6,1,'KOMPETENZEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 09:57:24','luca@nulltype.ch','2021-05-01 09:57:24','luca@nulltype.ch'),
  (7,7,1,1,5,0,7,1,'left','<p>Als Boutiquekanzlei für spezialisierte Rechtsdienstleistungen im öffentlichen Recht berät Advokatur Barmet Staat, Wirtschaft und Privatpersonen bei rechtlichen, politischen und strategischen Herausforderungen. </p>','[{\"linkText\":\"\",\"REX_LINK_3\":\"9\",\"anchor\":\"\",\"external\":\"\"},{\"linkText\":\"\",\"REX_LINK_3\":\"9\",\"anchor\":\"\",\"external\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-startseite-kompetenzen_einzelbild.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 10:09:43','luca@nulltype.ch','2021-06-01 15:31:20','Redakteur'),
  (8,7,1,1,12,0,8,1,'AKTUELL','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 13:49:12','luca@nulltype.ch','2021-05-01 13:49:12','luca@nulltype.ch'),
  (9,7,1,1,6,0,9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 13:49:26','luca@nulltype.ch','2021-05-01 13:50:47','luca@nulltype.ch'),
  (10,10,1,1,8,0,7,1,'Friendly reminder: Betreuungsurlaub per 1. Juli 2021','04.05.2021','Friendly reminder: Betreuungsurlaub per 1. Juli 2021','<p>Im Herbst 2020 hat der Bundesrat beschlossen, dass das Bundesgesetz über die Verbesserung der Vereinbarkeit von Erwerbstätigkeit und Angehörigenbetreuung in zwei Etappen in Kraft gesetzt wird. In der ersten Etappe wurden per 1. Januar 2021 unter anderem die Lohnfortzahlung bei kurzen Arbeitsabwesenheiten und der besoldete Vaterschaftsurlaub geregelt.&nbsp;</p>','<p>In der zweiten Etappe wird nun per 1. Juli 2021 der bezahlte 14-wöchige Urlaub für die Betreuung von schwer kranken oder verunfallten Kindern in Kraft gesetzt, welcher rein vom Umfang her eine deutlich grössere Entlastung für die Mitarbeitenden aber auch eine deutlich grössere Herausforderung für die betroffenen Arbeitgeberinnen darstellt.&nbsp;</p>','https://personalrechtsblog.ch/2021/05/04/friendly-reminder-betreuungsurlaub-per-1-juli-2021/','personalrechtsblog.ch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lp-test-3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 13:53:23','luca@nulltype.ch','2021-06-06 19:37:35','Redakteur'),
  (11,10,1,1,12,0,1,1,'AKTUELL','',NULL,'label',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 13:53:58','luca@nulltype.ch','2021-10-07 11:35:37','Redakteur'),
  (13,7,1,1,12,0,10,1,'Back to Top','','label',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 15:12:35','luca@nulltype.ch','2021-05-01 15:12:35','luca@nulltype.ch'),
  (14,7,1,1,7,0,11,1,'STAMPFENBACHSTRASSE 142','8006 ZUERICH',' +41 44 201 70 07','barmet@advokaturbarmet.ch','ADVOKATUR BARMET, STAMPFENBACHSTRASSE 142, POSTFACH 396, 8042 ZÜRICH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-01 15:30:37','luca@nulltype.ch','2021-05-05 15:18:42','luca@nulltype.ch'),
  (15,14,1,1,11,0,1,1,'auto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"linkText\":\"\",\"REX_LINK_10\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-03 09:55:02','luca@nulltype.ch','2021-05-03 09:55:02','luca@nulltype.ch'),
  (17,14,1,3,11,0,1,1,'manual',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"linkText\":\"Datenschutz\",\"REX_LINK_1\":\"2\",\"REX_MEDIA_1\":\"\",\"internal\":\"\"},{\"linkText\":\"Impressum\",\"REX_LINK_1\":\"2\",\"REX_MEDIA_1\":\"\",\"internal\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-03 09:56:35','luca@nulltype.ch','2021-11-17 10:37:45','luca@nulltype.ch'),
  (18,14,1,4,11,0,1,1,'manual',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"linkText\":\"Personalrechtsblog\",\"REX_LINK_1\":\"\",\"REX_MEDIA_1\":\"\",\"internal\":\"https:\\/\\/personalrechtsblog.ch\\/\"},{\"linkText\":\"Newsletter\",\"REX_LINK_1\":\"7\",\"REX_MEDIA_1\":\"\",\"internal\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-03 09:56:42','luca@nulltype.ch','2021-11-17 10:34:33','luca@nulltype.ch'),
  (19,14,1,2,11,0,1,1,'manual',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'[{\"linkText\":\"Kontakt\",\"REX_LINK_1\":\"13\",\"REX_MEDIA_1\":\"\",\"internal\":\"\"},{\"linkText\":\"HOW TO GET HERE\",\"REX_LINK_1\":\"\",\"REX_MEDIA_1\":\"how_to_get_here_3.pdf\",\"internal\":\"\"},{\"linkText\":\"DOWNLOAD CV\",\"REX_LINK_1\":\"\",\"REX_MEDIA_1\":\"cv_m.barmet.pdf\",\"internal\":\"\"},{\"linkText\":\"Jobs\",\"REX_LINK_1\":\"\",\"REX_MEDIA_1\":\"ab_stelleninseart_website_002.pdf\",\"internal\":\"\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-03 10:00:27','luca@nulltype.ch','2021-11-17 19:01:58','luca@nulltype.ch'),
  (20,8,1,1,10,0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-portrait.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-04 13:15:09','luca@nulltype.ch','2021-05-31 19:30:46','Ray'),
  (22,9,1,1,9,0,3,1,'[{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Submissionsrecht\",\"REX_MEDIA_1\":\"bildschirmfoto_2021-05-07_um_18.57.28.png\",\"subTitle\":\"Wenn der Staat einkauft\",\"text\":\"<p>Advokatur Barmet f\\u00fchrt Prozesse im eidgen\\u00f6ssischen und kantonalen Submissionsrecht \\u00fcber s\\u00e4mtliche Instanzen&nbsp;und ber\\u00e4t&nbsp;bei komplexen Ausschreibungen. Advokatur Barmet weiss ausserdem, was eine gute Ausschreibung ausmacht und kann die \\u00f6ffentliche Hand deshalb wirkungsvoll begleiten, punktuell oder \\u00fcber die gesamte Dauer eines Ausschreibungsprojekts.<\\/p>\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Personalrecht\",\"REX_MEDIA_1\":\"lp-test-2.jpg\",\"subTitle\":\"Same same but different\",\"text\":\"<p>Trotz vieler Gemeinsamkeiten unterscheidet sich das \\u00f6ffentliche Dienstrecht vom privaten Arbeitsrecht in wesentlichen Punkten. Kenntnis dieser Unterschiede und grosse Erfahrung im \\u00f6ffentlichen Personalrecht machen Advokatur Barmet zur Expertin im \\u00f6ffentlichen Dienstrecht auf Gemeinde-, Kantons- und Bundesebene.<\\/p>\\r\\n<p>Advokatur Barmet betreibt ausserdem zusammen mit Rechtsanwalt Michael Oberdorfer den personalrechtsblog.ch, auf welchem regelm\\u00e4ssig aktuelle Entscheide, Gesetzes\\u00e4nderungen und praxisrelevante Fragestellungen aufgegriffen und diskutiert werden.<br>Zum <a href=\\\"https:\\/\\/www.personalrechtsblog.ch\\\" target=\\\"_blank\\\">Personalrechtsblog<\\/a><\\/p>\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Gemeinderecht\",\"REX_MEDIA_1\":\"lp-test-3.jpg\",\"subTitle\":\"Von Ausgabenrecht bis Zusammenarbeitsvertrag\",\"text\":\"<p>Auf dem Gebiet des Gemeinderechts ber\\u00e4t Advokatur Barmet Gemeinden, Zweckverb\\u00e4nde, Anstalten und andere kommunale Tr\\u00e4ger \\u00f6ffentlicher Aufgaben. Wir erteilen rasch und verst\\u00e4ndlich Auskunft bei allt\\u00e4glichen Fragestellungen zum Gesetzesvollzug und unterst\\u00fctzen unsere Mandanten bei der Vorbereitung anspruchsvoller Gesch\\u00e4fte sowie in Rechtsmittelverfahren. Advokatur Barmet begleitet Gemeinden selbstverst\\u00e4ndlich auch bei gemeinde\\u00fcbergreifenden Zusammenarbeitsvertr\\u00e4gen oder bei der Ausgliederung \\u00f6ffentlicher Aufgaben.<\\/p>\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Bildungs- und Schulrecht\",\"REX_MEDIA_1\":\"bildschirmfoto_2021-05-04_um_13.14.09.png\",\"subTitle\":\"\",\"text\":\"<p>Bildungsinstitutionen stehen verschiedenen Stakeholdern gegen\\u00fcber und haben diverse Schnittstellen mit anderen Institutionen des \\u00f6ffentlichen und privaten Rechts. Sie sind mit zunehmend anspruchsvolleren Rechtsfragen konfrontiert. Advokatur Barmet ist eine Sparringpartnerin, welche die dichten und komplexen Rechtsgrundlagen kennt und dar\\u00fcber hinaus ausgewiesene, langj\\u00e4hrige Erfahrung in der Begleitung und Beratung von privaten und \\u00f6ffentlichen Bildungsinstitutionen vorweist.<\\/p>\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Medizin- und Gesundheitsrecht \",\"REX_MEDIA_1\":\"lp-test-5.jpg\",\"subTitle\":\"Durchblick im Kaleidoskop der Rechtsnormen\",\"text\":\"<p>Das Medizin- und Gesundheitsrecht zeichnet sich durch einen hohen Grad an Regulierung und eine verh\\u00e4ltnism\\u00e4ssig rasch \\u00e4ndernde Rechtsetzung und Rechtsprechung aus. Entscheidend ist deshalb, dass in der Beratung von Leistungserbringern des Gesundheitswesens, seien es Praxisgemeinschaften, Psychotherapeutinnen, Pflegeheime oder Spit\\u00e4ler aktuelles und breites Wissen schnell zur Verf\\u00fcgung steht. <\\/p>\\r\\n<p>Dank ihrer langj\\u00e4hrigen Erfahrung in der Beratung von Leistungserbringern des Gesundheitswesens findet sich Advokatur Barmet in den Gesetzen und Verordnungen, welche diese vielseitige und dynamische Landschaft pr\\u00e4gen, bestens zurecht. <\\/p>\\r\\n<p>Unsere Mandantschaft kann sich auf unser grosses Know-How insbesondere auch im Bereich der Spitalplanung und Spitalfinanzierung und in Zulassungs- und Aufsichtsverfahren f\\u00fcr s\\u00e4mtliche Leistungserbringer des Gesundheitswesens verlassen.<\\/p>\",\"check\":\"label\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Datenschutz- und \\u00d6ffentlichkeitsrecht\",\"REX_MEDIA_1\":\"lp-test-6.jpg\",\"subTitle\":\"Der Teufel steckt im Detail\",\"text\":\"<p>Das Gesetz stellt hohe Anforderungen an den Umgang der \\u00f6ffentlichen Hand mit Daten und Informationen aus der Verwaltung. Welche Informationen in welcher Form welchen Personen bekanntgegeben werden d\\u00fcrfen, ist in der Praxis oft Gegenstand einer rechtlich anspruchsvollen Einzelfallpr\\u00fcfung. Advokatur Barmet unterst\\u00fctzt \\u00f6ffentlich-rechtliche und private Stellen bei der herausfordernden Datenbearbeitung und Datenbekanntgabe und ber\\u00e4t sie bei Fragestellungen rund um den Datenschutz und den Zugang zu Informationen.<\\/p>\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"\\u00d6ffentliches Prozessrecht\",\"REX_MEDIA_1\":\"advokatur-barmet-slider-backup_1.jpg\",\"subTitle\":\"Aus dem Vollen sch\\u00f6pfen\",\"text\":\"<p>Das \\u00f6ffentliche Prozessrecht unterscheidet sich fundamental von zivilrechtlichen Verfahren. Advokatur Barmet weist langj\\u00e4hrige Prozesserfahrung im Bereich des \\u00f6ffentlichen Prozessrechts aus sowohl auf Kantonsebene als auch vor Bundesverwaltungsgericht und Bundesgericht. Diese Erfahrung bef\\u00e4higt uns, Prozesschancen und -risiken richtig einzusch\\u00e4tzen und die Verfahren effizient zu f\\u00fchren.<\\/p>\"},{\"checkbox_block_hold\":\"hold_block\",\"tileText\":\"Grundrechte\",\"REX_MEDIA_1\":\"advokatur-barmet-slider-4.jpg\",\"subTitle\":\"\",\"text\":\"<p>Wenn staatliches Handeln Individuen tangiert, dann stellen sich meist Fragen des Grundrechtsschutzes. Mitunter sind Grundrechte in einem Mass betroffen, das den Adressaten staatlicher Massnahmen ungerechtfertigt erscheint. Dann lohnt es sich, das in Frage stehende staatliche Handeln einer genaueren Pr\\u00fcfung mit Blick auf die Grundrechtskonformit\\u00e4t zu unterziehen. Hier unterst\\u00fctzt Advokatur Barmet Unternehmen und Privatpersonen. Auch im Bereich der politischen Rechte, namentlich des Wahl- und Abstimmungsrechts, verf\\u00fcgen wir \\u00fcber grosse Erfahrung in der Beratung der \\u00f6ffentlichen Hand und Privater und k\\u00f6nnen eine Vielzahl erfolgreich gef\\u00fchrter Rechtsmittelverfahren in diesem Bereich vorweisen.<\\/p>\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-04 17:03:51','luca@nulltype.ch','2021-06-08 08:18:45','Redakteur'),
  (23,8,1,1,2,0,2,1,'<p>Als Boutiquekanzlei für spezialisierte Rechtsdienstleistungen im öffentlichen Recht berät Advokatur Barmet Staat, Wirtschaft und Privatpersonen bei rechtlichen, politischen und strategischen Herausforderungen. In enger Zusammenarbeit mit unserer Mandantschaft kreieren wir nachhaltige Strategien, die im Spannungsfeld von Recht und Politik Bestand haben. Weil wir über grosse Erfahrung in öffentlich-rechtlichen Verfahren verfügen, können wir diese effizient führen. Unsere Rechtsgutachten sind klar in Aufbau, Sprache und Konklusion.&nbsp;</p>\r\n<p>Den Erfolg unserer Arbeit führen wir auf eine offene und vertrauensvolle Klientenbeziehung zurück. Wir kommunizieren direkt, klar und ehrlich, sodass unsere Partner aus Wirtschaft und Verwaltung stets auf eine gründliche Chancen- und Risikoanalyse zählen dürfen.</p>','Download CV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cv_m.barmet.pdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-05 14:19:35','luca@nulltype.ch','2021-06-05 11:34:02','luca@nulltype.ch'),
  (24,8,1,1,7,0,3,1,'STAMPFENBACHSTRASSE 142','8006 ZUERICH',' +41 44 201 70 07','barmet@advokaturbarmet.ch','ADVOKATUR BARMET, STAMPFENBACHSTRASSE 142, POSTFACH 396, 8042 ZÜRICH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-05 14:23:40','luca@nulltype.ch','2021-05-05 15:18:26','luca@nulltype.ch'),
  (25,13,1,1,7,0,1,1,'STAMPFENBACHSTRASSE 142','8006 ZUERICH',' +41 44 201 70 07','barmet@advokaturbarmet.ch','ADVOKATUR BARMET, STAMPFENBACHSTRASSE 142, POSTFACH 396, 8042 ZÜRICH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-05 15:26:44','luca@nulltype.ch','2021-05-05 15:26:44','luca@nulltype.ch'),
  (26,10,1,1,8,0,8,0,'','03.03.2021','','<p>Im Beitrag vom 3. März 2019 «Gesetzesvorlage zum Schutz von Whistleblowern – ein schwieriges Unterfangen» wurde in diesem Blog die Vorlage des Bundesrates zum Schutz von Whistleblowern vorgestellt. Dabei wurde auf einzelne Schwächen hingewiesen, aber auch festgehalten, dass die Vorlage die Rechtssicherheit verbessert. Nun hat der Nationalrat die Gesetzesvorlage haushoch abgelehnt. Sollte der Ständerat gleich entscheiden, wird die Vorlage definitiv versenkt, was eine vertane Chance wäre.</p>\r\n<p>Am 3. Juni 2019 behandelte der Nationalrat die Vorlage und lehnte sie mit 144 zu 27 Stimmen mit 6 Enthaltungen ab. Sowohl von links wie rechts wurde votiert, dass die Vorlage zu kompliziert sei. Der linken Ratsseite ging die Vorlage zudem zu wenig weit, weil sie keinen Ausbau des Kündigungsschutzes enthält. Die rechte Ratsseite wies darauf hin, dass viele Unternehmen bereits interne Meldestellen hätten. Im Beitrag vom 3. März 2019 «Gesetzesvorlage zum Schutz von Whistleblowern – ein schwieriges Unterfangen» wurde in diesem Blog die Vorlage des Bundesrates zum Schutz von Whistleblowern vorgestellt. Dabei wurde auf einzelne Schwächen hingewiesen, aber auch festgehalten, dass die Vorlage die Rechtssicherheit verbessert. Nun hat der Nationalrat die Gesetzesvorlage haushoch abgelehnt. Sollte der Ständerat gleich entscheiden, wird die Vorlage definitiv versenkt, was eine vertane Chance wäre.Im Beitrag vom 3. März 2019 «Gesetzesvorlage zum Schutz von Whistleblowern – ein schwieriges Unterfangen» wurde in diesem Blog die Vorlage des Bundesrates zum Schutz von Whistleblowern vorgestellt. Dabei wurde auf einzelne Schwächen hingewiesen, aber auch festgehalten, dass die Vorlage die Rechtssicherheit verbessert. Nun hat der Nationalrat die Gesetzesvorlage haushoch abgelehnt. Sollte der Ständerat gleich entscheiden, wird die Vorlage definitiv versenkt, was eine vertane Chance wäre.</p>','<p>Nun geht die Vorlage in den Ständerat. Wenn dieser die Vorlage ebenfalls ablehnt, ist sie vom Tisch. Damit würde aber eine Chance vertan. Denn für Arbeitnehmer, welche einen Missstand feststellen, ist die heutige Rechtslage unklar. Dadurch steigt die Gefahr, dass sie sich entweder vorschnell an die Öffentlichkeit wenden oder einen Missstand gar nicht erst melden. Beides kann nicht im Sinne der betroffenen Unternehmen sein.</p>\r\n<p>Nun geht die Vorlage in den Ständerat. Wenn dieser die Vorlage ebenfalls ablehnt, ist sie vom Tisch. Damit würde aber eine Chance vertan. Denn für Arbeitnehmer, welche einen Missstand feststellen, ist die heutige Rechtslage unklar. Dadurch steigt die Gefahr, dass sie sich entweder vorschnell an die Öffentlichkeit wenden oder einen Missstand gar nicht erst melden. Beides kann nicht im Sinne der betroffenen Unternehmen sein.</p>\r\n<p>Im Beitrag vom 3. März 2019 «Gesetzesvorlage zum Schutz von Whistleblowern – ein schwieriges Unterfangen» wurde in diesem Blog die Vorlage des Bundesrates zum Schutz von Whistleblowern vorgestellt. Dabei wurde auf einzelne Schwächen hingewiesen, aber auch festgehalten, dass die Vorlage die Rechtssicherheit verbessert. Nun hat der Nationalrat die Gesetzesvorlage haushoch abgelehnt. Sollte der Ständerat gleich entscheiden, wird die Vorlage definitiv versenkt, was eine vertane Chance wäre.</p>\r\n<p>Im Beitrag vom 3. März 2019 «Gesetzesvorlage zum Schutz von Whistleblowern – ein schwieriges Unterfangen» wurde in diesem Blog die Vorlage des Bundesrates zum Schutz von Whistleblowern vorgestellt. Dabei wurde auf einzelne Schwächen hingewiesen, aber auch festgehalten, haushoch abgelehnt. Sollte der Ständerat gleich entscheiden, wird die Vorlage definitiv versenkt, was eine vertane Chance wäre.</p>','www.google.ch','personalrechtsblog.ch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lp-test-5.jpg,lp-test-3.jpg,lp-test-2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-06 09:57:30','luca@nulltype.ch','2021-06-05 18:28:15','Redakteur'),
  (27,2,1,1,13,0,3,1,'Impressum & Datenschutz','<p class=\"default\">Advokatur Barmet<br>Stampfenbachstrasse 142<br>8006 Zürich<br>+41 44 201 70 07<br>barmet@advokaturbarmet.ch</p>\r\n<p class=\"default\">Webdesign, Coding, Fotografie<br>Another Studio<br>Luca Margadant<br>Lea Waser</p>\r\n<p class=\"sub\">HAFTUNGSAUSSCHLUSS</p>\r\n<p>Die in diesem Webauftritt enthaltenen Informationen stellen keine Rechtsauskunft dar und ersetzen eine professionelle Rechtsberatung im konkreten Fall unter keinen Umständen. Jede Haftung für Richtigkeit und Vollständigkeit der Seite und der darin enthaltenen Beiträge ist ausgeschlossen. Auf diesem Webauftritt sind Hyperlinks zu Websites Dritter enthalten. Diese Websites und die darin enthaltenen Informationen und Angebote unterliegen ausschliesslich der Haftung der jeweiligen Betreiber.</p>\r\n<p class=\"sub\">WIE NUTZT ADVOKATURBARMET.CH COOKIES? </p>\r\n<p class=\"default\">Alle persönlichen Informationen, die Sie uns geben, einschließlich Ihrer E-Mail, werden für die folgenden Zwecke verwendet: Funktionalität der Website-Funktionen, Web-Statistiken über Ihre Nutzung der Website. Wir verwenden die Informationen, um die Benutzererfahrung auf unserer Website zu messen und zu verbessern, um sicherzustellen, dass unsere Website wie beabsichtigt funktioniert. Daher können wir die folgenden Informationen sammeln.</p>\r\n<p>Advokatur Barmet verwendet Google Analytics, einen Webanalysedienst von Google Inc. Google Analytics verwendet sog. «Cookies». Das sind Textdateien, die auf Ihrem Computer gespeichert werden und die eine Analyse der Benutzung der Website ermöglichen. Die durch Cookies erzeugten Informationen über Ihre Benutzung dieser Website werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert. Im Falle der Aktivierung der IP-Anonymisierung auf dieser Webseite, wird Ihre IP-Adresse von Google jedoch innerhalb von Mitgliedstaaten der Europäischen Union oder in anderen Vertragsstaaten des Abkommens über den Europäischen Wirtschaftsraum zuvor gekürzt. Nur in Ausnahmefällen wird die volle IP-Adresse an einen Server von Google in den USA übertragen und dort gekürzt. Im Auftrag des Betreibers dieser Website wird Google diese Informationen benutzen, um Ihre Nutzung der Website auszuwerten, um Reports über die Websiteaktivitäten zusammenzustellen und um weitere mit der Websitenutzung und der Internetnutzung verbundene Dienstleistungen gegenüber dem Websitebetreiber zu erbringen. Die im Rahmen von Google Analytics von Ihrem Browser übermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengeführt. Sie können die Speicherung der Cookies durch eine entsprechende Einstellung Ihrer Browser-Software verhindern; wir weisen Sie jedoch darauf hin, dass Sie in diesem Fall gegebenenfalls nicht sämtliche Funktionen dieser Website vollumfänglich werden nutzen können.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-07 10:47:05','luca@nulltype.ch','2021-05-07 10:55:08','luca@nulltype.ch'),
  (28,2,1,1,10,0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-portrait.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-07 10:55:12','luca@nulltype.ch','2021-06-01 15:27:50','Redakteur'),
  (29,2,1,1,12,0,2,1,'Impressum','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-07 10:55:24','luca@nulltype.ch','2021-05-07 10:55:24','luca@nulltype.ch'),
  (30,9,1,1,14,0,1,1,'left','Kompetenzen','RECHTSGEBIETE','<p>Als Boutiquekanzlei für spezialisierte Rechtsdienstleistungen im öffentlichen Recht berät Advokatur Barmet Staat, Wirtschaft und Privatpersonen bei rechtlichen, politischen und strategischen Herausforderungen.  </p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-anzeigebild-kompetenzen.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-07 12:04:49','luca@nulltype.ch','2021-06-01 15:32:52','Redakteur'),
  (31,9,1,1,12,0,2,1,'Kompetenzen','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-07 12:07:45','luca@nulltype.ch','2021-05-07 12:07:45','luca@nulltype.ch'),
  (33,12,1,1,14,0,2,1,'left','Verhandlungsführung','Strategien für nachhaltige Lösungen','<p>Advokatur Barmet unterstützt auf folgende Weise:&nbsp;</p>\r\n<ul><li>Invervention: Wenn die Verhandlung in eine Sackgasse gerät, oder zu scheitern droht, hilft eine qualifizierte Aussensicht, die mit analytischem Blick den Verhandlungsprozess durchleuchtet und ermöglicht, scheinbar unverrückbare Positionen aufzubrechen.</li><li>Verhandlungscoaching: Ein Sparringpartner der weiss, wie Verhandlungen gelingen und warum sie scheitern, kann vor und während einer konkreten Verhandlung eine situationsgerechte Strategie entwickeln.</li><li>Ghost Negotiations: Wir simulieren eine konkrete Verhandlung und sorgen für Souveränität vom Anfang bis zum Abschluss einer Verhandlung.<br></li></ul>','label',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bildschirmfoto_2021-05-07_um_18.57.34.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-07 14:51:44','luca@nulltype.ch','2021-06-22 14:07:10','Redakteur'),
  (36,10,1,1,8,0,6,1,'Mirjam Barmet ist Referentin an der Weiterbildungsveranstaltung des Verbands Psychotherapeutinnen und Psychotherapeuten Zentralschweiz (VPZ)','05.06.2021','Rechtliche Aspekte in der Psychotherapie – Mirjam Barmet ist Referentin an der Weiterbildungsveranstaltung des VPZ','<p>Am 6. November 2021&nbsp;findet in Luzern eine ganztägige Weiterbildungsveranstaltung zu&nbsp;rechtlichen Brennpunkten im Berufsalltag der Psychotherapeutinnen und Psychotherapeuten statt.&nbsp;</p>\r\n<p>Die Veranstaltung wird organisiert und durchgeführt vom&nbsp;<a href=\"https://www.verband-vpz.ch/\" target=\"_blank\">Verband der Psychotherapeutinnen und Psychotherapeuten der Zentralschweizer Kantone LU, ZG, NW, OW, SZ, UR (VPZ)</a>.</p>','<p>Zusammen mit Dr. med. Claus Damas bestreitet Mirjam Barmet diese interdisziplinäre Weiterbildung, in der sie sich in ihrem interaktiven Tagungsprogramm den häufigsten Fragestellungen, Institutionen und Begrifflichkeiten, welche Therapeuten und Therapeutinnen in diesem Zusammenhang beschäftigen, widmen.</p>','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'leawaser_advokaturbarmet_039.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-05-31 19:43:06','Ray','2021-06-05 19:49:30','luca@nulltype.ch'),
  (38,12,1,1,12,0,1,0,'Verhandlungsführung','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-01 16:30:40','Redakteur','2021-06-01 16:30:40','Redakteur'),
  (42,11,1,1,14,0,2,1,'left','Untersuchungen','Unabhängige und gründliche Sachverhaltsermittlung','<p>Administrativuntersuchungen bzw. Untersuchungen sind mitunter in den folgenden Fällen angezeigt: </p>\r\n<ul>\r\n<li>Verdacht auf systematisch regelwidriges Verhalten (allenfalls mit strafrechtlichen Implikationen)</li>\r\n<li>Compliance relevante Verdachtsfälle stehen im Raum</li>\r\n<li>Unregelmässigkeiten bzw. Ungereimtheiten, welche ein Einschreiten im öffentlichen Interesse nötig machen (Administrativuntersuchungen)</li>\r\n<li>Vorwürfe sexueller Belästigung bzw. grenzüberschreitender, persönlichkeitsrechtsverletzender Belästigung (Mobbing) am Arbeitsplatz</li>\r\n</ul>','label',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-anzeigebild-untersuchungen.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-01 18:53:18','Redakteur','2021-06-22 14:02:35','Redakteur'),
  (44,11,1,1,2,0,3,1,'<p>Wenn in einer Organisation die Wogen hoch gehen, wenn schwerwiegende Vorwürfe im Raum stehen, oder wenn eine neutrale Aussensicht auf einen Konflikt oder eine unübersichtliche Situation nötig ist, ist eine Untersuchung angezeigt.&nbsp;Die interne Untersuchung schafft oft die entscheidende Grundlage, um Krisensituationen in Unternehmen und Organisationen abzuwenden, oder aus solchen rasch herauszufinden. Strukturiertes, rasches und gründliches Vorgehen bei der Ermittlung des Sachverhalts ist dabei entscheidend.&nbsp;<br>Advokatur Barmet verfügt über langjährige Erfahrung in der Durchführung und Begleitung von internen Untersuchungen und Administrativuntersuchungen. Unsere Untersuchungen bringen rasch Licht ins Dunkel und stellen dabei sicher, dass die Rechte der betroffenen Personen im gesamten Prozess gewahrt bleiben. Am Ende steht ein belastbarer Bericht, der einer Organisation ermöglicht, die nötigen rechtlichen und betrieblichen Massnahmen zu ergreifen. Dadurch können sich Unternehmen, staatliche Akteure und Organisationen so schnell als möglich wieder ihren Kernaufgaben widmen im Wissen darum, dass sie die rechtlichen Risiken ausgeschaltet haben und die erforderlichen Massnahmen aufgegleist sind.</p>','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-01 19:26:57','luca@nulltype.ch','2021-06-05 18:38:26','Redakteur'),
  (45,12,1,1,2,0,3,1,'<p>Advokatur Barmet verfügt über grosse Erfahrung und Expertise in Verhandlungstechniken und Verhandlungsanalysen. Auf diese Weise können wir unsere Auftragnehmerinnen und Auftragnehmer auf unterschiedliche Weise vor und während einer Verhandlung unterstützen und so gemeinsam zu optimalen Verhandlungsergebnissen gelangen. Advokatur Barmet strebt nachhaltige Lösungen an, welche die Beziehung zwischen den Verhandlungspartnern ebenso im Fokus hat wie das unmittelbare Verhandlungsziel.</p>','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-01 20:12:45','Redakteur','2021-06-05 11:28:57','luca@nulltype.ch'),
  (46,11,1,1,12,0,1,0,'Untersuchungen','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-05 11:31:48','luca@nulltype.ch','2021-06-05 11:31:59','luca@nulltype.ch'),
  (48,10,1,1,8,0,5,1,'Knatsch in der Behörde','22.06.2021','Knatsch in der Behörde','<p>Wenn es in der Behörde zu Spannungen kommt, werden die Unterschiede zu einem normalen Anstellungsverhältnis offenbar. Dennoch gibt es Möglichkeiten, Spannungen in der Behörde zu beseitigen oder gegen renitente Behördenmitglieder etwas zu unternehmen. Richtschnur muss dabei die Gewährleistung bzw. Wiederherstellung der Funktionsfähigkeit der Behörde, das heisst die Erfüllung des Mandats der Behördenmitglieder, sein.</p>','<p>Im dritten Teil der Behördenserie des personalrechtsblog.ch&nbsp;widmet sich Mirjam Barmet einem beliebten Thema aus unserer Berufspraxis. Wenn es innerhalb einer Behörde kracht oder die Behörde nicht mehr funktionsfähig ist, dann sind die rechtlichen Möglichkeiten beschränkt. Umso wichtiger sind Konfliktlösungsstrategien, um so schnell wie möglich zu einem geordneten Behördenalltag zurückzufinden.</p>','https://personalrechtsblog.ch/2021/06/22/knatsch-in-der-behoerde/','personalrechtsblog.ch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-slider-8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-06-22 17:38:02','Redakteur','2021-06-22 17:44:10','Redakteur'),
  (49,10,1,1,8,0,3,1,'Lohnverzicht beim Feierabendbier ','06.10.2021','Lohnverzicht beim Feierabendbier – ein Plädoyer für die Schriftlichkeit','<p>Auch vor Gericht und unter Juristinnen und Juristen gibt es immer wieder Fälle, bei denen man sich die Frage stellt, ob es sich tatsächlich so zugetragen hat.&nbsp;</p>','<p>In aller Regel sind solche Fälle aber äusserst lehrreich, weil besonders einprägsam. Etwa wie derjenige Fall, den das Arbeitsgericht Zürich kurz vor Jahresende 2020 zu beurteilen hatte.</p>','https://personalrechtsblog.ch/2021/10/06/lohnverzicht-beim-feierabendbier-ein-plaedoyer-fuer-die-schriftlichkeit/','personalrechtsblog.ch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-slider-9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-10-07 11:30:42','Redakteur','2021-10-07 11:35:08','Redakteur'),
  (50,10,1,1,8,0,4,1,'Rechtsprechungsübersicht Behördenentscheide','07.09.2021','Rechtsprechungsübersicht Behördenentscheide','<p>Im letzten Beitrag der Behördenserie stellt Mirjam Barmet&nbsp;vier wegweisende Entscheide des Verwaltungsgerichts Zürich vor, und erörtert anhand der Entscheidbesprechungen wichtige praktische Themen.&nbsp;</p>','<p>Die Entscheide zeigen, dass es auch in Zukunft schwierig sein wird, vorauszusehen, wie die Gerichte mit der Frage der Anwendbarkeit des Personalrechts auf die Behörden umgehen werden, da sich hierzu keine widerspruchsfreie Praxis erkennen lässt.</p>','https://personalrechtsblog.ch/2021/09/07/rechtsprechungsuebersicht-behoerdenentscheide/','personalrechtsblog.ch',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-slider-4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-10-07 11:34:30','Redakteur','2021-10-07 11:36:29','Redakteur'),
  (52,10,1,1,8,0,2,1,'We Are Hiring!','19.11.2021','Rechtsanwält*in mit Schwerpunkt öffentliches Recht, 30-50%\r\n','<p>Ab 1. Januar 2022 oder nach Vereinbarung</p>\r\n<p>Wir suchen Verstärkung, die mit Engagement und Leidenschaft berät und sich mit Freude juristisch komplexen Fällen widmet und dabei stets auf Unterstützung und fachlichen Austausch im humorvollen Team zählen kann. Dabei wenden wir uns explizit an Personen, die eine beruflich herausfordernde Tätigkeit mit anderen Engagements (etwa familiären) zu vereinen suchen. Advokatur Barmet ist eine auf öffentliches Recht spezialisierte kleine Anwaltskanzlei. Unsere&nbsp;Klient*innen schätzen unsere messerscharfe Analyse, unsere aufrichtige und unkomplizierte Kommunikation und unseren kühlen Kopf in hektischen Zeiten. Wir sind stolz auf langjährige, vertrauensvolle Mandatsbeziehungen.</p>\r\n\r\n<p>Bei Interesse freuen wir uns über Ihre elektronische Bewerbung an&nbsp;kontakt@advokaturbarmet.ch</p>','<p>Sie bringen mit</p>\r\n<p>- Abschluss in Rechtswissenschaften und Schweizer&nbsp;Anwaltspatent<br>-&nbsp;Grosser juristischer Sachverstand<br>-&nbsp;Solide Berufserfahrung im öffentlichen Recht<br>-&nbsp;Erfahrung im und/oder grosses Interesse an Personal- bzw. Arbeitsrecht<br>-&nbsp;Hohes Mass an Eigenverantwortung<br>-&nbsp;Unkomplizierte, pragmatische Arbeitsweise<br>-&nbsp;Reflektierte, eigene Meinung</p>\r\n<p>Sie erwarten</p>\r\n<p>- Juristisch und strategisch spannende Mandate<br>-&nbsp;Gute, vertrauensvolle Mandantenbeziehung<br>-&nbsp;Viel Gestaltungsspielraum<br>-&nbsp;Grosse zeitliche und örtliche Flexibilität in der&nbsp;Arbeitsgestaltung<br>-&nbsp;Wertschätzendes und förderndes Arbeitsumfeld<br>-&nbsp;Zeitgemässe und faire Entlöhnung</p>','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'advokatur-barmet-slider-5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-19 12:11:18','luca@nulltype.ch','2021-11-19 12:33:18','Redakteur');
/*!40000 ALTER TABLE `rex_article_slice` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_clang`;
CREATE TABLE `rex_clang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_clang` WRITE;
/*!40000 ALTER TABLE `rex_clang` DISABLE KEYS */;
INSERT INTO `rex_clang` VALUES 
  (1,'de','deutsch',1,1,0);
/*!40000 ALTER TABLE `rex_clang` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_config`;
CREATE TABLE `rex_config` (
  `namespace` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`namespace`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_config` WRITE;
/*!40000 ALTER TABLE `rex_config` DISABLE KEYS */;
INSERT INTO `rex_config` VALUES 
  ('core','package-config','{\"accessdenied\":{\"install\":true,\"status\":true},\"backup\":{\"install\":true,\"status\":true},\"be_style\":{\"install\":true,\"status\":true,\"plugins\":{\"customizer\":{\"install\":false,\"status\":false},\"redaxo\":{\"install\":true,\"status\":true}}},\"bloecks\":{\"install\":true,\"status\":true,\"plugins\":{\"cutncopy\":{\"install\":true,\"status\":true},\"dragndrop\":{\"install\":true,\"status\":true},\"status\":{\"install\":true,\"status\":true}}},\"cache_warmup\":{\"install\":true,\"status\":true},\"cronjob\":{\"install\":false,\"status\":false,\"plugins\":{\"article_status\":{\"install\":false,\"status\":false},\"optimize_tables\":{\"install\":false,\"status\":false}}},\"debug\":{\"install\":false,\"status\":false},\"developer\":{\"install\":true,\"status\":true},\"global_settings\":{\"install\":true,\"status\":true},\"install\":{\"install\":true,\"status\":true},\"mblock\":{\"install\":true,\"status\":true},\"media_manager\":{\"install\":true,\"status\":true},\"media_manager_plus\":{\"install\":true,\"status\":true},\"mediapool\":{\"install\":true,\"status\":true},\"metainfo\":{\"install\":true,\"status\":true},\"mform\":{\"install\":true,\"status\":true,\"plugins\":{\"docs\":{\"install\":true,\"status\":true}}},\"minibar\":{\"install\":true,\"status\":false},\"minify_images\":{\"install\":true,\"status\":true},\"multiupload\":{\"install\":true,\"status\":true,\"plugins\":{\"imageoptimizer\":{\"install\":true,\"status\":true},\"upload_precompressor\":{\"install\":false,\"status\":false}}},\"nullMeta\":{\"install\":true,\"status\":true},\"phpmailer\":{\"install\":true,\"status\":true},\"plyr\":{\"install\":true,\"status\":true},\"project\":{\"install\":true,\"status\":true},\"redactor\":{\"install\":true,\"status\":true},\"search_it\":{\"install\":true,\"status\":true,\"plugins\":{\"autocomplete\":{\"install\":false,\"status\":false},\"documentation\":{\"install\":true,\"status\":true},\"plaintext\":{\"install\":false,\"status\":false},\"stats\":{\"install\":false,\"status\":false}}},\"sprog\":{\"install\":true,\"status\":true},\"structure\":{\"install\":true,\"status\":true,\"plugins\":{\"content\":{\"install\":true,\"status\":true},\"history\":{\"install\":false,\"status\":false},\"version\":{\"install\":false,\"status\":false}}},\"ui_tools\":{\"install\":true,\"status\":true,\"plugins\":{\"bootstrap-datetimepicker\":{\"install\":true,\"status\":true},\"jquery-minicolors\":{\"install\":true,\"status\":true},\"selectize\":{\"install\":true,\"status\":true}}},\"users\":{\"install\":true,\"status\":true},\"yform\":{\"install\":true,\"status\":true,\"plugins\":{\"email\":{\"install\":true,\"status\":true},\"manager\":{\"install\":true,\"status\":true},\"rest\":{\"install\":true,\"status\":true},\"tools\":{\"install\":true,\"status\":true}}},\"yform_geo_osm\":{\"install\":true,\"status\":true},\"yform_spam_protection\":{\"install\":true,\"status\":true},\"yform_standalone_validator\":{\"install\":true,\"status\":true},\"yform_usability\":{\"install\":true,\"status\":true},\"yrewrite\":{\"install\":true,\"status\":true}}'),
  ('core','package-order','[\"be_style\",\"be_style\\/redaxo\",\"users\",\"backup\",\"cache_warmup\",\"developer\",\"global_settings\",\"install\",\"mblock\",\"media_manager\",\"media_manager_plus\",\"mediapool\",\"mform\",\"mform\\/docs\",\"minify_images\",\"multiupload\",\"multiupload\\/imageoptimizer\",\"nullMeta\",\"phpmailer\",\"plyr\",\"redactor\",\"search_it\",\"search_it\\/documentation\",\"sprog\",\"structure\",\"accessdenied\",\"metainfo\",\"structure\\/content\",\"bloecks\",\"bloecks\\/cutncopy\",\"bloecks\\/dragndrop\",\"bloecks\\/status\",\"ui_tools\",\"ui_tools\\/bootstrap-datetimepicker\",\"ui_tools\\/jquery-minicolors\",\"ui_tools\\/selectize\",\"yform\",\"yform\\/email\",\"yform\\/manager\",\"yform\\/rest\",\"yform\\/tools\",\"yform_geo_osm\",\"yform_spam_protection\",\"yform_standalone_validator\",\"yform_usability\",\"yrewrite\",\"project\"]'),
  ('core','utf8mb4','true'),
  ('core','version','\"5.11.2\"'),
  ('developer','actions','true'),
  ('developer','delete','true'),
  ('developer','dir_suffix','true'),
  ('developer','items','{\"templates\":{\"1\":1620202613,\"2\":1623093619,\"3\":1620220928,\"4\":1620128111,\"5\":1622401065,\"6\":1619685253},\"modules\":{\"1\":1622567904,\"2\":1622567914,\"3\":1622567933,\"4\":1622567929,\"5\":1622892485,\"6\":1622567986,\"7\":1622567917,\"8\":1637320420,\"9\":1622892620,\"10\":1622567941,\"11\":1622915977,\"12\":1622567911,\"13\":1622567909,\"14\":1622891091}}'),
  ('developer','modules','true'),
  ('developer','prefix','false'),
  ('developer','rename','true'),
  ('developer','sync_backend','true'),
  ('developer','sync_frontend','true'),
  ('developer','templates','true'),
  ('developer','umlauts','false'),
  ('developer','yform_email','true'),
  ('mblock','mblock_delete','1'),
  ('mblock','mblock_scroll','1'),
  ('mblock','mblock_theme','\"default_theme\"'),
  ('media_manager','interlace','[\"jpg\"]'),
  ('media_manager','jpg_quality','80'),
  ('media_manager','png_compression','5'),
  ('media_manager','webp_quality','85'),
  ('mform','mform_theme','\"default_theme\"'),
  ('multiupload/imageoptimizer','advpng_bin','\"\\/usr\\/bin\\/advpng\"'),
  ('multiupload/imageoptimizer','gif_mode','false'),
  ('multiupload/imageoptimizer','gifsicle_bin','\"\\/usr\\/bin\\/gifsicle\"'),
  ('multiupload/imageoptimizer','jpeg_mode','\"jpegoptim\"'),
  ('multiupload/imageoptimizer','jpegoptim_bin','\"\\/usr\\/bin\\/jpegoptim\"'),
  ('multiupload/imageoptimizer','jpegtran_bin','\"\\/usr\\/bin\\/jpegtran\"'),
  ('multiupload/imageoptimizer','optimize_uploaded_files','true'),
  ('multiupload/imageoptimizer','optipng_bin','\"\\/usr\\/bin\\/optipng\"'),
  ('multiupload/imageoptimizer','png_mode','\"pngquant\"'),
  ('multiupload/imageoptimizer','pngcrush_bin','\"\\/usr\\/bin\\/pngcrush\"'),
  ('multiupload/imageoptimizer','pngout_bin','\"\\/usr\\/bin\\/pngout\"'),
  ('multiupload/imageoptimizer','pngquant_bin','\"\\/usr\\/bin\\/pngquant\"'),
  ('nullMeta','key','\"value\"'),
  ('nullMeta','key2','false'),
  ('nullSpace','analytics_id','\"\"'),
  ('nullSpace','audience','\"\"'),
  ('nullSpace','author','\"\"'),
  ('nullSpace','company_city','\"Z\\u00fcrich\"'),
  ('nullSpace','company_coordinates','\"47.38716544479855, 8.539954673013266\"'),
  ('nullSpace','company_country','\"Schweiz\"'),
  ('nullSpace','company_email','\"barmet@advokaturbarmet.ch\"'),
  ('nullSpace','company_name','\"Advokatur Barmet\"'),
  ('nullSpace','company_street','\"Stampfenbachstrasse 142\"'),
  ('nullSpace','company_zip','\"8006\"'),
  ('nullSpace','cookie_all','\"\"'),
  ('nullSpace','cookie_required','\"\"'),
  ('nullSpace','cookie_text','\"\"'),
  ('nullSpace','index','\"index,follow\"'),
  ('nullSpace','keywords','\"\"'),
  ('phpmailer','archive','false'),
  ('phpmailer','bcc','\"\"'),
  ('phpmailer','charset','\"utf-8\"'),
  ('phpmailer','confirmto','\"\"'),
  ('phpmailer','detour_mode','false'),
  ('phpmailer','encoding','\"8bit\"'),
  ('phpmailer','errormail','0'),
  ('phpmailer','from','\"\"'),
  ('phpmailer','fromname','\"Mailer\"'),
  ('phpmailer','host','\"localhost\"'),
  ('phpmailer','logging','0'),
  ('phpmailer','mailer','\"mail\"'),
  ('phpmailer','password','\"\"'),
  ('phpmailer','port','25'),
  ('phpmailer','priority','0'),
  ('phpmailer','security_mode','false'),
  ('phpmailer','smtp_debug','\"0\"'),
  ('phpmailer','smtpauth','false'),
  ('phpmailer','smtpsecure','\"\"'),
  ('phpmailer','test_address','\"\"'),
  ('phpmailer','username','\"\"'),
  ('phpmailer','wordwrap','120'),
  ('search_it','limit','[0,10]'),
  ('sprog','chunkSizeArticles','4'),
  ('structure','notfound_article_id','7'),
  ('structure','start_article_id','7'),
  ('structure/content','default_template_id','1'),
  ('ui_tools/jquery-minicolors','for-customizer','1'),
  ('yform_spam_protection','geo_block','0'),
  ('yform_spam_protection','honeypot','1'),
  ('yform_spam_protection','ip_block','1'),
  ('yform_spam_protection','ip_block_limit','10'),
  ('yform_spam_protection','ip_block_timer','300'),
  ('yform_spam_protection','notification_email','\"\"'),
  ('yform_spam_protection','timer','1'),
  ('yform_spam_protection','timer_form','5'),
  ('yform_spam_protection','timer_session','2'),
  ('yform_spam_protection','tld_block','0'),
  ('yform_spam_protection','tld_list','\".ru\"'),
  ('yform_spam_protection','warning','\"Ihre Anfrage wurde als Spam erkannt und nicht zugestellt. Sollte dies irrt\\u00fcmlich passiert sein, wenden Sie sich bitte an den Betreiber der Website.\"'),
  ('yform_usability','duplicate_tables','[\"all\"]'),
  ('yform_usability','sorting_tables','[\"all\"]'),
  ('yform_usability','status_tables','[\"all\"]'),
  ('yrewrite','unicode_urls','false'),
  ('yrewrite','yrewrite_hide_url_block','false');
/*!40000 ALTER TABLE `rex_config` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_cronjob`;
CREATE TABLE `rex_cronjob` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nexttime` datetime DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `execution_moment` tinyint(1) NOT NULL,
  `execution_start` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_cronjob` WRITE;
/*!40000 ALTER TABLE `rex_cronjob` DISABLE KEYS */;
INSERT INTO `rex_cronjob` VALUES 
  (1,'Artikel-Status',NULL,'rex_cronjob_article_status',NULL,'{\"minutes\":[0],\"hours\":[0],\"days\":\"all\",\"weekdays\":\"all\",\"months\":\"all\"}',NULL,'|frontend|backend|script|',1,'0000-00-00 00:00:00',0,'2020-12-01 09:43:21','luca@nulltype.ch','2020-12-01 09:43:21','luca@nulltype.ch'),
  (2,'Tabellen-Optimierung',NULL,'rex_cronjob_optimize_tables',NULL,'{\"minutes\":[0],\"hours\":[0],\"days\":\"all\",\"weekdays\":\"all\",\"months\":\"all\"}',NULL,'|frontend|backend|script|',0,'0000-00-00 00:00:00',0,'2020-12-01 09:43:23','luca@nulltype.ch','2020-12-01 09:43:23','luca@nulltype.ch');
/*!40000 ALTER TABLE `rex_cronjob` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_global_settings`;
CREATE TABLE `rex_global_settings` (
  `clang` int(10) unsigned NOT NULL,
  `glob_tab_text` text DEFAULT NULL,
  `glob_cookie_text` text DEFAULT NULL,
  `glob_cookie_accept_all` text DEFAULT NULL,
  `glob_cookie_accept_required` text DEFAULT NULL,
  `glob_tab_analytics` text DEFAULT NULL,
  `glob_analytics_id` text DEFAULT NULL,
  `glob_tab_company` text DEFAULT NULL,
  `glob_company_mail` text DEFAULT NULL,
  PRIMARY KEY (`clang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `rex_global_settings` WRITE;
/*!40000 ALTER TABLE `rex_global_settings` DISABLE KEYS */;
INSERT INTO `rex_global_settings` VALUES 
  (1,'','WIR VERWENDEN COOKIES. <br class=\"mobile__only\">DU HAST DIE WAHL.','ALLE AKZEPTIEREN            ','NOTWENDIGE COOKIES AKZEPTIEREN','','UA-195902114-1','','kontakt@advokaturbarmet.ch');
/*!40000 ALTER TABLE `rex_global_settings` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_global_settings_field`;
CREATE TABLE `rex_global_settings_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  `attributes` text NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `default` varchar(255) NOT NULL,
  `params` text DEFAULT NULL,
  `validate` text DEFAULT NULL,
  `callback` text DEFAULT NULL,
  `restrictions` text DEFAULT NULL,
  `createuser` varchar(255) NOT NULL,
  `createdate` datetime NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_global_settings_field` WRITE;
/*!40000 ALTER TABLE `rex_global_settings_field` DISABLE KEYS */;
INSERT INTO `rex_global_settings_field` VALUES 
  (1,'Texte','glob_tab_text',1,'',14,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 11:16:01','luca@nulltype.ch','2021-04-29 11:16:01'),
  (2,'Cookie Text','glob_cookie_text',2,'',1,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 11:16:19','luca@nulltype.ch','2021-04-29 11:16:19'),
  (3,'Alle cookies akzeptieren','glob_cookie_accept_all',3,'',1,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 11:16:49','luca@nulltype.ch','2021-04-29 11:16:49'),
  (4,'Notwendige Cookies aktzeptieren','glob_cookie_accept_required',4,'',1,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 11:17:12','luca@nulltype.ch','2021-04-29 11:17:12'),
  (5,'Analytics','glob_tab_analytics',5,'',14,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 12:38:54','luca@nulltype.ch','2021-04-29 12:39:49'),
  (6,'Tracking ID','glob_analytics_id',6,'',1,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 12:40:08','luca@nulltype.ch','2021-04-29 12:40:08'),
  (7,'Firmendaten','glob_tab_company',7,'',14,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 15:09:50','luca@nulltype.ch','2021-04-29 15:09:50'),
  (8,'Kontakt E-Mail-Adresse','glob_company_mail',8,'',1,'','',NULL,'',NULL,'luca@nulltype.ch','2021-04-29 15:10:12','luca@nulltype.ch','2021-04-29 15:10:12');
/*!40000 ALTER TABLE `rex_global_settings_field` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_global_settings_type`;
CREATE TABLE `rex_global_settings_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `dbtype` varchar(255) NOT NULL,
  `dblength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_global_settings_type` WRITE;
/*!40000 ALTER TABLE `rex_global_settings_type` DISABLE KEYS */;
INSERT INTO `rex_global_settings_type` VALUES 
  (1,'text','text',0),
  (2,'textarea','text',0),
  (3,'select','varchar',255),
  (4,'radio','varchar',255),
  (5,'checkbox','varchar',255),
  (6,'REX_MEDIA_WIDGET','varchar',255),
  (7,'REX_MEDIALIST_WIDGET','text',0),
  (8,'REX_LINK_WIDGET','varchar',255),
  (9,'REX_LINKLIST_WIDGET','text',0),
  (10,'date','text',0),
  (11,'datetime','text',0),
  (12,'legend','text',0),
  (13,'time','text',0),
  (14,'tab','text',0),
  (15,'colorpicker','text',0);
/*!40000 ALTER TABLE `rex_global_settings_type` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_mblock_rexform_demo`;
CREATE TABLE `rex_mblock_rexform_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT 1,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mblock_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_media`;
CREATE TABLE `rex_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filetype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `med_credits` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `med_credits_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_media` WRITE;
/*!40000 ALTER TABLE `rex_media` DISABLE KEYS */;
INSERT INTO `rex_media` VALUES 
  (1,1,NULL,'image/jpeg','lp-test-6.jpg','lp-test-6.jpg','106976',2000,1126,'','2021-04-29 14:05:04','luca@nulltype.ch','2021-04-29 14:05:04','luca@nulltype.ch',0,NULL,NULL),
  (2,1,NULL,'image/jpeg','lp-test-4.jpg','lp-test-4.jpg','106020',2000,1122,'','2021-04-29 14:05:04','luca@nulltype.ch','2021-04-29 14:05:04','luca@nulltype.ch',0,NULL,NULL),
  (3,1,NULL,'image/jpeg','lp-test-1.jpg','lp-test-1.jpg','220060',2000,1125,'','2021-04-29 14:05:04','luca@nulltype.ch','2021-04-29 14:05:04','luca@nulltype.ch',0,NULL,NULL),
  (4,1,NULL,'image/jpeg','lp-test-5.jpg','lp-test-5.jpg','184524',2000,1122,'','2021-04-29 14:05:04','luca@nulltype.ch','2021-06-05 18:11:29','Redakteur',0,'Bildcredit 2',''),
  (5,1,NULL,'image/jpeg','lp-test-3.jpg','lp-test-3.jpg','210789',2000,1121,'','2021-04-29 14:05:05','luca@nulltype.ch','2021-06-06 19:36:20','Redakteur',0,'',''),
  (6,1,NULL,'image/jpeg','lp-test-2.jpg','lp-test-2.jpg','182069',2000,1123,'','2021-04-29 14:05:05','luca@nulltype.ch','2021-04-29 14:05:05','luca@nulltype.ch',0,NULL,NULL),
  (7,1,NULL,'image/png','link-test-2.png','link-test-2.png','697010',548,820,'','2021-04-30 15:52:32','luca@nulltype.ch','2021-04-30 15:52:32','luca@nulltype.ch',0,NULL,NULL),
  (8,1,NULL,'image/png','link-test-1.png','link-test-1.png','710243',540,818,'','2021-04-30 15:52:32','luca@nulltype.ch','2021-04-30 15:52:32','luca@nulltype.ch',0,NULL,NULL),
  (9,1,NULL,'image/png','link-test-3.png','link-test-3.png','768215',542,822,'','2021-04-30 15:52:32','luca@nulltype.ch','2021-04-30 15:52:32','luca@nulltype.ch',0,NULL,NULL),
  (10,1,NULL,'image/png','link-test-4.png','link-test-4.png','870549',548,820,'','2021-04-30 15:52:32','luca@nulltype.ch','2021-04-30 15:52:32','luca@nulltype.ch',0,NULL,NULL),
  (11,1,NULL,'image/png','bild-mit-text-test-1.png','bild-mit-text-test-1.png','127788',720,760,'Bild mit Text','2021-05-01 10:08:48','luca@nulltype.ch','2021-05-01 11:52:41','luca@nulltype.ch',0,NULL,NULL),
  (12,1,NULL,'image/png','bildschirmfoto_2021-05-04_um_13.14.09.png','Bildschirmfoto 2021-05-04 um 13.14.09.png','3144877',1582,1054,'','2021-05-04 13:15:56','luca@nulltype.ch','2021-05-04 13:42:15','luca@nulltype.ch',0,'',NULL),
  (13,1,NULL,'image/png','bildschirmfoto_2021-05-07_um_18.57.34.png','Bildschirmfoto 2021-05-07 um 18.57.34.png','3914177',1466,1548,'','2021-05-07 18:58:43','luca@nulltype.ch','2021-06-05 18:49:49','Redakteur',0,'',''),
  (14,1,NULL,'image/png','bildschirmfoto_2021-05-07_um_18.57.28.png','Bildschirmfoto 2021-05-07 um 18.57.28.png','2884788',1470,1544,'','2021-05-07 18:58:57','luca@nulltype.ch','2021-05-07 18:58:57','luca@nulltype.ch',0,'',''),
  (15,2,NULL,'image/jpeg','testbild.jpg','testbild.jpg','472378',683,512,'','2021-05-31 18:39:10','Redakteur','2021-05-31 18:39:10','Redakteur',0,NULL,NULL),
  (16,3,NULL,'image/jpeg','advokatur-barmet-portrait.jpg','advokatur-barmet-portrait.jpg','254287',2500,1667,'Advokatur Barmet Portrait','2021-05-31 19:30:37','Ray','2021-05-31 19:30:37','Ray',0,'',''),
  (17,4,NULL,'image/jpeg','advokatur-barmet-slider-4.jpg','advokatur-barmet-slider-4.jpg','191478',3162,1899,'advokatur-barmet-slider-4','2021-06-01 14:37:45','Redakteur','2021-06-01 14:43:24','Redakteur',0,'',''),
  (18,4,NULL,'image/jpeg','advokatur-barmet-slider-3.jpg','advokatur-barmet-slider-3.jpg','227242',2500,1667,'advokatur-barmet-slider-3','2021-06-01 14:37:45','Redakteur','2021-06-01 14:43:08','Redakteur',0,'',''),
  (19,4,NULL,'image/jpeg','advokatur-barmet-slider-5.jpg','advokatur-barmet-slider-5.jpg','167119',2500,1605,'advokatur-barmet-slider-5','2021-06-01 14:37:45','Redakteur','2021-06-01 14:42:52','Redakteur',0,'',''),
  (21,4,NULL,'image/jpeg','advokatur-barmet-slider-7.jpg','advokatur-barmet-slider-7.jpg','128000',2500,1421,'advokatur-barmet-slider-7','2021-06-01 14:37:46','Redakteur','2021-06-01 14:42:20','Redakteur',0,'',''),
  (22,4,NULL,'image/jpeg','advokatur-barmet-slider-1.jpg','advokatur-barmet-slider-1.jpg','259946',2500,1442,'advokatur-barmet-slider-1','2021-06-01 14:37:46','Redakteur','2021-06-01 14:41:59','Redakteur',0,'',''),
  (23,4,NULL,'image/jpeg','advokatur-barmet-slider-8.jpg','advokatur-barmet-slider-8.jpg','255774',2500,1405,'advokatur-barmet-slider-8','2021-06-01 14:37:46','Redakteur','2021-06-22 17:37:35','Redakteur',0,'',''),
  (24,4,NULL,'image/jpeg','advokatur-barmet-slider-9.jpg','advokatur-barmet-slider-9.jpg','308972',2500,1526,'advokatur-barmet-slider-9','2021-06-01 14:37:46','Redakteur','2021-10-07 11:28:13','Redakteur',0,'',''),
  (25,4,NULL,'image/jpeg','advokatur-barmet-slider-2.jpg','advokatur-barmet-slider-2.jpg','193594',2500,1512,'advokatur-barmet-slider-2','2021-06-01 14:37:47','Redakteur','2021-06-01 14:41:18','Redakteur',0,'',''),
  (26,5,NULL,'image/jpeg','advokatur-barmet_mood_2.jpg','advokatur-barmet_mood_2.jpg','92393',1116,1667,'advokatur-barmet_mood_2','2021-06-01 14:38:29','Redakteur','2021-06-01 14:40:48','Redakteur',0,'',''),
  (27,5,NULL,'image/jpeg','advokatur-barmet_mood_3.jpg','advokatur-barmet_mood_3.jpg','345212',2500,3750,'advokatur-barmet_mood_3','2021-06-01 14:38:29','Redakteur','2021-06-01 14:40:31','Redakteur',0,'',''),
  (28,5,NULL,'image/jpeg','advokatur-barmet_mood_1.jpg','advokatur-barmet_mood_1.jpg','282636',2500,3750,'advokatur-barmet_mood_1','2021-06-01 14:38:30','Redakteur','2021-06-01 14:40:18','Redakteur',0,'',''),
  (29,5,NULL,'image/jpeg','advokatur-barmet_mood_4.jpg','advokatur-barmet_mood_4.jpg','143535',1077,1667,'advokatur-barmet_mood_4','2021-06-01 14:38:30','Redakteur','2021-06-01 14:40:06','Redakteur',0,'',''),
  (30,6,NULL,'image/jpeg','advokatur-barmet-startseite-doppelbild-1.jpg','advokatur-barmet-startseite-doppelbild-1.jpg','74080',1705,1667,'advokatur-barmet-startseite-doppelbild-1','2021-06-01 14:45:20','Redakteur','2021-06-01 14:47:04','Redakteur',0,'',''),
  (31,6,NULL,'image/jpeg','advokatur-barmet-startseite-doppelbild-2.jpg','advokatur-barmet-startseite-doppelbild-2.jpg','554244',3021,2563,'advokatur-barmet-startseite-doppelbild-2','2021-06-01 14:45:20','Redakteur','2021-06-01 14:45:47','Redakteur',0,'',''),
  (32,7,NULL,'image/jpeg','leawaser_advokaturbarmet_402.jpg','leawaser_advokaturbarmet_402.jpg','75337',2195,1299,'LEAWASER_ADVOKATURBARMET_402','2021-06-01 14:47:59','Redakteur','2021-06-01 14:49:54','Redakteur',0,'',''),
  (33,7,NULL,'image/jpeg','leawaser_advokaturbarmet_039.jpg','leawaser_advokaturbarmet_039.jpg','213202',3162,1893,'LEAWASER_ADVOKATURBARMET_039','2021-06-01 14:47:59','Redakteur','2021-06-05 18:06:42','Redakteur',0,'',''),
  (34,8,NULL,'image/jpeg','advokatur-barmet-anzeigebild-kompetenzen.jpg','advokatur-barmet-anzeigebild-kompetenzen.jpg','200013',3162,3195,'advokatur-barmet-anzeigebild-kompetenzen','2021-06-01 14:57:56','Redakteur','2021-06-01 14:58:17','Redakteur',0,'',''),
  (35,9,NULL,'image/jpeg','advokatur-barmet-anzeigebild-untersuchungen.jpg','advokatur-barmet-anzeigebild-untersuchungen.jpg','220522',3471,3162,'advokatur-barmet-anzeigebild-untersuchungen.jpg','2021-06-01 14:59:34','Redakteur','2021-06-01 14:59:51','Redakteur',0,'',''),
  (36,10,NULL,'image/jpeg','advokatur-barmet-anzeigebild-verhandlungsfuehrung.jpg','advokatur-barmet-anzeigebild-verhandlungsfuehrung.jpg','237080',2500,3750,'advokatur-barmet-anzeigebild-verhandlungsführung','2021-06-01 15:00:08','Redakteur','2021-06-01 15:00:30','Redakteur',0,'',''),
  (37,4,NULL,'image/jpeg','advokatur-barmet-slider-backup_1.jpg','advokatur-barmet-slider-backup_1.jpg','255774',2500,1405,'advokatur-barmet-slider-backup_1','2021-06-01 15:01:50','Redakteur','2021-06-01 15:02:24','Redakteur',0,'',''),
  (38,4,NULL,'image/jpeg','advokatur-barmet-slider-backup_2.jpg','advokatur-barmet-slider-backup_2.jpg','164938',2176,1324,'advokatur-barmet-slider-backup_2','2021-06-01 15:01:50','Redakteur','2021-06-01 15:02:07','Redakteur',0,'',''),
  (39,11,NULL,'image/jpeg','advokatur-barmet-startseite-kompetenzen_einzelbild.jpg','advokatur-barmet-startseite-kompetenzen_einzelbild.jpg','81809',1311,1667,'advokatur-barmet-startseite-kompetenzen-einzelbild.jpg','2021-06-01 15:14:40','Redakteur','2021-06-01 15:15:10','Redakteur',0,'',''),
  (40,10,NULL,'image/jpeg','advokatur-barmet-anzeigebild-verhandlungsfuehrung_1.jpg','advokatur-barmet-anzeigebild-verhandlungsfuehrung_1.jpg','250902',2181,2064,'advokatur-barmet-anzeigebild-verhandlungsführung','2021-06-01 16:18:57','Redakteur','2021-06-01 16:28:11','Redakteur',0,'',''),
  (42,0,NULL,'application/pdf','how_to_get_here.pdf','how to get here.pdf','22926',NULL,NULL,'','2021-06-01 16:51:59','Redakteur','2021-06-01 16:51:59','Redakteur',0,'',''),
  (43,0,NULL,'application/pdf','cv_m.barmet.pdf','CV_M.Barmet.pdf','41809',NULL,NULL,'','2021-06-01 16:52:36','Redakteur','2021-06-01 16:52:36','Redakteur',0,'',''),
  (48,4,NULL,'image/jpeg','advokatur-barmet-slider-6.jpg','advokatur-barmet-slider-6.jpg','1175430',3162,2642,'advokatur-barmet-slider-6','2021-06-01 17:19:33','Redakteur','2021-07-14 15:21:18','Redakteur',0,'',''),
  (49,0,NULL,'application/pdf','how_to_get_here_1.pdf','how to get here.pdf','65606',NULL,NULL,'','2021-06-02 14:30:50','Redakteur','2021-06-02 14:30:50','Redakteur',0,'',''),
  (50,0,NULL,'application/pdf','how_to_get_here_2.pdf','how to get here.pdf','65606',NULL,NULL,'How to get here','2021-06-02 14:32:30','Redakteur','2021-06-02 14:32:30','Redakteur',0,'',''),
  (51,0,NULL,'application/pdf','how_to_get_here_3.pdf','how to get here.pdf','65606',NULL,NULL,'Barmet Anfahrtsplan','2021-06-05 09:49:22','luca@nulltype.ch','2021-06-05 09:49:22','luca@nulltype.ch',0,'',''),
  (52,0,NULL,'application/zip','leawaser_interior_advokatur_barmet.zip','leawaser_INTERIOR_ADVOKATUR_BARMET.zip','61866753',NULL,NULL,'','2021-06-22 17:37:02','Redakteur','2021-06-22 17:37:02','Redakteur',0,'',''),
  (53,4,NULL,'image/jpeg','advokatur-barmet-slider-6_retouche.jpg','advokatur-barmet-slider-6_retouche.jpg','1175430',3162,2642,'advokatur-barmet-slider-6-retouche','2021-07-14 15:21:50','Redakteur','2021-07-14 15:21:50','Redakteur',0,'',''),
  (54,0,NULL,'application/pdf','ab_stelleninseart_website_002.pdf','AB_Stelleninseart_Website_002.pdf','720938',NULL,NULL,'','2021-11-17 19:01:57','luca@nulltype.ch','2021-11-17 19:01:57','luca@nulltype.ch',0,'','');
/*!40000 ALTER TABLE `rex_media` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_media_category`;
CREATE TABLE `rex_media_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_media_category` WRITE;
/*!40000 ALTER TABLE `rex_media_category` DISABLE KEYS */;
INSERT INTO `rex_media_category` VALUES 
  (1,'Testbilder',0,'|','2021-04-29 14:04:22','luca@nulltype.ch','2021-04-29 14:04:26','luca@nulltype.ch',NULL,0),
  (2,'Schulung',0,'|','2021-05-31 18:38:11','Redakteur','2021-05-31 18:38:11','Redakteur',NULL,0),
  (3,'Advokatur',0,'|','2021-05-31 19:30:08','Ray','2021-05-31 19:30:08','Ray',NULL,0),
  (4,'Slider Home',0,'|','2021-06-01 14:37:12','Redakteur','2021-06-01 14:37:12','Redakteur',NULL,0),
  (5,'Advokatur Mood',0,'|','2021-06-01 14:38:18','Redakteur','2021-06-01 14:38:18','Redakteur',NULL,0),
  (6,'Startseite Doppelbild',0,'|','2021-06-01 14:45:09','Redakteur','2021-06-01 14:45:09','Redakteur',NULL,0),
  (7,'Startseite Aktuell',0,'|','2021-06-01 14:47:50','Redakteur','2021-06-01 14:47:50','Redakteur',NULL,0),
  (8,'Kompetenzen',0,'|','2021-06-01 14:57:42','Redakteur','2021-06-01 14:57:42','Redakteur',NULL,0),
  (9,'Untersuchungen',0,'|','2021-06-01 14:59:01','Redakteur','2021-06-01 14:59:01','Redakteur',NULL,0),
  (10,'Verhandlungsführung',0,'|','2021-06-01 15:00:04','Redakteur','2021-06-01 15:00:04','Redakteur',NULL,0),
  (11,'Startseite Kompetenzen',0,'|','2021-06-01 15:14:23','Redakteur','2021-06-01 15:14:23','Redakteur',NULL,0);
/*!40000 ALTER TABLE `rex_media_category` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_media_manager_plus_breakpoints`;
CREATE TABLE `rex_media_manager_plus_breakpoints` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `mediaquery` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

LOCK TABLES `rex_media_manager_plus_breakpoints` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_plus_breakpoints` DISABLE KEYS */;
INSERT INTO `rex_media_manager_plus_breakpoints` VALUES 
  (1,'XS','(max-width: 375px)'),
  (2,'S','(min-width: 376px) and (max-width: 750px)'),
  (3,'M','(min-width: 751px) and (max-width: 1024px)'),
  (4,'L','(min-width: 1025px) and (max-width: 1300px)'),
  (5,'XL','(min-width: 1301px)');
/*!40000 ALTER TABLE `rex_media_manager_plus_breakpoints` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_media_manager_type`;
CREATE TABLE `rex_media_manager_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` int(10) NOT NULL,
  `subgroup` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_media_manager_type` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_type` DISABLE KEYS */;
INSERT INTO `rex_media_manager_type` VALUES 
  (1,1,'rex_mediapool_detail','Zur Darstellung von Bildern in der Detailansicht im Medienpool','2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend',0,0),
  (2,1,'rex_mediapool_maximized','Zur Darstellung von Bildern im Medienpool wenn maximiert','2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend',0,0),
  (3,1,'rex_mediapool_preview','Zur Darstellung der Vorschaubilder im Medienpool','2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend',0,0),
  (4,1,'rex_mediabutton_preview','Zur Darstellung der Vorschaubilder in REX_MEDIA_BUTTON[]s','2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend',0,0),
  (5,1,'rex_medialistbutton_preview','Zur Darstellung der Vorschaubilder in REX_MEDIALIST_BUTTON[]s','2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend',0,0);
/*!40000 ALTER TABLE `rex_media_manager_type` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_media_manager_type_effect`;
CREATE TABLE `rex_media_manager_type_effect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL,
  `effect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_media_manager_type_effect` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_type_effect` DISABLE KEYS */;
INSERT INTO `rex_media_manager_type_effect` VALUES 
  (1,1,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"200\",\"rex_effect_resize_height\":\"200\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend'),
  (2,2,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"600\",\"rex_effect_resize_height\":\"600\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend'),
  (3,3,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"80\",\"rex_effect_resize_height\":\"80\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend'),
  (4,4,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"246\",\"rex_effect_resize_height\":\"246\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend'),
  (5,5,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"246\",\"rex_effect_resize_height\":\"246\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2021-03-03 09:02:50','backend','2021-03-03 09:02:50','backend');
/*!40000 ALTER TABLE `rex_media_manager_type_effect` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_metainfo_field`;
CREATE TABLE `rex_metainfo_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `default` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validate` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `callback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restrictions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `templates` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_metainfo_field` WRITE;
/*!40000 ALTER TABLE `rex_metainfo_field` DISABLE KEYS */;
INSERT INTO `rex_metainfo_field` VALUES 
  (1,'Bildcredit','med_credits',1,'',1,'','',NULL,'',NULL,NULL,'2021-05-04 13:41:47','luca@nulltype.ch','2021-05-04 13:41:47','luca@nulltype.ch'),
  (2,'Bildcredit Link','med_credits_link',2,'',1,'','',NULL,'',NULL,NULL,'2021-05-04 13:43:17','luca@nulltype.ch','2021-05-04 13:43:17','luca@nulltype.ch');
/*!40000 ALTER TABLE `rex_metainfo_field` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_metainfo_type`;
CREATE TABLE `rex_metainfo_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dblength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_metainfo_type` WRITE;
/*!40000 ALTER TABLE `rex_metainfo_type` DISABLE KEYS */;
INSERT INTO `rex_metainfo_type` VALUES 
  (1,'text','text',0),
  (2,'textarea','text',0),
  (3,'select','varchar',255),
  (4,'radio','varchar',255),
  (5,'checkbox','varchar',255),
  (6,'REX_MEDIA_WIDGET','varchar',255),
  (7,'REX_MEDIALIST_WIDGET','text',0),
  (8,'REX_LINK_WIDGET','varchar',255),
  (9,'REX_LINKLIST_WIDGET','text',0),
  (10,'date','text',0),
  (11,'datetime','text',0),
  (12,'legend','text',0),
  (13,'time','text',0);
/*!40000 ALTER TABLE `rex_metainfo_type` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_module`;
CREATE TABLE `rex_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `output` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_module` WRITE;
/*!40000 ALTER TABLE `rex_module` DISABLE KEYS */;
INSERT INTO `rex_module` VALUES 
  (1,NULL,'Intro','<?php\n$images = explode(\',\', \'REX_MEDIALIST[1]\');\nif (!empty($images[0])) {\n    $output = \'<div class=\"intro component\">\';\n    $output .= \'<div class=\"logo\"><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"61.009\" height=\"52.97\" viewBox=\"0 0 61.009 52.97\"><g transform=\"translate(-293.815 -414.926)\"><rect width=\"7.126\" height=\"7.525\" transform=\"translate(293.815 462.313) rotate(-45)\" fill=\"#fff\"/><path d=\"M354.824,453.485c0,9.036-6.7,14.411-18.149,14.411H310.5V465.17c6.543-.233,7.244-.857,7.244-6.543V424.2c0-5.686-.7-6.31-7.244-6.543v-2.727h24.381c12.464,0,18.773,4.207,18.773,12.62,0,8.258-5.608,12.23-17.526,12.619v.313C349.294,440.633,354.824,444.527,354.824,453.485ZM325.848,418.2v20.33h5.3c9.346,0,13.709-3.271,13.709-10.2,0-6.621-4.05-10.126-11.684-10.126Zm20.174,35.521c0-9.036-3.661-11.218-20.174-11.3v15.189c0,5.064,3.115,7.4,8.8,7.4C341.815,465.015,346.022,460.886,346.022,453.72Z\" fill=\"#fff\"/></g></svg></div>\';\n    $output .= \'<div class=\"intro__title\">REX_VALUE[1]</div>\';\n    foreach ($images as $index => $image) {\n        $imgObj = rex_media::get($image);\n        $lazyData = $index < 3 ? \'\' : \' data-lazy data-markup=\\\'\' . media_manager_plus_frontend::generatePictureTag($imgObj->getExtension(), $imgObj->getFileName()) . \'\\\'\';\n        $hiddenClass = $index > 0 ? \' hidden\' : \'\';\n        $output .= \'<div class=\"item\' . $hiddenClass . \'\"\' . $lazyData . \'>\';\n        if ($index < 3) {\n            $output .= Simplify::getPictureTag($image);\n            //$output .= media_manager_plus_frontend::generatePictureTag($imgObj->getExtension(), $imgObj->getFileName());\n        }\n        $output .= \'</div>\';\n    }\n    $output .= \'</div>\';\n\n    echo $output;\n}\n?>','<?php\n$mform = new MForm();\n$mform->addMedialistField(\'1\', array(\'Bilder\'));\n$mform->addTextField(\'1\', array(\'Titel\'));\necho $mform->show();\n?>','2021-04-29 12:55:04','luca@nulltype.ch','2021-06-01 19:18:24','luca@nulltype.ch',NULL,0),
  (2,NULL,'Text','<?php\n$fileDownload = \'REX_MEDIA[1]\';\n\n$output = \'<div class=\"text__full component\">\';\n    $output .= \'REX_VALUE[id=1 output=html]\';\n\n    if(!empty($fileDownload)) {\n        $output .= \'<div class=\"download\">\';\n            $output .= \'<a data-cursor-dynamic href=\"/media/\'.$fileDownload.\'\" download=\"download\">REX_VALUE[2]</a>\';\n        $output .= \'</div>\';\n    }\n$output .= \'</div>\';\n\necho $output;\n?>','<?php\n$mform = new MForm();\n    $mform->addTab(\'Text\');\n        $mform->addTextAreaField(\'1\', array(\'label\' => \'Text\', \'class\' => \'redactor-editor--links_only\'));\n    $mform->closeTab();\n\n    $mform->addTab(\'Download\');\n        $mform->addTextField(\'2\', array(\'label\' => \'Linktext\'));\n        $mform->addMediaField(\'1\', array(\'label\' => \'Datei\'));\n    $mform->closeTab();\necho $mform->show();\n?>','2021-04-29 12:55:10','luca@nulltype.ch','2021-06-01 19:18:34','luca@nulltype.ch',NULL,0),
  (3,NULL,'Interne oder externe Verlinkungen (2-Spaltig)','<?php\n$links = rex_var::toArray(\'REX_VALUE[1]\');\n\n$output = \'<div class=\"cta__squares component\">\';\nforeach($links as $link){\n    $image = $link[\'REX_MEDIA_1\'];\n    $internalLink = $link[\'REX_LINK_1\'];\n    $externalLink = $link[\'external\'];\n    $title = $link[\'title\'];\n    $subtitle = $link[\'subtitle\'];\n    $isExternal = !empty($externalLink);\n\n    if(!empty($internalLink) ||!empty($externalLink)) {\n      $output .= $isExternal ? \'<a href=\"\" rel=\"noreferrer\" data-cursor-dynamic target=\"_blank\">\' : \'<a href=\"\'.rex_article::get($internalLink)->getUrl().\'\" data-cursor-dynamic>\';\n    }\n\n    $output .= \'<div class=\"cta\">\';\n        $output .= \'<div class=\"cta__image\">\'.Simplify::getPictureTag($image).\'</div>\';\n        $output .= \'<div class=\"cta__content\">\';\n            $output .= \'<div class=\"cta__title\">\'.$title.\'</div>\';\n            $output .= \'<div class=\"cta__separator\"></div>\';\n            $output .= \'<div class=\"cta__subtitle\">\'.$subtitle.\'</div>\';\n        $output .= \'</div>\';\n    $output .= \'<div class=\"cta__more\"></div>\';\n    $output .= \'</div>\';\n\n    if(!empty($internalLink) ||!empty($externalLink)) {\n        $output .= \'</a>\';\n    }\n}\n$output .= \'</div>\';\necho $output;\n?>','<?php\r\n$mblockID = \'1\';\r\n$mblock = new MForm();\r\n$mblock->addFieldset(\'Kachel\');\r\n    $mblock->addMediaField(\"$mblockID.0.REX_MEDIA_1\", array(\'Bild\'));\r\n    $mblock->addLinkField(\"$mblockID.0.REX_LINK_1\", array(\'label\' => \'Interne Verlinkung\'));\r\n    $mblock->addTextField(\"$mblockID.0.external\", array(\'label\' => \'Externe Verlinkung\', \'placeholder\' => \'Dieses Feld überschreibt das Feld «interne Verlinkung»\'));\r\n    $mblock->addTextField(\"$mblockID.0.title\", array(\'label\' => \'Titel\'));\r\n    $mblock->addTextField(\"$mblockID.0.subtitle\", array(\'label\' => \'Untertitel\'));\r\n$mblock->closeFieldset();\r\necho Mblock::show($mblockID, $mblock);\r\n?>','2021-04-29 12:55:45','luca@nulltype.ch','2021-06-01 19:18:53','luca@nulltype.ch',NULL,0),
  (4,NULL,'Interne Verlinkung (4-Bilder)','<?php\n$images = [\'REX_MEDIA[1]\',\'REX_MEDIA[2]\',\'REX_MEDIA[3]\',\'REX_MEDIA[4]\'];\n$url = !empty(\'REX_LINK[1]\') ? rex_article::get(\'REX_LINK[1]\', rex_clang::getCurrentId())->getUrl() : \'\';\n$title = !empty(\'REX_LINK[1]\') ? rex_article::get(\'REX_LINK[1]\', rex_clang::getCurrentId())->getName() : \'\';\n\n$output = !empty($url) ? \'<a href=\"\'.$url.\'\" title=\"\'.$title.\'\" class=\"component thumb__link\">\' : \'\';\n$output .= \'<div class=\"thumbnail__row\" data-cursor-dynamic>\';\nforeach($images as $image) {\n    $output .= \'<div class=\"thumbnail\">\';\n\n        $output .= Simplify::getPictureTag($image);\n        //$output .= media_manager_plus_frontend::generatePictureTag($imgObj->getExtension(), $imgObj->getFileName());\n    $output .= \'</div>\';\n}\n$output .= \'</div>\';\n$output .= !empty($url) ? \'</a>\' : \'\';\necho $output;\n?>','<?php\n$mform = new MForm();\n    $mform->addLinkField(\'1\', array(\'label\' => \'Verlinkung\'));\n    $mform->addMediaField(\'1\', array(\'label\' => \'Bild 1\'));\n    $mform->addMediaField(\'2\', array(\'label\' => \'Bild 2\'));\n    $mform->addMediaField(\'3\', array(\'label\' => \'Bild 3\'));\n    $mform->addMediaField(\'4\', array(\'label\' => \'Bild 4\'));\necho $mform->show();\n?>','2021-04-29 12:56:29','luca@nulltype.ch','2021-06-01 19:18:49','luca@nulltype.ch',NULL,0),
  (5,NULL,'Bild mit Text','<?php\n$alignment = \'REX_VALUE[1]\';\n$text = \'REX_VALUE[id=2 output=html]\';\n$links = rex_var::toArray(\'REX_VALUE[3]\');\n\n$output = \'<div class=\"image__text component \'.$alignment.\'\">\';\n\n    $output .= \'<div class=\"col\">\';\n        $output .= Simplify::getPictureTag(\'REX_MEDIA[1]\');\n    $output .= \'</div>\';\n\n    // Links\n    $alignClass = \'REX_VALUE[5]\' === \'label\' ? \' no-center\' : \'\';\n    $output .= \'<div class=\"col\'.$alignClass.\'\">\';\n        $output .= \'<div class=\"text paragraph\">\';\n        $output .= $text;\n        if(!empty($links)) {\n            $output .= \'<div class=\"links\">\';\n            foreach($links as $link) {\n                $anchorAttribute = !empty($link[\'anchor\']) ? \' data-anchor=\"#\'.$link[\'anchor\'].\'\"\' : \'\';\n                $isExternal = !empty($link[\'external\']);\n                $linkText = $link[\'linkText\'];\n\n                if($isExternal) {\n                    $output .= \'<a href=\"\'.Simplify::formatLink($link[\'external\']).\'\" data-cursor-dynamic rel=\"noreferrer\" target=\"_blank\">\'.$linkText.\'</a>\';\n                } else {\n                    $output .= !empty($link[\'REX_LINK_3\']) ? \'<a href=\"\'.rex_article::get($link[\'REX_LINK_3\'], rex_clang::getCurrentId())->getUrl().\'\" data-cursor-dynamic>\'.$linkText.\'</a>\' : \'\';\n                }\n            }\n            $output .= \'</div>\';\n        }\n        $output .= \'</div>\';\n    $output .= \'</div>\';\n\n$output .= \'</div>\';\necho $output;\n\n?>','<?php\n$mform = new MForm();\n$mform->addFieldset(\'Inhalt und Einstellungen\');\n    $mform->addSelectField(\'1\', array(\'left\' => \'Links\', \'right\' => \'Rechts\'), array(\'label\' => \'Bildausrichtung\'));\n    $mform->addMediaField(\'1\', array(\'label\' => \'Bild\'));\n    $mform->addTextAreaField(\'2\', array(\'label\' => \'Text\',\'class\' => \'redactor-editor--links_only\'));\n    $mform->addCheckboxField(\'4\', array(\'label\' => \'Titel nicht ausmitten\'));\n$mform->closeFieldset();\n$mform->addFieldset(\'Links hinzufügen\');\necho $mform->show();\n\n$mblockID = \'3\';\n$mblock = new MForm();\n    $mblock->addFieldset(\'Link\');\n    $mblock->addTextField(\"$mblockID.0.linkText\", array(\'label\' => \'Linktext\'));\n    $mblock->addLinkField(\"$mblockID.0.REX_LINK_1\", array(\'label\' => \'interner Link\'));\n    $mblock->addTextField(\"$mblockID.0.anchor\", array(\'label\' => \'interner Anker\'));\n    $mblock->addTextField(\"$mblockID.0.external\", array(\'label\' => \'externer Link\', \'placeholder\' => \'Achtung, dieses Feld überschreibt das Feld «interner Link»\'));\necho MBlock::show($mblockID, $mblock, array(\'initial-hidden\' => \'1\'));\n?>','2021-04-29 12:56:37','luca@nulltype.ch','2021-06-05 13:28:05','console',NULL,0),
  (6,NULL,'Aktuell-Vorschau','<?php\n$article = rex_article::get(\'REX_LINK[1]\', rex_clang::getCurrentId());\nif(!empty($article)) {\n    $slices = rex_article_slice::getSlicesForArticle($article->getId(), rex_clang::getCurrentId());\n    foreach($slices as $slice) {\n        if($slice->getModuleId() === 8) {\n            $title = $slice->getValue(1);\n            $date = str_replace(\'.\', \' / \', $slice->getValue(2));\n            $mediaList = explode(\',\', $slice->getMediaList(1));\n\n            $output = \'<a href=\"\'.$article->getUrl().\'\" data-cursor-dynamic>\';\n            $output .= \'<div class=\"news__preview component\">\';\n                $output .= \'<div class=\"col\">\';\n                    $output .= \'<div class=\"news__meta\">\';\n                        $output .= \'<div class=\"news__title\">\'.$title.\'</div>\';\n                        $output .= \'<div class=\"news__divider\"></div>\';\n                        $output .= \'<div class=\"news__date\">\'.$date.\'</div>\';\n                    $output .= \'</div>\';\n                    $output .= \'<div class=\"news__more\"></div>\';\n                $output .= \'</div>\';\n\n                $output .= \'<div class=\"col\">\';\n                    if(!empty($mediaList[0])) {\n                        $output .= Simplify::getPictureTag($mediaList[0]);\n                    }\n                $output .= \'</div>\';\n            $output .= \'</div>\';\n\n            $output .= \'</a>\';\n            echo $output;\n            break;\n        }\n    }\n}\n?>','<?php\n$mform = new MForm();\n    $mform->addLinkField(\'1\', array(\'label\' => \'«Aktuell» Artikel\'));\necho $mform->show();\n?>','2021-04-29 12:57:40','luca@nulltype.ch','2021-06-01 19:19:46','luca@nulltype.ch',NULL,0),
  (7,NULL,'Kontakt','<?php\n$output = \'<div class=\"contact component\">\';\n    $output .= \'<div class=\"title\">Contact</div>\';\n    $output .= \'<div class=\"address__line\">REX_VALUE[1]<br>REX_VALUE[2]</div>\';\n    $output .= \'<div class=\"address__line\">REX_VALUE[3]<br><a data-cursor-dynamic href=\"mailto:REX_VALUE[4]\">REX_VALUE[4]</a></div>\';\n    $output .= !empty(\'REX_VALUE[5]\') ? \'<div class=\"mailbox\">Postadresse: REX_VALUE[5]</div>\' : \'\';\n$output .= \'</div>\';\necho $output;\n?>','<?php\n$mform = new MForm();\n    $mform->addTextField(\'1\', array(\'label\' => \'Kontaktzeile 1\'));\n    $mform->addTextField(\'2\', array(\'label\' => \'Kontaktzeile 2\'));\n    $mform->addTextField(\'3\', array(\'label\' => \'Telefon\'));\n    $mform->addTextField(\'4\', array(\'label\' => \'Email\'));\n\n    $mform->addTextField(\'5\', array(\'label\' => \'Postadresse\'));\necho $mform->show();\n?>','2021-04-29 12:58:39','luca@nulltype.ch','2021-06-01 19:18:37','luca@nulltype.ch',NULL,0),
  (8,NULL,'Aktuell-Beitrag','<?php\r\n$images = !empty(\'REX_MEDIALIST[1]\') ? explode(\',\', \'REX_MEDIALIST[1]\') : null;\r\n$output = \'<div class=\"blog__post component closed\">\';\r\n$output .= \'<div class=\"preview\">\';\r\n$output .= \'<div class=\"col\">\';\r\n$output .= \'<div class=\"preview__content\">\';\r\n$output .= \'<div class=\"preview__title\">REX_VALUE[1]</div>\';\r\n$output .= \'<div class=\"preview__divider\"></div>\';\r\nif(!empty(\'REX_VALUE[2]\')) {\r\n    $date = str_replace(\'.\', \' / \', \'REX_VALUE[2]\');\r\n    $output .= \'<div class=\"preview__date\">DATE: \' . $date . \'</div>\';\r\n}\r\n$output .= \'</div>\';\r\n$output .= \'</div>\';\r\n\r\n$output .= \'<div class=\"col\">\';\r\n$output .= \'<div class=\"media__wrapper\">\';\r\nif (count($images) > 1 && !empty($images[0])) {\r\n    $output .= \'<div class=\"swiper-container\">\';\r\n    $output .= \'<div class=\"swiper-wrapper\">\';\r\n    foreach ($images as $image) {\r\n        $output .= \'<div class=\"swiper-slide\">\';\r\n        //$output .= \'<img src=\"\'.$image.\'\"\'>\r\n        $output .= Simplify::getPictureTag($image);\r\n        $output .= \'</div>\';\r\n    }\r\n    $output .= \'</div>\';\r\n    $output .= \'<div class=\"swiper-pagination\"></div>\';\r\n    $output .= \'</div>\';\r\n} else {\r\n    if(!empty($images) && !empty($images[0])) {\r\n        $image = $images[0];\r\n        $output .= Simplify::getPictureTag($image);\r\n    }\r\n}\r\n$output .= \'</div>\';\r\n$output .= \'</div>\';\r\n$output .= \'</div>\';\r\n\r\n$output .= \'<div class=\"blog__content\">\';\r\n$output .= \'<div class=\"col\">\';\r\n$output .= \'<div class=\"content__title\">REX_VALUE[3]</div>\';\r\n$output .= \'<div class=\"content__text\">REX_VALUE[id=4 output=html]</div>\';\r\n$output .= \'</div>\';\r\n\r\n$output .= \'<div class=\"col\">\';\r\n$titleOutput = false;\r\nforeach ($images as $image) {\r\n    if (!empty($image)) {\r\n        $imageCredit = rex_media::get($image)->getValue(\'med_credits\');\r\n    }\r\n\r\n    if (!empty($imageCredit)) {\r\n        if (!$titleOutput) {\r\n            $output .= \'<div class=\"image__credit\">Image Credits</div>\';\r\n            $titleOutput = true;\r\n        }\r\n\r\n        $creditURL = rex_media::get($image)->getValue(\'med_credits_link\');\r\n        $creditString = !empty($creditURL) ? \'<a href=\"\' . Simplify::formatLink($creditURL) . \'\" title=\"Credits: \' . $imageCredit . \'\">@\' . $imageCredit . \'</a>\' : \'@\' . $imageCredit;\r\n        $output .= \'<div class=\"image__credit\">\' . $creditString . \'</div>\';\r\n    }\r\n}\r\n\r\n$output .= !empty(\'REX_VALUE[id=5 output=html]\') ? \'<div class=\"content__text\">REX_VALUE[id=5 output=html]</div>\' : \'\';\r\n\r\n$moreLink = \'REX_VALUE[7]\';\r\n$moreURL = \'REX_VALUE[6]\';\r\n\r\nif (!empty($moreLink) && !empty($moreURL)) {\r\n    $output .= \'<div class=\"content__link\" data-cursor-dynamic><span>READ MORE:</span><a href=\"\' . Simplify::formatLink($moreURL) . \'\" target=\"_blank\" title=\"\' . $moreLink . \'\">\' . $moreLink . \'</a></div>\';\r\n}\r\n\r\n$output .= \'</div>\';\r\n$output .= \'</div>\';\r\n$output .= \'<div class=\"blog__more\" data-cursor-dynamic></div>\';\r\n$output .= \'</div>\';\r\necho $output;\r\n?>','<?php\r\n    $mform = new MForm();\r\n        $mform->addTab(\'Meta-Informationen\');\r\n        $mform->addTextField(\'1\', array(\'label\' => \'Titel\'));\r\n        $mform->addTextField(\'2\', array(\'label\' => \'Datum\', \'class\' => \'datepicker\'));\r\n        $mform->addMedialistField(\'1\', array(\'label\' => \'Bild(er)\'));\r\n        $mform->closeTab();\r\n\r\n        $mform->addTab(\'Inhalte\');\r\n            $mform->addFieldset(\'Texte\');\r\n                $mform->addTextAreaField(\'3\', array(\'label\' => \'Lauftext-Titel\'));\r\n                $mform->addTextAreaField(\'4\', array(\'label\' => \'Text (linke Spalte)\', \'class\' => \'redactor-editor--links_only\'));\r\n                $mform->addTextAreaField(\'5\', array(\'label\' => \'Text (rechte Spalte)\', \'class\' => \'redactor-editor--links_only\'));\r\n            $mform->closeFieldset();\r\n            $mform->addFieldset(\'Read More\');\r\n                $mform->addTextField(\'6\', array(\'label\' => \'«Read More» Link\'));\r\n                $mform->addTextField(\'7\', array(\'label\' => \'«Read More» Linktext\'));\r\n            $mform->closeFieldset();\r\n        $mform->closeTab();\r\n    echo $mform->show();\r\n?>','2021-04-29 12:59:15','luca@nulltype.ch','2021-11-19 12:13:40','luca@nulltype.ch',NULL,0),
  (9,NULL,'Kompetenzen','<?php\n$tiles = rex_var::toArray(\'REX_VALUE[1]\');\n$output = \'\';\n\nif (!empty($tiles)) {\n    $output .= \'<div class=\"tiles component\">\';\n    foreach ($tiles as $tile) {\n        // Tile\n        $alignClass = $tile[\'check\'] === \'label\' ? \' no-center\' : \'\';\n\n        $output .= \'<div class=\"tile\" data-cursor-dynamic><div class=\"tile__title\">\' . $tile[\'tileText\'] . \'</div><div class=\"tile__more\"></div></div>\';\n        $output .= \'<div class=\"tile__popup\">\';\n            $pictureTag = !empty($tile[\'REX_MEDIA_1\']) ? Simplify::getPictureTag($tile[\'REX_MEDIA_1\']) : \'\';\n            $output .= \'<div class=\"col\">\'.$pictureTag.\'</div>\';\n            $output .= \'<div class=\"col\'.$alignClass.\'\">\';\n                $output .= \'<div class=\"popup__content\">\';\n                    $output .= \'<div class=\"popup__title\">\'.$tile[\'tileText\'].\'</div>\';\n                    $output .= \'<div class=\"popup__divider\"></div>\';\n                    $output .= \'<div class=\"popup__subtitle\">\'.$tile[\'subTitle\'].\'</div>\';\n                    $output .= \'<div class=\"popup__text\">\'.$tile[\'text\'].\'</div>\';\n                $output .= \'</div>\';\n                $output .= \'<div class=\"popup__close\" data-cursor-dynamic></div>\';\n            $output .= \'</div>\';\n        $output .= \'</div>\';\n        // Popup\n    }\n    $output .= \'</div>\';\n}\n\necho $output;\n?>','<?php\n$mblockID = \'1\';\n\n$mblock = new Mform();\n    $mblock->addFieldset(\'Kompetenz\');\n        $mblock->addTab(\'Kachel\');\n            $mblock->addTextField(\"$mblockID.0.tileText\", array(\'label\' => \'Kacheltext\'));\n        $mblock->closeTab();\n\n        $mblock->addTab(\'Popup-Inhalt\');\n            $mblock->addMediaField(\"$mblockID.0.REX_MEDIA_1\", array(\'label\' => \'Bild\'));\n            $mblock->addTextField(\"$mblockID.0.subTitle\", array(\'label\' => \'Untertitel\'));\n            $mblock->addTextAreaField(\"$mblockID.0.text\", array(\'label\' => \'Text\', \'class\' => \'redactor-editor--links_only\'));\n            $mblock->addCheckboxField(\"$mblockID.0.check\", array(\'label\' => \'Titel nicht einmitten\'));\n        $mblock->closeTab();\n\n    $mblock->closeFieldset();\necho MBlock::show($mblockID, $mblock);\n?>','2021-04-29 12:59:31','luca@nulltype.ch','2021-06-05 13:30:20','console',NULL,0),
  (10,NULL,'Einzelbild','<?php\n    $output = \'<div class=\"image component\">\';\n        $output .= Simplify::getPictureTag(\'REX_MEDIA[1]\');\n    $output .= \'</div>\';\n    echo $output;\n?>','<?php\r\n$mform = new MForm();\r\n    $mform->addMediaField(\'1\', array(\'label\' => \'Bild\'));\r\necho $mform->show();\r\n?>','2021-04-29 13:01:36','luca@nulltype.ch','2021-06-01 19:19:01','luca@nulltype.ch',NULL,0),
  (11,NULL,'Footer','<?php\r\n$setting = \'REX_VALUE[1]\';\r\n\r\n$output = \'\';\r\n\r\nswitch ($setting) {\r\n    case \'auto\':\r\n        $rootCats = rex_category::getRootCategories(false, rex_clang::getCurrentId());\r\n        $output .= \'<ul>\';\r\n        foreach ($rootCats as $cat) {\r\n            $article = $cat->getStartArticle();\r\n            $articleID = $article->getId();\r\n            $articleName = $article->getName();\r\n            $articleURL = $article->getUrl();\r\n            if ($articleID !== 7 && $articleID !== 13) {\r\n                $output .= \'<li><a href=\"\' . $articleURL . \'\" title=\"\' . $articleName . \'\">\' . $articleName . \'</a></li>\';\r\n            }\r\n        }\r\n        $output .= \'</ul>\';\r\n        break;\r\n    case \'manual\':\r\n        $links = rex_var::toArray(\'REX_VALUE[10]\');\r\n        $output .= \'<ul>\';\r\n        foreach ($links as $link) {\r\n            $linkText = $link[\'linkText\'];\r\n            $linkInternal = $link[\'REX_LINK_1\'];\r\n            $linkExternal = $link[\'internal\'];\r\n            $linkDownload = $link[\'REX_MEDIA_1\'];\r\n\r\n            $isExternal = !empty($linkExternal);\r\n            $isDownload = !empty($linkDownload);\r\n\r\n            if ($isDownload) {\r\n                $output .= \'<li><a href=\"/media/\' . $linkDownload . \'\" download=\"download\" data-cursor-static title=\"\' . $linkText . \'\">\' . $linkText . \'</a></li>\';\r\n            } else if ($isExternal) {\r\n                $linkExternal = Simplify::formatLink($linkExternal);\r\n                $output .= \'<li><a href=\"\' . $linkExternal . \'\" rel=\"noreferrer\" target=\"_blank\" data-cursor-static title=\"\' . $linkText . \'\">\' . $linkText . \'</a></li>\';\r\n            } else {\r\n\r\n                $article = rex_article::get($linkInternal, rex_clang::getCurrentId());\r\n                if (!empty($article)) {\r\n                    $linkText = $article->getName();\r\n                    $linkText = !empty($link[\'linkText\']) ? $link[\'linkText\'] : $linkText;\r\n                    if (!empty($article)) {\r\n                        $articleURL = $article->getUrl();\r\n                        $articleName = $article->getName();\r\n                        $output .= \'<li><a href=\"\' . $articleURL . \'\" data-cursor-static title=\"\' . $articleName . \'\">\' . $linkText . \'</a></li>\';\r\n                    }\r\n                }\r\n            }\r\n        }\r\n        $output .= \'</ul>\';\r\n        break;\r\n    default:\r\n        break;\r\n}\r\n\r\necho $output;\r\n?>','<?php\r\n$mform = new MForm();\r\n    $mform->addFieldset(\'Einstellungen\');\r\n    $mform->addSelectField(\'1\', array(\'auto\' => \'Hauptartikel automatisch (ohne Kontakt)\', \'manual\' => \'Manuell\'), array(\'label\' => \'Einstellung\', \'class\' => \'barmet__footer__select\'));\r\n    $mform->closeFieldset();\r\necho $mform->show();\r\n\r\necho \'<div class=\"barmet__footer--manual\">\';\r\n$mblockID = \'10\';\r\n$mblock = new MForm();\r\n    $mblock->addFieldset(\'Manuelle Verlinkung\');\r\n    $mblock->addTextField(\"$mblockID.0.linkText\", array(\'label\' => \'Link Text\'));\r\n    $mblock->addLinkField(1, array(\'label\' => \'Interne Verlinkung\'));\r\n    $mblock->addMediaField(1, array(\'label\' => \'File Download\'));\r\n    $mblock->addTextField(\"$mblockID.0.internal\", array(\'label\' => \'Externe Verlinkung\', \'placeholder\' => \'Dieses Feld überschreibt das Feld «interne Verlinkung»\'));\r\n    $mblock->closeFieldset();\r\necho Mblock::show($mblockID, $mblock);\r\necho \'</div>\';\r\n?>\r\n\r\n<script>\r\n    var selectField = document.querySelector(\'.barmet__footer__select\');\r\n    var manualElement = document.querySelector(\'.barmet__footer--manual\');\r\n\r\n    var showHide = (show) => {\r\n        console.log(show);\r\n        if(show) {\r\n            manualElement.style.display = \'block\';\r\n        } else {\r\n            manualElement.style.display = \'none\';\r\n        }\r\n    }\r\n\r\n    selectField.addEventListener(\'change\', (e) => {\r\n        if(e.target.value === \'auto\') {\r\n            showHide(false);\r\n        } else {\r\n            showHide(true);\r\n        }\r\n    });\r\n\r\n    window.setTimeout(() => {\r\n        if(selectField.value === \'auto\') {\r\n            showHide(false);\r\n        } else {\r\n            showHide(true);\r\n        }\r\n    },200);\r\n</script>\r\n','2021-04-29 13:05:26','luca@nulltype.ch','2021-06-05 19:59:37','console',NULL,0),
  (12,NULL,'Titel','<?php\n$isBackToTop = !empty(\'REX_VALUE[3]\') ? \' scroll__to--top\' : \'\';\n$notSloping = !empty(\'REX_VALUE[4]\') ? \' padding\' : \'\';\n$anchor = !empty(\'REX_VALUE[2]\') ? \' id=\"#\' . \'REX_VALUE[2]\' . \'\"\' : \'\';\n$cursor = !empty($isBackToTop) ? \' data-cursor-dynamic\' : \'\';\n$output = \'<h2 class=\"subtitle component\' . $isBackToTop . $notSloping . \'\"\' . $anchor . $cursor . \'>REX_VALUE[1]</h2>\';\necho $output;\n?>','<?php\n$mform = new MForm();\n\n$mform->addTextField(\'1\', array(\'label\' => \'Titel\'));\n$mform->addTextField(\'2\', array(\'label\' => \'Anker\'));\n$mform->addCheckboxField(\'3\', array(\'label\' => \'Fungiert als Back to top-Button\'));\n$mform->addCheckboxField(\'4\', array(\'label\' => \'Linien nicht bis ganz nach Aussen rendern\'));\necho $mform->show();\n?>','2021-04-30 16:13:03','luca@nulltype.ch','2021-06-01 19:18:31','luca@nulltype.ch',NULL,0),
  (13,NULL,'Titel mit Text','<?php\n$output = \'<div class=\"title__text component\">\';\n    $output .= \'<div class=\"title\">REX_VALUE[1]</div>\';\n    $output .= \'<div class=\"text\">REX_VALUE[id=2 output=html]</div>\';\n$output .= \'</div>\';\n\necho $output;\n?>','<?php\n$mform = new MForm();\n$mform->addTextField(\'1\', array(\'label\' => \'Titel\', \'placeholder\' => \'Darf auch leer gelassen werden\'));\n$mform->addTextAreaField(\'2\', array(\'label\' => \'Text\', \'placeholder\' , \'class\' => \'redactor-editor--links_with_styles\'));\necho $mform->show();\n?>','2021-05-07 10:41:48','luca@nulltype.ch','2021-06-01 19:18:29','luca@nulltype.ch',NULL,0),
  (14,NULL,'Bild mit Text und Titel','<?php\n$alignment = \'REX_VALUE[1]\';\n$text = \'REX_VALUE[id=4 output=html]\';\n$output = \'<div class=\"image__text with--title component \'.$alignment.\'\">\';\n\n$output .= \'<div class=\"col\">\';\nif(!empty(\'REX_MEDIA[1]\')) {\n    $output .= Simplify::getPictureTag(\'REX_MEDIA[1]\');\n}\n$output .= \'</div>\';\n\n// Links\n$alignClass = \'REX_VALUE[5]\' === \'label\' ? \' no-center\' : \'\';\n$output .= \'<div class=\"col\'.$alignClass.\'\">\';\n    $output .= \'<div class=\"full__content\">\';\n        $output .= \'<div class=\"title\">REX_VALUE[2]</div>\';\n        $output .= \'<div class=\"divider\"></div>\';\n        $output .= \'<div class=\"full__subtitle\">REX_VALUE[3]</div>\';\n\n        $output .= \'<div class=\"text paragraph\">\';\n            $output .= $text;\n        $output .= \'</div>\';\n    $output .= \'</div>\';\n$output .= \'</div>\';\n\n$output .= \'</div>\';\necho $output;\n//dump($output);\n\n?>','<?php\n$mform = new MForm();\n$mform->addFieldset(\'Inhalt und Einstellungen\');\n$mform->addSelectField(\'1\', array(\'left\' => \'Links\', \'right\' => \'Rechts\'), array(\'label\' => \'Bildausrichtung\'));\n$mform->addMediaField(\'1\', array(\'label\' => \'Bild\'));\n$mform->addTextField(\'2\', array(\'label\' => \'Titel\'));\n$mform->addTextField(\'3\', array(\'label\' => \'Untertitel\'));\n$mform->addTextAreaField(\'4\', array(\'label\' => \'Text\',\'class\' => \'redactor-editor--links_only\'));\n$mform->addCheckboxField(\'5\', array(\'label\' => \'Titel nicht ausmitten\'));\n$mform->closeFieldset();\necho $mform->show();\n?>','2021-05-07 12:00:56','luca@nulltype.ch','2021-06-05 13:04:51','console',NULL,0);
/*!40000 ALTER TABLE `rex_module` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_module_action`;
CREATE TABLE `rex_module_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_nullmeta`;
CREATE TABLE `rex_nullmeta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seo_basis_index` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_zip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_company_coordinates` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_audience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_keywords` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_basis_author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_analytics_analytics_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_banner_cookie_all` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_banner_cookie_required` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_banner_cookie_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_nullmeta` WRITE;
/*!40000 ALTER TABLE `rex_nullmeta` DISABLE KEYS */;
INSERT INTO `rex_nullmeta` VALUES 
  (1,'index&comma;follow','Advokatur Barmet','Stampfenbachstrasse 142','Z&uuml;rich','8006','Schweiz','barmet&commat;advokaturbarmet&period;ch','47&period;38716544479855&comma; 8&period;539954673013266','','','','','','','');
/*!40000 ALTER TABLE `rex_nullmeta` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_redactor_profile`;
CREATE TABLE `rex_redactor_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_height` int(5) NOT NULL,
  `max_height` int(5) NOT NULL,
  `plugin_counter` tinyint(1) NOT NULL,
  `plugin_limiter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugins` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_redactor_profile` WRITE;
/*!40000 ALTER TABLE `rex_redactor_profile` DISABLE KEYS */;
INSERT INTO `rex_redactor_profile` VALUES 
  (1,'links_only','Nur links',0,0,1,'','linkExternal,linkInternal,linkEmail,linkTelephone,ul,undo,redo'),
  (3,'links_with_styles','',0,0,1,'','format[Normal=p.default|Zwischentitel=p.sub],linkExternal,linkInternal,linkEmail,linkTelephone,undo,redo');
/*!40000 ALTER TABLE `rex_redactor_profile` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_sprog_wildcard`;
CREATE TABLE `rex_sprog_wildcard` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `wildcard` varchar(255) DEFAULT NULL,
  `replace` text DEFAULT NULL,
  `createuser` varchar(255) NOT NULL,
  `updateuser` varchar(255) NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `rex_template`;
CREATE TABLE `rex_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_template` WRITE;
/*!40000 ALTER TABLE `rex_template` DISABLE KEYS */;
INSERT INTO `rex_template` VALUES 
  (1,NULL,'Default','REX_TEMPLATE[2]\nREX_TEMPLATE[3]\n<main class=\"content<?php echo $contentPadding;?>\" data-routing=\"container\">\n    REX_ARTICLE[]\n</main>\nREX_TEMPLATE[5]\nREX_TEMPLATE[4]',1,'2021-03-03 09:21:45','luca@nulltype.ch','2021-05-05 10:16:53','console','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (2,NULL,'Page Header','<?php\n// Language Switcher\nif (isset($_POST[\'langUpdate\'])) {\n    $clang = $_POST[\'langUpdate\'];\n    $article = rex_article::getCurrent($clang);\n    echo $article->getUrl();\n    exit;\n}\n\n// Change Menu on Language Switch\nif (isset($_POST[\'getMenu\'])) {\n    $clang = $_POST[\'getMenu\'];\n    Menu::getMenu(3, $clang);\n    exit;\n}\n\n// Change Menu Logo Link on Language Switch\nif (isset($_POST[\'getHeaderLogo\'])) {\n    $clang = $_POST[\'getHeaderLogo\'];\n    Menu::getHeaderLogo(\'<svg width=\"21\" height=\"35\" viewBox=\"0 0 21 35\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M2.49207 3.26796e-07C0.837851 1.09871e-07 -1.42774e-07 1.08876 -3.39863e-07 2.59172C-5.19881e-07 3.9645 0.547828 4.44971 2.5243 6.16569L12.2992 14.7574L12.2992 14.8166L2.50281 14.8166C0.848593 14.8166 0.0107419 15.9053 0.0107417 17.4083C0.0107415 18.9112 0.848593 20 2.50281 20L18.5079 20C20.1621 20 21 18.9112 21 17.4083C21 16.0355 20.4522 15.5266 18.4757 13.8343L8.70077 5.24261L8.70077 5.18344L18.4972 5.18344C20.1514 5.18344 20.9893 4.09468 20.9893 2.59172C20.9893 1.08876 20.1514 2.64254e-06 18.4972 2.42561e-06L2.49207 3.26796e-07Z\" fill=\"white\"/><path d=\"M2.49207 15C0.837851 15 -1.42774e-07 16.0888 -3.39863e-07 17.5917C-5.19881e-07 18.9645 0.547828 19.4497 2.5243 21.1657L12.2992 29.7574L12.2992 29.8166L2.50281 29.8166C0.848593 29.8166 0.0107419 30.9053 0.0107417 32.4083C0.0107415 33.9112 0.848593 35 2.50281 35L18.5079 35C20.1621 35 21 33.9112 21 32.4083C21 31.0355 20.4522 30.5266 18.4757 28.8343L8.70077 20.2426L8.70077 20.1834L18.4972 20.1834C20.1514 20.1834 20.9893 19.0947 20.9893 17.5917C20.9893 16.0888 20.1514 15 18.4972 15L2.49207 15Z\" fill=\"white\"/></svg>\', $clang);\n    exit;\n}\n\nif(isset($_POST[\'checkForIntro\'])) {\n    $firstSlice = rex_article_slice::getFirstSliceForArticle(rex_article::getCurrentId(), rex_clang::getCurrentId());\n    $hasIntro = false;\n    if(!empty($firstSlice)) {\n        $hasIntro = $firstSlice->getId() === 1;\n    }\n    $introClass = $hasIntro ? \'add\' : \'remove\';\n    echo $introClass;\n    exit;\n}\n\n// *********************\n// VARIABLES\n// *********************\n$seo = new rex_yrewrite_seo();\n$rootCategories = rex_category::getRootCategories();\n$metaValues = get_object_vars(Table::getValues(\'nullmeta\', false, \'asc\', false))[0];\n\n// Check if intro is set as first slice\n$firstSlice = rex_article_slice::getFirstSliceForArticle(rex_article::getCurrentId(), rex_clang::getCurrentId());\n$hasIntro = false;\nif(!empty($firstSlice)) {\n    $hasIntro = $firstSlice->getId() === 1;\n}\n$introClass = $hasIntro ? \'has__intro\' : \'\';\n$menuBarColor = $hasIntro ? \'\' : \' black\';\n$contentPadding = $hasIntro ? \'\' : \' padding\';\n\n?>\n<!doctype html>\n<html lang=\"<?php echo rex_clang::getCurrent()->getCode(); ?>\">\n<head>\n    <base href=\"<?php echo rex::getServer(); ?>\"/>\n    <title><?php echo $seo->getTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <meta http-equiv=\'Content-Type\' content=\'text/html; charset=utf-8\'>\n    <meta name=\"format-detection\" content=\"telephone=no\">\n    <meta name=\"revisit-after\" content=\"7\">\n    <meta name=\"robots\" content=\"index,follow\">\n\n    <meta name=\"description\" content=\"<?php echo $seo->getDescription(); ?>\">\n    <meta name=\"keywords\" content=\"<?php echo $metaValues->getValue(\'seo_basis_keywords\');?>\">\n    <meta name=\"pace-topic\" content=\"<?php echo $metaValues->getValue(\'seo_basis_keywords\');?>\">\n    <meta name=\"topic\" content=\"<?php echo $metaValues->getValue(\'seo_basis_keywords\');?>\">\n    <meta name=\"audience\" content=\"<?php echo $metaValues->getValue(\'seo_basis_audience\');?>\">\n\n    <meta name=\"geo.position\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_coordinates\');?>\">\n    <meta name=\"geo.placename\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_street\').\', \'.$metaValues->getValue(\'seo_basis_company_city\');?>\">\n\n    <meta name=\"author\" content=\"<?php echo $metaValues->getValue(\'seo_basis_author\');?>\">\n    <meta name=\"owner\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_name\');?>\">\n    <meta name=\"reply-to\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_email\');?>\">\n    <meta name=\"copright\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_name\').\', \'.$seo->getCanonicalUrl();?>\">\n\n    <meta property=\"og:title\" content=\"<?php echo $seo->getTitle(); ?>\">\n    <meta property=\"og:description\" content=\"<?php echo $seo->getDescription(); ?>\">\n    <meta property=\"og:site_name\" content=\"<?php echo rex::getServerName(); ?>\">\n\n    <meta property=\"og:image\" content=\"ressources/favs/apple-touch-icon.png\"> <!-- TODO -->\n    <meta property=\"og:secure_url\" content=\"<?php echo rex::getServer()?>>\">\n    <meta property=\"og:image:alt\" content=\"Favicon\">\n    <meta property=\"og:image:type\" content=\"image/png\">\n    <meta property=\"og:locale\" content=\"<?php echo $SEOLangCode ?>>\">\n    <meta property=\"og:site_name\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_name\'); ?>>\">\n    <meta property=\"og:email\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_email\');?>\">\n    <meta property=\"og:latitude\" content=\"<?php echo explode(str_replace(\' \', \'\', $metaValues->getValue(\'seo_basis_company_coordinates\')))[0];?>>\">\n    <meta property=\"og:longitude\" content=\"<?php echo explode(str_replace(\' \', \'\', $metaValues->getValue(\'seo_basis_company_coordinates\')))[1];?>\">\n    <meta property=\"og:street-address\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_street\');?>\">\n    <meta property=\"og:locality\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_city\');?>\">\n    <meta property=\"og:postal-code\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_zip\');?>\">\n    <meta property=\"og:country-name\" content=\"<?php echo $metaValues->getValue(\'seo_basis_company_country\');?>\">\n\n    <meta property=\"twitter:title\" content=\"<?php echo $seo->getTitle(); ?>\">\n    <meta property=\"twitter:description\" content=\"<?php echo $seo->getDescription(); ?>\">\n    <meta property=\"twitter:image\" content=\"ressources/favs/apple-touch-icon.png\"> <!-- TODO -->\n    <meta property=\"twitter:card\" content=\"summary_large_image\">\n\n    <link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"/ressources/favs/apple-touch-icon.png\">\n    <link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"/ressources/favs/favicon-32x32.png\">\n    <link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"/ressources/favs/favicon-16x16.png\">\n    <link rel=\"manifest\" href=\"/ressources/favs/site.webmanifest\">\n    <link rel=\"mask-icon\" href=\"/ressources/favs/safari-pinned-tab.svg\" color=\"#000000\">\n    <link rel=\"shortcut icon\" href=\"/ressources/favs/favicon.ico\">\n    <meta name=\"msapplication-TileColor\" content=\"#4b4b4b\">\n    <meta name=\"msapplication-config\" content=\"/ressources/favs/browserconfig.xml\">\n    <meta name=\"theme-color\" content=\"#ffffff\">\n\n    <link rel=\"stylesheet\" href=\"ressources/css/style.min.css\">\n    <link rel=\"stylesheet\" href=\"https://unpkg.com/swiper/swiper-bundle.min.css\"/>\n\n    <link href=\"//google.ch\" rel=\"dns-prefetch\">\n    <link href=\"//google.de\" rel=\"dns-prefetch\">\n    <link href=\"//google.com\" rel=\"dns-prefetch\">\n    <link href=\"//google-analytics.com\" rel=\"dns-prefetch\">\n    <link href=\"//facebook.com\" rel=\"dns-prefetch\">\n    <link href=\"//vimeo.com\" rel=\"dns-prefetch\">\n</head>\n<?php echo \'<body data-routing=\"wrapper\" class=\"\' . $introClass . \'\" data-analytics=\"\' . rex_global_settings::getValue(\'analytics_id\') . \'\">\' ?>\n\n\n',0,'2021-03-03 09:21:12','luca@nulltype.ch','2021-06-07 21:20:19','console','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (3,NULL,'Header','<header>\n    <div id=\"cursor\">\n        <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24.4\" height=\"24.6\" viewBox=\"0 0 24.4 24.6\">\n            <path id=\"Pfad_6\" data-name=\"Pfad 6\" d=\"M0,0-12.4,12.2,0,24.6,12,12.2Z\" transform=\"translate(12.4)\"/>\n        </svg>\n    </div>\n    <div class=\"menu__bar<?php echo $menuBarColor;?>\">\n        <div class=\"menu__btn\" data-hover data-cursor-static>\n            <div class=\"stroke\"></div>\n            <div class=\"stroke\"></div>\n            <div class=\"stroke\"></div>\n        </div>\n        <div class=\"company__logo\">\n            <?php Menu::getHeaderLogo(\'<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"61.009\" height=\"52.97\" viewBox=\"0 0 61.009 52.97\"><g transform=\"translate(-293.815 -414.926)\"><rect width=\"7.126\" height=\"7.525\" transform=\"translate(293.815 462.313) rotate(-45)\" fill=\"#fff\"/><path d=\"M354.824,453.485c0,9.036-6.7,14.411-18.149,14.411H310.5V465.17c6.543-.233,7.244-.857,7.244-6.543V424.2c0-5.686-.7-6.31-7.244-6.543v-2.727h24.381c12.464,0,18.773,4.207,18.773,12.62,0,8.258-5.608,12.23-17.526,12.619v.313C349.294,440.633,354.824,444.527,354.824,453.485ZM325.848,418.2v20.33h5.3c9.346,0,13.709-3.271,13.709-10.2,0-6.621-4.05-10.126-11.684-10.126Zm20.174,35.521c0-9.036-3.661-11.218-20.174-11.3v15.189c0,5.064,3.115,7.4,8.8,7.4C341.815,465.015,346.022,460.886,346.022,453.72Z\" fill=\"#fff\"/></g></svg>\');?>\n        </div>\n    </div>\n\n    <div class=\"menu__modal\">\n        <div class=\"menu__close\" data-hover data-cursor-static></div>\n        <?php Menu::getMenu(); ?>\n        <a href=\"<?php echo \'mailto:\'.rex_global_settings::getValue(\'company_mail\')?>\" title=\"Kontakt E-Mail Advokatur Barmet\">\n            <div class=\"menu__contact\">\n                <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24.5\" height=\"18.502\" viewBox=\"0 0 24.5 18.502\">\n                    <g id=\"Gruppe_1\" data-name=\"Gruppe 1\" transform=\"translate(-311.884 -393.476)\">\n                        <path d=\"M324.544,410.368l-.026.027L311.884,397.96v12.18a1.837,1.837,0,0,0,1.838,1.838h20.825a1.837,1.837,0,0,0,1.837-1.838V398.389l-11.813,12.006Z\"/>\n                        <path d=\"M334.547,393.476H313.722a1.838,1.838,0,0,0-1.838,1.838v.927l12.647,12.448,11.831-12.024.022.021v-1.372A1.837,1.837,0,0,0,334.547,393.476Z\"/>\n                    </g>\n                </svg>\n            </div>\n        </a>\n    </div>\n</header>\n<div class=\"darken\"></div>',0,'2021-03-03 09:21:31','luca@nulltype.ch','2021-05-05 15:22:08','console','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (4,NULL,'Page Footer','        <script src=\"https://cdn.jsdelivr.net/npm/@barba/core@2.9.7/dist/barba.umd.min.js\"></script>\n        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/gsap.min.js\"></script>\n        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.0/ScrollToPlugin.min.js\"></script>\n        <script type=\"module\" src=\"/ressources/js/main.js\"></script>\n    </body>\n</html>',0,'2021-03-03 09:22:30','luca@nulltype.ch','2021-05-04 13:35:11','console','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (5,NULL,'Footer','<?php\nif ($_COOKIE[\'cookieAccepted\'] === null && $_COOKIE[\'cookieAll\'] === null) {\n    echo \'\n        <div class=\"cookie__consent hidden\">\n            <div class=\"cookie__text\">\'.rex_global_settings::getValue(\'cookie_text\').\'</div>\n            <div class=\"cookie__buttons\">\n                <div class=\"accept__all\" data-cursor-static>\'.rex_global_settings::getValue(\'cookie_accept_all\').\'</div>\n                <div class=\"accept__required\" data-cursor-static>\'.rex_global_settings::getValue(\'cookie_accept_required\').\'</div>\n            </div>\n        </div>      \n        \';\n    }\n?>\n\n<footer>\n    <?php\n        $FooterArticleContent = new rex_article_content(14);\n\n        $footerCtypes = array(\n          \'col__1\' => $FooterArticleContent->getArticle(1),\n          \'col__2\' => $FooterArticleContent->getArticle(2),\n          \'col__3\' => $FooterArticleContent->getArticle(3),\n          \'col__4\' => $FooterArticleContent->getArticle(4),\n        );\n\n        $output = \'\';\n        foreach($footerCtypes as $content) {\n            $output .= $content;\n        }\n        echo $output;\n    ?>\n\n    <div class=\"foot__note\">\n        <div class=\"copyright\"><?php echo \'© \'.date(\'Y\').\' ADVOKATUR BARMET\';?></div>\n        <div class=\"logo\">\n            <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"61.009\" height=\"52.97\" viewBox=\"0 0 61.009 52.97\"><g transform=\"translate(-293.815 -414.926)\"><rect width=\"7.126\" height=\"7.525\" transform=\"translate(293.815 462.313) rotate(-45)\" fill=\"#000\"/><path d=\"M354.824,453.485c0,9.036-6.7,14.411-18.149,14.411H310.5V465.17c6.543-.233,7.244-.857,7.244-6.543V424.2c0-5.686-.7-6.31-7.244-6.543v-2.727h24.381c12.464,0,18.773,4.207,18.773,12.62,0,8.258-5.608,12.23-17.526,12.619v.313C349.294,440.633,354.824,444.527,354.824,453.485ZM325.848,418.2v20.33h5.3c9.346,0,13.709-3.271,13.709-10.2,0-6.621-4.05-10.126-11.684-10.126Zm20.174,35.521c0-9.036-3.661-11.218-20.174-11.3v15.189c0,5.064,3.115,7.4,8.8,7.4C341.815,465.015,346.022,460.886,346.022,453.72Z\" fill=\"#000\"/></g></svg>\n        </div>\n        <div class=\"credits\" data-cursor-static data-copyright=\"<span><?php echo \'© \'.date(\'Y\').\' ADVOKATUR BARMET\';?></span><span><a href=\'mailto:luca@nulltype.ch\'>Code: Luca Margadant</a></span>\" data-credits=\"<span><a href=\'https://www.another-studio.ch\' target=\'_blank\' rel=\'noreferrer\'>Design: Another Studio</a></span><span><a href=\'https://www.leawaser.ch\' target=\'_blank\' rel=\'noreferrer\'>Fotografie: Lea Waser</a></span>\">Credits</div>\n    </div>\n</footer>',1,'2021-05-03 09:48:53','luca@nulltype.ch','2021-05-30 20:57:45','console','{\"ctype\":{\"1\":\"Spalte 1\",\"2\":\"Spalte 2\",\"3\":\"Spalte 3\",\"4\":\"Spalte 4\"},\"modules\":{\"1\":{\"0\":\"11\",\"all\":0},\"2\":{\"0\":\"11\",\"all\":0},\"3\":{\"0\":\"11\",\"all\":0},\"4\":{\"0\":\"11\",\"all\":0}},\"categories\":{\"all\":\"1\"}}',0),
  (6,NULL,'404','',1,'2021-03-03 09:19:54','luca@nulltype.ch','2021-04-29 10:34:13','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0);
/*!40000 ALTER TABLE `rex_template` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_user_role`;
CREATE TABLE `rex_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_user_role` WRITE;
/*!40000 ALTER TABLE `rex_user_role` DISABLE KEYS */;
INSERT INTO `rex_user_role` VALUES 
  (1,'Redakteur','','{\"general\":\"|backup[export]|global_settings[settings]|media[sync]|multiupload[]|phpmailer[]|sprog[]|yform[email]|yrewrite[seo]|yrewrite[url]|\",\"options\":\"|addArticle[]|addCategory[]|article2category[]|article2startarticle[]|bloecks[cutncopy]|bloecks[dragndrop]|copyArticle[]|copyContent[]|deleteArticle[]|deleteCategory[]|editArticle[]|editCategory[]|moveArticle[]|moveCategory[]|moveSlice[]|publishArticle[]|publishCategory[]|publishSlice[]|sprog[wildcard]|\",\"extras\":null,\"clang\":\"all\",\"media\":\"all\",\"structure\":\"all\",\"modules\":\"all\",\"yform_manager_table\":\"all\"}','2021-03-03 09:24:48','luca@nulltype.ch','2021-05-31 18:47:25','Ray',0);
/*!40000 ALTER TABLE `rex_user_role` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yform_email_template`;
CREATE TABLE `rex_yform_email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_reply_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_reply_to_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_html` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_field`;
CREATE TABLE `rex_yform_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prio` int(11) NOT NULL,
  `type_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `db_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_hidden` tinyint(1) NOT NULL,
  `search` tinyint(1) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_required` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yform_field` WRITE;
/*!40000 ALTER TABLE `rex_yform_field` DISABLE KEYS */;
INSERT INTO `rex_yform_field` VALUES 
  (1,'rex_nullmeta',1,'value','text','varchar(191)',0,0,'seo_basis_index','',''),
  (2,'rex_nullmeta',2,'value','text','varchar(191)',0,0,'seo_basis_company_name','',''),
  (3,'rex_nullmeta',3,'value','text','varchar(191)',0,0,'seo_basis_company_street','',''),
  (4,'rex_nullmeta',4,'value','text','varchar(191)',0,0,'seo_basis_company_city','',''),
  (5,'rex_nullmeta',5,'value','text','varchar(191)',0,0,'seo_basis_company_zip','',''),
  (6,'rex_nullmeta',6,'value','text','varchar(191)',0,0,'seo_basis_company_country','',''),
  (7,'rex_nullmeta',7,'value','text','varchar(191)',0,0,'seo_basis_company_email','',''),
  (8,'rex_nullmeta',8,'value','text','varchar(191)',0,0,'seo_basis_company_coordinates','',''),
  (9,'rex_nullmeta',9,'value','text','varchar(191)',0,0,'seo_basis_audience','',''),
  (10,'rex_nullmeta',10,'value','text','varchar(191)',0,0,'seo_basis_keywords','',''),
  (11,'rex_nullmeta',11,'value','text','varchar(191)',0,0,'seo_basis_author','',''),
  (12,'rex_nullmeta',12,'value','text','varchar(191)',0,0,'google_analytics_analytics_id','',''),
  (13,'rex_nullmeta',13,'value','text','varchar(191)',0,0,'cookie_banner_cookie_all','',''),
  (14,'rex_nullmeta',14,'value','text','varchar(191)',0,0,'cookie_banner_cookie_required','',''),
  (15,'rex_nullmeta',15,'value','text','varchar(191)',0,0,'cookie_banner_cookie_text','','');
/*!40000 ALTER TABLE `rex_yform_field` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yform_history`;
CREATE TABLE `rex_yform_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataset` (`table_name`,`dataset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_history_field`;
CREATE TABLE `rex_yform_history_field` (
  `history_id` int(11) NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`history_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_rest_token`;
CREATE TABLE `rex_yform_rest_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `amount` int(11) NOT NULL,
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paths` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_rest_token_access`;
CREATE TABLE `rex_yform_rest_token_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `datetime_created` datetime NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yform_table`;
CREATE TABLE `rex_yform_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_amount` int(11) NOT NULL,
  `list_sortfield` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'id',
  `list_sortorder` enum('ASC','DESC') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ASC',
  `prio` int(11) NOT NULL,
  `search` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `export` tinyint(1) NOT NULL,
  `import` tinyint(1) NOT NULL,
  `mass_deletion` tinyint(1) NOT NULL,
  `mass_edit` tinyint(1) NOT NULL,
  `schema_overwrite` tinyint(1) NOT NULL DEFAULT 1,
  `history` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yform_table` WRITE;
/*!40000 ALTER TABLE `rex_yform_table` DISABLE KEYS */;
INSERT INTO `rex_yform_table` VALUES 
  (1,1,'rex_nullmeta','Nullmeta','',50,'id','ASC',1,1,1,0,0,0,0,1,0);
/*!40000 ALTER TABLE `rex_yform_table` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yrewrite_alias`;
CREATE TABLE `rex_yrewrite_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_id` int(11) NOT NULL,
  `clang_start` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yrewrite_alias` WRITE;
/*!40000 ALTER TABLE `rex_yrewrite_alias` DISABLE KEYS */;
INSERT INTO `rex_yrewrite_alias` VALUES 
  (1,'www.advokaturbarmet.ch',2,0);
/*!40000 ALTER TABLE `rex_yrewrite_alias` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yrewrite_domain`;
CREATE TABLE `rex_yrewrite_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mount_id` int(11) NOT NULL,
  `start_id` int(11) NOT NULL,
  `notfound_id` int(11) NOT NULL,
  `clangs` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clang_start` int(11) NOT NULL,
  `clang_start_auto` tinyint(1) NOT NULL,
  `clang_start_hidden` tinyint(1) NOT NULL,
  `robots` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_scheme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_redirect` tinyint(1) NOT NULL,
  `auto_redirect_days` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_yrewrite_domain` WRITE;
/*!40000 ALTER TABLE `rex_yrewrite_domain` DISABLE KEYS */;
INSERT INTO `rex_yrewrite_domain` VALUES 
  (2,'https://advokaturbarmet.ch',0,7,7,'',1,0,0,'','%T / %SN','',0,0);
/*!40000 ALTER TABLE `rex_yrewrite_domain` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_yrewrite_forward`;
CREATE TABLE `rex_yrewrite_forward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` int(11) NOT NULL,
  `clang` int(11) NOT NULL,
  `extern` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movetype` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
