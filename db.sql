/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.22 : Database - chatbot
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chatbot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `chatbot`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add dataset',7,'add_dataset'),
(26,'Can change dataset',7,'change_dataset'),
(27,'Can delete dataset',7,'delete_dataset'),
(28,'Can view dataset',7,'view_dataset'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add pyschiatrist',9,'add_pyschiatrist'),
(34,'Can change pyschiatrist',9,'change_pyschiatrist'),
(35,'Can delete pyschiatrist',9,'delete_pyschiatrist'),
(36,'Can view pyschiatrist',9,'view_pyschiatrist'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add tips',11,'add_tips'),
(42,'Can change tips',11,'change_tips'),
(43,'Can delete tips',11,'delete_tips'),
(44,'Can view tips',11,'view_tips'),
(45,'Can add suggestions',12,'add_suggestions'),
(46,'Can change suggestions',12,'change_suggestions'),
(47,'Can delete suggestions',12,'delete_suggestions'),
(48,'Can view suggestions',12,'view_suggestions'),
(49,'Can add feedback',13,'add_feedback'),
(50,'Can change feedback',13,'change_feedback'),
(51,'Can delete feedback',13,'delete_feedback'),
(52,'Can view feedback',13,'view_feedback'),
(53,'Can add complaint',14,'add_complaint'),
(54,'Can change complaint',14,'change_complaint'),
(55,'Can delete complaint',14,'delete_complaint'),
(56,'Can view complaint',14,'view_complaint'),
(57,'Can add chatbot',15,'add_chatbot'),
(58,'Can change chatbot',15,'change_chatbot'),
(59,'Can delete chatbot',15,'delete_chatbot'),
(60,'Can view chatbot',15,'view_chatbot'),
(61,'Can add chat',16,'add_chat'),
(62,'Can change chat',16,'change_chat'),
(63,'Can delete chat',16,'delete_chat'),
(64,'Can view chat',16,'view_chat'),
(65,'Can add query',17,'add_query'),
(66,'Can change query',17,'change_query'),
(67,'Can delete query',17,'delete_query'),
(68,'Can view query',17,'view_query'),
(69,'Can add council',18,'add_council'),
(70,'Can change council',18,'change_council'),
(71,'Can delete council',18,'delete_council'),
(72,'Can view council',18,'view_council');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `chatbot_chat` */

DROP TABLE IF EXISTS `chatbot_chat`;

CREATE TABLE `chatbot_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `from_id_id` bigint NOT NULL,
  `to_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_chat_from_id_id_f333e12a_fk_chatbot_login_id` (`from_id_id`),
  KEY `chatbot_chat_to_id_id_605c8a50_fk_chatbot_login_id` (`to_id_id`),
  CONSTRAINT `chatbot_chat_from_id_id_f333e12a_fk_chatbot_login_id` FOREIGN KEY (`from_id_id`) REFERENCES `chatbot_login` (`id`),
  CONSTRAINT `chatbot_chat_to_id_id_605c8a50_fk_chatbot_login_id` FOREIGN KEY (`to_id_id`) REFERENCES `chatbot_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_chat` */

/*Table structure for table `chatbot_chatbot` */

DROP TABLE IF EXISTS `chatbot_chatbot`;

CREATE TABLE `chatbot_chatbot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `pid_id` bigint NOT NULL,
  `sentiments` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_chatbot_pid_id_f49e5f51_fk_chatbot_user_id` (`pid_id`),
  CONSTRAINT `chatbot_chatbot_pid_id_f49e5f51_fk_chatbot_user_id` FOREIGN KEY (`pid_id`) REFERENCES `chatbot_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_chatbot` */

insert  into `chatbot_chatbot`(`id`,`questions`,`reply`,`pid_id`,`sentiments`) values 
(68,'how old are you?','21\r\n',2,'2.5'),
(69,'What brings you here?','klgytf',2,'2.5'),
(70,'how old are you?','21\r\n',2,'2.5'),
(71,'What brings you here?','nkjn',2,'2.5');

/*Table structure for table `chatbot_complaint` */

DROP TABLE IF EXISTS `chatbot_complaint`;

CREATE TABLE `chatbot_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `uid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_complaint_uid_id_16463800_fk_chatbot_user_id` (`uid_id`),
  CONSTRAINT `chatbot_complaint_uid_id_16463800_fk_chatbot_user_id` FOREIGN KEY (`uid_id`) REFERENCES `chatbot_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_complaint` */

insert  into `chatbot_complaint`(`id`,`complaint`,`reply`,`date`,`uid_id`) values 
(1,'ys','admin','2023-03-24',2),
(2,'ys','','2023-03-24',2),
(3,'dfdv','pending','2023-03-24',2),
(4,'klkj','pending','2023-03-24',2);

/*Table structure for table `chatbot_council` */

DROP TABLE IF EXISTS `chatbot_council`;

CREATE TABLE `chatbot_council` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `score` varchar(100) NOT NULL,
  `result` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_council` */

insert  into `chatbot_council`(`id`,`score`,`result`) values 
(1,'10','you are very depressed.please consult a doctor'),
(2,'20','you are depressed.but you can overcome by doing meditations,hearing positive musics,reading books etc'),
(3,'30','you are at the verge of getting depressed.try to do some meditations'),
(4,'40','keep yourself motivated and be happy'),
(5,'50','you are a happy person.Make others too happy');

/*Table structure for table `chatbot_dataset` */

DROP TABLE IF EXISTS `chatbot_dataset`;

CREATE TABLE `chatbot_dataset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_dataset` */

insert  into `chatbot_dataset`(`id`,`questions`) values 
(5,'how are you');

/*Table structure for table `chatbot_feedback` */

DROP TABLE IF EXISTS `chatbot_feedback`;

CREATE TABLE `chatbot_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `uid_id` bigint NOT NULL,
  `rating` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_feedback_uid_id_037dbc2c_fk_chatbot_user_id` (`uid_id`),
  CONSTRAINT `chatbot_feedback_uid_id_037dbc2c_fk_chatbot_user_id` FOREIGN KEY (`uid_id`) REFERENCES `chatbot_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_feedback` */

insert  into `chatbot_feedback`(`id`,`feedback`,`date`,`uid_id`,`rating`) values 
(1,'wrgregrferg','2023-03-23',2,'5'),
(2,'admin','2023-03-24',2,'1'),
(3,'123','2023-03-27',2,'2'),
(4,'m,m,','2023-05-05',2,'2');

/*Table structure for table `chatbot_login` */

DROP TABLE IF EXISTS `chatbot_login`;

CREATE TABLE `chatbot_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_login` */

insert  into `chatbot_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(2,'user','123','user'),
(5,'raju','raju','user'),
(6,'vishnu','123','user'),
(7,'rudh','123','psychiatrist'),
(8,'athi','Athi12345@','user'),
(9,'shukoor','123','psychiatrist'),
(10,'devan','123','psychiatrist');

/*Table structure for table `chatbot_pyschiatrist` */

DROP TABLE IF EXISTS `chatbot_pyschiatrist`;

CREATE TABLE `chatbot_pyschiatrist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `post` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  `expireance` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_pyschiatrist_lid_id_fa992124_fk_chatbot_login_id` (`lid_id`),
  CONSTRAINT `chatbot_pyschiatrist_lid_id_fa992124_fk_chatbot_login_id` FOREIGN KEY (`lid_id`) REFERENCES `chatbot_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_pyschiatrist` */

insert  into `chatbot_pyschiatrist`(`id`,`firstname`,`lastname`,`place`,`gender`,`phone`,`post`,`email`,`lid_id`,`expireance`,`image`) values 
(3,'anirudh','ram','tirur','male',847463636,'tirur','aman11@gmail.com',7,'4 years','download.jpg'),
(4,'shukoor','mes','pattambi','male',8089220909,'palakkad','athi@gmail.com',9,'7','images.jpg'),
(5,'sreedev','dev','malappuram','male',9867674523,'calicut','aa@gmail.com',10,'5','butter_Od0ggRs.jpeg');

/*Table structure for table `chatbot_query` */

DROP TABLE IF EXISTS `chatbot_query`;

CREATE TABLE `chatbot_query` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_query` */

insert  into `chatbot_query`(`id`,`query`) values 
(1,'how old are you?'),
(2,'What brings you here?'),
(3,'Have you seen a counselor before?'),
(4,'How do you feel when a problem pops up unexpectedly?'),
(5,'Do you feel sad, mad, hopeless, stuck, or something else?'),
(6,'What else do you feel? Tell me more.'),
(7,'How often do you experience the problem?'),
(8,'What have you tried so far?'),
(9,'Cope with life’s up and downs?'),
(10,'Control your emotions?'),
(11,'Have the energy level you wanted?'),
(12,'Feel capable?'),
(13,'Feel able to ask for support?'),
(14,'Do you feel like withdrawing from family, friends, and isolating yourself?'),
(15,'During work hours, do you have a hard time staying focused and concentrating on the task-at-hand?'),
(16,'How do you feel when you wake at the start of the day?'),
(17,'Do You find that you often loose your temper or get frustrated easily?'),
(18,'You feel stressed and tired all the time.'),
(19,'Been upset because of something that happened unexpectedly?'),
(20,'Felt that you were unable to control important things in your life?'),
(21,'Felt nervous and \'stressed\'?'),
(22,'Felt confident about your ability to handle your personal problems?'),
(23,'Felt that things were going your way?'),
(24,'Found that you could NOT cope with all the things you had to do?'),
(25,'Been able to control irritations in your life?'),
(26,'Been angered because of things that happened that were out of your control?\r\n'),
(27,'Felt difficulties were piling up so high that you could not overcome them?'),
(28,'How often have you been bothered by feeling down, depressed or hopeless?'),
(29,'How often have you had little interest or pleasure in doing things?'),
(30,'How often have you been bothered by trouble falling or staying asleep, or sleeping too much?'),
(32,'How often have you been bothered by feeling tired or having little energy?'),
(33,'How often have you been bothered by feeling bad about yourself, or that you are a failure, or have let yourself or your family down?'),
(34,'How often have you been bothered by trouble concentrating on things, such as reading the newspaper or watching television?'),
(35,'Have you had an anxiety attack (suddenly feeling fear or panic)?'),
(36,'How often have you been bothered by feeling nervous, anxious or on edge?'),
(37,'How often have you been bothered by not being able to stop or control worrying?'),
(38,'How often have you been bothered by worrying too much about different things?'),
(39,'How often have you been bothered by having trouble relaxing?'),
(40,'How often have you been bothered by being so restless that it is hard to sit still?'),
(41,'How often have you been bothered by becoming easily annoyed or irritable?'),
(42,'How often have you been bothered by feeling afraid as if something awful might happen?');

/*Table structure for table `chatbot_suggestions` */

DROP TABLE IF EXISTS `chatbot_suggestions`;

CREATE TABLE `chatbot_suggestions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `suggestions` varchar(250) NOT NULL,
  `descriptions` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `pid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_suggestions_pid_id_9abcee36_fk_chatbot_pyschiatrist_id` (`pid_id`),
  CONSTRAINT `chatbot_suggestions_pid_id_9abcee36_fk_chatbot_pyschiatrist_id` FOREIGN KEY (`pid_id`) REFERENCES `chatbot_pyschiatrist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_suggestions` */

insert  into `chatbot_suggestions`(`id`,`suggestions`,`descriptions`,`date`,`pid_id`) values 
(10,'sfgfssrg','rgf','2023-04-12',3),
(11,'kjjk','lk','2023-05-05',3);

/*Table structure for table `chatbot_tips` */

DROP TABLE IF EXISTS `chatbot_tips`;

CREATE TABLE `chatbot_tips` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `pid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_tips_pid_id_4ff21dce_fk_chatbot_pyschiatrist_id` (`pid_id`),
  CONSTRAINT `chatbot_tips_pid_id_4ff21dce_fk_chatbot_pyschiatrist_id` FOREIGN KEY (`pid_id`) REFERENCES `chatbot_pyschiatrist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_tips` */

/*Table structure for table `chatbot_user` */

DROP TABLE IF EXISTS `chatbot_user`;

CREATE TABLE `chatbot_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `post` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_user_lid_id_9abf52fc_fk_chatbot_login_id` (`lid_id`),
  CONSTRAINT `chatbot_user_lid_id_9abf52fc_fk_chatbot_login_id` FOREIGN KEY (`lid_id`) REFERENCES `chatbot_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `chatbot_user` */

insert  into `chatbot_user`(`id`,`firstname`,`lastname`,`place`,`gender`,`phone`,`post`,`email`,`lid_id`,`image`) values 
(2,'ys','iam','CALICUT','male',8547606484,'HJSDH','souravsthsh@gmail.com',2,'butter.jpeg'),
(3,'raj','k','kj','female',8547606484,'kj','raju@gmail.com',5,'butter.jpeg'),
(4,'vishnu','vish','CALICUT','male',9961443487,'chorode','aman11@gmail.com',6,'butter.jpeg'),
(5,'athi','kkk','kkk','male',8089220909,'kkk','athi@gmail.com',8,'butter.jpeg');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(16,'chatbot','chat'),
(15,'chatbot','chatbot'),
(14,'chatbot','complaint'),
(18,'chatbot','council'),
(7,'chatbot','dataset'),
(13,'chatbot','feedback'),
(8,'chatbot','login'),
(9,'chatbot','pyschiatrist'),
(17,'chatbot','query'),
(12,'chatbot','suggestions'),
(11,'chatbot','tips'),
(10,'chatbot','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-03-16 09:03:22.291687'),
(2,'auth','0001_initial','2023-03-16 09:03:22.981177'),
(3,'admin','0001_initial','2023-03-16 09:03:23.135684'),
(4,'admin','0002_logentry_remove_auto_add','2023-03-16 09:03:23.152380'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-03-16 09:03:23.167719'),
(6,'contenttypes','0002_remove_content_type_name','2023-03-16 09:03:23.286241'),
(7,'auth','0002_alter_permission_name_max_length','2023-03-16 09:03:23.360978'),
(8,'auth','0003_alter_user_email_max_length','2023-03-16 09:03:23.397547'),
(9,'auth','0004_alter_user_username_opts','2023-03-16 09:03:23.408548'),
(10,'auth','0005_alter_user_last_login_null','2023-03-16 09:03:23.591519'),
(11,'auth','0006_require_contenttypes_0002','2023-03-16 09:03:23.614419'),
(12,'auth','0007_alter_validators_add_error_messages','2023-03-16 09:03:23.631250'),
(13,'auth','0008_alter_user_username_max_length','2023-03-16 09:03:23.696957'),
(14,'auth','0009_alter_user_last_name_max_length','2023-03-16 09:03:23.771021'),
(15,'auth','0010_alter_group_name_max_length','2023-03-16 09:03:23.777253'),
(16,'auth','0011_update_proxy_permissions','2023-03-16 09:03:23.800216'),
(17,'auth','0012_alter_user_first_name_max_length','2023-03-16 09:03:23.862735'),
(18,'chatbot','0001_initial','2023-03-16 09:03:24.975061'),
(19,'sessions','0001_initial','2023-03-16 09:03:25.034048'),
(20,'chatbot','0002_feedback_rating','2023-03-23 10:27:38.819715'),
(21,'chatbot','0003_auto_20230408_1156','2023-04-08 06:28:03.018306'),
(22,'chatbot','0004_query','2023-04-13 09:05:20.684414'),
(23,'chatbot','0005_remove_query_query_id','2023-04-13 10:03:37.003005'),
(24,'chatbot','0006_council','2023-04-19 08:08:54.767933'),
(25,'chatbot','0007_chatbot_sentiments','2023-04-19 10:28:49.988569');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('wuij1a72tt8polt9axqg7cvobt6wjsul','.eJxVjEEKgDAQA78iOReLgij9jKhdtWK1aHso4t_dPXoakgl5sDsLUysEYatghY2CoFKYDxjku3CDB5d-4TimGOkqt0ALd0mWnRxM7LQn6wb9n8QciF266erX0xPeDzj6JN8:1puolS:73-jV02IZt4bvRxX_cZkMP19jtAzSNXijh1LwcwYwEk','2023-05-19 06:17:58.383715');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
