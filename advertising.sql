-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 29 2018 г., 01:48
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `advertising`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adunit`
--

CREATE TABLE `adunit` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `adunit-click`
--

CREATE TABLE `adunit-click` (
  `id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `adunit_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `IP` varchar(100) NOT NULL,
  `ISO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `adunit-views`
--

CREATE TABLE `adunit-views` (
  `id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `adunit_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `IP` varchar(100) NOT NULL,
  `ISO` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subjects`
--

INSERT INTO `subjects` (`id`, `name`) VALUES
(6, 'Тематика 1'),
(7, 'Тематика 2'),
(8, 'Тематика 3'),
(9, 'Тематика 4');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `adunit`
--
ALTER TABLE `adunit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resource_id` (`resource_id`);

--
-- Индексы таблицы `adunit-click`
--
ALTER TABLE `adunit-click`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_id` (`resources_id`),
  ADD KEY `adunit_id` (`adunit_id`);

--
-- Индексы таблицы `adunit-views`
--
ALTER TABLE `adunit-views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_id` (`resources_id`),
  ADD KEY `adunit_id` (`adunit_id`);

--
-- Индексы таблицы `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Индексы таблицы `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `adunit`
--
ALTER TABLE `adunit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `adunit-click`
--
ALTER TABLE `adunit-click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `adunit-views`
--
ALTER TABLE `adunit-views`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT для таблицы `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `adunit`
--
ALTER TABLE `adunit`
  ADD CONSTRAINT `adunit_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `adunit-click`
--
ALTER TABLE `adunit-click`
  ADD CONSTRAINT `FK_adunit-click_resources` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adunit-click_ibfk_1` FOREIGN KEY (`adunit_id`) REFERENCES `adunit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `adunit-views`
--
ALTER TABLE `adunit-views`
  ADD CONSTRAINT `FK_adunit-views_adunit` FOREIGN KEY (`adunit_id`) REFERENCES `adunit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adunit-views_ibfk_1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
