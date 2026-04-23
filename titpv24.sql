-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 23 2026 г., 10:33
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `titpv24`
--

-- --------------------------------------------------------

--
-- Структура таблицы `opetaja`
--

CREATE TABLE `opetaja` (
  `opetajaID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `epost` varchar(50) DEFAULT NULL,
  `ruum` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `opetamine`
--

CREATE TABLE `opetamine` (
  `opetamineID` int(11) NOT NULL,
  `kuupaev` date DEFAULT NULL,
  `oppeaine` varchar(30) DEFAULT NULL,
  `opilaneID` int(11) DEFAULT NULL,
  `hinne` int(11) DEFAULT NULL CHECK (`hinne` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `opilane`
--

CREATE TABLE `opilane` (
  `opilaneID` int(11) NOT NULL,
  `eesnimi` varchar(25) DEFAULT NULL,
  `perenimi` varchar(30) NOT NULL,
  `synniaeg` date DEFAULT NULL,
  `stip` bit(1) DEFAULT NULL,
  `mobiil` varchar(13) DEFAULT NULL,
  `aadress` text DEFAULT NULL,
  `keskmineHinne` decimal(2,1) DEFAULT NULL,
  `ryhmId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `opilane`
--

INSERT INTO `opilane` (`opilaneID`, `eesnimi`, `perenimi`, `synniaeg`, `stip`, `mobiil`, `aadress`, `keskmineHinne`, `ryhmId`) VALUES
(1, 'Irina', 'Merkulova', NULL, NULL, NULL, NULL, 4.2, NULL),
(2, 'Ivan', 'Holovanov', NULL, NULL, NULL, NULL, 4.2, NULL),
(3, 'Ivan', 'Sereda', NULL, NULL, NULL, NULL, 4.2, NULL),
(4, 'Marko', 'Suvorov', NULL, NULL, NULL, NULL, 5.0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ryhm`
--

CREATE TABLE `ryhm` (
  `ryhmId` int(11) NOT NULL,
  `ryhmNimi` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `ryhm`
--

INSERT INTO `ryhm` (`ryhmId`, `ryhmNimi`) VALUES
(1, 'TITpv24'),
(2, 'TITpe24');

-- --------------------------------------------------------

--
-- Структура таблицы `tund`
--

CREATE TABLE `tund` (
  `tundID` int(11) NOT NULL,
  `kuupaev` date DEFAULT NULL,
  `tundinimi` varchar(30) DEFAULT NULL,
  `opetajaID` int(11) DEFAULT NULL,
  `opetamineID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `opetaja`
--
ALTER TABLE `opetaja`
  ADD PRIMARY KEY (`opetajaID`);

--
-- Индексы таблицы `opetamine`
--
ALTER TABLE `opetamine`
  ADD PRIMARY KEY (`opetamineID`),
  ADD KEY `opilaneID` (`opilaneID`);

--
-- Индексы таблицы `opilane`
--
ALTER TABLE `opilane`
  ADD PRIMARY KEY (`opilaneID`),
  ADD KEY `fk_ryhm` (`ryhmId`);

--
-- Индексы таблицы `ryhm`
--
ALTER TABLE `ryhm`
  ADD PRIMARY KEY (`ryhmId`);

--
-- Индексы таблицы `tund`
--
ALTER TABLE `tund`
  ADD PRIMARY KEY (`tundID`),
  ADD KEY `opetajaID` (`opetajaID`),
  ADD KEY `opetamineID` (`opetamineID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `opetaja`
--
ALTER TABLE `opetaja`
  MODIFY `opetajaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `opetamine`
--
ALTER TABLE `opetamine`
  MODIFY `opetamineID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `opilane`
--
ALTER TABLE `opilane`
  MODIFY `opilaneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tund`
--
ALTER TABLE `tund`
  MODIFY `tundID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `opetamine`
--
ALTER TABLE `opetamine`
  ADD CONSTRAINT `opetamine_ibfk_1` FOREIGN KEY (`opilaneID`) REFERENCES `opilane` (`opilaneID`);

--
-- Ограничения внешнего ключа таблицы `opilane`
--
ALTER TABLE `opilane`
  ADD CONSTRAINT `fk_ryhm` FOREIGN KEY (`ryhmId`) REFERENCES `ryhm` (`ryhmId`);

--
-- Ограничения внешнего ключа таблицы `tund`
--
ALTER TABLE `tund`
  ADD CONSTRAINT `tund_ibfk_1` FOREIGN KEY (`opetajaID`) REFERENCES `opetaja` (`opetajaID`),
  ADD CONSTRAINT `tund_ibfk_2` FOREIGN KEY (`opetamineID`) REFERENCES `opetamine` (`opetamineID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
