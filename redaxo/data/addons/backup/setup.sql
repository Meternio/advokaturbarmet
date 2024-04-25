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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_article` WRITE;
/*!40000 ALTER TABLE `rex_article` DISABLE KEYS */;
INSERT INTO `rex_article` VALUES 
  (1,1,0,'404','',0,0,1,'|',0,6,1,'2021-03-03 09:03:34','luca@nulltype.ch','2021-03-03 09:20:02','luca@nulltype.ch',0,'AUTO','','','','','','',0,''),
  (2,2,0,'Impressum','',0,0,2,'|',0,1,1,'2021-03-03 09:03:43','luca@nulltype.ch','2021-03-03 09:03:43','luca@nulltype.ch',0,'AUTO','','','','','','',0,''),
  (3,3,0,'Datenschutz','',0,0,3,'|',0,1,1,'2021-03-03 09:03:47','luca@nulltype.ch','2021-03-03 09:03:47','luca@nulltype.ch',0,'AUTO','','','','','','',0,''),
  (4,4,0,'Thanks','',0,0,4,'|',0,1,1,'2021-03-03 09:03:51','luca@nulltype.ch','2021-03-03 09:03:51','luca@nulltype.ch',0,'AUTO','','','','','','',0,''),
  (5,5,0,'Unsubscribe','',0,0,5,'|',0,1,1,'2021-03-03 09:03:58','luca@nulltype.ch','2021-03-03 09:03:58','luca@nulltype.ch',0,'AUTO','','','','','','',0,''),
  (6,6,0,'Results','',0,0,6,'|',0,1,1,'2021-03-03 09:04:06','luca@nulltype.ch','2021-03-03 09:04:06','luca@nulltype.ch',0,'AUTO','','','','','','',0,''),
  (7,7,0,'Home','Home',1,1,1,'|',1,1,1,'2021-03-03 09:04:13','luca@nulltype.ch','2021-03-03 09:04:10','luca@nulltype.ch',0,'AUTO','','','','','','',0,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  ('core','package-config','{\"backup\":{\"install\":true,\"status\":true},\"be_style\":{\"install\":true,\"status\":true,\"plugins\":{\"customizer\":{\"install\":false,\"status\":false},\"redaxo\":{\"install\":true,\"status\":true}}},\"bloecks\":{\"install\":true,\"status\":true,\"plugins\":{\"cutncopy\":{\"install\":true,\"status\":true},\"dragndrop\":{\"install\":true,\"status\":true},\"status\":{\"install\":true,\"status\":true}}},\"cache_warmup\":{\"install\":true,\"status\":true},\"cronjob\":{\"install\":false,\"status\":false,\"plugins\":{\"article_status\":{\"install\":false,\"status\":false},\"optimize_tables\":{\"install\":false,\"status\":false}}},\"debug\":{\"install\":false,\"status\":false},\"developer\":{\"install\":true,\"status\":true},\"global_settings\":{\"install\":true,\"status\":true},\"install\":{\"install\":true,\"status\":true},\"mblock\":{\"install\":true,\"status\":true},\"media_manager\":{\"install\":true,\"status\":true},\"media_manager_plus\":{\"install\":true,\"status\":true},\"mediapool\":{\"install\":true,\"status\":true},\"metainfo\":{\"install\":true,\"status\":true},\"mform\":{\"install\":true,\"status\":true,\"plugins\":{\"docs\":{\"install\":true,\"status\":true}}},\"minibar\":{\"install\":true,\"status\":true},\"minify_images\":{\"install\":true,\"status\":true},\"multiupload\":{\"install\":true,\"status\":true,\"plugins\":{\"imageoptimizer\":{\"install\":true,\"status\":true},\"upload_precompressor\":{\"install\":false,\"status\":false}}},\"phpmailer\":{\"install\":true,\"status\":true},\"plyr\":{\"install\":true,\"status\":true},\"project\":{\"install\":true,\"status\":true},\"redactor\":{\"install\":true,\"status\":true},\"search_it\":{\"install\":true,\"status\":true,\"plugins\":{\"autocomplete\":{\"install\":false,\"status\":false},\"documentation\":{\"install\":true,\"status\":true},\"plaintext\":{\"install\":false,\"status\":false},\"stats\":{\"install\":false,\"status\":false}}},\"sprog\":{\"install\":true,\"status\":true},\"structure\":{\"install\":true,\"status\":true,\"plugins\":{\"content\":{\"install\":true,\"status\":true},\"history\":{\"install\":false,\"status\":false},\"version\":{\"install\":false,\"status\":false}}},\"ui_tools\":{\"install\":true,\"status\":true,\"plugins\":{\"bootstrap-datetimepicker\":{\"install\":true,\"status\":true},\"jquery-minicolors\":{\"install\":true,\"status\":true},\"selectize\":{\"install\":true,\"status\":true}}},\"users\":{\"install\":true,\"status\":true},\"yform\":{\"install\":true,\"status\":true,\"plugins\":{\"email\":{\"install\":true,\"status\":true},\"manager\":{\"install\":true,\"status\":true},\"rest\":{\"install\":true,\"status\":true},\"tools\":{\"install\":true,\"status\":true}}},\"yform_geo_osm\":{\"install\":true,\"status\":true},\"yform_spam_protection\":{\"install\":true,\"status\":true},\"yform_standalone_validator\":{\"install\":true,\"status\":true},\"yform_usability\":{\"install\":true,\"status\":true},\"yrewrite\":{\"install\":true,\"status\":true}}'),
  ('core','package-order','[\"be_style\",\"be_style\\/redaxo\",\"users\",\"backup\",\"cache_warmup\",\"developer\",\"global_settings\",\"install\",\"mblock\",\"media_manager\",\"media_manager_plus\",\"mediapool\",\"mform\",\"mform\\/docs\",\"minify_images\",\"multiupload\",\"multiupload\\/imageoptimizer\",\"phpmailer\",\"plyr\",\"redactor\",\"search_it\",\"search_it\\/documentation\",\"sprog\",\"structure\",\"metainfo\",\"structure\\/content\",\"bloecks\",\"bloecks\\/cutncopy\",\"bloecks\\/dragndrop\",\"bloecks\\/status\",\"ui_tools\",\"ui_tools\\/bootstrap-datetimepicker\",\"ui_tools\\/jquery-minicolors\",\"ui_tools\\/selectize\",\"yform\",\"yform\\/email\",\"yform\\/manager\",\"yform\\/rest\",\"yform\\/tools\",\"yform_geo_osm\",\"yform_spam_protection\",\"yform_standalone_validator\",\"yform_usability\",\"yrewrite\",\"minibar\",\"project\"]'),
  ('core','utf8mb4','true'),
  ('core','version','\"5.11.2\"'),
  ('developer','actions','true'),
  ('developer','delete','true'),
  ('developer','dir_suffix','true'),
  ('developer','items','{\"templates\":{\"1\":1614759705,\"2\":1614759672,\"3\":1614759691,\"4\":1614759750,\"5\":1614759715,\"6\":1614759594}}'),
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
  ('structure','notfound_article_id','1'),
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
  PRIMARY KEY (`clang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `rex_global_settings` WRITE;
/*!40000 ALTER TABLE `rex_global_settings` DISABLE KEYS */;
INSERT INTO `rex_global_settings` VALUES 
  (1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_module_action`;
CREATE TABLE `rex_module_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  (1,NULL,'Default','REX_TEMPLATE[2]\r\nREX_TEMPLATE[3]\r\n<main class=\"content\" data-routing=\"container\">\r\n\r\n</main>\r\nREX_TEMPLATE[5]\r\nREX_TEMPLATE[4]',1,'2021-03-03 09:21:45','luca@nulltype.ch','2021-03-03 09:21:45','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (2,NULL,'Page Header','<?php\r\n// *********************\r\n// VARIABLES\r\n// *********************\r\n$seo = new rex_yrewrite_seo();\r\n$rootCategories = rex_category::getRootCategories();\r\n\r\n?>\r\n<!doctype html>\r\n<html lang=\"<?php echo rex_clang::getCurrent()->getCode(); ?>\" class=\"leaving-default\">\r\n<head>\r\n    <base href=\"<?php echo rex::getServer(); ?>\"/>\r\n    <title><?php echo $seo->getTitle(); ?></title>\r\n    <meta charset=\"utf-8\">\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\">\r\n    <meta name=\"author\" content=\"Nulltype, Luca Margadant\">\r\n\r\n    <link rel=\"preload\" href=\"/ressources/js/app.js\" as=\"script\" crossorigin>\r\n    <link rel=\"preload\" href=\"/ressources/js/dynamic.js\" as=\"script\" crossorigin>\r\n    <link rel=\"preload\" href=\"/ressources/js/helpers.js\" as=\"script\" crossorigin>\r\n    <link rel=\"preload\" href=\"/ressources/js/js_handler.js\" as=\"script\" crossorigin>\r\n    <link rel=\"preload\" href=\"/ressources/js/static.js\" as=\"script\" crossorigin>\r\n    <!--<link rel=\"preload\" href=\"/ressources/fonts/bigdailyshortweb-regular.woff\" as=\"font\" crossorigin>\r\n    <link rel=\"preload\" href=\"/ressources/fonts/HelveticaNeue-Extended.woff\" as=\"font\" crossorigin>-->\r\n\r\n    <link href=\"//google.ch\" rel=\"dns-prefetch\">\r\n    <link href=\"//google.de\" rel=\"dns-prefetch\">\r\n    <link href=\"//google.com\" rel=\"dns-prefetch\">\r\n    <link href=\"//google-analytics.com\" rel=\"dns-prefetch\">\r\n    <link href=\"//facebook.com\" rel=\"dns-prefetch\">\r\n    <link href=\"//youtube.com\" rel=\"dns-prefetch\">\r\n\r\n\r\n    <link rel=\"stylesheet\" href=\"ressources/css/app.css\">\r\n</head>\r\n<body data-routing=\"wrapper\">\r\n\r\n',0,'2021-03-03 09:21:12','luca@nulltype.ch','2021-03-03 09:21:12','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (3,NULL,'Header','<header>\r\n    <?php\r\n    echo \'<ul>\';\r\n    foreach ($rootCategories as $category) {\r\n        $article = $category->getStartArticle();\r\n        $articleURL = $article->getUrl();\r\n        $articleName = $article->getName();\r\n\r\n        echo \'<a href=\"\' . $articleURL . \'\" title=\"\' . $articleName . \'\">\' . $articleName . \'<li></li></a>\';\r\n    }\r\n    echo \'</ul>\';\r\n    ?>\r\n</header>',0,'2021-03-03 09:21:31','luca@nulltype.ch','2021-03-03 09:21:31','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (4,NULL,'Page Footer','        <script src=\"https://cdn.jsdelivr.net/npm/@barba/core\"></script>\r\n        <script type=\"module\" src=\"/ressources/js/main.js\"></script>\r\n    </body>\r\n</html>',0,'2021-03-03 09:22:30','luca@nulltype.ch','2021-03-03 09:22:30','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (5,NULL,'Footer','<footer>\r\n\r\n</footer>',0,'2021-03-03 09:21:55','luca@nulltype.ch','2021-03-03 09:21:55','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0),
  (6,NULL,'404','',1,'2021-03-03 09:19:54','luca@nulltype.ch','2021-03-03 09:19:54','luca@nulltype.ch','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0);
/*!40000 ALTER TABLE `rex_template` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `rex_tmp_search_it_cache`;
CREATE TABLE `rex_tmp_search_it_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `returnarray` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_tmp_search_it_cacheindex_ids`;
CREATE TABLE `rex_tmp_search_it_cacheindex_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index_id` int(11) DEFAULT NULL,
  `cache_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_tmp_search_it_index`;
CREATE TABLE `rex_tmp_search_it_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `ftable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcolumn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `texttype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clang` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fileext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plaintext` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `unchangedtext` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `teaser` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastindexed` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`),
  FULLTEXT KEY `plaintext` (`plaintext`),
  FULLTEXT KEY `unchangedtext` (`unchangedtext`),
  FULLTEXT KEY `plaintext_2` (`plaintext`,`unchangedtext`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_tmp_search_it_keywords`;
CREATE TABLE `rex_tmp_search_it_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soundex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `colognephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clang` int(11) NOT NULL DEFAULT -1,
  `count` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`,`clang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_tmp_yform_spam_protection_frequency`;
CREATE TABLE `rex_tmp_yform_spam_protection_frequency` (
  `ipv4` int(10) unsigned DEFAULT NULL,
  `ipv6` varbinary(16) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `was_blocked` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_user`;
CREATE TABLE `rex_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_tries` tinyint(4) NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_changed` datetime NOT NULL,
  `previous_passwords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_change_required` tinyint(1) NOT NULL,
  `lasttrydate` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookiekey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `rex_user` WRITE;
/*!40000 ALTER TABLE `rex_user` DISABLE KEYS */;
INSERT INTO `rex_user` VALUES 
  (1,'Administrator',NULL,'luca@nulltype.ch','$2y$10$YyD0U0vfSYa4MT45qzUoFOfTULIyVFf7lg0uHxx2mZKEY9SNmv366',NULL,1,1,'','',NULL,0,'2021-03-03 09:02:57','setup','2021-03-03 09:02:57','setup','2021-03-03 09:02:57','[]',0,'2021-03-03 09:03:00','2021-03-03 09:03:00','9sg5mq7jihh2el5h5k9m6rk51pgi14h0',NULL,0),
  (2,'Ray','','Ray','$2y$10$OTIedO37ok1BLjqtzmR6I.xUUsZNi4naCz2vbZPXUJ2dsolG5C0w6','ray@nullgradnord.ch',1,1,'','','',0,'2021-03-03 09:06:45','luca@nulltype.ch','2021-03-03 09:06:45','luca@nulltype.ch','2021-03-03 09:06:45','[]',1,'0000-00-00 00:00:00',NULL,NULL,NULL,0),
  (3,'Redakteur','','Redakteur','$2y$10$7bFjiTXo24NgpGQiwvNGRurLP9KLiX8YpS4XhVAObcwtZqdXwX0MC','',1,0,'','','1',0,'2021-03-03 09:07:17','luca@nulltype.ch','2021-03-03 09:24:55','luca@nulltype.ch','2021-03-03 09:07:17','[]',1,'0000-00-00 00:00:00',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `rex_user` ENABLE KEYS */;
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
  (1,'Redakteur','','{\"general\":\"|backup[export]|global_settings[settings]|media[sync]|multiupload[]|phpmailer[]|sprog[]|yform[email]|\",\"options\":\"|addArticle[]|addCategory[]|article2category[]|article2startarticle[]|bloecks[cutncopy]|bloecks[dragndrop]|copyArticle[]|copyContent[]|deleteArticle[]|deleteCategory[]|editArticle[]|editCategory[]|moveArticle[]|moveCategory[]|moveSlice[]|publishArticle[]|publishCategory[]|publishSlice[]|sprog[wildcard]|\",\"extras\":null,\"clang\":\"all\",\"media\":\"all\",\"structure\":\"all\",\"modules\":\"all\",\"yform_manager_table\":\"all\"}','2021-03-03 09:24:48','luca@nulltype.ch','2021-03-03 09:26:08','luca@nulltype.ch',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
DROP TABLE IF EXISTS `rex_yrewrite_alias`;
CREATE TABLE `rex_yrewrite_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_id` int(11) NOT NULL,
  `clang_start` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
