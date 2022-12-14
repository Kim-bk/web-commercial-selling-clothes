USE [master]
GO
/****** Object:  Database [ECommerceSellingClothes]    Script Date: 15/09/2022 6:52:22 CH ******/
CREATE DATABASE [ECommerceSellingClothes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerceSellingClothes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ECommerceSellingClothes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerceSellingClothes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ECommerceSellingClothes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ECommerceSellingClothes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerceSellingClothes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerceSellingClothes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ECommerceSellingClothes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerceSellingClothes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerceSellingClothes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerceSellingClothes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerceSellingClothes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ECommerceSellingClothes] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerceSellingClothes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerceSellingClothes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerceSellingClothes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerceSellingClothes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerceSellingClothes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerceSellingClothes] SET QUERY_STORE = OFF
GO
USE [ECommerceSellingClothes]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShopId] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[DateCreated] [datetime] NULL,
	[UserGroupId] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[ShopId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Gender] [char](1) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cendential]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cendential](
	[RoleId] [int] NULL,
	[UserGroupId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[ShopId] [int] NULL,
	[Path] [nvarchar](255) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ShopId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Price] [int] NULL,
	[DateCreated] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](5) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ItemId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordered]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordered](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[StatusId] [int] NULL,
	[PaymentId] [int] NULL,
	[DateCreate] [datetime] NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Ordered] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PhomeNumber] [nvarchar](10) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 15/09/2022 6:52:22 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (1, NULL, NULL, N'Áo nỉ và Bộ đồ thể thao', N'Áo len chui đầu, áo thể thao,....', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (2, NULL, NULL, N'Áo hoodie và Áo khoác', N'Áo khoác lạnh, áo khoác ấm, áo hoodie,...', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (3, NULL, NULL, N'Áo phông', N'Áo thun, Áo thể thao,...', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (4, 1, NULL, N'Áo nỉ đánh gôn', N'Thoải mái khi thể thao', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (5, 1, NULL, N'Nam Sportswear', N'Đồ thể thao nam', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (6, 1, NULL, N'Nam Originals', N'Phiên bản cổ điển ', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (7, 2, NULL, N'Áo khoác bóng đá', N'Áo khoác cho các fan bóng đá ', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (8, 2, NULL, N'Áo khoác đánh Gôn', N'Áo khoác cho người chơi Gôn', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (9, 2, NULL, N'Áo khoác nam thể thao', N'Áo khoác thể thao', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (10, 3, NULL, N'Áo thun Unisex', N'Áo thun Unisex cổ điển', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (11, 3, NULL, N'Áo thun tập luyện', N'Áo thun dành cho tập luyện', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (12, 3, NULL, N'Áo thun thể thao', N'Áo thun dành cho thể thao', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (13, NULL, NULL, N'Quần Bó', N'Quần dài, quần Short, quàn tập luyện', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (14, 13, NULL, N'Quần dài tập luyện ba sọc', N'Quần dài Adidas tập luyện ba sọc thể thao', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (15, 13, NULL, N'Quần dài trơn thể thao', N'Quần bó đài trơn ', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (16, 13, NULL, N'Quần Short và họa tiết', N'Quàn short thể thao và họa tiết', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (17, NULL, NULL, N'Áo Jersey', N'Áo đấu, áo tập, áo thun lạnh', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (18, 17, NULL, N'Áo đấu sân nhà', N'Áo đấu sân nhà của các đội tuyển', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (19, 17, NULL, N'Áo đấu sân khách', N'Áo đấu sân khách của các đội tuyển', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (20, 17, NULL, N'Áo tập ', N'Áo tập trước trận của các đội  tuyển', N'1')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (21, NULL, NULL, N'Áo phông', N'Áo phông, áo không tay,...', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (22, 21, NULL, N'Áo thun lửng', N'Áo tank top, áo bolero,...', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (23, 21, NULL, N'Áo thun bo ', N'Áo phù hợp cho thể thao', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (24, 21, NULL, N'Áo thun oversize', N'Áo oversize nhiều mẫu mã,...', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (25, NULL, NULL, N'Đồ mang ở nhà', N'Đồ bộ, áo sơ mi,....', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (26, 25, NULL, N'Đồ bộ', N'Gồm quần và áo', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (27, 25, NULL, N'Áo lót tập luyện', N'Áo Bra tập luyện thoải mái', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (28, NULL, NULL, N'Áo hoodie', N'Áo hoodie có khóa, áo hoodie  trơn,...', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (29, 28, NULL, N'Áo hoodie có khóa kéo', N'Có khóa kéo ở giữa', N'0')
INSERT [dbo].[Category] ([Id], [ParentId], [ShopId], [Name], [Description], [Gender]) VALUES (30, 28, NULL, N'Áo hoodie trơn', N'Không có khóa kéo và rất ấp', N'0')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (1, 1, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/f0614164005b4004a629ae7a018764f5_9366/áo-len-chui-đầu-3-sọc.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (2, 2, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/6deb48f878ee428080a8ae75010afe90_9366/áo-hoodie-thể-thao-disney.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (3, 3, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/c38cbbc7be5841c98c71ae8001300017_9366/áo-sweatshirt-cổ-tròn.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (4, 4, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/ebd5e82b17824bc3952aace700b8ce9d_9366/m-feelcozy-swt.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (5, 5, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/6335b6e5975b44b2b7f1ad120147a646_9366/áo-sweatshirt-cổ-tròn-ba-lá-classics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (6, 6, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/e1c8f00b477f40debf2aae37015473ad_9366/áo-sweatshirt-cổ-tròn-formal.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (7, 7, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/cdfc70fbaa7f4782b850adeb0051541a_9366/áo-anorak-chui-đầu-khóa-kéo-lửng-adicross.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (8, 8, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/9ef3a438ad1746abb227ad1201487e18_9366/áo-hoodie-ba-lá-classics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (9, 9, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/b288b344a21142879e67adf50061bab8_9366/áo-chui-đầu-cổ-tròn-adicross.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (10, 10, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/06c0a38c595b42e18049add5000d13dd_9366/pg-lightsweater.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (11, 11, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/41777eee1f354472b484aeca00e7e1aa_9366/áo-khoác-đội-tuyển-đức.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (12, 12, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0a34e6ce70fb4deabd47ae71017aaa73_9366/áo-khoác-khóa-kéo-rain.rdy.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (13, 13, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/b6e4ad039f6547a79ac5ae4a012e7bb3_9366/áo-khoác-khóa-kéo-rain.rdy.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (14, 14, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/1dfce3bf7f954ce7ace1ae9400b20ac1_9366/áo-hoodie-vải-thun-da-cá-mélange-essentials.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (15, 15, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/08f4d1779ea944bc9580ae4a00a0205b_9366/áo-khoác-ngoài-prsve.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (16, 16, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/90add9c91e7f494e85e2ae6f0130f2c1_9366/áo-khoác-khóa-kéo-provisional.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (17, 17, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/42efb9cee958468e93bfaec300ded42c_9366/áo-hoodie-neuclassics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (18, 18, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/6ad553d83e994c18941aae71011bb4eb_9366/áo-khoác-khóa-kéo-provisional.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (19, 19, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/767779ca18014c03b487ae4a00a1f9da_9366/áo-khoác-ngoài-prsve.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (20, 20, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/2201aed539a74900affaae93010a902a_9366/áo-khoác-lông-vũ.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (21, 21, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/5232fa5d0a1e4a1c92d1aed8008f493f_9366/áo-thun-class-of-72-adidas-originals-unisex.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (22, 22, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/aaac0b79281e4273b0f4aed8008f68a3_9366/áo-thun-class-of-72-adidas-originals-unisex.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (23, 23, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/bea82d0ba0c64a89bea4ae8500ab1621_9366/áo-thun-3-sọc-classics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (24, 24, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/cd598040a4d94ca4872daed2012739ff_9366/áo-thun-adidas-rekive.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (25, 25, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/a8d2dd68b5884f1ebb35ae7601101561_9366/áo-thun-graphic-overspray.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (26, 26, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/8385a6d012d04832a021ae760127271c_9366/áo-thun-thể-thao-aeroready-designed-to-move.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (27, 27, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/67d4260f65814b1b9d77aeb500ea4e79_9366/áo-thun-graphic-fast.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (28, 28, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/54fb760369374ef3b554ae8a010fb5ab_9366/áo-thun-vai-rủ-feelvivid-essentials.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (29, 29, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/25852980ee9347f4b760ae88014459b2_9366/áo-thun-ba-lá-series-style.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (30, 30, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/1352c95daef944a0ab6aae8a011047f4_9366/áo-thun-colorblock-essentials.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (31, 31, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/efd9a1901a3844c5af0fae850122b6f9_9366/quần-bó-tập-luyện-dáng-dài-aeroready-techfit.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (32, 32, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/70bf81b9e085483e8f15ada300c79105_9366/quần-bó-dáng-dài-saturday.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (33, 33, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/6fce60b749014092b5b9ae550098c69d_9366/quần-bó-tập-luyện-dáng-dài-3-sọc-techfit.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (34, 34, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/082cd1546ee049938506ae5300e2590b_9366/quần-bó-tập-luyện-dáng-dài-3-sọc-techfit.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (35, 35, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/4d3b60bd13184a6cb723af100093b555_9366/quần-bó-tập-luyện-dáng-dài-techfit.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (36, 36, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/76e7d8b4cb6e465388a1acca00504124_9366/quần-short-bó-lyte-ryde-techfit-aeroready.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (37, 37, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/6763e731f5bd494ab38dabbf00bf98fa_9366/quần-bó-dáng-dài-saturday.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (38, 38, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/75dca3b442f5493197a2aaa40131a3c3_9366/quần-alphaskin-sport-3-4.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (39, 39, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/dc0f43d7d0b940808c1eaab101419c12_9366/quần-bó-alphaskin.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (40, 40, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/709a57aad43b40cc9962aaa20158b015_9366/quần-bó-họa-tiết-dáng-dài-alphaskin.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (41, 41, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/9bfb32aae6da4166a627aeec009117f4_9366/áo-đấu-sân-nhà-đội-tuyển-đức-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (42, 42, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/c8a146ebb9f4442d8dbaae830109d9d5_9366/áo-đấu-sân-nhà-argentina-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (43, 43, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/fe6a7cccadb042fcaa8faeec0117d2c5_9366/áo-đấu-sân-khách-đội-tuyển-đức-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (44, 44, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/b4ac52d7018b4c2abaacaeb6010f310a_9366/áo-đấu-sân-nhà-đội-tuyển-nhật-bản-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (45, 45, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/4b55294ab5ad47ebafaaaeb000185f9c_9366/áo-đấu-sân-khách-đội-tuyển-nhật-bản-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (46, 46, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/bb48fa69a5ba40ef9b44ae83010a4969_9366/áo-đấu-sân-khách-đội-tuyển-argentina-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (47, 47, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/461638e245ea43ce9930aecb00fd9a41_9366/áo-tập-trước-trận-đội-tuyển-tây-ban-nha.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (48, 48, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/4d8ddd86106c454888e4ae88012a5f24_9366/áo-tập-trước-trận-đội-tuyển-đức.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (49, 49, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/9fd9b89f51734736bc8daea400c337f3_9366/áo-đấu-sân-khách-đội-tuyển-tây-ban-nha-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (50, 50, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/d61eb17bd05b40a7a470aefd00f38f36_9366/áo-đấu-sân-nhà-authentic-đội-tuyển-nhật-bản-22.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (51, 51, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/5ef750e2d21b4d4cbea7aec300dd7868_9366/áo-thun-lửng-nhung-monogram-dập-nổi.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (52, 52, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0d9ed785461c455eac6cae760133da4c_9366/áo-thun-bo-gấu-classics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (53, 53, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/788a8e202d974dad9ca9aeb000153457_9366/áo-bolero-hiit-45-seconds.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (54, 54, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/b17ad1ea3a5b45e9a8edae9200393b18_9366/áo-tank-top-lửng-train-hiit-aeroready.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (55, 55, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/28c3b3ca6e6a484faf71ae79007e0314_9366/áo-thun-bo-gấu-classics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (56, 56, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/90982473d3ab4d4eb288ae4a0124ab58_9366/áo-polo-3-sọc.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (57, 57, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/cc74a8f46d584a54927aae9e00c999bc_9366/áo-thun-neuclassics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (58, 58, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/98cee06996c748c59051aea700e899cc_9366/áo-thun-chạy-bộ-run-it.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (59, 59, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/5baf2792cbff40f3a9d9aef400824b72_9366/áo-thun-oversize-adicolor-heritage-now.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (60, 60, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/ecc55535b044421baff0aef301220354_9366/áo-thun-oversize-adicolor-heritage-now.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (61, 61, 3, N'https://sg-live-01.slatic.net/p/aee8044c83668a543481f3f6443d874c.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (62, 62, 4, N'https://vn-live-01.slatic.net/p/84ce50ca7e8b39e350c02bfa634502d1.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (63, 63, 2, N'https://filebroker-cdn.lazada.vn/kf/Sa07c28989e70412a91b7279f1c9c969dv.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (64, 64, 3, N'https://sg-live-01.slatic.net/p/df63738e8355c90b202fbf1ed6478eef.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (65, 65, 4, N'https://vn-live-01.slatic.net/p/0b95a13a080328ca3a40739d12d410c9.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (66, 66, 3, N'https://vn-live-01.slatic.net/p/1b8408e427788910c264bbeff6f6afc6.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (67, 67, 2, N'https://vn-live-01.slatic.net/p/7027f202bb1d3939ff06c972faba5e5f.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (68, 68, 3, N'https://sg-live-01.slatic.net/p/497a16ac615deee2e4878ef106e01f78.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (69, 69, 1, N'https://vn-live-01.slatic.net/p/72ab1e146cf44f74ba53542b0621510f.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (70, 70, 4, N'https://vn-live-01.slatic.net/p/01c5821c35a749d2569ee58655529b60.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (71, 71, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/4d5083e6e38445359cf7aef9004d3b32_9366/áo-bra-hiit-tập-luyện-medium-support-luxe-powerimpact.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (72, 72, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/9e223fe19bc540ff8eb9ae4a013dddf6_9366/áo-bra-tập-luyện-medium-support-techfit-powerreact.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (73, 73, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/4114703e605a4afa8025ae9b011460e3_9366/áo-bra-tập-luyện-medium-support-techfit-powerreact.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (74, 74, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0e1234a843854788b102ae9b00f98aef_9366/áo-bra-tập-luyện-medium-support-techfit-powerimpact.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (75, 75, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/4d85271a56014ac8b88aaeea01257ff8_9366/áo-bra-chạy-bộ-có-túi-medium-support.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (76, 76, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/f5ca44b073ce47e2bb61aea700f7047b_9366/áo-bra-hiit-tập-luyện-medium-support-luxe-powerimpact.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (77, 77, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/9b4971d50e184f788fa8aeb000342368_9366/áo-bra-tập-luyện-high-support-adidas-tlrd-move.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (78, 78, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/cafc7c09735a406a83a6aeca00d76603_9366/áo-bra-tập-luyện-high-support-impact-adidas-tlrd.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (79, 79, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/03d3623476c24c7aa7cfae4a0116eaf7_9366/áo-bra-fire-light-support-yoga-luxe-studio.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (80, 80, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/91bf73d793794d0baf3dade4005ae5cf_9366/áo-bra-chạy-bộ-high-support-luxe-fastimpact.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (81, 81, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0414b2345abb4916942eae7a00d322aa_9366/áo-hoodie-ba-lá-adidas-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (82, 82, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/13e066df25d149f58ecbae0800e4fa96_9366/áo-hoodie-rally-unisex.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (83, 83, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/b6fdd809071b42f88da6ae910111d9db_9366/áo-hoodie-khóa-kéo-phủ-họa-tiết.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (84, 84, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/c1dfd34b9fcb43a2a84ead4900ec3156_9366/track-top-có-mũ-3-sọc-future-icons-adidas-sportswear.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (85, 85, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0aad85a3e21c4903ad5dadb0008bb54f_9366/áo-hoodie-lửng-love-unites.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (86, 86, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/3d70333be5db41e98984ae8b013a3181_9366/áo-hoodie-khóa-kéo-slim-fit-mission-victory.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (87, 87, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/b6656fd5fa1747deb514ae9b010a43cb_9366/áo-hoodie-lửng-marimekko.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (88, 88, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/cd1a4c4de44746c5b157ae80011ebdc0_9366/áo-hoodie-lửng.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (89, 89, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/d6524adeb1da463585a0ada300974693_9366/track-top-có-mũ-3-sọc-future-icons-adidas-sportswear.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (90, 90, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/ccf1f596b425420685acae760124a45c_9366/áo-hoodie-đan-dây-always-original.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (91, 91, 4, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/f4f4bdd1b6974e87828aae92002e75e9_9366/áo-hoodie-lửng-disney.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (92, 92, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/48c1922d5577454c8d24ae9b01101e43_9366/áo-track-jacket-có-mũ-vải-poplin-classics-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (93, 93, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0153b3f830df41a9b09bae93011a0f13_9366/track-top-có-mũ-hyperglam.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (94, 94, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/a04ce698584743ea9c47ae95008f68ca_9366/track-top-có-mũ-hyperglam.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (95, 95, 2, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/eb4386db0b9a4217b5ccae45006898eb_9366/áo-hoodie-có-lót-wind.rdy.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (96, 96, 1, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/134ce71b3d534771a264aaab00f1094e_9366/áo-hoodie-ba-lá-adidas-adicolor.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (97, 97, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/743375b3e5a24beb897dae3f01283fa6_9366/áo-hoodie-khóa-kéo-slim-fit-mission-victory.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (98, 98, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/82ecb501fec94a3f81f4ae7501311422_9366/áo-hoodie-có-lót-wind.rdy.jpg')
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (99, 99, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0274faa3841b46118815adc601158e06_9366/áo-gió-dệt-thoi-future-icons-adidas-sportswear.jpg')
GO
INSERT [dbo].[Image] ([Id], [ItemId], [ShopId], [Path]) VALUES (100, 100, 3, N'https://assets.adidas.com/images/w_280,h_280,f_auto,q_auto:sensitive/0292900a8d614a2d8f91adf601268078_9366/gt-w-hoody.jpg')
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (1, 4, 4, N'Áo Len Chui Đầu 3 Sọc', 1250000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Len Chui Đầu 3 Sọc', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (2, 4, 3, N'Áo Len Chui Đầu 3 Sọc', 1250000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Len Chui Đầu 3 Sọc', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (3, 5, 4, N'Áo Hoodie Thể Thao Disney', 750000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Hoodie Thể Thao Disney', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (4, 4, 1, N'Áo Sweatshirt Cổ Tròn', 1150000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Originals Áo Sweatshirt Cổ Tròn', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (5, 5, 3, N'M FEELCOZY SWT', 550000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear M FEELCOZY SWT', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (6, 6, 1, N'Áo Sweatshirt Cổ Tròn Ba Lá Classics Adicolor', 850000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Originals Áo Sweatshirt Cổ Tròn Ba Lá Classics Adicolor', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (7, 5, 3, N'Áo Sweatshirt Cổ Tròn Formal', 800000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Sweatshirt Cổ Tròn Formal', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (8, 4, 3, N'Áo Anorak Chui Đầu Khóa Kéo Lửng Adicross', 1600000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Anorak Chui Đầu Khóa Kéo Lửng Adicross', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (9, 6, 4, N'Áo Hoodie Ba Lá Classics Adicolor', 1000000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Originals Áo Hoodie Ba Lá Classics Adicolor', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (10, 4, 3, N'Áo Chui Đầu Cổ Tròn Adicross', 1200000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Chui Đầu Cổ Tròn Adicross', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (11, 7, 2, N'Áo Khoác Đội Tuyển Đức', 1200000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Khoác Đội Tuyển Đức', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (12, 8, 4, N'Áo Khoác Khóa Kéo RAIN.RDY', 2400000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Khoác Khóa Kéo RAIN.RDY', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (13, 8, 3, N'Áo Khoác Khóa Kéo RAIN.RDY', 2400000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Khoác Khóa Kéo RAIN.RDY', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (14, 9, 1, N'Áo Hoodie Vải Thun Da Cá Mélange Essentials', 750000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Hoodie Vải Thun Da Cá Mélange Essentials', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (15, 9, 2, N'Áo Khoác Ngoài PRSVE', 1500000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Khoác Ngoài PRSVE', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (16, 8, 3, N'Áo Khoác Khóa Kéo Provisional', 1350000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Khoác Khóa Kéo Provisional', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (17, 7, 2, N'Áo Hoodie Neuclassics Adicolor', 1100000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Originals Áo Hoodie Neuclassics Adicolor', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (18, 8, 2, N'Áo Khoác Khóa Kéo Provisional', 1350000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Khoác Khóa Kéo Provisional', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (19, 7, 4, N'Áo Khoác Ngoài PRSVE', 1500000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Khoác Ngoài PRSVE', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (20, 8, 4, N'Áo Khoác Lông Vũ', 2800000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Đánh Gôn Áo Khoác Lông Vũ', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (21, 10, 3, N'Áo Thun Class of 72 adidas Originals (Unisex)', 475000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Originals Áo Thun Class of 72 adidas Originals (Unisex)', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (22, 10, 2, N'Áo Thun Class of 72 adidas Originals (Unisex)', 850000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Originals Áo Thun Class of 72 adidas Originals (Unisex)', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (23, 10, 1, N'Áo Thun 3 Sọc Classics Adicolor', 700000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Originals Áo Thun 3 Sọc Classics Adicolor', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (24, 10, 1, N'Áo Thun adidas Rekive', 700000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Originals Áo Thun adidas Rekive', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (25, 11, 3, N'ÁO THUN GRAPHIC OVERSPRAY', 475000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện ÁO THUN GRAPHIC OVERSPRAY', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (26, 11, 2, N'Áo thun thể thao AEROREADY Designed To Move', 575000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện Áo thun thể thao AEROREADY Designed To Move', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (27, 11, 3, N'Áo Thun Graphic Fast', 800000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Chạy Áo Thun Graphic Fast', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (28, 12, 4, N'Áo Thun Vai Rủ FeelVivid Essentials', 425000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Thun Vai Rủ FeelVivid Essentials', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (29, 10, 2, N'Áo Thun Ba Lá Series Style', 450000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Originals Áo Thun Ba Lá Series Style', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (30, 12, 1, N'Áo Thun Colorblock Essentials', 600000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Sportswear Áo Thun Colorblock Essentials', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (31, 16, 1, N'Quần Bó Tập Luyện Dáng Dài AEROREADY Techfit', 475000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện Quần Bó Tập Luyện Dáng Dài AEROREADY Techfit', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (32, 15, 4, N'Quần Bó Dáng Dài Saturday', 850000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Chạy Quần Bó Dáng Dài Saturday', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (33, 14, 3, N'Quần Bó Tập Luyện Dáng Dài 3 Sọc Techfit', 700000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện Quần Bó Tập Luyện Dáng Dài 3 Sọc Techfit', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (34, 14, 3, N'Quần Bó Tập Luyện Dáng Dài 3 Sọc Techfit', 700000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện Quần Bó Tập Luyện Dáng Dài 3 Sọc Techfit', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (35, 15, 4, N'Quần Bó Tập Luyện Dáng Dài Techfit', 475000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện Quần Bó Tập Luyện Dáng Dài Techfit', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (36, 16, 1, N'Quần Short Bó Lyte Ryde Techfit AEROREADY', 575000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Luyện Quần Short Bó Lyte Ryde Techfit AEROREADY', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (37, 15, 2, N'Quần bó dáng dài Saturday', 800000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Chạy Quần bó dáng dài Saturday', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (38, 16, 4, N'Quần Alphaskin Sport 3/4', 425000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Yoga Quần Alphaskin Sport 3/4', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (39, 16, 3, N'Quần bó Alphaskin', 450000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Yoga Quần bó Alphaskin', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (40, 15, 2, N'Quần bó họa tiết dáng dài Alphaskin', 600000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Tập Yoga Quần bó họa tiết dáng dài Alphaskin', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (41, 18, 1, N'Áo Đấu Sân Nhà Đội Tuyển Đức 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Nhà Đội Tuyển Đức 22', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (42, 18, 3, N'Áo Đấu Sân Nhà Argentina 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Nhà Argentina 22', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (43, 19, 3, N'Áo Đấu Sân Khách Đội Tuyển Đức 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Khách Đội Tuyển Đức 22', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (44, 19, 2, N'Áo Đấu Sân Nhà Đội Tuyển Nhật Bản 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Nhà Đội Tuyển Nhật Bản 22', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (45, 19, 4, N'Áo Đấu Sân Khách Đội Tuyển Nhật Bản 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Khách Đội Tuyển Nhật Bản 22', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (46, 19, 3, N'Áo Đấu Sân Khách Đội Tuyển Argentina 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Khách Đội Tuyển Argentina 22', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (47, 20, 1, N'Áo Tập Trước Trận Đội Tuyển Tây Ban Nha', 750000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Tập Trước Trận Đội Tuyển Tây Ban Nha', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (48, 20, 2, N'Áo Tập Trước Trận Đội Tuyển Đức', 750000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Tập Trước Trận Đội Tuyển Đức', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (49, 19, 2, N'Áo Đấu Sân Khách Đội Tuyển Tây Ban Nha 22', 1075000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Khách Đội Tuyển Tây Ban Nha 22', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (50, 18, 2, N'Áo Đấu Sân Nhà Authentic Đội Tuyển Nhật Bản 22', 1500000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nam Bóng Đá Áo Đấu Sân Nhà Authentic Đội Tuyển Nhật Bản 22', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (51, 22, 4, N'Áo Thun Lửng Nhung Monogram Dập Nổi', 550000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Originals Áo Thun Lửng Nhung Monogram Dập Nổi', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (52, 23, 3, N'Áo Thun Bo Gấu Classics Adicolor', 550000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Originals Áo Thun Bo Gấu Classics Adicolor', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (53, 22, 4, N'Áo Bolero HIIT 45 Seconds', 600000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ HIIT Áo Bolero HIIT 45 Seconds', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (54, 22, 1, N'Áo Tank Top Lửng Train HIIT AEROREADY', 450000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ HIIT Áo Tank Top Lửng Train HIIT AEROREADY', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (55, 23, 3, N'Áo Thun Bo Gấu Classics Adicolor', 550000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Originals Áo Thun Bo Gấu Classics Adicolor', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (56, 24, 2, N'Áo Polo 3 Sọc', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Đánh Gôn Áo Polo 3 Sọc', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (57, 24, 3, N'Áo Thun Neuclassics Adicolor', 500000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Originals Áo Thun Neuclassics Adicolor', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (58, 22, 4, N'Áo Thun Chạy Bộ Run It', 400000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Chạy Áo Thun Chạy Bộ Run It', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (59, 24, 3, N'Áo Thun Oversize Adicolor Heritage Now', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Originals Áo Thun Oversize Adicolor Heritage Now', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (60, 24, 1, N'Áo Thun Oversize Adicolor Heritage Now', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Originals Áo Thun Oversize Adicolor Heritage Now', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (61, 26, 3, N'Set Bộ Áo Thun Phom Rộng Quần Thun Ôm Legging Ngố', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà ', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (62, 26, 4, N'SET BỘ NỮ CARO PHỐI VIỀN CỔ TIM THỜI TRANG SÀNH ĐIỆU ĐẸP TINH TẾ', 350000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (63, 26, 2, N'Set áo thun dior quần borip vải đẹp giá tốt d6', 400000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (64, 26, 3, N'Bộ đùi hoạt hình siêu cute-WIN SHOP-LĐ', 450000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (65, 26, 4, N'Quần áo mặc nhà, đồ bộ nữ, kiểu dáng nhẹ nhàng mẫu cổ bèo họa tiết hoạt hình đẹp', 500000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (66, 26, 3, N'Sét Áo Tay Phồng Kèm Chân Váy Đui Cá Thật Sự Thích Hợp Với Mọi Phong Cách.', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (67, 26, 2, N'SÉT BÀ BA CÚT TÀU RẤT DỂ THƯƠNG', 750000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (68, 26, 3, N'Set áo khoác croptop đen và đầm 2 dây. Váy kèm áo khoác ngoài sơ mi cực xinh 1stclothes', 870000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (69, 26, 1, N'Set bộ sơ mi đũi dài tay mix quần short (đùi) nhẹ nhàng màu trắng và đen.', 140000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (70, 26, 4, N'Set   áo sơ mi tay dài kèm quần ống rộng vải đũi mix đồ đi chơi cực sang, Chất vải đũi mặc vừa nhẹ vừa mát. MỘC 1999', 110000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Form rông thoải mái thích hợp mặc ở nhà', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (71, 27, 4, N'Áo Bra HIIT Tập Luyện Medium Support Luxe Powerimpact', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ HIIT Áo Bra HIIT Tập Luyện Medium Support Luxe Powerimpact', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (72, 27, 3, N'Áo Bra Tập Luyện Medium Support Techfit Powerreact', 475000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Tập Luyện Medium Support Techfit Powerreact', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (73, 27, 2, N'Áo Bra Tập Luyện Medium Support Techfit Powerreact', 475000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Tập Luyện Medium Support Techfit Powerreact', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (74, 27, 2, N'Áo Bra Tập Luyện Medium Support Techfit Powerimpact', 625000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Tập Luyện Medium Support Techfit Powerimpact', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (75, 27, 3, N'Áo Bra Chạy Bộ Có Túi Medium Support', 625000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Chạy Bộ Có Túi Medium Support', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (76, 27, 3, N'Áo Bra HIIT Tập Luyện Medium Support Luxe Powerimpact', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ HIIT Áo Bra HIIT Tập Luyện Medium Support Luxe Powerimpact', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (77, 27, 4, N'Áo Bra Tập Luyện High Support adidas TLRD Move', 550000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ HIIT Áo Bra Tập Luyện High Support adidas TLRD Move', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (78, 27, 1, N'Áo Bra Tập Luyện High Support Impact adidas TLRD', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Tập Luyện High Support Impact adidas TLRD', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (79, 27, 4, N'Áo Bra Fire Light Support Yoga Luxe Studio', 650000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Fire Light Support Yoga Luxe Studio', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (80, 27, 2, N'Áo Bra Chạy Bộ High Support Luxe FastImpact', 1000000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Nữ Tập Luyện Áo Bra Chạy Bộ High Support Luxe FastImpact', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (81, 30, 1, N'Áo hoodie Ba Lá adidas Adicolor', 1000000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo hoodie Ba Lá adidas Adicolor', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (82, 30, 4, N'Áo Hoodie Rally (Unisex)', 1500000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Rally (Unisex)', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (83, 29, 1, N'Áo Hoodie Khóa Kéo Phủ Họa Tiết', 1250000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Khóa Kéo Phủ Họa Tiết', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (84, 30, 4, N'Track Top Có Mũ 3 Sọc Future Icons adidas Sportswear', 900000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Track Top Có Mũ 3 Sọc Future Icons adidas Sportswear', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (85, 30, 1, N'Áo Hoodie Lửng Love Unites', 800000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Lửng Love Unites', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (86, 29, 3, N'Áo Hoodie Khóa Kéo Slim Fit Mission Victory', 1200000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Khóa Kéo Slim Fit Mission Victory', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (87, 30, 3, N'Áo Hoodie Lửng Marimekko', 1100000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Lửng Marimekko', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (88, 30, 4, N'Áo Hoodie Lửng', 750000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Lửng', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (89, 30, 2, N'Track Top Có Mũ 3 Sọc Future Icons adidas Sportswear', 900000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Track Top Có Mũ 3 Sọc Future Icons adidas Sportswear', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (90, 29, 2, N'Áo Hoodie Đan Dây Always Original', 1400000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Đan Dây Always Original', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (91, 30, 4, N'Áo Hoodie Lửng Disney', 1250000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Lửng Disney', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (92, 29, 3, N'Áo Track Jacket Có Mũ Vải Poplin Classics Adicolor', 1100000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Track Jacket Có Mũ Vải Poplin Classics Adicolor', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (93, 29, 1, N'Track Top Có Mũ Hyperglam', 850000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Track Top Có Mũ Hyperglam', N'S', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (94, 29, 3, N'Track Top Có Mũ Hyperglam', 850000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Track Top Có Mũ Hyperglam', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (95, 29, 2, N'Áo Hoodie Có Lót WIND.RDY', 1325000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Có Lót WIND.RDY', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (96, 30, 1, N'Áo hoodie Ba Lá adidas Adicolor', 1000000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo hoodie Ba Lá adidas Adicolor', N'M', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (97, 29, 3, N'Áo Hoodie Khóa Kéo Slim Fit Mission Victory', 1200000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Khóa Kéo Slim Fit Mission Victory', N'XL', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (98, 29, 3, N'Áo Hoodie Có Lót WIND.RDY', 1325000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Hoodie Có Lót WIND.RDY', N'L', 100)
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (99, 29, 3, N'Áo Gió Dệt Thoi Future Icons adidas Sportswear', 900000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'Áo Gió Dệt Thoi Future Icons adidas Sportswear', N'S', 100)
GO
INSERT [dbo].[Item] ([Id], [CategoryId], [ShopId], [Name], [Price], [DateCreated], [Description], [Size], [Quantity]) VALUES (100, 29, 3, N'GT W HOODY', 1300000, CAST(N'2022-09-15T15:00:13.553' AS DateTime), N'GT W HOODY', N'S', 100)
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([Id], [Name], [Address], [PhomeNumber], [DateCreated]) VALUES (1, N'DSimple', N'Đà Nẵng', N'0909090909', NULL)
INSERT [dbo].[Shop] ([Id], [Name], [Address], [PhomeNumber], [DateCreated]) VALUES (2, N'DSmile', N'Hồ Chí Minh', N'0707070707', NULL)
INSERT [dbo].[Shop] ([Id], [Name], [Address], [PhomeNumber], [DateCreated]) VALUES (3, N'Star Store', N'Quảng Nam', N'0808080808', NULL)
INSERT [dbo].[Shop] ([Id], [Name], [Address], [PhomeNumber], [DateCreated]) VALUES (4, N'Hope Store', N'Hà Nội', N'8787878787', NULL)
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Shop]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_UserGroup] FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_UserGroup]
GO
ALTER TABLE [dbo].[Category]  WITH NOCHECK ADD FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[Cendential]  WITH NOCHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Cendential]  WITH NOCHECK ADD FOREIGN KEY([UserGroupId])
REFERENCES [dbo].[UserGroup] ([Id])
GO
ALTER TABLE [dbo].[Image]  WITH NOCHECK ADD FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[Image]  WITH NOCHECK ADD FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[Item]  WITH NOCHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH NOCHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Ordered] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Item]
GO
ALTER TABLE [dbo].[Ordered]  WITH NOCHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Ordered]  WITH CHECK ADD  CONSTRAINT [FK_Ordered_Payment] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([Id])
GO
ALTER TABLE [dbo].[Ordered] CHECK CONSTRAINT [FK_Ordered_Payment]
GO
ALTER TABLE [dbo].[Ordered]  WITH CHECK ADD  CONSTRAINT [FK_Ordered_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Ordered] CHECK CONSTRAINT [FK_Ordered_Status]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Shop] FOREIGN KEY([Id])
REFERENCES [dbo].[Shop] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Shop]
GO
USE [master]
GO
ALTER DATABASE [ECommerceSellingClothes] SET  READ_WRITE 
GO
