-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 26 mars 2024 à 12:37
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd_resto_view`
--

-- --------------------------------------------------------

--
-- Structure de la table `aimer`
--

DROP TABLE IF EXISTS `aimer`;
CREATE TABLE IF NOT EXISTS `aimer` (
  `idR` bigint NOT NULL,
  `mailU` varchar(150) NOT NULL,
  PRIMARY KEY (`idR`,`mailU`),
  KEY `mailU` (`mailU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `aimer`
--

INSERT INTO `aimer` (`idR`, `mailU`) VALUES
(8, 'achille@tallon.fr'),
(1, 'bugs.bunny@gmail.com'),
(2, 'bugs.bunny@gmail.com'),
(3, 'bugs.bunny@gmail.com'),
(4, 'bugs.bunny@gmail.com'),
(7, 'bugs.bunny@gmail.com'),
(8, 'bugs.bunny@gmail.com'),
(10, 'gaston.lagaffe@gmail.com'),
(11, 'john.doe@gmail.com'),
(1, 'michel.garay@gmail.com'),
(4, 'test@bts.sio'),
(6, 'test@bts.sio'),
(7, 'test@bts.sio');

-- --------------------------------------------------------

--
-- Structure de la table `critiquer`
--

DROP TABLE IF EXISTS `critiquer`;
CREATE TABLE IF NOT EXISTS `critiquer` (
  `idR` bigint NOT NULL,
  `mailU` varchar(150) NOT NULL,
  `note` int DEFAULT NULL,
  `commentaire` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`idR`,`mailU`),
  KEY `mailU` (`mailU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `critiquer`
--

INSERT INTO `critiquer` (`idR`, `mailU`, `note`, `commentaire`) VALUES
(1, 'achille@tallon.fr', 5, NULL),
(1, 'bugs.bunny@gmail.com', 3, 'Très bonne entrecote, les frites sont maisons et delicieuses.'),
(1, 'jj.soueix@gmail.com', 3, 'moyen'),
(1, 'john.doe@gmail.com', 4, 'Très bon accueil.'),
(1, 'test@bts.sio', 4, '5/5 parce que j\'aime les entrecotes'),
(2, 'bugs.bunny@gmail.com', 1, 'À éviter...'),
(2, 'jj.soueix@gmail.com', 2, 'bof.'),
(2, 'john.doe@gmail.com', 1, 'Cuisine tres moyenne.'),
(2, 'test@bts.sio', 5, NULL),
(3, 'test@bts.sio', 2, 'Pas foufou'),
(4, 'bugs.bunny@gmail.com', 5, NULL),
(4, 'john.doe@gmail.com', 5, 'Rapide.'),
(5, 'john.doe@gmail.com', 3, 'Cuisine correcte.'),
(6, 'john.doe@gmail.com', 4, 'Cuisine de qualité.'),
(7, 'bugs.bunny@gmail.com', 5, NULL),
(7, 'gaston.lagaffe@gmail.com', 4, 'Bon accueil.'),
(7, 'john.doe@gmail.com', 5, 'Excellent.'),
(8, 'achille@tallon.fr', 4, NULL),
(8, 'test@bts.sio', 1, NULL),
(9, 'bugs.bunny@gmail.com', 4, 'Très bon accueil :)');

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `idP` bigint NOT NULL,
  `cheminP` varchar(255) DEFAULT NULL,
  `idR` bigint DEFAULT NULL,
  PRIMARY KEY (`idP`),
  KEY `idR` (`idR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`idP`, `cheminP`, `idR`) VALUES
(0, 'entrepote.jpg', 1),
(2, 'sapporo.jpg', 3),
(3, 'entrepote.jpg', 1),
(4, 'barDuCharcutier.jpg', 2),
(6, 'cidrerieDuFronton.jpg', 4),
(7, 'agadir.jpg', 5),
(8, 'leBistrotSainteCluque.jpg', 6),
(9, 'auberge.jpg', 7),
(10, 'laTableDePottoka.jpg', 8),
(11, 'rotisserieDuRoyLeon.jpg', 9),
(12, 'barDuMarche.jpg', 10),
(13, 'trinquetModerne.jpg', 11),
(14, 'cidrerieDuFronton2.jpg', 4),
(15, 'cidrerieDuFronton3.jpg', 4);

-- --------------------------------------------------------

--
-- Structure de la table `preferer`
--

DROP TABLE IF EXISTS `preferer`;
CREATE TABLE IF NOT EXISTS `preferer` (
  `mailU` varchar(150) NOT NULL,
  `idTC` bigint NOT NULL,
  PRIMARY KEY (`mailU`,`idTC`),
  KEY `idTC` (`idTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `preferer`
--

INSERT INTO `preferer` (`mailU`, `idTC`) VALUES
('achille@tallon.fr', 1),
('bugs.bunny@gmail.com', 1),
('john.doe@gmail.com', 1),
('michel.garay@gmail.com', 1),
('test@bts.sio', 1),
('john.doe@gmail.com', 2),
('michel.garay@gmail.com', 2),
('test@bts.sio', 2),
('michel.garay@gmail.com', 3),
('test@bts.sio', 3),
('test@bts.sio', 4),
('bugs.bunny@gmail.com', 5),
('achille@tallon.fr', 7),
('achille@tallon.fr', 9),
('bugs.bunny@gmail.com', 9),
('achille@tallon.fr', 10),
('bugs.bunny@gmail.com', 10),
('michel.garay@gmail.com', 10),
('test@bts.sio', 10),
('achille@tallon.fr', 11),
('bugs.bunny@gmail.com', 11),
('john.doe@gmail.com', 11),
('test@bts.sio', 11);

-- --------------------------------------------------------

--
-- Structure de la table `proposer`
--

DROP TABLE IF EXISTS `proposer`;
CREATE TABLE IF NOT EXISTS `proposer` (
  `idR` bigint NOT NULL,
  `idTC` bigint NOT NULL,
  PRIMARY KEY (`idR`,`idTC`),
  KEY `idTC` (`idTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `proposer`
--

INSERT INTO `proposer` (`idR`, `idTC`) VALUES
(1, 1),
(2, 1),
(4, 1),
(10, 1),
(11, 1),
(3, 3),
(5, 3),
(7, 6),
(4, 8),
(6, 10),
(9, 10),
(11, 10),
(4, 11),
(8, 11);

-- --------------------------------------------------------

--
-- Structure de la table `resto`
--

DROP TABLE IF EXISTS `resto`;
CREATE TABLE IF NOT EXISTS `resto` (
  `idR` bigint NOT NULL,
  `nomR` varchar(255) DEFAULT NULL,
  `numAdrR` varchar(20) DEFAULT NULL,
  `voieAdrR` varchar(255) DEFAULT NULL,
  `cpR` char(5) DEFAULT NULL,
  `villeR` varchar(255) DEFAULT NULL,
  `latitudeDegR` float DEFAULT NULL,
  `longitudeDegR` float DEFAULT NULL,
  `descR` text,
  `horairesR` text,
  PRIMARY KEY (`idR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `resto`
--

INSERT INTO `resto` (`idR`, `nomR`, `numAdrR`, `voieAdrR`, `cpR`, `villeR`, `latitudeDegR`, `longitudeDegR`, `descR`, `horairesR`) VALUES
(1, 'L\'entrepote', '2', 'rue Maurice Ravel', '33000', 'Bordeaux', 44.7948, -0.58754, 'description', '<table>\n    <thead>\n        <tr>\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <td class=\"label\">Midi</td>\n            <td class=\"cell\">de 11h45 à 14h30</td>\n            <td class=\"cell\">de 11h45 à 15h00</td>\n        </tr>\n        <tr>\n            <td class=\"label\">Soir</td>\n            <td class=\"cell\">de 18h45 à 22h30</td>\n            <td class=\"cell\">de 18h45 à 1h</td>	\n        </tr>\n        <tr>\n            <td class=\"label\">À emporter</td>\n            <td class=\"cell\">de 11h30 à 23h</td>\n            <td class=\"cell\">de 11h30 à 2h</td>\n        </tr>\n    </tbody>\n</table>'),
(2, 'Le bar du charcutier', '30', 'rue Parlement Sainte-Catherine', '33000', 'Bordeaux', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(3, 'Sapporo', '33', 'rue Saint Rémi', '33000', 'Bordeaux', NULL, NULL, 'Le Sapporo propose à ses clients de délicieux plats typiques japonais.', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(4, 'Cidrerie du fronton', NULL, 'Place du Fronton', '64210', 'Arbonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(5, 'Agadir', '3', 'Rue Sainte-Catherine', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(6, 'Le Bistrot Sainte Cluque', '9', 'Rue Hugues', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(7, 'La petite auberge', '15', 'rue des cordeliers', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(8, 'La table de Pottoka', '21', 'Quai Amiral Dubourdieu', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(9, 'La Rotisserie du Roy Léon', '8', 'rue de coursic', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(10, 'Bar du Marché', '39', 'Rue des Basques', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>'),
(11, 'Trinquet Moderne', '60', 'Avenue Dubrocq', '64100', 'Bayonne', NULL, NULL, 'description', '<table>\r\n    <thead>\r\n        <tr>\r\n            <th>Ouverture</th><th>Semaine</th>	<th>Week-end</th>\r\n        </tr>\r\n    </thead>\r\n    <tbody>\r\n        <tr>\r\n            <td class=\"label\">Midi</td>\r\n            <td class=\"cell\">de 11h45 à 14h30</td>\r\n            <td class=\"cell\">de 11h45 à 15h00</td>\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">Soir</td>\r\n            <td class=\"cell\">de 18h45 à 22h30</td>\r\n            <td class=\"cell\">de 18h45 à 1h</td>	\r\n        </tr>\r\n        <tr>\r\n            <td class=\"label\">À emporter</td>\r\n            <td class=\"cell\">de 11h30 à 23h</td>\r\n            <td class=\"cell\">de 11h30 à 2h</td>\r\n        </tr>\r\n    </tbody>\r\n</table>');

-- --------------------------------------------------------

--
-- Structure de la table `typecuisine`
--

DROP TABLE IF EXISTS `typecuisine`;
CREATE TABLE IF NOT EXISTS `typecuisine` (
  `idTC` bigint NOT NULL,
  `libelleTC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `typecuisine`
--

INSERT INTO `typecuisine` (`idTC`, `libelleTC`) VALUES
(1, 'sud ouest'),
(2, 'japonaise'),
(3, 'orientale'),
(4, 'fastfood'),
(5, 'vegetarienne'),
(6, 'vegan'),
(7, 'crepe'),
(8, 'sandwich'),
(9, 'tartes'),
(10, 'viande'),
(11, 'grillade');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `mailU` varchar(150) NOT NULL,
  `mdpU` varchar(50) DEFAULT NULL,
  `pseudoU` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`mailU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`mailU`, `mdpU`, `pseudoU`) VALUES
('achille@tallon.fr', 'sej6dETYl/ea.', 'yann'),
('bugs.bunny@gmail.com', 'seSzpoUAQgIl.', 'pich'),
('gaston.lagaffe@gmail.com', '$1$zvN5hYSQSQDFUIQSdufUQSDFznHF5osT.', '@lex'),
('jj.soueix@gmail.com', '$1$zvN5hYMI$SDFGSDFGJqJSDJF.', 'drskott'),
('john.doe@gmail.com', '$1$zvNDSFQSdfqsDfQsdfsT.', 'Nico40'),
('michel.garay@gmail.com', '$1$zvN5hYMI$VSatLQ6SDFGdsfgznHF5osT.', 'Mitch'),
('test@bts.sio', 'seSzpoUAQgIl.', 'test'),
('test@gmail.com', 'seCBdk.BxFGa6', 'test');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `aimer`
--
ALTER TABLE `aimer`
  ADD CONSTRAINT `aimer_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`),
  ADD CONSTRAINT `aimer_ibfk_2` FOREIGN KEY (`mailU`) REFERENCES `utilisateur` (`mailU`);

--
-- Contraintes pour la table `critiquer`
--
ALTER TABLE `critiquer`
  ADD CONSTRAINT `critiquer_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`),
  ADD CONSTRAINT `critiquer_ibfk_2` FOREIGN KEY (`mailU`) REFERENCES `utilisateur` (`mailU`);

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`);

--
-- Contraintes pour la table `preferer`
--
ALTER TABLE `preferer`
  ADD CONSTRAINT `preferer_ibfk_1` FOREIGN KEY (`mailU`) REFERENCES `utilisateur` (`mailU`),
  ADD CONSTRAINT `preferer_ibfk_2` FOREIGN KEY (`idTC`) REFERENCES `typecuisine` (`idTC`);

--
-- Contraintes pour la table `proposer`
--
ALTER TABLE `proposer`
  ADD CONSTRAINT `proposer_ibfk_1` FOREIGN KEY (`idR`) REFERENCES `resto` (`idR`),
  ADD CONSTRAINT `proposer_ibfk_2` FOREIGN KEY (`idTC`) REFERENCES `typecuisine` (`idTC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
