-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 23 juin 2022 à 00:01
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
  `idClient` int(11) NOT NULL,
  `nomClient` varchar(30) DEFAULT 'mr(mlle)',
  `prenomClient` varchar(30) DEFAULT 'mr(mlle)',
  `id_contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `prenomClient`, `id_contact`) VALUES
(1, 'bore', 'younouss', 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `idContact` int(11) NOT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`idContact`, `telephone`, `email`) VALUES
(1, '66035300', 'bore.younous59@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `depot`
--

CREATE TABLE `depot` (
  `idDepot` int(11) NOT NULL,
  `date_depot` datetime NOT NULL DEFAULT current_timestamp(),
  `nombre_de_jour` int(11) DEFAULT NULL,
  `date_retrait` datetime NOT NULL,
  `prixTotal` int(11) NOT NULL,
  `paye` int(11) NOT NULL DEFAULT 0,
  `quantite_total` int(11) NOT NULL,
  `statut_paiment` tinyint(1) NOT NULL DEFAULT 0,
  `id_client` int(11) DEFAULT NULL,
  `id_pressing` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `depot`
--

INSERT INTO `depot` (`idDepot`, `date_depot`, `nombre_de_jour`, `date_retrait`, `prixTotal`, `paye`, `quantite_total`, `statut_paiment`, `id_client`, `id_pressing`) VALUES
(1, '2022-06-21 22:10:18', NULL, '2022-06-23 00:00:00', 5000, 0, 7, 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pressing`
--

CREATE TABLE `pressing` (
  `idPressing` int(11) NOT NULL,
  `nomPressing` varchar(30) NOT NULL,
  `statut_abonnement` tinyint(1) NOT NULL DEFAULT 1,
  `date_inscription` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL,
  `id_contact` int(11) DEFAULT NULL,
  `montantInscription` int(5) NOT NULL DEFAULT 10000,
  `SommeInscriptionPaye` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pressing`
--

INSERT INTO `pressing` (`idPressing`, `nomPressing`, `statut_abonnement`, `date_inscription`, `id_user`, `id_contact`, `montantInscription`, `SommeInscriptionPaye`) VALUES
(1, 'pressing coulou', 1, '2022-06-21 22:08:18', 1, 1, 10000, 10000);

-- --------------------------------------------------------

--
-- Structure de la table `type_vetement`
--

CREATE TABLE `type_vetement` (
  `idTypeVetement` int(11) NOT NULL,
  `nomTypeVetement` varchar(30) NOT NULL,
  `prixTypeVetement` int(9) NOT NULL,
  `id_pressing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_vetement`
--

INSERT INTO `type_vetement` (`idTypeVetement`, `nomTypeVetement`, `prixTypeVetement`, `id_pressing`) VALUES
(1, 'tshirt', 1000, 1),
(2, 'chemise', 2000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(45) NOT NULL,
  `prenomUser` varchar(45) NOT NULL,
  `login` varchar(30) NOT NULL,
  `mot_de_pass` varchar(30) NOT NULL,
  `role` varchar(16) NOT NULL DEFAULT 'gerant',
  `id_contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `nomUser`, `prenomUser`, `login`, `mot_de_pass`, `role`, `id_contact`) VALUES
(1, 'bore', 'younouss', '66035300', '123456', 'gerant', 1);

-- --------------------------------------------------------

--
-- Structure de la table `vetement_depose`
--

CREATE TABLE `vetement_depose` (
  `idVetementDepose` int(11) NOT NULL,
  `quantiteVetementDepose` int(11) NOT NULL,
  `id_type_vetement` int(11) NOT NULL,
  `id_depot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vetement_depose`
--

INSERT INTO `vetement_depose` (`idVetementDepose`, `quantiteVetementDepose`, `id_type_vetement`, `id_depot`) VALUES
(1, 2, 1, 1),
(2, 5, 2, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `client_contact` (`id_contact`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`idContact`);

--
-- Index pour la table `depot`
--
ALTER TABLE `depot`
  ADD PRIMARY KEY (`idDepot`),
  ADD KEY `deposeur` (`id_client`),
  ADD KEY `depot_chez_pressing` (`id_pressing`);

--
-- Index pour la table `pressing`
--
ALTER TABLE `pressing`
  ADD PRIMARY KEY (`idPressing`),
  ADD KEY `contact_pressing` (`id_contact`),
  ADD KEY `proprietaire` (`id_user`);

--
-- Index pour la table `type_vetement`
--
ALTER TABLE `type_vetement`
  ADD PRIMARY KEY (`idTypeVetement`),
  ADD KEY `pressing_du_type` (`id_pressing`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `user_contact` (`id_contact`);

--
-- Index pour la table `vetement_depose`
--
ALTER TABLE `vetement_depose`
  ADD PRIMARY KEY (`idVetementDepose`),
  ADD KEY `vetement_du_depot` (`id_depot`),
  ADD KEY `type_vetement` (`id_type_vetement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `idContact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `depot`
--
ALTER TABLE `depot`
  MODIFY `idDepot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pressing`
--
ALTER TABLE `pressing`
  MODIFY `idPressing` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `type_vetement`
--
ALTER TABLE `type_vetement`
  MODIFY `idTypeVetement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `vetement_depose`
--
ALTER TABLE `vetement_depose`
  MODIFY `idVetementDepose` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`idContact`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `depot`
--
ALTER TABLE `depot`
  ADD CONSTRAINT `deposeur` FOREIGN KEY (`id_client`) REFERENCES `client` (`idClient`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `depot_chez_pressing` FOREIGN KEY (`id_pressing`) REFERENCES `pressing` (`idPressing`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `pressing`
--
ALTER TABLE `pressing`
  ADD CONSTRAINT `contact_pressing` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`idContact`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proprietaire` FOREIGN KEY (`id_user`) REFERENCES `user` (`idUser`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `type_vetement`
--
ALTER TABLE `type_vetement`
  ADD CONSTRAINT `pressing_du_type` FOREIGN KEY (`id_pressing`) REFERENCES `pressing` (`idPressing`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`idContact`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `vetement_depose`
--
ALTER TABLE `vetement_depose`
  ADD CONSTRAINT `type_vetement` FOREIGN KEY (`id_type_vetement`) REFERENCES `type_vetement` (`idTypeVetement`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `vetement_du_depot` FOREIGN KEY (`id_depot`) REFERENCES `depot` (`idDepot`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
