-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2023 a las 11:35:17
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marca_id` bigint(20) UNSIGNED DEFAULT NULL,
  `medida_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra` decimal(8,2) NOT NULL DEFAULT 0.00,
  `venta` decimal(8,2) NOT NULL DEFAULT 0.00,
  `stock_minimo` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `nombre`, `barra`, `marca_id`, `medida_id`, `categoria_id`, `compra`, `venta`, `stock_minimo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'IPHONE  X', '010101', 1, 1, 1, '1000.00', '1500.00', '2.00', 1, '2022-11-20 02:40:00', '2022-11-20 02:40:00'),
(2, 'producto 2', '0101010', 1, 1, 1, '10.00', '10.00', '2.00', 0, '2022-11-20 14:57:57', '2022-11-25 13:25:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_images`
--

CREATE TABLE `articulo_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `articulo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articulo_images`
--

INSERT INTO `articulo_images` (`id`, `articulo_id`, `image_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '2022-11-20 12:37:41', '2022-11-20 14:14:37'),
(2, 1, 2, 0, '2022-11-20 13:21:02', '2022-11-20 14:14:34'),
(3, 1, 3, 0, '2022-11-20 14:14:42', '2022-11-20 14:16:24'),
(4, 1, 4, 0, '2022-11-20 14:16:20', '2022-11-20 14:16:30'),
(5, 1, 5, 0, '2022-11-20 14:16:27', '2022-11-20 14:55:13'),
(6, 1, 6, 0, '2022-11-20 14:47:54', '2022-11-20 14:47:59'),
(7, 2, 7, 1, '2022-11-20 14:58:05', '2022-11-20 14:58:05'),
(8, 1, 8, 0, '2022-11-20 14:59:38', '2022-11-20 14:59:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

CREATE TABLE `cajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `user_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2022-11-20 00:49:33', '2022-11-22 13:00:54'),
(2, 1, 0, '2022-11-22 13:00:54', '2022-11-22 13:28:52'),
(3, 1, 1, '2022-11-22 13:28:52', '2022-11-22 13:28:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_compras`
--

CREATE TABLE `caja_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_compras`
--

INSERT INTO `caja_compras` (`id`, `caja_id`, `compra_id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '1000.00', 1, '2022-11-25 13:26:49', '2022-11-25 13:26:49'),
(2, 3, 2, '1000.00', 1, '2023-01-05 06:37:00', '2023-01-05 06:37:00'),
(3, 3, 3, '3000.00', 1, '2023-01-05 06:37:05', '2023-01-05 06:37:05'),
(4, 3, 4, '22000.00', 1, '2023-03-31 15:03:15', '2023-03-31 15:03:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_movimientos`
--

CREATE TABLE `caja_movimientos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_movimientos`
--

INSERT INTO `caja_movimientos` (`id`, `motivo`, `caja_id`, `monto`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'sa', 3, '1.00', 1, 1, '2023-03-31 15:02:30', '2023-03-31 15:02:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_ventas`
--

CREATE TABLE `caja_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caja_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `monto` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `caja_ventas`
--

INSERT INTO `caja_ventas` (`id`, `caja_id`, `venta_id`, `monto`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1500.00', 1, '2022-11-20 11:58:30', '2022-11-20 11:58:30'),
(2, 2, 2, '1510.00', 0, '2022-11-22 13:02:12', '2022-11-22 13:27:00'),
(3, 2, 3, '20.00', 1, '2022-11-22 13:14:05', '2022-11-22 13:14:05'),
(4, 2, 4, '10.00', 0, '2022-11-22 13:27:46', '2022-11-22 13:27:56'),
(5, 3, 5, '1500.00', 0, '2022-11-22 13:29:00', '2022-11-22 13:29:15'),
(6, 3, 6, '3010.00', 1, '2022-11-22 14:16:27', '2022-11-22 14:16:27'),
(7, 3, 7, '1500.00', 1, '2023-01-05 04:29:33', '2023-01-05 04:29:33'),
(8, 3, 8, '1500.00', 1, '2023-01-05 04:47:47', '2023-01-05 04:47:47'),
(9, 3, 9, '1500.00', 1, '2023-01-05 04:49:23', '2023-01-05 04:49:23'),
(10, 3, 10, '1500.00', 1, '2023-01-05 04:50:06', '2023-01-05 04:50:06'),
(11, 3, 11, '1500.00', 1, '2023-01-05 04:51:07', '2023-01-05 04:51:07'),
(12, 3, 12, '1500.00', 1, '2023-01-05 04:51:13', '2023-01-05 04:51:13'),
(13, 3, 13, '1500.00', 1, '2023-01-05 04:56:28', '2023-01-05 04:56:28'),
(14, 3, 14, '1500.00', 1, '2023-01-05 04:57:44', '2023-01-05 04:57:44'),
(15, 3, 15, '1500.00', 1, '2023-01-05 06:46:13', '2023-01-05 06:46:13'),
(16, 3, 16, '3000.00', 1, '2023-01-05 06:46:18', '2023-01-05 06:46:18'),
(17, 3, 17, '3000.00', 1, '2023-01-05 06:46:50', '2023-01-05 06:46:50'),
(18, 3, 18, '1500.00', 1, '2023-01-05 06:47:16', '2023-01-05 06:47:16'),
(19, 3, 19, '1500.00', 1, '2023-01-05 06:47:26', '2023-01-05 06:47:26'),
(20, 3, 20, '1500.00', 1, '2023-01-05 06:48:08', '2023-01-05 06:48:08'),
(21, 3, 21, '1500.00', 1, '2023-01-05 06:48:12', '2023-01-05 06:48:12'),
(22, 3, 22, '1500.00', 1, '2023-01-05 06:50:10', '2023-01-05 06:50:10'),
(23, 3, 23, '1500.00', 1, '2023-01-05 06:50:15', '2023-01-05 06:50:15'),
(24, 3, 24, '1500.00', 1, '2023-01-05 07:16:00', '2023-01-05 07:16:00'),
(25, 3, 25, '1500.00', 1, '2023-01-05 07:18:44', '2023-01-05 07:18:44'),
(26, 3, 26, '1500.00', 1, '2023-01-05 07:18:51', '2023-01-05 07:18:51'),
(27, 3, 27, '1500.00', 1, '2023-01-05 07:19:44', '2023-01-05 07:19:44'),
(28, 3, 28, '1500.00', 1, '2023-01-05 07:19:55', '2023-01-05 07:19:55'),
(29, 3, 29, '1500.00', 1, '2023-01-05 07:20:39', '2023-01-05 07:20:39'),
(30, 3, 30, '1500.00', 1, '2023-01-05 07:20:46', '2023-01-05 07:20:46'),
(31, 3, 31, '1500.00', 1, '2023-01-05 07:20:51', '2023-01-05 07:20:51'),
(32, 3, 32, '1200.00', 1, '2023-01-05 07:22:00', '2023-01-05 07:22:00'),
(33, 3, 33, '1500.00', 1, '2023-01-11 08:05:39', '2023-01-11 08:05:39'),
(34, 3, 34, '1500.00', 1, '2023-01-11 08:11:20', '2023-01-11 08:11:20'),
(35, 3, 35, '1500.00', 1, '2023-01-11 08:11:32', '2023-01-11 08:11:32'),
(36, 3, 36, '1500.00', 1, '2023-03-31 15:52:37', '2023-03-31 15:52:37'),
(37, 3, 37, '1500.00', 1, '2023-03-31 16:02:34', '2023-03-31 16:02:34'),
(38, 3, 38, '1500.00', 1, '2023-03-31 16:02:41', '2023-03-31 16:02:41'),
(39, 3, 39, '1500.00', 1, '2023-03-31 16:02:56', '2023-03-31 16:02:56'),
(40, 3, 40, '0.00', 1, '2023-03-31 16:02:59', '2023-03-31 16:02:59'),
(41, 3, 41, '1500.00', 1, '2023-03-31 16:50:44', '2023-03-31 16:50:44'),
(42, 3, 42, '1500.00', 1, '2023-03-31 16:52:20', '2023-03-31 16:52:20'),
(43, 3, 43, '1500.00', 1, '2023-03-31 17:01:12', '2023-03-31 17:01:12'),
(44, 3, 44, '1500.00', 1, '2023-03-31 17:13:54', '2023-03-31 17:13:54'),
(45, 3, 45, '1500.00', 1, '2023-03-31 17:21:27', '2023-03-31 17:21:27'),
(46, 3, 46, '1500.00', 1, '2023-03-31 17:26:34', '2023-03-31 17:26:34'),
(47, 3, 47, '1500.00', 1, '2023-03-31 17:26:53', '2023-03-31 17:26:53'),
(48, 3, 48, '1500.00', 1, '2023-03-31 17:34:30', '2023-03-31 17:34:30'),
(49, 3, 49, '1500.00', 1, '2023-03-31 17:34:38', '2023-03-31 17:34:38'),
(50, 3, 50, '1500.00', 1, '2023-03-31 17:35:09', '2023-03-31 17:35:09'),
(51, 3, 51, '1500.00', 1, '2023-03-31 17:35:39', '2023-03-31 17:35:39'),
(52, 3, 52, '0.00', 1, '2023-03-31 17:35:44', '2023-03-31 17:35:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'CELULARES', 1, '2022-11-20 02:36:28', '2022-11-20 02:36:28'),
(2, 'LAPTOPS', 1, '2022-11-20 02:36:35', '2022-11-20 02:36:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proveedor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `motivo`, `proveedor`, `total`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, NULL, 'PUBLICO GENERAL', '1000.00', 1, 1, '2022-11-25 13:26:49', '2022-11-25 13:26:49'),
(2, NULL, 'PUBLICO GENERAL', '1000.00', 1, 1, '2023-01-05 06:37:00', '2023-01-05 06:37:00'),
(3, NULL, 'PUBLICO GENERAL', '3000.00', 1, 1, '2023-01-05 06:37:05', '2023-01-05 06:37:05'),
(4, NULL, 'PUBLICO GENERAL', '22000.00', 1, 1, '2023-03-31 15:03:15', '2023-03-31 15:03:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_inventarios`
--

CREATE TABLE `compra_inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cantidad` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra_inventarios`
--

INSERT INTO `compra_inventarios` (`id`, `inventario_id`, `compra_id`, `precio`, `cantidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '1000.00', '1.00', 1, '2022-11-25 13:26:49', '2022-11-25 13:26:49'),
(2, 19, 2, '1000.00', '1.00', 1, '2023-01-05 06:37:00', '2023-01-05 06:37:00'),
(3, 20, 3, '1000.00', '3.00', 1, '2023-01-05 06:37:05', '2023-01-05 06:37:05'),
(4, 42, 4, '1000.00', '22.00', 1, '2023-03-31 15:03:15', '2023-03-31 15:03:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `path`, `estado`, `created_at`, `updated_at`) VALUES
(1, '/storage/articulos/1DwIUptTlTbgLRIre0MnSNnkcYNVAntLIsGnQfdY.webp', 1, '2022-11-20 12:37:41', '2022-11-20 12:37:41'),
(2, '/storage/articulos/UC319PFFHvPNgBnKrtH8CsVRtkLG8z2X3QLuGGXQ.webp', 1, '2022-11-20 13:21:02', '2022-11-20 13:21:02'),
(3, '/storage/articulos/MtrKRrDuXvMlkWHEknKau20qeUIuE0J04P738SI6.webp', 1, '2022-11-20 14:14:42', '2022-11-20 14:14:42'),
(4, '/storage/articulos/5Xn1dMsInDO5jpapcELN6nwdKRnP8ostHkMfnslU.webp', 1, '2022-11-20 14:16:20', '2022-11-20 14:16:20'),
(5, '/storage/articulos/n2tWJqHiSswTENBHFgWp7GzhOlbW0EgqW3S5mofE.webp', 1, '2022-11-20 14:16:27', '2022-11-20 14:16:27'),
(6, '/storage/articulos/OqdaWkuoe3v8kMIWL6Xjuk2we2itk6bUrFJ8LLPu.webp', 1, '2022-11-20 14:47:54', '2022-11-20 14:47:54'),
(7, '/storage/articulos/k0kQL4CROZe37QeNaDWG3TIjx8b2M4R0izfGMbos.webp', 1, '2022-11-20 14:58:05', '2022-11-20 14:58:05'),
(8, '/storage/articulos/22q2dOqUaKFRqmrg0FwYsBMQmPlzdf5jApY3Hhal.webp', 1, '2022-11-20 14:59:38', '2022-11-20 14:59:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `articulo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `compra` decimal(8,2) NOT NULL DEFAULT 0.00,
  `venta` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cantidad` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inventarios`
--

INSERT INTO `inventarios` (`id`, `motivo`, `articulo_id`, `compra`, `venta`, `cantidad`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, '1000.00', '1500.00', '10.00', 1, 1, '2022-11-20 11:58:19', '2022-11-20 11:58:19'),
(2, 'Venta #2', 1, '1000.00', '1500.00', '1.00', 2, 1, '2022-11-20 11:58:30', '2022-11-20 11:58:30'),
(3, 'Venta #3', 1, '1000.00', '1500.00', '1.00', 2, 1, '2022-11-22 13:02:12', '2022-11-22 13:02:12'),
(4, 'Venta #3', 2, '10.00', '10.00', '1.00', 2, 1, '2022-11-22 13:02:12', '2022-11-22 13:02:12'),
(5, 'Venta #4', 2, '10.00', '10.00', '2.00', 2, 1, '2022-11-22 13:14:05', '2022-11-22 13:14:05'),
(6, 'Venta #5', 2, '10.00', '10.00', '1.00', 2, 1, '2022-11-22 13:27:46', '2022-11-22 13:27:46'),
(7, 'Venta #6', 1, '1000.00', '1500.00', '1.00', 2, 1, '2022-11-22 13:29:00', '2022-11-22 13:29:00'),
(8, 'Venta #7', 2, '10.00', '10.00', '1.00', 2, 1, '2022-11-22 14:16:27', '2022-11-22 14:16:27'),
(9, 'Venta #7', 1, '1000.00', '1500.00', '2.00', 2, 1, '2022-11-22 14:16:27', '2022-11-22 14:16:27'),
(10, 'COMPRA #2', 1, '1000.00', '1500.00', '1.00', 1, 1, '2022-11-25 13:26:49', '2022-11-25 13:26:49'),
(11, 'Venta #8', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:29:33', '2023-01-05 04:29:33'),
(12, 'Venta #9', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:47:47', '2023-01-05 04:47:47'),
(13, 'Venta #10', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:49:23', '2023-01-05 04:49:23'),
(14, 'Venta #11', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:50:06', '2023-01-05 04:50:06'),
(15, 'Venta #12', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:51:07', '2023-01-05 04:51:07'),
(16, 'Venta #13', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:51:13', '2023-01-05 04:51:13'),
(17, 'Venta #14', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:56:28', '2023-01-05 04:56:28'),
(18, 'Venta #15', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 04:57:44', '2023-01-05 04:57:44'),
(19, 'COMPRA #3', 1, '1000.00', '1500.00', '1.00', 1, 1, '2023-01-05 06:37:00', '2023-01-05 06:37:00'),
(20, 'COMPRA #4', 1, '1000.00', '1500.00', '3.00', 1, 1, '2023-01-05 06:37:05', '2023-01-05 06:37:05'),
(21, 'Venta #16', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:46:13', '2023-01-05 06:46:13'),
(22, 'Venta #17', 1, '1000.00', '1500.00', '2.00', 2, 1, '2023-01-05 06:46:18', '2023-01-05 06:46:18'),
(23, 'Venta #18', 1, '1000.00', '1500.00', '2.00', 2, 1, '2023-01-05 06:46:50', '2023-01-05 06:46:50'),
(24, 'Venta #19', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:47:16', '2023-01-05 06:47:16'),
(25, 'Venta #20', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:47:26', '2023-01-05 06:47:26'),
(26, 'Venta #21', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:48:08', '2023-01-05 06:48:08'),
(27, 'Venta #22', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:48:12', '2023-01-05 06:48:12'),
(28, 'Venta #23', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:50:10', '2023-01-05 06:50:10'),
(29, 'Venta #24', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 06:50:15', '2023-01-05 06:50:15'),
(30, 'Venta #25', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:16:00', '2023-01-05 07:16:00'),
(31, 'Venta #26', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:18:44', '2023-01-05 07:18:44'),
(32, 'Venta #27', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:18:51', '2023-01-05 07:18:51'),
(33, 'Venta #28', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:19:44', '2023-01-05 07:19:44'),
(34, 'Venta #29', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:19:55', '2023-01-05 07:19:55'),
(35, 'Venta #30', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:20:39', '2023-01-05 07:20:39'),
(36, 'Venta #31', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:20:46', '2023-01-05 07:20:46'),
(37, 'Venta #32', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:20:51', '2023-01-05 07:20:51'),
(38, 'Venta #33', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-05 07:22:00', '2023-01-05 07:22:00'),
(39, 'Venta #34', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-11 08:05:39', '2023-01-11 08:05:39'),
(40, 'Venta #35', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-11 08:11:20', '2023-01-11 08:11:20'),
(41, 'Venta #36', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-01-11 08:11:32', '2023-01-11 08:11:32'),
(42, 'COMPRA #5', 1, '1000.00', '1500.00', '22.00', 1, 1, '2023-03-31 15:03:15', '2023-03-31 15:03:15'),
(43, 'Venta #37', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 15:52:37', '2023-03-31 15:52:37'),
(44, 'Venta #38', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 16:02:34', '2023-03-31 16:02:34'),
(45, 'Venta #39', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 16:02:41', '2023-03-31 16:02:41'),
(46, 'Venta #40', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 16:02:56', '2023-03-31 16:02:56'),
(47, 'Venta #42', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 16:50:44', '2023-03-31 16:50:44'),
(48, 'Venta #43', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 16:52:20', '2023-03-31 16:52:20'),
(49, 'Venta #44', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:01:12', '2023-03-31 17:01:12'),
(50, 'Venta #45', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:13:54', '2023-03-31 17:13:54'),
(51, 'Venta #46', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:21:27', '2023-03-31 17:21:27'),
(52, 'Venta #47', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:26:34', '2023-03-31 17:26:34'),
(53, 'Venta #48', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:26:53', '2023-03-31 17:26:53'),
(54, 'Venta #49', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:34:30', '2023-03-31 17:34:30'),
(55, 'Venta #50', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:34:38', '2023-03-31 17:34:38'),
(56, 'Venta #51', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:35:09', '2023-03-31 17:35:09'),
(57, 'Venta #52', 1, '1000.00', '1500.00', '1.00', 2, 1, '2023-03-31 17:35:39', '2023-03-31 17:35:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'LG', 1, '2022-11-20 02:35:31', '2022-11-20 02:35:31'),
(2, 'SAMSUNG', 1, '2022-11-20 02:35:43', '2022-11-20 02:35:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `codigo`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'NIU', 'UNIDAD', 1, '2022-11-20 02:36:04', '2022-11-20 02:36:04'),
(2, 'KG', 'KILOGRAMO', 1, '2022-11-20 02:36:14', '2022-11-20 02:36:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos`
--

CREATE TABLE `metodos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2022_09_05_090404_create_marcas_table', 1),
(4, '2022_09_05_092110_create_medidas_table', 1),
(5, '2022_09_05_092209_create_categorias_table', 1),
(6, '2022_09_06_093457_create_articulos_table', 1),
(7, '2022_09_07_074747_create_images_table', 1),
(8, '2022_09_07_074807_create_monedas_table', 1),
(9, '2022_09_07_074909_create_moneda_images_table', 1),
(10, '2022_09_07_075218_create_sucursals_table', 1),
(11, '2022_09_07_075414_create_documentos_table', 1),
(12, '2022_09_07_075616_create_comprobantes_table', 1),
(13, '2022_09_07_075625_create_metodos_table', 1),
(14, '2022_09_07_075653_create_series_table', 1),
(15, '2022_09_07_075743_create_cajas_table', 1),
(16, '2022_09_07_075846_create_caja_movimientos_table', 1),
(17, '2022_09_07_080236_create_inventarios_table', 1),
(18, '2022_09_07_080407_create_ventas_table', 1),
(19, '2022_09_07_080449_create_venta_inventarios_table', 1),
(20, '2022_09_07_080743_create_caja_ventas_table', 1),
(21, '2022_09_07_080844_create_compras_table', 1),
(22, '2022_09_07_080910_create_compra_inventarios_table', 1),
(23, '2022_09_07_080925_create_caja_compras_table', 1),
(24, '2022_11_06_073558_create_articulo_images_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `monto` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda_images`
--

CREATE TABLE `moneda_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `moneda_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprobante_id` bigint(20) UNSIGNED DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursals`
--

CREATE TABLE `sucursals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `impresora` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `impresora_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sucursals`
--

INSERT INTO `sucursals` (`id`, `nombre`, `direccion`, `telefono`, `documento`, `impresora`, `impresora_url`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Jhony crea', 'Walter acevedo Otuzco La Libertad', '+51988714360', NULL, 'TM-20II', 'http://192.168.1.3/Udemy/printers/public/printer/', 1, '2023-01-05 03:44:35', '2023-03-31 15:50:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `nombre`, `username`, `email`, `password`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Jhony Creativo', 'demo', 'demo', '$2y$10$fco2kUp9WIgTvNVwNgPrj.j/ASCgiD.aJSYsoZgt1M6Rgenj25UDe', 1, 1, '2022-11-20 00:49:22', '2022-11-20 00:49:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cliente` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(8,2) NOT NULL DEFAULT 0.00,
  `pago` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cambio` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tipo` int(11) NOT NULL DEFAULT 1,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `motivo`, `cliente`, `total`, `pago`, `cambio`, `tipo`, `estado`, `created_at`, `updated_at`) VALUES
(1, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 0, '2022-11-20 11:58:30', '2022-11-20 12:06:55'),
(2, NULL, 'PUBLICO GENERAL', '1510.00', '0.00', '0.00', 1, 0, '2022-11-22 13:02:12', '2022-11-22 13:22:31'),
(3, NULL, 'PUBLICO GENERAL', '20.00', '0.00', '0.00', 1, 1, '2022-09-22 13:14:05', '2022-11-22 13:15:05'),
(4, NULL, 'PUBLICO GENERAL', '10.00', '0.00', '0.00', 1, 1, '2022-10-22 13:27:46', '2022-11-22 13:27:56'),
(5, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 0, '2022-11-22 13:29:00', '2022-11-22 13:29:15'),
(6, NULL, 'PUBLICO GENERAL', '3010.00', '0.00', '0.00', 1, 1, '2022-11-22 14:16:27', '2022-11-22 14:16:27'),
(7, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:29:33', '2023-01-05 04:29:33'),
(8, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:47:47', '2023-01-05 04:47:47'),
(9, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:49:23', '2023-01-05 04:49:23'),
(10, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:50:06', '2023-01-05 04:50:06'),
(11, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:51:07', '2023-01-05 04:51:07'),
(12, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:51:13', '2023-01-05 04:51:13'),
(13, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:56:28', '2023-01-05 04:56:28'),
(14, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 04:57:44', '2023-01-05 04:57:44'),
(15, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:46:13', '2023-01-05 06:46:13'),
(16, NULL, 'PUBLICO GENERAL', '3000.00', '0.00', '0.00', 1, 1, '2023-01-05 06:46:18', '2023-01-05 06:46:18'),
(17, NULL, 'PUBLICO GENERAL', '3000.00', '0.00', '0.00', 1, 1, '2023-01-05 06:46:50', '2023-01-05 06:46:50'),
(18, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:47:16', '2023-01-05 06:47:16'),
(19, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:47:26', '2023-01-05 06:47:26'),
(20, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:48:08', '2023-01-05 06:48:08'),
(21, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:48:12', '2023-01-05 06:48:12'),
(22, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:50:10', '2023-01-05 06:50:10'),
(23, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 06:50:15', '2023-01-05 06:50:15'),
(24, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:16:00', '2023-01-05 07:16:00'),
(25, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:18:44', '2023-01-05 07:18:44'),
(26, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:18:51', '2023-01-05 07:18:51'),
(27, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:19:44', '2023-01-05 07:19:44'),
(28, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:19:55', '2023-01-05 07:19:55'),
(29, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:20:38', '2023-01-05 07:20:38'),
(30, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:20:46', '2023-01-05 07:20:46'),
(31, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-05 07:20:51', '2023-01-05 07:20:51'),
(32, NULL, 'PUBLICO GENERAL', '1200.00', '0.00', '0.00', 1, 1, '2023-01-05 07:22:00', '2023-01-05 07:22:00'),
(33, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-11 08:05:39', '2023-01-11 08:05:39'),
(34, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-11 08:11:20', '2023-01-11 08:11:20'),
(35, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-01-11 08:11:32', '2023-01-11 08:11:32'),
(36, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 15:52:37', '2023-03-31 15:52:37'),
(37, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 16:02:34', '2023-03-31 16:02:34'),
(38, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 16:02:41', '2023-03-31 16:02:41'),
(39, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 16:02:56', '2023-03-31 16:02:56'),
(40, NULL, 'PUBLICO GENERAL', '0.00', '0.00', '0.00', 1, 1, '2023-03-31 16:02:59', '2023-03-31 16:02:59'),
(41, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 16:50:44', '2023-03-31 16:50:44'),
(42, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 16:52:20', '2023-03-31 16:52:20'),
(43, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:01:12', '2023-03-31 17:01:12'),
(44, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:13:54', '2023-03-31 17:13:54'),
(45, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:21:27', '2023-03-31 17:21:27'),
(46, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:26:34', '2023-03-31 17:26:34'),
(47, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:26:53', '2023-03-31 17:26:53'),
(48, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:34:30', '2023-03-31 17:34:30'),
(49, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:34:38', '2023-03-31 17:34:38'),
(50, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:35:09', '2023-03-31 17:35:09'),
(51, NULL, 'PUBLICO GENERAL', '1500.00', '0.00', '0.00', 1, 1, '2023-03-31 17:35:39', '2023-03-31 17:35:39'),
(52, NULL, 'PUBLICO GENERAL', '0.00', '0.00', '0.00', 1, 1, '2023-03-31 17:35:44', '2023-03-31 17:35:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_inventarios`
--

CREATE TABLE `venta_inventarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `inventario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `venta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `precio` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cantidad` decimal(8,2) NOT NULL DEFAULT 0.00,
  `estado` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_inventarios`
--

INSERT INTO `venta_inventarios` (`id`, `inventario_id`, `venta_id`, `precio`, `cantidad`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '1500.00', '1.00', 1, '2022-11-20 11:58:30', '2022-11-20 11:58:30'),
(2, 3, 2, '1500.00', '1.00', 1, '2022-11-22 13:02:12', '2022-11-22 13:02:12'),
(3, 4, 2, '10.00', '1.00', 1, '2022-11-22 13:02:12', '2022-11-22 13:02:12'),
(4, 5, 3, '10.00', '2.00', 1, '2022-11-22 13:14:05', '2022-11-22 13:14:05'),
(5, 6, 4, '10.00', '1.00', 1, '2022-11-22 13:27:46', '2022-11-22 13:27:46'),
(6, 7, 5, '1500.00', '1.00', 1, '2022-11-22 13:29:00', '2022-11-22 13:29:00'),
(7, 8, 6, '10.00', '1.00', 1, '2022-11-22 14:16:27', '2022-11-22 14:16:27'),
(8, 9, 6, '1500.00', '2.00', 1, '2022-11-22 14:16:27', '2022-11-22 14:16:27'),
(9, 11, 7, '1500.00', '1.00', 1, '2023-01-05 04:29:33', '2023-01-05 04:29:33'),
(10, 12, 8, '1500.00', '1.00', 1, '2023-01-05 04:47:47', '2023-01-05 04:47:47'),
(11, 13, 9, '1500.00', '1.00', 1, '2023-01-05 04:49:23', '2023-01-05 04:49:23'),
(12, 14, 10, '1500.00', '1.00', 1, '2023-01-05 04:50:06', '2023-01-05 04:50:06'),
(13, 15, 11, '1500.00', '1.00', 1, '2023-01-05 04:51:07', '2023-01-05 04:51:07'),
(14, 16, 12, '1500.00', '1.00', 1, '2023-01-05 04:51:13', '2023-01-05 04:51:13'),
(15, 17, 13, '1500.00', '1.00', 1, '2023-01-05 04:56:28', '2023-01-05 04:56:28'),
(16, 18, 14, '1500.00', '1.00', 1, '2023-01-05 04:57:44', '2023-01-05 04:57:44'),
(17, 21, 15, '1500.00', '1.00', 1, '2023-01-05 06:46:13', '2023-01-05 06:46:13'),
(18, 22, 16, '1500.00', '2.00', 1, '2023-01-05 06:46:18', '2023-01-05 06:46:18'),
(19, 23, 17, '1500.00', '2.00', 1, '2023-01-05 06:46:50', '2023-01-05 06:46:50'),
(20, 24, 18, '1500.00', '1.00', 1, '2023-01-05 06:47:16', '2023-01-05 06:47:16'),
(21, 25, 19, '1500.00', '1.00', 1, '2023-01-05 06:47:26', '2023-01-05 06:47:26'),
(22, 26, 20, '1500.00', '1.00', 1, '2023-01-05 06:48:08', '2023-01-05 06:48:08'),
(23, 27, 21, '1500.00', '1.00', 1, '2023-01-05 06:48:12', '2023-01-05 06:48:12'),
(24, 28, 22, '1500.00', '1.00', 1, '2023-01-05 06:50:10', '2023-01-05 06:50:10'),
(25, 29, 23, '1500.00', '1.00', 1, '2023-01-05 06:50:15', '2023-01-05 06:50:15'),
(26, 30, 24, '1500.00', '1.00', 1, '2023-01-05 07:16:00', '2023-01-05 07:16:00'),
(27, 31, 25, '1500.00', '1.00', 1, '2023-01-05 07:18:44', '2023-01-05 07:18:44'),
(28, 32, 26, '1500.00', '1.00', 1, '2023-01-05 07:18:51', '2023-01-05 07:18:51'),
(29, 33, 27, '1500.00', '1.00', 1, '2023-01-05 07:19:44', '2023-01-05 07:19:44'),
(30, 34, 28, '1500.00', '1.00', 1, '2023-01-05 07:19:55', '2023-01-05 07:19:55'),
(31, 35, 29, '1500.00', '1.00', 1, '2023-01-05 07:20:39', '2023-01-05 07:20:39'),
(32, 36, 30, '1500.00', '1.00', 1, '2023-01-05 07:20:46', '2023-01-05 07:20:46'),
(33, 37, 31, '1500.00', '1.00', 1, '2023-01-05 07:20:51', '2023-01-05 07:20:51'),
(34, 38, 32, '1200.00', '1.00', 1, '2023-01-05 07:22:00', '2023-01-05 07:22:00'),
(35, 39, 33, '1500.00', '1.00', 1, '2023-01-11 08:05:39', '2023-01-11 08:05:39'),
(36, 40, 34, '1500.00', '1.00', 1, '2023-01-11 08:11:20', '2023-01-11 08:11:20'),
(37, 41, 35, '1500.00', '1.00', 1, '2023-01-11 08:11:32', '2023-01-11 08:11:32'),
(38, 43, 36, '1500.00', '1.00', 1, '2023-03-31 15:52:37', '2023-03-31 15:52:37'),
(39, 44, 37, '1500.00', '1.00', 1, '2023-03-31 16:02:34', '2023-03-31 16:02:34'),
(40, 45, 38, '1500.00', '1.00', 1, '2023-03-31 16:02:41', '2023-03-31 16:02:41'),
(41, 46, 39, '1500.00', '1.00', 1, '2023-03-31 16:02:56', '2023-03-31 16:02:56'),
(42, 47, 41, '1500.00', '1.00', 1, '2023-03-31 16:50:44', '2023-03-31 16:50:44'),
(43, 48, 42, '1500.00', '1.00', 1, '2023-03-31 16:52:20', '2023-03-31 16:52:20'),
(44, 49, 43, '1500.00', '1.00', 1, '2023-03-31 17:01:12', '2023-03-31 17:01:12'),
(45, 50, 44, '1500.00', '1.00', 1, '2023-03-31 17:13:54', '2023-03-31 17:13:54'),
(46, 51, 45, '1500.00', '1.00', 1, '2023-03-31 17:21:27', '2023-03-31 17:21:27'),
(47, 52, 46, '1500.00', '1.00', 1, '2023-03-31 17:26:34', '2023-03-31 17:26:34'),
(48, 53, 47, '1500.00', '1.00', 1, '2023-03-31 17:26:53', '2023-03-31 17:26:53'),
(49, 54, 48, '1500.00', '1.00', 1, '2023-03-31 17:34:30', '2023-03-31 17:34:30'),
(50, 55, 49, '1500.00', '1.00', 1, '2023-03-31 17:34:38', '2023-03-31 17:34:38'),
(51, 56, 50, '1500.00', '1.00', 1, '2023-03-31 17:35:09', '2023-03-31 17:35:09'),
(52, 57, 51, '1500.00', '1.00', 1, '2023-03-31 17:35:39', '2023-03-31 17:35:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulos_marca_id_foreign` (`marca_id`),
  ADD KEY `articulos_medida_id_foreign` (`medida_id`),
  ADD KEY `articulos_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `articulo_images`
--
ALTER TABLE `articulo_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articulo_images_articulo_id_foreign` (`articulo_id`),
  ADD KEY `articulo_images_image_id_foreign` (`image_id`);

--
-- Indices de la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cajas_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_compras_caja_id_foreign` (`caja_id`),
  ADD KEY `caja_compras_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_movimientos_caja_id_foreign` (`caja_id`);

--
-- Indices de la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caja_ventas_caja_id_foreign` (`caja_id`),
  ADD KEY `caja_ventas_venta_id_foreign` (`venta_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compra_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `compra_inventarios_compra_id_foreign` (`compra_id`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventarios_articulo_id_foreign` (`articulo_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodos`
--
ALTER TABLE `metodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda_images`
--
ALTER TABLE `moneda_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `moneda_images_moneda_id_foreign` (`moneda_id`),
  ADD KEY `moneda_images_image_id_foreign` (`image_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_comprobante_id_foreign` (`comprobante_id`);

--
-- Indices de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `venta_inventarios_inventario_id_foreign` (`inventario_id`),
  ADD KEY `venta_inventarios_venta_id_foreign` (`venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articulo_images`
--
ALTER TABLE `articulo_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cajas`
--
ALTER TABLE `cajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `metodos`
--
ALTER TABLE `metodos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moneda_images`
--
ALTER TABLE `moneda_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursals`
--
ALTER TABLE `sucursals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `articulos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `articulos_medida_id_foreign` FOREIGN KEY (`medida_id`) REFERENCES `medidas` (`id`);

--
-- Filtros para la tabla `articulo_images`
--
ALTER TABLE `articulo_images`
  ADD CONSTRAINT `articulo_images_articulo_id_foreign` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`),
  ADD CONSTRAINT `articulo_images_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);

--
-- Filtros para la tabla `cajas`
--
ALTER TABLE `cajas`
  ADD CONSTRAINT `cajas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `caja_compras`
--
ALTER TABLE `caja_compras`
  ADD CONSTRAINT `caja_compras_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `caja_compras_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `caja_movimientos`
--
ALTER TABLE `caja_movimientos`
  ADD CONSTRAINT `caja_movimientos_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`);

--
-- Filtros para la tabla `caja_ventas`
--
ALTER TABLE `caja_ventas`
  ADD CONSTRAINT `caja_ventas_caja_id_foreign` FOREIGN KEY (`caja_id`) REFERENCES `cajas` (`id`),
  ADD CONSTRAINT `caja_ventas_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `compra_inventarios`
--
ALTER TABLE `compra_inventarios`
  ADD CONSTRAINT `compra_inventarios_compra_id_foreign` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`),
  ADD CONSTRAINT `compra_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `inventarios_articulo_id_foreign` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `moneda_images`
--
ALTER TABLE `moneda_images`
  ADD CONSTRAINT `moneda_images_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `moneda_images_moneda_id_foreign` FOREIGN KEY (`moneda_id`) REFERENCES `monedas` (`id`);

--
-- Filtros para la tabla `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `series_comprobante_id_foreign` FOREIGN KEY (`comprobante_id`) REFERENCES `comprobantes` (`id`);

--
-- Filtros para la tabla `venta_inventarios`
--
ALTER TABLE `venta_inventarios`
  ADD CONSTRAINT `venta_inventarios_inventario_id_foreign` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`),
  ADD CONSTRAINT `venta_inventarios_venta_id_foreign` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
