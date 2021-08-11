-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 11 août 2021 à 09:18
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bookmark_v3`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(2, 'Dev', 'Catégorie en rapport avec le développement'),
(3, 'SocialNetwork', 'Categorie en rapport avec les reseaux sociaux'),
(4, 'Shop', 'Categorie en rapport avec des sites de revente'),
(5, 'Marque', 'Categorie en rapport avec des marques');

-- --------------------------------------------------------

--
-- Structure de la table `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `link`
--

INSERT INTO `link` (`id`, `name`, `url`) VALUES
(167, 'GitLab', 'https://www.gitlab.com/'),
(168, 'Discord', 'https://www.discord.com/'),
(169, 'Docker', 'https://www.docker.com/'),
(170, 'Apple', 'https://www.apple.com/'),
(171, 'Simplonline', 'https://simplonline.co/'),
(172, 'Amazon', 'https://www.amazon.fr/'),
(173, 'LDLC', 'https://www.ldlc.com/'),
(190, 'Rolex', 'https://www.rolex.com/');

-- --------------------------------------------------------

--
-- Structure de la table `link_categories`
--

CREATE TABLE `link_categories` (
  `id` int(11) NOT NULL,
  `id_link` int(11) DEFAULT NULL,
  `id_cat` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `link_categories`
--

INSERT INTO `link_categories` (`id`, `id_link`, `id_cat`) VALUES
(34, 167, 2),
(35, 168, 3),
(36, 169, 2),
(37, 170, 5),
(38, 171, 2),
(39, 172, 4),
(40, 173, 4),
(57, 190, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `link_categories`
--
ALTER TABLE `link_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_link` (`id_link`),
  ADD KEY `id_cat` (`id_cat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT pour la table `link_categories`
--
ALTER TABLE `link_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `link_categories`
--
ALTER TABLE `link_categories`
  ADD CONSTRAINT `link_categories_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `link_categories_ibfk_2` FOREIGN KEY (`id_link`) REFERENCES `link` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
