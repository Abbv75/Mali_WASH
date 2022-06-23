-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 21 juin 2022 à 22:01
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mali_wash`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT 'mr(mlle)',
  `prenom` varchar(30) DEFAULT 'mr(mlle)',
  `id_contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `depot`
--

CREATE TABLE `depot` (
  `id` int(11) NOT NULL,
  `date_depot` datetime NOT NULL DEFAULT current_timestamp(),
  `nombre_de_jour` int(11) DEFAULT NULL,
  `date_retrait` datetime NOT NULL,
  `prix` int(11) NOT NULL,
  `quantite_total` int(11) NOT NULL,
  `statut_paiment` tinyint(1) NOT NULL DEFAULT 0,
  `id_client` int(11) DEFAULT NULL,
  `id_pressing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pressing`
--

CREATE TABLE `pressing` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `statut_abonnement` tinyint(1) NOT NULL DEFAULT 1,
  `date_inscription` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL,
  `id_contact` int(11) DEFAULT NULL,
  `montantInscription` int(5) NOT NULL DEFAULT 10000,
  `paye` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type_vetement`
--

CREATE TABLE `type_vetement` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prix` int(9) NOT NULL,
  `id_pressing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `login` varchar(30) NOT NULL,
  `mot_de_pass` varchar(30) NOT NULL,
  `role` varchar(16) NOT NULL DEFAULT 'gerant',
  `id_contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vetement_depose`
--

CREATE TABLE `vetement_depose` (
  `id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `id_type_vetement` int(11) NOT NULL,
  `id_depot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_contact` (`id_contact`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `depot`
--
ALTER TABLE `depot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposeur` (`id_client`),
  ADD KEY `depot_chez_pressing` (`id_pressing`);

--
-- Index pour la table `pressing`
--
ALTER TABLE `pressing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_pressing` (`id_contact`),
  ADD KEY `proprietaire` (`id_user`);

--
-- Index pour la table `type_vetement`
--
ALTER TABLE `type_vetement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pressing_du_type` (`id_pressing`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact` (`id_contact`);

--
-- Index pour la table `vetement_depose`
--
ALTER TABLE `vetement_depose`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vetement_du_depot` (`id_depot`),
  ADD KEY `type_vetement` (`id_type_vetement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `depot`
--
ALTER TABLE `depot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pressing`
--
ALTER TABLE `pressing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_vetement`
--
ALTER TABLE `type_vetement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vetement_depose`
--
ALTER TABLE `vetement_depose`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `depot`
--
ALTER TABLE `depot`
  ADD CONSTRAINT `deposeur` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `depot_chez_pressing` FOREIGN KEY (`id_pressing`) REFERENCES `pressing` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `pressing`
--
ALTER TABLE `pressing`
  ADD CONSTRAINT `contact_pressing` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proprietaire` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `type_vetement`
--
ALTER TABLE `type_vetement`
  ADD CONSTRAINT `pressing_du_type` FOREIGN KEY (`id_pressing`) REFERENCES `pressing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `vetement_depose`
--
ALTER TABLE `vetement_depose`
  ADD CONSTRAINT `type_vetement` FOREIGN KEY (`id_type_vetement`) REFERENCES `type_vetement` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vetement_du_depot` FOREIGN KEY (`id_depot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
