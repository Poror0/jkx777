-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 19 2025 г., 13:42
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zhkh777`
--

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE `application` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `profession_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'new',
  `rejection_reason` text,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id`, `user_id`, `profession_id`, `title`, `description`, `status`, `rejection_reason`, `created_at`, `updated_at`) VALUES
(6, 6, 3, 'Дверь мне запилите', 'лимончела я за руль, считай что не пил\r\nтачка ревет без слез, как смотреть на жизнь?\r\nкореш без папы сам как то вырос борзым\r\nсели потрещать, ладно, тащите пузырь\r\ntest red', 'confirmed', '', 1763545749, 1763545972),
(7, 6, 1, '123', '123', 'cancelled', 'Отменено пользователем', 1763546029, 1763546035);

-- --------------------------------------------------------

--
-- Структура таблицы `profession`
--

CREATE TABLE `profession` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `profession`
--

INSERT INTO `profession` (`id`, `name`) VALUES
(1, 'Сантехник'),
(2, 'Электрик'),
(3, 'Мелкий ремонт'),
(4, 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `full_name`, `username`, `email`, `phone`, `address`, `password_hash`, `auth_key`, `is_admin`, `created_at`, `updated_at`) VALUES
(5, 'Админ', 'admin', 'admin@zhkh777.ru', '+79999999999', 'Маями', '$2y$13$sQJvTW30SeM6PmbfkZtWhOxmXrbIspYw9Q/jxQM305X6URHT.zdnS', '0QdvCmxvpP55ChO3ff77uoHjtendB-AI', 1, 1763545599, 1763545599),
(6, 'Сергей', 'Sergey', 'sergey@mail.ru', '+79115225252', 'Спб', '$2y$13$J1kN4uZbIUsHT4gKDZXrOO05HTTpBPEIKeZJUi73xHqVzKoOw9xxi', 'e5L0FT6L4pVxZbwUP4jAyauRe45xuhPY', 0, 1763545693, 1763545693),
(7, 'тест', 'test', 'test@mail.ru', '+79528125252', '52 спб', '$2y$13$7Or/cXrGOnc57J.G437PieeHNNoYSekoEKfbyI1G2E305DCWsftce', 'nvGtwGUfDNhulWG0EWQ67WGRpItu7gec', 0, 1763545915, 1763545915);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-application-user_id` (`user_id`),
  ADD KEY `fk-application-profession_id` (`profession_id`);

--
-- Индексы таблицы `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `application`
--
ALTER TABLE `application`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `profession`
--
ALTER TABLE `profession`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `fk-application-profession_id` FOREIGN KEY (`profession_id`) REFERENCES `profession` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-application-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
