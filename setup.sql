CREATE TABLE IF NOT EXISTS `items` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Text` varchar(300) NOT NULL,
  `UserId` bigint(20) unsigned NOT NULL,
  `Completed` tinyint(1) NOT NULL,
  `Must` tinyint(1) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `CompletionDate` timestamp NULL DEFAULT NULL,
  `Deadline` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users` (
  `Id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(48) NOT NULL,
  `Hash` varchar(43) NOT NULL,
  `Salt` varchar(10) NOT NULL,
  `CurrentItemId` bigint(20) unsigned NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  `Banned` tinyint(1) NOT NULL,
  `Guest` tinyint(1) NOT NULL,
  `RegistrationDate` timestamp NULL DEFAULT NULL,
  `LastSeen` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
