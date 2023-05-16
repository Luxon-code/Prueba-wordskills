-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2023 a las 23:46:30
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionlibros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestionlibros_cliente`
--

CREATE TABLE `appgestionlibros_cliente` (
  `id` bigint(20) NOT NULL,
  `cliNombre` varchar(45) NOT NULL COMMENT 'Nombre del cliente',
  `cliApellido` varchar(45) NOT NULL COMMENT 'Apellido del cliente',
  `cliTelefono` varchar(45) NOT NULL COMMENT 'Telefono del cliente',
  `cliCorreo` varchar(45) NOT NULL COMMENT 'Correo electronico del cliente',
  `cliDireccion` varchar(45) NOT NULL COMMENT 'Direccion fisica del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `appgestionlibros_cliente`
--

INSERT INTO `appgestionlibros_cliente` (`id`, `cliNombre`, `cliApellido`, `cliTelefono`, `cliCorreo`, `cliDireccion`) VALUES
(1, 'Joseph', 'Trujillo', '1324324', 'trujillojoseph66@gmail.com', 'carrera 7 #12-68'),
(2, 'David', 'Cuellar', '1046457', 'naakbzj@gan', 'calle 34# 133');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestionlibros_libro`
--

CREATE TABLE `appgestionlibros_libro` (
  `id` bigint(20) NOT NULL,
  `libNombre` varchar(45) NOT NULL COMMENT 'Título del libro es el nombre principal que lo identifica',
  `libAutor` varchar(45) NOT NULL COMMENT 'Autor del libro',
  `libISBN` varchar(50) NOT NULL COMMENT 'Código único asignado a cada libro',
  `libGenero` varchar(50) NOT NULL COMMENT 'Genero del libro',
  `libAnoPublicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `appgestionlibros_libro`
--

INSERT INTO `appgestionlibros_libro` (`id`, `libNombre`, `libAutor`, `libISBN`, `libGenero`, `libAnoPublicacion`) VALUES
(1, 'Mil años de soledad', 'Gabriel', '21334', 'Novela', 2005),
(3, 'Nuevo libro', 'Gabriel', '2133487', 'Ciencia ficcion', 2010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appgestionlibros_prestamo`
--

CREATE TABLE `appgestionlibros_prestamo` (
  `id` bigint(20) NOT NULL,
  `preCodigo` varchar(45) NOT NULL COMMENT 'Codigo unico de prestamo',
  `preFechaPrestamo` date NOT NULL COMMENT 'Corresponde a la fecha que el libro es retirado',
  `preFechaEntrega` date NOT NULL COMMENT 'Corresponde a la fecha que el libro es regresado ',
  `preEstado` varchar(40) DEFAULT NULL,
  `preCliente_id` bigint(20) NOT NULL COMMENT 'Hace relación al elemento FK',
  `preLibro_id` bigint(20) NOT NULL COMMENT 'Hace relación al elemento FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `appgestionlibros_prestamo`
--

INSERT INTO `appgestionlibros_prestamo` (`id`, `preCodigo`, `preFechaPrestamo`, `preFechaEntrega`, `preEstado`, `preCliente_id`, `preLibro_id`) VALUES
(1, 'PRES00001', '2023-05-16', '2023-05-31', 'En prestamo', 1, 1),
(2, 'PRES00002', '2023-05-16', '2023-05-31', 'En prestamo', 1, 1),
(3, 'PRES00003', '2023-05-16', '2023-05-30', 'En prestamo', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add libro', 8, 'add_libro'),
(30, 'Can change libro', 8, 'change_libro'),
(31, 'Can delete libro', 8, 'delete_libro'),
(32, 'Can view libro', 8, 'view_libro'),
(33, 'Can add prestamo', 9, 'add_prestamo'),
(34, 'Can change prestamo', 9, 'change_prestamo'),
(35, 'Can delete prestamo', 9, 'delete_prestamo'),
(36, 'Can view prestamo', 9, 'view_prestamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'appGestionLibros', 'cliente'),
(8, 'appGestionLibros', 'libro'),
(9, 'appGestionLibros', 'prestamo'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-05-16 18:49:32.846523'),
(2, 'auth', '0001_initial', '2023-05-16 18:49:33.401547'),
(3, 'admin', '0001_initial', '2023-05-16 18:49:33.525202'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-05-16 18:49:33.535196'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-05-16 18:49:33.543206'),
(6, 'appGestionLibros', '0001_initial', '2023-05-16 18:49:33.738303'),
(7, 'contenttypes', '0002_remove_content_type_name', '2023-05-16 18:49:33.805852'),
(8, 'auth', '0002_alter_permission_name_max_length', '2023-05-16 18:49:33.866535'),
(9, 'auth', '0003_alter_user_email_max_length', '2023-05-16 18:49:33.928066'),
(10, 'auth', '0004_alter_user_username_opts', '2023-05-16 18:49:33.938068'),
(11, 'auth', '0005_alter_user_last_login_null', '2023-05-16 18:49:33.981055'),
(12, 'auth', '0006_require_contenttypes_0002', '2023-05-16 18:49:33.985062'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2023-05-16 18:49:33.993061'),
(14, 'auth', '0008_alter_user_username_max_length', '2023-05-16 18:49:34.014128'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2023-05-16 18:49:34.035120'),
(16, 'auth', '0010_alter_group_name_max_length', '2023-05-16 18:49:34.094142'),
(17, 'auth', '0011_update_proxy_permissions', '2023-05-16 18:49:34.105659'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2023-05-16 18:49:34.128653'),
(19, 'sessions', '0001_initial', '2023-05-16 18:49:34.163659'),
(20, 'appGestionLibros', '0002_rename_libañopublicacion_libro_libanopublicacion', '2023-05-16 20:45:49.098721'),
(21, 'appGestionLibros', '0003_alter_prestamo_preestado', '2023-05-16 21:20:20.656550');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appgestionlibros_cliente`
--
ALTER TABLE `appgestionlibros_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `appgestionlibros_libro`
--
ALTER TABLE `appgestionlibros_libro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `libISBN` (`libISBN`);

--
-- Indices de la tabla `appgestionlibros_prestamo`
--
ALTER TABLE `appgestionlibros_prestamo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `preCodigo` (`preCodigo`),
  ADD KEY `appGestionLibros_pre_preCliente_id_14db6e37_fk_appGestio` (`preCliente_id`),
  ADD KEY `appGestionLibros_pre_preLibro_id_4670dac8_fk_appGestio` (`preLibro_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appgestionlibros_cliente`
--
ALTER TABLE `appgestionlibros_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `appgestionlibros_libro`
--
ALTER TABLE `appgestionlibros_libro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `appgestionlibros_prestamo`
--
ALTER TABLE `appgestionlibros_prestamo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appgestionlibros_prestamo`
--
ALTER TABLE `appgestionlibros_prestamo`
  ADD CONSTRAINT `appGestionLibros_pre_preCliente_id_14db6e37_fk_appGestio` FOREIGN KEY (`preCliente_id`) REFERENCES `appgestionlibros_cliente` (`id`),
  ADD CONSTRAINT `appGestionLibros_pre_preLibro_id_4670dac8_fk_appGestio` FOREIGN KEY (`preLibro_id`) REFERENCES `appgestionlibros_libro` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
