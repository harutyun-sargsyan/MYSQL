-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 29 2024 г., 08:27
-- Версия сервера: 5.5.48
-- Версия PHP: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `TestIKMTT2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
  `Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `cat_status` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`Id`, `Name`, `cat_status`) VALUES
(1, 'ART', '1'),
(2, 'FOR MEN', '1'),
(3, 'FOR HOME', '0'),
(4, 'BABY', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `Cat_Prod`
--

CREATE TABLE IF NOT EXISTS `Cat_Prod` (
  `Id` int(11) NOT NULL,
  `p_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Cat_Prod`
--

INSERT INTO `Cat_Prod` (`Id`, `p_id`, `c_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 6, 4),
(6, 7, 1),
(7, 5, 3),
(8, 8, 2),
(9, 2, 3),
(10, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Products`
--

CREATE TABLE IF NOT EXISTS `Products` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Price` int(100) DEFAULT NULL,
  `U_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Products`
--

INSERT INTO `Products` (`Id`, `Name`, `Price`, `U_id`) VALUES
(1, 'Led', 120, 3),
(2, 'Far', 16, 4),
(3, 'Jacet', 25, 1),
(4, 'Foto Art', 100, 2),
(5, 'pampers', 25, 3),
(6, 'soscation', 10, 1),
(7, 'door', 65, 4),
(8, 'windows', 85, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Post_number` int(12) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`Id`, `Name`, `Surname`, `Phone`, `Post_number`, `Address`, `dob`, `Email`) VALUES
(1, 'Harut', 'Sargsyan', '+37498077858', 1111, 'MY address1', '1987-04-19', NULL),
(2, 'yghuy', 'yuy', 'yuy', 0, 'yyyuyu', '2024-08-01', 'yyiuyu'),
(3, 'Aram', 'Sarojan', '5555522', 5552, 'Gyumri', '2020-02-22', 'hdfbvdkf@fnjbfv.ru'),
(4, 'Armen', 'Asattryan', '55555414', 8877, 'Address1', '2024-03-01', 'email@mail.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Cat_Prod`
--
ALTER TABLE `Cat_Prod`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Индексы таблицы `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `U_id` (`U_id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Categories`
--
ALTER TABLE `Categories`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `Cat_Prod`
--
ALTER TABLE `Cat_Prod`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `Products`
--
ALTER TABLE `Products`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Cat_Prod`
--
ALTER TABLE `Cat_Prod`
  ADD CONSTRAINT `cat_prod_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `Products` (`Id`),
  ADD CONSTRAINT `cat_prod_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `Categories` (`Id`);

--
-- Ограничения внешнего ключа таблицы `Products`
--
ALTER TABLE `Products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `Users` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
