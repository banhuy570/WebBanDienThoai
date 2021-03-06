USE [master]
GO
/****** Object:  Database [BuiNguyenNgocHuyDB]    Script Date: 20-Jun-21 9:11:50 PM ******/
CREATE DATABASE [BuiNguyenNgocHuyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HoTenDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HoTenDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HoTenDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HoTenDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuiNguyenNgocHuyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET  MULTI_USER 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BuiNguyenNgocHuyDB', N'ON'
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET QUERY_STORE = OFF
GO
USE [BuiNguyenNgocHuyDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20-Jun-21 9:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20-Jun-21 9:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UnitCost] [int] NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](150) NULL,
	[IDDM] [int] NULL,
	[Description] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 20-Jun-21 9:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (1, N'Samsung', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (2, N'Apple', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (4, N'HTC', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (5, N'Lenovo', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (7, N'Sony', NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description]) VALUES (8, N'Test', N'Made in Japan 1')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (1, N'Iphone 12', 1222220, 1, N'iphone-xs-gold-600x600-2-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (2, N'Rog Phone 5 ', 12121212, 22, N'iphone-se-256gb-2020-261920-101916-200x200.jpg', 4, N'Gaming Phone Ngon nhất Năm 2021', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (3, N'iphone XR', 67466767, 1, N'iphone-8-plus-128gb-082720-052716-600x600.jpg', 5, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (4, N'Iphone X', 12000000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (5, N'Iphone 12', 1222220, 1, N'iphone-11-pro-max-512gb-gold-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (6, N'Iphone 12', 12222200, 1, N'iphone-se-128gb-2020-261820-101803-200x200.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (7, N'Iphone 12', 1222220, 1, N'iphone-7-plus-128gb-hh-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (10, N'Iphone X', 12000000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (11, N'Iphone X', 120000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (12, N'Iphone X', 1200000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (13, N'Rog Phone 5 ', 1212121, 22, N'iphone-7-plus-128gb-hh-600x600.jpg', 4, N'Gaming Phone Ngon nhất Năm 2021', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (14, N'Rog Phone 5 ', 12121, 22, N'iphone-7-plus-128gb-hh-600x600.jpg', 4, N'Gaming Phone Ngon nhất Năm 2021', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (15, N'Iphone 12', 1222220, 1, N'iphone-xs-gold-600x600-2-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (16, N'Rog Phone 5 ', 12121212, 22, N'iphone-se-256gb-2020-261920-101916-200x200.jpg', 4, N'Gaming Phone Ngon nhất Năm 2021', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (17, N'iphone XR', 67466767, 1, N'iphone-8-plus-128gb-082720-052716-600x600.jpg', 5, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (18, N'Iphone X', 12000000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (19, N'Iphone 12', 1222220, 1, N'iphone-11-pro-max-512gb-gold-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (20, N'Iphone 12', 12222200, 1, N'iphone-se-128gb-2020-261820-101803-200x200.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (21, N'Iphone 12', 1222220, 1, N'iphone-xs-gold-600x600-2-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (22, N'Rog Phone 5 ', 12121212, 22, N'iphone-se-256gb-2020-261920-101916-200x200.jpg', 4, N'Gaming Phone Ngon nhất Năm 2021', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (23, N'iphone XR', 67466767, 1, N'iphone-8-plus-128gb-082720-052716-600x600.jpg', 5, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (24, N'Iphone X', 12000000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (25, N'Iphone 12', 1222220, 1, N'iphone-11-pro-max-512gb-gold-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (26, N'Iphone 12', 12222200, 1, N'iphone-se-128gb-2020-261820-101803-200x200.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (27, N'Iphone 12', 1222220, 1, N'iphone-xs-gold-600x600-2-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (28, N'Rog Phone 5 ', 12121212, 22, N'iphone-se-256gb-2020-261920-101916-200x200.jpg', 4, N'Gaming Phone Ngon nhất Năm 2021', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (29, N'iphone XR', 67466767, 1, N'iphone-8-plus-128gb-082720-052716-600x600.jpg', 5, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (30, N'Iphone X', 12000000, 10, N'iphone-7-plus-128gb-hh-600x600.jpg', 2, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (31, N'Iphone 12', 1222220, 1, N'iphone-11-pro-max-512gb-gold-600x600.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (32, N'Iphone 12', 12222200, 1, N'iphone-se-128gb-2020-261820-101803-200x200.jpg', 1, N'ĐIện thoại Iphone 12 siêu hấp dẫn năm 2020', 1)
INSERT [dbo].[Product] ([ID], [Name], [UnitCost], [Quantity], [Image], [IDDM], [Description], [Status]) VALUES (33, N'11', 1, 11, NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (1, N'huy                                               ', N'7363a0d0604902af7b70b271a0b96480', 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (2, N'huy1                                              ', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (3, N'HUY11                                             ', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (5, N'ad1                                               ', N'5eac43aceba42c8757b54003a58277b5', 1)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (6, N'1                                                 ', N'c4ca4238a0b923820dcc509a6f75849b', 0)
INSERT [dbo].[UserAccount] ([ID], [UserName], [Password], [Status]) VALUES (7, N'1                                                 ', N'c4ca4238a0b923820dcc509a6f75849b', 1)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IDDM])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [BuiNguyenNgocHuyDB] SET  READ_WRITE 
GO
