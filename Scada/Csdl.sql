-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 31, 2024 lúc 09:34 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hmi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `ID đơn hàng` int(11) NOT NULL,
  `Thành công` int(11) NOT NULL DEFAULT 0,
  `Số lần bơm` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`ID đơn hàng`, `Thành công`, `Số lần bơm`) VALUES
(0, 1, 1),
(1, 0, 1),
(0, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deal`
--

CREATE TABLE `deal` (
  `id` int(11) NOT NULL,
  `Số lần bơm bình 1` int(11) NOT NULL DEFAULT 0,
  `Số lần bơm bình 2` int(11) NOT NULL DEFAULT 0,
  `Số lần bơm bình 3` int(11) NOT NULL DEFAULT 0,
  `Mức ưu tiên bình 1` int(11) NOT NULL,
  `Mức ưu tiên bình 2` int(11) NOT NULL,
  `Mức ưu tiên bình 3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `deal`
--

INSERT INTO `deal` (`id`, `Số lần bơm bình 1`, `Số lần bơm bình 2`, `Số lần bơm bình 3`, `Mức ưu tiên bình 1`, `Mức ưu tiên bình 2`, `Mức ưu tiên bình 3`) VALUES
(0, 3, 0, 2, 1, 2, 3),
(1, 2, 1, 1, 3, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `error code`
--

CREATE TABLE `error code` (
  `id` int(11) NOT NULL,
  `Đặc điểm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `error code`
--

INSERT INTO `error code` (`id`, `Đặc điểm`) VALUES
(0, 'ID người dùng không hợp lệ (01-99)'),
(1, 'pH không hợp lệ (01-13)'),
(2, 'Thời gian empty không hợp lệ (>0)'),
(3, 'Thời gian check không hợp lệ (>0)'),
(4, 'Giá trị ưu tiên không hợp lệ (chỉ 1,2,3)'),
(5, 'Pump 1 bơm không đầy'),
(6, 'Pump 2 bơm không đầy'),
(7, 'Pump 3 bơm không đầy'),
(8, 'Valve cấp 1 xả không cạn'),
(9, 'Valve cấp 2 xả không cạn'),
(10, 'Valve cấp 3 xả không cạn'),
(11, 'Cơ cấu chấp hành không chạy khi đang làm việc'),
(12, 'Thời gian giới hạn không hợp lệ (>=50)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `ID người dùng` int(11) NOT NULL,
  `Nút đã nhấn` text NOT NULL,
  `Địa chỉ nút` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`ID người dùng`, `Nút đã nhấn`, `Địa chỉ nút`) VALUES
(10, 'Start', '0.00'),
(10, 'Auto', '0.02'),
(10, 'Start', '0.00'),
(10, 'Auto', '0.02'),
(10, 'Start', '0.00'),
(10, 'Auto', '0.02'),
(10, 'Stop', '0.01'),
(10, 'Start', '0.00'),
(10, 'Stop', '0.01'),
(10, 'Start', '0.00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warn`
--

CREATE TABLE `warn` (
  `ID lỗi` int(11) NOT NULL,
  `Nội dung` text NOT NULL,
  `ID người dùng` int(11) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `warn`
--

INSERT INTO `warn` (`ID lỗi`, `Nội dung`, `ID người dùng`) VALUES
(0, 'ID người dùng không hợp lệ (01-99)', -1),
(1, 'pH không hợp lệ (01-13)', 10),
(8, 'Valve cấp 1 xả không cạn', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `water`
--

CREATE TABLE `water` (
  `id` int(11) NOT NULL,
  `Đặc điểm` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `water`
--

INSERT INTO `water` (`id`, `Đặc điểm`) VALUES
(0, 'Nước công nghiệp'),
(1, 'Nước tưới cây'),
(2, 'Nước sạch');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `error code`
--
ALTER TABLE `error code`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
