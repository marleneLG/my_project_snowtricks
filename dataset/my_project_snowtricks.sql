-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 30 mars 2024 à 16:49
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `my_project_snowtricks`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Flips', '2024-02-17 09:36:41', '2024-02-17 09:36:41'),
(2, 'Spins', '2024-02-17 09:37:39', '2024-02-17 09:37:39'),
(3, 'Grabs', '2024-02-17 09:38:02', '2024-02-17 09:38:02'),
(4, 'Butter', '2024-02-17 09:40:05', '2024-02-17 09:40:05');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231229164508', '2023-12-29 16:45:21', 137),
('DoctrineMigrations\\Version20240105105019', '2024-01-05 10:50:30', 134),
('DoctrineMigrations\\Version20240119142818', '2024-01-19 14:28:33', 110),
('DoctrineMigrations\\Version20240126102307', '2024-01-26 10:23:26', 261),
('DoctrineMigrations\\Version20240217092728', '2024-02-17 09:29:15', 360),
('DoctrineMigrations\\Version20240302142439', '2024-03-02 14:25:27', 239);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trick_id` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `embed` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A2CA10CB281BE2E` (`trick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `trick_id`, `url`, `embed`, `created_at`, `updated_at`) VALUES
(1, 2, 'snow7-65d0908dd6565.jpg', NULL, '2024-02-17 10:55:09', '2024-02-17 10:55:09'),
(2, 3, 'snow6-65d0c2ea2aa9b.jpg', NULL, '2024-02-17 14:30:02', '2024-02-17 14:30:02'),
(3, 4, 'snow7-65d78dff91d3b.jpg', NULL, '2024-02-22 18:10:07', '2024-02-22 18:10:07'),
(4, 4, 'snow8-65d78dff93bbe.jpg', NULL, '2024-02-22 18:10:07', '2024-02-22 18:10:07'),
(5, 4, 'snow9-65d78dff94e0f.jpg', NULL, '2024-02-22 18:10:07', '2024-02-22 18:10:07'),
(6, 5, 'snow1-65d7917b3289f.jpg', NULL, '2024-02-22 18:24:59', '2024-02-22 18:24:59'),
(7, 5, 'snow2-65d7917b32faa.jpg', NULL, '2024-02-22 18:24:59', '2024-02-22 18:24:59'),
(8, 5, 'snow3-65d7917b334ca.jpg', NULL, '2024-02-22 18:24:59', '2024-02-22 18:24:59'),
(9, 6, 'snow5-65d793be34705.jpg', NULL, '2024-02-22 18:34:38', '2024-02-22 18:34:38'),
(10, 7, 'snow9-65d88bb90fb03.jpg', NULL, '2024-02-23 12:12:41', '2024-02-23 12:12:41'),
(12, 9, 'snow2-65d8953f7d023.jpg', NULL, '2024-02-23 12:53:19', '2024-02-23 12:53:19'),
(15, 4, 'snow9-65da2109855c7.jpg', NULL, '2024-02-24 17:02:01', '2024-02-24 17:02:01'),
(18, 12, 'snow3-65da2fb4d0710.jpg', NULL, '2024-02-24 18:04:36', '2024-02-24 18:04:36'),
(19, 13, 'snow6-65da308ede7ce.jpg', NULL, '2024-02-24 18:08:14', '2024-02-24 18:08:14'),
(20, 13, 'snow6-65db09f5e5768.jpg', NULL, '2024-02-25 09:35:49', '2024-02-25 09:35:49'),
(21, 14, 'snow2-65db0e996cd23.jpg', NULL, '2024-02-25 09:55:37', '2024-02-25 09:55:37'),
(22, 2, 'snow9-65e1a0ce2fa26.jpg', NULL, '2024-03-01 09:33:02', '2024-03-01 09:33:02'),
(29, 14, 'snow7-65e33a99acdb5.jpg', NULL, '2024-03-02 14:41:29', '2024-03-02 14:41:29'),
(30, 14, 'snow8-65e33a99ae320.jpg', NULL, '2024-03-02 14:41:29', '2024-03-02 14:41:29'),
(31, 14, 'snow1-65e33aa72fd76.jpg', NULL, '2024-03-02 14:41:43', '2024-03-02 14:41:43'),
(32, 14, 'snow2-65e33aa7314b4.jpg', NULL, '2024-03-02 14:41:43', '2024-03-02 14:41:43');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `trick_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FB281BE2E` (`trick_id`),
  KEY `IDX_B6BD307FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `content`, `created_at`, `updated_at`, `trick_id`, `user_id`) VALUES
(1, 'Test comment', '2024-02-18 08:57:50', '2024-02-18 08:57:50', 2, 11),
(5, 'Bonjour tout le monde', '2024-03-02 14:43:56', '2024-03-02 14:43:56', 2, 12),
(8, 'Great Trick', '2024-03-02 16:04:50', '2024-03-02 16:04:50', 14, 12),
(12, 'Essai commentaire', '2024-03-02 16:07:09', '2024-03-02 16:07:09', 13, 12),
(13, 'test pagination', '2024-03-09 08:40:54', '2024-03-09 08:40:54', 2, 11),
(14, 'test pagination', '2024-03-09 08:42:48', '2024-03-09 08:42:48', 2, 11),
(15, 'Cette figure est incroyable', '2024-03-22 09:22:42', '2024-03-22 09:22:42', 2, 11);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:171:\\\"http://localhost:8000/verify/email?expires=1705679050&signature=cZV7fwd7FQQUZAGn6rlOUraFGjtOHcr%2Fj0z%2B0XXTYPM%3D&token=%2BFUdU9XV7q0h1BtI1Z8OAoNC3VTJoJ0D%2B1SeVTfqQSQ%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"marlene.mlg53@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:9:\\\"snowtrick\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"marlene22@yopmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-01-19 14:44:10', '2024-01-19 14:44:10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trick`
--

DROP TABLE IF EXISTS `trick`;
CREATE TABLE IF NOT EXISTS `trick` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `category_id` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D8F0A91E12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `name`, `description`, `created_at`, `updated_at`, `category_id`, `slug`) VALUES
(2, 'Le Ollie', 'Le Ollie est le trick fondamental qui donne accès à toutes les autres figures en snowboard. C\'est la clé pour découvrir le freestyle.', '2024-02-17 10:55:09', '2024-02-17 10:55:09', 4, 'Le-Ollie'),
(3, 'Le Indy', 'Attrape le carre des orteils de ta planche, entre les fixations, avec ta main arrière.', '2024-02-17 14:30:00', '2024-02-17 14:30:00', 3, 'Le-Indy'),
(4, 'Le Stalefish', 'Passe la main derrière ton genou arrière et attrape le carre de ta planche entre les fixations, côté talon, avec ta main arrière.', '2024-02-22 18:10:06', '2024-02-22 18:10:06', 3, 'Le-Stalefish'),
(5, 'Le Wildcat', 'Un Wildcat est un Backflip qui garde la planche parallèle à la trajectoire, tu fais donc une sorte de Flip \"latéral\" sans perte de vitesse.', '2024-02-22 18:24:58', '2024-02-22 18:24:58', 1, 'Le-Wildcat'),
(6, 'Le Backflip', 'Un Backflip fait tourner la planche perpendiculairement à la neige, tu fais donc un Flip directement en arrière, en stabilisant la planche lors de l\'atterrissage.', '2024-02-22 18:34:37', '2024-02-22 18:34:37', 1, 'Le-Backflip'),
(7, 'Le Rodéo', 'Un Rodéo est un Frontflip avec un twist. Littéralement. Lorsque tu arrives sur le rebord du saut, déclenche un virage Frontside. Puis, décolle la carre des orteils de ta planche, en continuant la rotation, de façon à effectuer un Frontflip avec un Frontsi', '2024-02-23 12:12:39', '2024-02-23 12:12:39', 1, 'Le-Rodeo'),
(9, 'Le Corked Spin', 'Un Corked Spin ajoute simplement un front ou un Backflip dans un flat spin. Tu l\'entendras généralement en compétition lorsque les pros lancent des Back Double Corked 10s ou des Cabs Triple Cork 14s.', '2024-02-23 12:53:17', '2024-02-23 12:53:17', 1, 'Le-Corked-Spin'),
(12, 'Le Melon', 'Passe la main avant derrière ton genou et attrape le bord des talons entre les fixations.', '2024-02-24 18:04:36', '2024-02-24 18:04:36', 3, 'Le-Melon'),
(13, 'Le Tripod', 'Va en ligne droite et regarde derrière toi. Fais une grosse pression sur le talon de la planche, puis baisse-toi et touche la neige avec tes mains, en formant un trépied avec le talon de la planche et tes bras. Cette figure demande beaucoup de force au ni', '2024-02-24 18:08:13', '2024-02-24 18:08:13', 3, 'Le-Tripod'),
(14, 'Le Nose-Roll 180', 'Amorce un virage sur les orteils ou les talons, et une fois que tu es sur la carre, soulève le talon de ta planche, en gardant la spatule au sol. Ensuite, fais pivoter la planche pour atterrir en Switch.', '2024-02-25 09:55:36', '2024-02-25 09:55:36', 4, 'Le-Nose-Roll-180');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `created_at`, `updated_at`, `is_verified`, `picture`) VALUES
(11, 'marlene22@yopmail.com', '[]', '$2y$13$WQHk/vw/KHzeB4qSLmG37OIRoIpbU.BycRCAymG2jRjRxBjZNhpIW', 'marlene22', '2024-01-19 15:17:26', '2024-01-19 15:17:26', 1, 'AdobeStock-289109006-Preview-65d89338a3bc3.jpg'),
(12, 'userTest2@yopmail.com', '[]', '$2y$13$vh640QqcOAgXxGIXYPfBEeFfI5tzzI2njtJm7xWmKUqtLtnfzr3Ly', 'userTest2', '2024-02-22 08:06:48', '2024-02-22 08:06:48', 1, 'family-2611748-960-720-65d7009a9cc98.jpg'),
(14, 'coucou@gmail.com', '[]', '$2y$13$OYeugDRosIS7f2LQqEACkewRCnXFfN0uWmnbvCjgvpAkHWfHhZdfK', 'coucou@gmail.com', '2024-02-23 12:44:38', '2024-02-23 12:44:38', 1, 'AdobeStock-289109006-Preview-65d89338a3bc3.jpg'),
(15, 'jojo@yopma.com', '[]', '$2y$13$.UXXerfnuZsnKuMGR4Y4M.A13XMulk.BXBZQoO8CeOv161QEXXyVe', 'jojojoj', '2024-03-03 08:30:34', '2024-03-03 08:30:34', 1, 'family-2611748-960-720-65e4352c6c87c.jpg'),
(17, 'jean@jean.jean', '[]', '$2y$13$i7anW2jR1RCYK0v1Vssuz.4fi433dWAu1fOil37VTijKFyjfGJ3iO', 'jean', '2024-03-09 10:18:16', '2024-03-09 10:18:16', 1, 'family-2611748-960-720-65ec3769d3610.jpg');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B6BD307FB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `trick`
--
ALTER TABLE `trick`
  ADD CONSTRAINT `FK_D8F0A91E12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
