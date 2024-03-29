USE [master]
GO
/****** Object:  Database [rumah_makan]    Script Date: 21/10/2018 20.08.38 ******/
CREATE DATABASE [rumah_makan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rumah_makan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\rumah_makan.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'rumah_makan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\rumah_makan_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [rumah_makan] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rumah_makan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rumah_makan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rumah_makan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rumah_makan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rumah_makan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rumah_makan] SET ARITHABORT OFF 
GO
ALTER DATABASE [rumah_makan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rumah_makan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rumah_makan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rumah_makan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rumah_makan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rumah_makan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rumah_makan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rumah_makan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rumah_makan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rumah_makan] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rumah_makan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rumah_makan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rumah_makan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rumah_makan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rumah_makan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rumah_makan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rumah_makan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rumah_makan] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [rumah_makan] SET  MULTI_USER 
GO
ALTER DATABASE [rumah_makan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rumah_makan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rumah_makan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rumah_makan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [rumah_makan] SET DELAYED_DURABILITY = DISABLED 
GO
USE [rumah_makan]
GO
/****** Object:  Table [dbo].[tb_employee]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_employee](
	[Id] [char](6) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Hp] [varchar](13) NOT NULL,
	[Position] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_employee_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_member]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Handphone] [varchar](13) NOT NULL,
	[JoinDate] [date] NOT NULL,
 CONSTRAINT [PK_tb_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_menu]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Photo] [nvarchar](100) NOT NULL,
	[Carbo] [int] NOT NULL,
	[Protein] [int] NOT NULL,
 CONSTRAINT [PK_tb_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_orderdetail]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_orderdetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Orderid] [char](12) NOT NULL,
	[Menuid] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Status] [varchar](11) NOT NULL,
 CONSTRAINT [PK_tb_orderdetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_orderHeader]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_orderHeader](
	[id] [char](12) NOT NULL,
	[Emp_id] [char](6) NOT NULL,
	[Mem_id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[PaymentType] [varchar](20) NULL,
	[CardNumber] [varchar](16) NULL,
	[Bank] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_orderHeader] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_detail]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_detail]
AS
SELECT        YEAR(dbo.tb_orderHeader.Date) AS Tahun, MONTH(dbo.tb_orderHeader.Date) AS Bulan, DATENAME(month, dbo.tb_orderHeader.Date) AS Month, SUM(dbo.tb_orderdetail.Qty * dbo.tb_menu.Price / 1000) 
                         AS Income
FROM            dbo.tb_menu INNER JOIN
                         dbo.tb_orderdetail ON dbo.tb_menu.id = dbo.tb_orderdetail.Menuid INNER JOIN
                         dbo.tb_orderHeader ON dbo.tb_orderdetail.Orderid = dbo.tb_orderHeader.id
GROUP BY YEAR(dbo.tb_orderHeader.Date), DATENAME(month, dbo.tb_orderHeader.Date), MONTH(dbo.tb_orderHeader.Date)

GO
/****** Object:  View [dbo].[v_detailmenu]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_detailmenu]
AS
SELECT        dbo.tb_orderdetail.Id, dbo.tb_orderdetail.Orderid, dbo.tb_menu.Name, dbo.tb_orderdetail.Qty, dbo.tb_menu.Price, dbo.tb_menu.Carbo, dbo.tb_menu.Protein, dbo.tb_orderdetail.Status, 
                         dbo.tb_orderdetail.Qty * dbo.tb_menu.Price AS Total, dbo.tb_orderdetail.Menuid
FROM            dbo.tb_menu INNER JOIN
                         dbo.tb_orderdetail ON dbo.tb_menu.id = dbo.tb_orderdetail.Menuid

GO
/****** Object:  View [dbo].[v_report]    Script Date: 21/10/2018 20.08.38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_report]
AS
SELECT        dbo.tb_orderHeader.id, dbo.tb_menu.Name, dbo.tb_orderdetail.Qty, dbo.tb_menu.Price, dbo.tb_orderdetail.Qty * dbo.tb_menu.Price AS Total, DATENAME(month, dbo.tb_orderHeader.Date) AS Month, 
                         DATENAME(year, dbo.tb_orderHeader.Date) AS Tahun, DATEPART(MONTH, dbo.tb_orderHeader.Date) AS Bulan
FROM            dbo.tb_menu INNER JOIN
                         dbo.tb_orderdetail ON dbo.tb_menu.id = dbo.tb_orderdetail.Menuid INNER JOIN
                         dbo.tb_orderHeader ON dbo.tb_orderdetail.Orderid = dbo.tb_orderHeader.id

GO
INSERT [dbo].[tb_employee] ([Id], [Name], [Email], [Password], [Hp], [Position]) VALUES (N'EM001 ', N'Stanley Giovany', N'ammar.fiky@gmail.com', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'081516171819', N'admin')
INSERT [dbo].[tb_employee] ([Id], [Name], [Email], [Password], [Hp], [Position]) VALUES (N'EM002 ', N'Grady Leif', N'grady.leif@gmail.com', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'089901020304', N'chef')
INSERT [dbo].[tb_employee] ([Id], [Name], [Email], [Password], [Hp], [Position]) VALUES (N'EM003 ', N'Hengky
', N'hengky@gmail.com', N'PJkJr+wlNU1VHa4hWQuybjjVPyFzuNPcPu5MBH56scHri4UQPjvnumE7MbtcnDYhTcnxSkL9ei/bhIVrylxEwg==', N'089899010203', N'cashier')
INSERT [dbo].[tb_employee] ([Id], [Name], [Email], [Password], [Hp], [Position]) VALUES (N'EM004 ', N'Ammar11', N'pinter11.gugel@gmail.com', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', N'0852131444859', N'admin')
SET IDENTITY_INSERT [dbo].[tb_member] ON 

INSERT [dbo].[tb_member] ([id], [Name], [Email], [Handphone], [JoinDate]) VALUES (2, N'Ammar1', N'a@a1.com', N'0293011', CAST(N'2018-05-05' AS Date))
INSERT [dbo].[tb_member] ([id], [Name], [Email], [Handphone], [JoinDate]) VALUES (7, N'Ammar1', N'a@a1.com', N'0293011', CAST(N'2018-05-05' AS Date))
INSERT [dbo].[tb_member] ([id], [Name], [Email], [Handphone], [JoinDate]) VALUES (10, N'Ammar11', N'a@1a1.com', N'02930111', CAST(N'2018-05-05' AS Date))
SET IDENTITY_INSERT [dbo].[tb_member] OFF
SET IDENTITY_INSERT [dbo].[tb_menu] ON 

INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (1, N'Risotto
', 50000, N'D:\\cobagambar\risotto.jpeg
', 150, 50)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (2, N'Lasagna
', 55000, N'D:\\cobagambar\lasagna.jpg
', 150, 200)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (3, N'Mac and Chesse', 60000, N'D:\\cobagambar\mac and cheese.jpg', 150, 75)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (4, N'French Fries', 20000, N'D:\\cobagambar\french fries.jpg', 120, 70)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (5, N'Cheese Burger', 35000, N'D:\\cobagambar\cheese burger.jpeg', 170, 120)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (6, N'Iced Coffee', 18000, N'D:\\cobagambar\iced coffee.jpg', 50, 80)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (7, N'Matcha Latte', 21000, N'D:\\cobagambar\matcha latte.jpg', 75, 75)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (8, N'Pepperoni Pizza', 50000, N'D:\\cobagambar\pepperoni pizza.jpg', 160, 100)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (16, N'NasGor', 21000, N'D:\\cobagambar\NasGor.jpg', 20, 20)
INSERT [dbo].[tb_menu] ([id], [Name], [Price], [Photo], [Carbo], [Protein]) VALUES (18, N'Sushi1', 10000, N'D:\\cobagambar\Sushi1', 10, 20)
SET IDENTITY_INSERT [dbo].[tb_menu] OFF
SET IDENTITY_INSERT [dbo].[tb_orderdetail] ON 

INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (2, N'201810120001', 2, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (5, N'201804010880', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (7, N'201804010880', 2, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (8, N'201804010851', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (9, N'201804010851', 2, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (16, N'201804010156', 3, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (17, N'201804010156', 2, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (18, N'201804010117', 3, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (19, N'201804010117', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (22, N'201804010036', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (23, N'201804010036', 2, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (24, N'201804020906', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (25, N'201804020906', 3, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (26, N'201804020762', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (27, N'201804020762', 3, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (28, N'201804020636', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (29, N'201804020636', 2, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (30, N'201804020569', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (31, N'201804020569', 2, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (32, N'201804020492', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (33, N'201804020492', 3, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (34, N'201804020433', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (35, N'201804020433', 3, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (36, N'201804020304', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (37, N'201804020304', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (38, N'201804020034', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (41, N'201804020034', 3, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (42, N'201804030959', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (43, N'201804030959', 2, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (44, N'201804030835', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (45, N'201804030835', 2, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (46, N'201804030802', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (48, N'201804030802', 3, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (49, N'201804030550', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (51, N'201804030550', 2, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (52, N'201804030281', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (54, N'201804030281', 2, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (55, N'201804030268', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (56, N'201804030268', 3, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (57, N'201810150001', 1, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (58, N'201810150001', 2, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (63, N'201810150002', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (64, N'201810150002', 2, 1, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (87, N'201810150003', 1, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (88, N'201810150003', 2, 2, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (89, N'201810160001', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (90, N'201810160001', 16, 4, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (91, N'201810160002', 1, 4, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (92, N'201810160002', 3, 4, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (93, N'201810160003', 16, 4, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (94, N'201810160003', 6, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (95, N'201810160004', 5, 4, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (96, N'201810160004', 8, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (97, N'201810160005', 1, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (98, N'201810160005', 2, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (99, N'201810160005', 3, 3, N'Delivered')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (100, N'201810170001', 1, 2, N'Preparation')
INSERT [dbo].[tb_orderdetail] ([Id], [Orderid], [Menuid], [Qty], [Status]) VALUES (101, N'201810170001', 3, 4, N'Preparation')
SET IDENTITY_INSERT [dbo].[tb_orderdetail] OFF
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804010036', N'EM001 ', 2, CAST(N'2018-04-01' AS Date), N'credit', N'6833826941675950', N'BNI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804010117', N'EM001 ', 2, CAST(N'2018-04-01' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804010156', N'EM001 ', 2, CAST(N'2018-04-01' AS Date), N'credit', N'4924570930475540', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804010851', N'EM001 ', 2, CAST(N'2018-04-01' AS Date), N'credit', N'5082333599030290', N'BNI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804010880', N'EM001 ', 2, CAST(N'2018-04-01' AS Date), N'credit', N'2857038845088740', N'BNI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020034', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020304', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020433', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020492', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020569', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'credit', N'7056256032450990', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020636', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020762', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804020906', N'EM001 ', 2, CAST(N'2018-04-02' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804030268', N'EM001 ', 2, CAST(N'2018-04-03' AS Date), N'credit', N'5368014819749650', N'BNI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804030281', N'EM001 ', 2, CAST(N'2018-04-03' AS Date), N'cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804030550', N'EM001 ', 2, CAST(N'2018-04-03' AS Date), N'credit', N'2604355373270370', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804030802', N'EM001 ', 2, CAST(N'2018-04-03' AS Date), N'credit', N'2447163670320800', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804030835', N'EM001 ', 2, CAST(N'2018-04-03' AS Date), N'credit', N'6228368772410350', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201804030959', N'EM001 ', 2, CAST(N'2018-04-03' AS Date), N'credit', N'3201014994649190', N'BNI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810120001', N'EM003 ', 7, CAST(N'2018-10-12' AS Date), N'Cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810150001', N'EM003 ', 7, CAST(N'2018-10-15' AS Date), N'Cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810150002', N'EM003 ', 10, CAST(N'2018-10-15' AS Date), N'Credit Card', N'8989898989', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810150003', N'EM001 ', 2, CAST(N'2018-10-15' AS Date), NULL, NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810160001', N'EM003 ', 7, CAST(N'2018-10-16' AS Date), N'Credit Card', N'1231312313121', N'BRI')
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810160002', N'EM003 ', 10, CAST(N'2018-10-16' AS Date), N'Cash', NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810160003', N'EM001 ', 2, CAST(N'2018-10-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810160004', N'EM001 ', 7, CAST(N'2018-10-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810160005', N'EM001 ', 2, CAST(N'2018-10-16' AS Date), NULL, NULL, NULL)
INSERT [dbo].[tb_orderHeader] ([id], [Emp_id], [Mem_id], [Date], [PaymentType], [CardNumber], [Bank]) VALUES (N'201810170001', N'EM001 ', 7, CAST(N'2018-10-17' AS Date), NULL, NULL, NULL)
ALTER TABLE [dbo].[tb_orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_tb_orderdetail_tb_menu] FOREIGN KEY([Menuid])
REFERENCES [dbo].[tb_menu] ([id])
GO
ALTER TABLE [dbo].[tb_orderdetail] CHECK CONSTRAINT [FK_tb_orderdetail_tb_menu]
GO
ALTER TABLE [dbo].[tb_orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_tb_orderdetail_tb_orderHeader] FOREIGN KEY([Orderid])
REFERENCES [dbo].[tb_orderHeader] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_orderdetail] CHECK CONSTRAINT [FK_tb_orderdetail_tb_orderHeader]
GO
ALTER TABLE [dbo].[tb_orderHeader]  WITH CHECK ADD  CONSTRAINT [FK_tb_orderHeader_tb_employee] FOREIGN KEY([Emp_id])
REFERENCES [dbo].[tb_employee] ([Id])
GO
ALTER TABLE [dbo].[tb_orderHeader] CHECK CONSTRAINT [FK_tb_orderHeader_tb_employee]
GO
ALTER TABLE [dbo].[tb_orderHeader]  WITH CHECK ADD  CONSTRAINT [FK_tb_orderHeader_tb_member] FOREIGN KEY([Mem_id])
REFERENCES [dbo].[tb_member] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_orderHeader] CHECK CONSTRAINT [FK_tb_orderHeader_tb_member]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_menu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tb_orderdetail"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tb_orderHeader"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_menu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_orderdetail"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detailmenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_detailmenu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tb_menu"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tb_orderdetail"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tb_orderHeader"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_report'
GO
USE [master]
GO
ALTER DATABASE [rumah_makan] SET  READ_WRITE 
GO
