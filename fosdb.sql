-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-01-2020 a las 22:58:35
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fosdb`
--

-- --------------------------------------------------------

create database fosdb;
use fosdb;
--
-- Estructura de tabla para la tabla `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `ID` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_admin`
--

INSERT INTO `tbl_admin` (`ID`, `username`, `password`) VALUES
(0, 'admin', '1234abcd..');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menuID` int(11) NOT NULL,
  `menuName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`menuID`, `menuName`) VALUES
(8, 'Cerveza'),
(9, 'Trago'),
(10, 'Bebidas'),
(11, 'Coctel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menuitem`
--

CREATE TABLE `tbl_menuitem` (
  `itemID` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  `menuItemName` text NOT NULL,
  `price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_menuitem`
--

INSERT INTO `tbl_menuitem` (`itemID`, `menuID`, `menuItemName`, `price`) VALUES
(17, 8, 'Cerveza Artesanal', '5000.00'),
(19, 8, 'Cerveza Club Colombia', '5000.00'),
(20, 8, 'Cerveza Poker', '6000.00'),
(21, 8, 'Cervaza Aguila', '6000.00'),
(22, 8, 'Cerveza Costeña', '6000.00'),
(23, 9, 'Ron', '6000.00'),
(24, 9, 'Whisky', '6000.00'),
(25, 9, 'Vodka', '6000.00'),
(26, 9, 'Aguardiente', '6000.00'),
(27, 9, 'Ginebra', '6000.00'),
(28, 9, 'Tequila', '6000.00'),
(29, 9, 'Pisco', '6000.00'),
(30, 10, 'Tinto', '1000.00'),
(31, 10, 'CafÃ© con Leche', '1200.00'),
(32, 10, 'Gaseosa 350 ML', '2000.00'),
(33, 10, 'Gaseosa 200 ML', '1500.00'),
(34, 10, 'Jugo Natural en Agua', '4000.00'),
(35, 10, 'Jugo Natural en Leche', '5000.00'),
(36, 10, 'Jugo de Naranja', '3500.00'),
(37, 9, 'Brandy', '3000.00'),
(38, 11, 'Margarita', '3000.00'),
(39, 11, 'Mojito', '3000.00'),
(40, 11, 'Caipirinha', '3000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_order`
--

CREATE TABLE `tbl_order` (
  `orderID` int(11) NOT NULL,
  `status` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_order`
--

INSERT INTO `tbl_order` (`orderID`, `status`, `total`, `order_date`) VALUES
(1, 'finish', '1000.00', '2020-01-17'),
(2, 'finish', '10000.00', '2020-01-17'),
(3, 'ready', '11000.00', '2020-01-18'),
(4, 'cancelled', '6000.00', '2020-01-18'),
(5, 'preparing', '10000.00', '2020-01-25'),
(6, 'waiting', '15500.00', '2020-01-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_orderdetail`
--

CREATE TABLE `tbl_orderdetail` (
  `orderID` int(11) NOT NULL,
  `orderDetailID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_orderdetail`
--

INSERT INTO `tbl_orderdetail` (`orderID`, `orderDetailID`, `itemID`, `quantity`) VALUES
(1, 1, 14, 1),
(2, 2, 13, 1),
(2, 3, 14, 1),
(2, 4, 15, 1),
(2, 5, 16, 1),
(3, 6, 25, 1),
(3, 7, 38, 1),
(3, 8, 32, 1),
(4, 9, 17, 1),
(4, 10, 30, 1),
(5, 11, 17, 2),
(6, 12, 23, 1),
(6, 13, 26, 1),
(6, 14, 36, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_role`
--

INSERT INTO `tbl_role` (`role`) VALUES
('cajero'),
('Mesero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `staffID` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` text NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_staff`
--

INSERT INTO `tbl_staff` (`staffID`, `username`, `password`, `status`, `role`) VALUES
(1, 'Juan', '1234abcd..', 'Online', 'cajero'),
(4, 'Pedro', '1234abcd..', 'Online', 'Mesero'),
(5, 'Emily', '1234abcd..', 'Online', 'cajero'),
(6, 'Robert', '1234abcd..', 'Online', 'cajero'),
(7, 'Sofia', 'abc123', 'Offline', 'Mesero'),
(9, 'Marin', '1234abcd..', 'Online', 'cajero');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menuID`);

--
-- Indices de la tabla `tbl_menuitem`
--
ALTER TABLE `tbl_menuitem`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `menuID` (`menuID`);

--
-- Indices de la tabla `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`orderID`);

--
-- Indices de la tabla `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  ADD PRIMARY KEY (`orderDetailID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `orderID` (`orderID`);

--
-- Indices de la tabla `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_menuitem`
--
ALTER TABLE `tbl_menuitem`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `staffID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
