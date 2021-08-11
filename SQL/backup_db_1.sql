/*
Export BDD
Fichier avec toute les commandes utilisé : create_db.sql
Aide de Gabriel pour la compréhension du SQL.
Aide de Dimitri pour le PhP.
*/

CREATE DATABASE bookmark_v3;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(2, 'Dev', 'Catégorie en rapport avec le développement'),
(3, 'SocialNetwork', 'Categorie en rapport avec les reseaux sociaux'),
(4, 'Shop', 'Categorie en rapport avec des sites de revente'),
(5, 'Marque', 'Categorie en rapport avec des marques');

CREATE TABLE IF NOT EXISTS `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

INSERT INTO `link` (`id`, `name`, `url`) VALUES
(7, 'facebook', 'https://www.facebook.com'),
(8, 'Instagram', 'https://www.instagram.com'),
(9, 'Snapchat', 'https://www.snapchat.com'),
(10, 'Discord', 'https://www.discord.com'),
(11, 'GitHub', 'https://www.github.com'),
(12, 'GitLab', 'https://www.gitlab.com'),
(13, 'StackOverflow', 'https://www.stackoverflow.com'),
(14, 'DeveloppeZ', 'https://www.deloppez.com'),
(15, 'Amazon', 'https://www.amazon.com'),
(16, 'LDLC', 'https://www.ldlc.com'),
(17, 'FuturXWear', 'https://www.futurxwear.fr'),
(18, 'Asos', 'https://www.asos.com'),
(19, 'Republic Of Gamers', 'https://rog.asus.com/fr/'),
(20, 'Apple', 'https://www.apple.com'),
(21, 'Steelseries', 'https://fr.steelseries.com/'),
(22, 'EKWB', 'https://www.ekwb.com');

CREATE TABLE IF NOT EXISTS `link_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_link` int(11) DEFAULT NULL,
  `id_cat` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_link` (`id_link`),
  KEY `id_cat` (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO `link_categories` (`id`, `id_link`, `id_cat`) VALUES
(1, 7, 3),
(2, 8, 3),
(3, 9, 3),
(4, 10, 3),
(5, 11, 2),
(6, 12, 2),
(7, 13, 2),
(8, 14, 2),
(9, 15, 4),
(10, 16, 4),
(11, 17, 4),
(12, 18, 4),
(13, 19, 5),
(14, 20, 5),
(15, 21, 5),
(16, 22, 5);

ALTER TABLE `link_categories`
  ADD CONSTRAINT `link_categories_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `link_categories_ibfk_2` FOREIGN KEY (`id_link`) REFERENCES `link` (`id`);
COMMIT;