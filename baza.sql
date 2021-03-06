USE [master]
GO
/****** Object:  Database [shop]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE DATABASE [shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shop] SET  MULTI_USER 
GO
ALTER DATABASE [shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shop] SET QUERY_STORE = OFF
GO
USE [shop]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditLogs]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[ExecutedAt] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductColorSizeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLines]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ColorId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColorSizes]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColorSizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductColorId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductColorSizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cover] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Gender] [int] NOT NULL,
	[DiscountRate] [int] NULL,
	[CurrentPrice] [decimal](18, 2) NOT NULL,
	[OldPrice] [decimal](18, 2) NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCase]    Script Date: 6/16/2021 7:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserUseCase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520131446_initial', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520131731_added_user_config', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520131921_user_config_passowrd_required', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520135736_added_category_product_tables', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520140640_added_category_product_configs', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520140830_gender_string_to_enum_in_product', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520143257_orderline_config', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520143724_added_orders_and_orderlines', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520150013_added_comment_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520150340_added_dbset_comment', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520151038_added_comment_config', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520171322_added_productColor_productColorSize_color_size_tables', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520171704_added_configurations', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520173337_added_cart_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520175700_added_likedcomments_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520175847_added_likedAt_in_likedcomment_table', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210520181022_added_productname_in_orderlines', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210521125728_int to string Name in size', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210521135225_int to string in color for name', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210525100722_added data in audit log', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210607163032_moram da smanjim malo tabela nemam vremena', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210608145512_added size and color into order line', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210608170843_added total price in order line', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609115413_added_user_and_userUseCase_properties_in_audit_log', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609115939_removed_userUseCases_from_auditlog', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[AuditLogs] ON 

INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (1, 20, 1, CAST(N'2021-05-25T10:13:56.7280384' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (2, 20, 1, CAST(N'2021-05-25T11:19:53.0503039' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Nedelja6 (1).rar\"","ContentType":"application/vnd.rar","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Nedelja6 (1).rar\""],"Content-Type":["application/vnd.rar"]},"Length":10244104,"Name":"CoverImage","FileName":"Nedelja6 (1).rar"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (3, 20, 1, CAST(N'2021-05-25T11:20:50.0406913' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Nedelja6 (1).rar\"","ContentType":"application/vnd.rar","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Nedelja6 (1).rar\""],"Content-Type":["application/vnd.rar"]},"Length":10244104,"Name":"CoverImage","FileName":"Nedelja6 (1).rar"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (4, 20, 1, CAST(N'2021-05-25T12:42:18.8579528' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (5, 20, 1, CAST(N'2021-05-25T12:45:21.7865453' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (6, 20, 1, CAST(N'2021-05-25T13:06:35.1511405' AS DateTime2), N'{"Sizes":[{"SizeId":75,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":222,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (7, 21, 1, CAST(N'2021-05-25T13:08:17.6004256' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":7,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product3","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (8, 21, 1, CAST(N'2021-05-25T13:11:17.4601786' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product3","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (9, 21, 1, CAST(N'2021-05-25T13:13:02.6745976' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":7,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (10, 21, 1, CAST(N'2021-05-25T13:14:08.0335476' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":7,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (11, 21, 1, CAST(N'2021-05-25T13:16:52.0993878' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (12, 21, 1, CAST(N'2021-05-25T13:18:31.9060131' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":6,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (13, 21, 1, CAST(N'2021-05-25T13:19:21.5503130' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":7,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product2","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (14, 21, 1, CAST(N'2021-05-25T13:19:39.4253779' AS DateTime2), N'{"Sizes":[{"SizeId":5,"ColorsAndQuantity":[{"ColorId":1,"Quantity":10},{"ColorId":2,"Quantity":5}]},{"SizeId":7,"ColorsAndQuantity":[{"ColorId":1,"Quantity":4},{"ColorId":3,"Quantity":2}]}],"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product3","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":0,"DiscountRate":10,"CurrentPrice":1000.0,"CategoryId":11}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (15, 20, 14, CAST(N'2021-06-09T13:02:55.7919581' AS DateTime2), N'{"Keyword":null,"DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (16, 20, 14, CAST(N'2021-06-09T13:03:40.6745319' AS DateTime2), N'{"Keyword":null,"DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (17, 20, 14, CAST(N'2021-06-09T13:04:16.9986458' AS DateTime2), N'{"Keyword":"stefanvaske","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (18, 20, 14, CAST(N'2021-06-09T13:04:28.0097418' AS DateTime2), N'{"Keyword":"ste","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (19, 20, 14, CAST(N'2021-06-09T13:04:29.1121825' AS DateTime2), N'{"Keyword":"st","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (20, 20, 14, CAST(N'2021-06-09T13:04:44.8885008' AS DateTime2), N'{"Keyword":"ste","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (21, 20, 14, CAST(N'2021-06-09T13:06:00.2007395' AS DateTime2), N'{"Keyword":"ste","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (22, 20, 14, CAST(N'2021-06-09T13:06:03.6542444' AS DateTime2), N'{"Keyword":"test","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (23, 20, 14, CAST(N'2021-06-09T13:06:08.9177138' AS DateTime2), N'{"Keyword":"stefan","DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (24, 20, 14, CAST(N'2021-06-09T13:06:24.7802469' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (25, 20, 14, CAST(N'2021-06-09T13:06:28.4427246' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-25T00:00:00","DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (26, 20, 14, CAST(N'2021-06-09T13:06:29.7070672' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (27, 20, 14, CAST(N'2021-06-09T13:06:46.8448759' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-25T00:00:00","DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (28, 20, 14, CAST(N'2021-06-09T13:06:51.9157106' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-02T00:00:00","DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (29, 20, 14, CAST(N'2021-06-09T13:06:54.8943843' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (30, 20, 14, CAST(N'2021-06-09T13:07:11.3313249' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":"2021-06-08T00:00:00"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (31, 20, 14, CAST(N'2021-06-09T13:07:13.4757149' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":"2021-06-09T00:00:00"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (32, 20, 14, CAST(N'2021-06-09T13:07:17.7778207' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":"2021-06-10T00:00:00"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (36, 20, 13, CAST(N'2021-06-09T13:47:00.5107280' AS DateTime2), N'{"SearchOrderLinesDto":{},"Order":null,"OrderId":3}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (37, 20, 12, CAST(N'2021-06-09T13:47:22.2524803' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (38, 20, 15, CAST(N'2021-06-09T15:40:40.2988491' AS DateTime2), N'5')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (39, 20, 15, CAST(N'2021-06-09T15:40:57.6569233' AS DateTime2), N'11')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (40, 20, 15, CAST(N'2021-06-09T18:13:57.3225934' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (41, 20, 24, CAST(N'2021-06-09T18:14:01.1055298' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (42, 20, 18, CAST(N'2021-06-09T18:14:04.4486844' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (43, 20, 20, CAST(N'2021-06-09T18:14:09.1541897' AS DateTime2), N'2')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (44, 20, 23, CAST(N'2021-06-09T18:14:32.1080121' AS DateTime2), N'2')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (45, 20, 21, CAST(N'2021-06-09T18:21:05.7884115' AS DateTime2), N'{"Name":"test"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (46, 20, 18, CAST(N'2021-06-09T18:21:12.0761499' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (47, 20, 22, CAST(N'2021-06-09T18:21:25.0085531' AS DateTime2), N'{"Id":6,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (48, 20, 22, CAST(N'2021-06-09T18:24:05.8225875' AS DateTime2), N'{"Id":6,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (49, 20, 18, CAST(N'2021-06-09T18:24:22.5896205' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (50, 20, 22, CAST(N'2021-06-09T18:24:39.3464026' AS DateTime2), N'{"Id":6,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (51, 20, 22, CAST(N'2021-06-09T18:28:17.1317195' AS DateTime2), N'{"Id":6,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (52, 20, 22, CAST(N'2021-06-09T18:30:07.8159212' AS DateTime2), N'{"Id":4,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (53, 20, 22, CAST(N'2021-06-09T18:30:37.4804131' AS DateTime2), N'{"Id":4,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (54, 20, 22, CAST(N'2021-06-09T18:32:33.2217532' AS DateTime2), N'{"Id":4,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (55, 20, 22, CAST(N'2021-06-09T18:36:47.5006530' AS DateTime2), N'{"Id":6,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (56, 20, 20, CAST(N'2021-06-09T18:36:53.7158140' AS DateTime2), N'6')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (57, 20, 22, CAST(N'2021-06-09T18:37:02.1132302' AS DateTime2), N'{"Id":6,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (58, 20, 23, CAST(N'2021-06-09T18:37:07.5493395' AS DateTime2), N'6')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (59, 20, 20, CAST(N'2021-06-09T18:37:11.5138483' AS DateTime2), N'6')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (60, 20, 20, CAST(N'2021-06-09T18:41:40.1363445' AS DateTime2), N'6')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (61, 20, 24, CAST(N'2021-06-09T18:42:31.5067281' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (62, 20, 26, CAST(N'2021-06-09T18:42:37.6039972' AS DateTime2), N'{"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (63, 20, 24, CAST(N'2021-06-09T18:42:41.8851172' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (65, 20, 27, CAST(N'2021-06-09T18:45:54.8548282' AS DateTime2), N'{"Id":10,"Name":"test"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (66, 20, 27, CAST(N'2021-06-09T18:47:41.3231436' AS DateTime2), N'{"Id":10,"Name":"test"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (67, 20, 25, CAST(N'2021-06-09T18:47:52.2488976' AS DateTime2), N'10')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (68, 20, 28, CAST(N'2021-06-09T18:47:58.9878135' AS DateTime2), N'10')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (69, 20, 28, CAST(N'2021-06-09T18:48:52.7570222' AS DateTime2), N'10')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (70, 20, 28, CAST(N'2021-06-09T18:49:12.4447879' AS DateTime2), N'10')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (71, 20, 25, CAST(N'2021-06-09T18:49:18.4099112' AS DateTime2), N'10')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (72, 20, 16, CAST(N'2021-06-09T18:50:41.9171942' AS DateTime2), N'{"Name":"test"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (73, 20, 15, CAST(N'2021-06-09T18:50:47.9934600' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (74, 20, 16, CAST(N'2021-06-09T18:50:54.1344044' AS DateTime2), N'16')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (75, 20, 17, CAST(N'2021-06-09T18:50:58.7607271' AS DateTime2), N'{"Id":16,"Name":"test2"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (76, 20, 16, CAST(N'2021-06-09T18:51:02.1563557' AS DateTime2), N'16')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (77, 20, 18, CAST(N'2021-06-09T18:51:06.7668373' AS DateTime2), N'16')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (78, 20, 16, CAST(N'2021-06-09T18:51:09.7231920' AS DateTime2), N'16')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (79, 20, 15, CAST(N'2021-06-09T18:51:16.7421415' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (80, 20, 29, CAST(N'2021-06-10T11:47:53.3627599' AS DateTime2), N'26')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (81, 20, 29, CAST(N'2021-06-10T11:48:24.9999732' AS DateTime2), N'2')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (82, 20, 29, CAST(N'2021-06-10T11:48:33.7334472' AS DateTime2), N'27')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (83, 20, 29, CAST(N'2021-06-10T11:48:39.6344421' AS DateTime2), N'25')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (84, 20, 29, CAST(N'2021-06-10T11:49:01.4063243' AS DateTime2), N'1043')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (86, 20, 30, CAST(N'2021-06-10T12:44:10.9622283' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (88, 20, 30, CAST(N'2021-06-10T12:48:22.5012211' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (89, 20, 32, CAST(N'2021-06-10T13:12:16.5483381' AS DateTime2), N'{"Id":13,"FirstName":"test1","LastName":"test1","Email":null,"UseCaseIds":[1,2,3,4]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (90, 20, 32, CAST(N'2021-06-10T13:14:23.5922228' AS DateTime2), N'{"Id":13,"FirstName":"test1","LastName":"test1","Email":"alobre@gmail.com","UseCaseIds":[1,2,3,4]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (91, 20, 1, CAST(N'2021-06-13T10:13:18.4406382' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":null,"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (92, 20, 1, CAST(N'2021-06-13T10:18:37.2450200' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":null,"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (93, 20, 1, CAST(N'2021-06-13T10:19:13.6934583' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":null,"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (94, 20, 1, CAST(N'2021-06-13T10:20:51.3882339' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":null,"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (95, 20, 1, CAST(N'2021-06-13T10:23:31.3672746' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (96, 20, 1, CAST(N'2021-06-13T10:25:31.8572568' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (97, 20, 1, CAST(N'2021-06-13T10:32:45.4808670' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (98, 20, 1, CAST(N'2021-06-13T10:38:05.0649432' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (99, 20, 9, CAST(N'2021-06-13T10:51:26.4001934' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\""],"Content-Type":["image/png"]},"Length":474887,"Name":"CoverImage","FileName":"Screenshot (3).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (100, 20, 1, CAST(N'2021-06-13T10:52:33.0435316' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (101, 20, 9, CAST(N'2021-06-13T10:53:13.7149464' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\""],"Content-Type":["image/png"]},"Length":474887,"Name":"CoverImage","FileName":"Screenshot (3).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (102, 20, 9, CAST(N'2021-06-13T10:54:25.6368364' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\""],"Content-Type":["image/png"]},"Length":474887,"Name":"CoverImage","FileName":"Screenshot (3).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (103, 20, 9, CAST(N'2021-06-13T10:57:04.4964210' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\""],"Content-Type":["image/png"]},"Length":474887,"Name":"CoverImage","FileName":"Screenshot (3).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (104, 20, 9, CAST(N'2021-06-13T10:59:07.0305917' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (3).png\""],"Content-Type":["image/png"]},"Length":474887,"Name":"CoverImage","FileName":"Screenshot (3).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (105, 20, 9, CAST(N'2021-06-13T11:12:11.8265538' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":20,"CurrentPrice":850.0,"CategoryId":12}')
GO
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (106, 20, 9, CAST(N'2021-06-13T11:13:10.9044120' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product1234","Description":"alo bre","Gender":1,"DiscountRate":20,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (107, 20, 9, CAST(N'2021-06-13T11:17:38.9859068' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product1234","Description":"alo bre","Gender":1,"DiscountRate":20,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (108, 20, 9, CAST(N'2021-06-13T11:18:07.9602290' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product1234","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (109, 20, 9, CAST(N'2021-06-13T11:18:30.3080844' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2029,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product1234","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (110, 20, 1, CAST(N'2021-06-13T11:22:27.6712562' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (1).png\""],"Content-Type":["image/png"]},"Length":415448,"Name":"CoverImage","FileName":"Screenshot (1).png"},"Name":"Product121","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (111, 20, 9, CAST(N'2021-06-13T11:24:47.0796913' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product1234","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (112, 20, 9, CAST(N'2021-06-13T11:25:17.5103247' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product11","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (113, 20, 9, CAST(N'2021-06-13T11:25:29.3814235' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product11","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (114, 20, 9, CAST(N'2021-06-13T11:25:44.9907729' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product11","Description":"alo bre","Gender":1,"DiscountRate":1,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (115, 20, 9, CAST(N'2021-06-13T11:28:55.5726510' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (116, 20, 9, CAST(N'2021-06-13T11:30:37.0401960' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (117, 20, 9, CAST(N'2021-06-13T11:32:09.4361448' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (118, 20, 9, CAST(N'2021-06-13T11:37:45.9782011' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (119, 20, 9, CAST(N'2021-06-13T11:38:06.6426469' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":1000.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (120, 20, 9, CAST(N'2021-06-13T11:39:42.0469834' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (121, 20, 9, CAST(N'2021-06-13T11:43:21.9628908' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (122, 20, 9, CAST(N'2021-06-13T11:44:33.0475787' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (123, 20, 9, CAST(N'2021-06-13T11:46:12.9255798' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":null,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (124, 20, 9, CAST(N'2021-06-13T11:46:57.3229281' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (125, 20, 9, CAST(N'2021-06-13T11:48:29.0750164' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (126, 20, 9, CAST(N'2021-06-13T11:52:06.1261508' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (127, 20, 9, CAST(N'2021-06-13T11:53:06.3690518' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (2).png\""],"Content-Type":["image/png"]},"Length":414302,"Name":"CoverImage","FileName":"Screenshot (2).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (128, 20, 3, CAST(N'2021-06-13T12:12:41.0732566' AS DateTime2), N'{"CategoryIds":[],"SizeIds":[],"ColorIds":[],"Keyword":null,"PriceMin":null,"PriceMax":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (129, 20, 29, CAST(N'2021-06-13T12:12:49.3552583' AS DateTime2), N'1043')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (130, 20, 29, CAST(N'2021-06-13T12:52:21.8763926' AS DateTime2), N'1043')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (131, 20, 29, CAST(N'2021-06-13T12:54:27.0317130' AS DateTime2), N'1043')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (132, 20, 29, CAST(N'2021-06-13T12:57:23.8733651' AS DateTime2), N'1043')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (133, 20, 29, CAST(N'2021-06-13T12:59:09.4794773' AS DateTime2), N'1043')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (134, 20, 3, CAST(N'2021-06-13T12:59:30.8821712' AS DateTime2), N'{"CategoryIds":[],"SizeIds":[],"ColorIds":[],"Keyword":null,"PriceMin":null,"PriceMax":null,"PerPage":10,"Page":1}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (135, 20, 10, CAST(N'2021-06-13T13:12:47.8773539' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (136, 20, 6, CAST(N'2021-06-13T13:12:56.1045503' AS DateTime2), N'[{"Id":0,"ProductColorSizeId":44,"Quantity":25},{"Id":0,"ProductColorSizeId":45,"Quantity":3}]')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (137, 20, 10, CAST(N'2021-06-13T13:13:02.0018935' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (138, 20, 8, CAST(N'2021-06-13T13:13:50.1126122' AS DateTime2), N'5')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (139, 20, 6, CAST(N'2021-06-13T13:20:14.6516994' AS DateTime2), N'[{"Id":0,"ProductColorSizeId":44,"Quantity":25},{"Id":0,"ProductColorSizeId":45,"Quantity":3}]')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (140, 20, 10, CAST(N'2021-06-13T13:20:23.9859566' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (141, 20, 10, CAST(N'2021-06-13T13:20:46.0823294' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (142, 20, 10, CAST(N'2021-06-13T13:21:13.1168094' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (143, 20, 10, CAST(N'2021-06-13T13:21:51.9916490' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (144, 20, 10, CAST(N'2021-06-13T13:27:16.8975115' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (145, 20, 10, CAST(N'2021-06-13T13:31:43.4014201' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (146, 20, 10, CAST(N'2021-06-13T13:35:00.4556950' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (147, 20, 12, CAST(N'2021-06-13T13:44:02.1911573' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (148, 20, 12, CAST(N'2021-06-13T13:45:10.0487859' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (149, 20, 13, CAST(N'2021-06-13T13:50:18.0597659' AS DateTime2), N'{"SearchOrderLinesDto":{},"Order":null,"OrderId":3}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (150, 20, 13, CAST(N'2021-06-13T13:51:15.3066452' AS DateTime2), N'{"SearchOrderLinesDto":{},"Order":null,"OrderId":3}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (151, 20, 14, CAST(N'2021-06-13T13:54:18.2527558' AS DateTime2), N'{"Keyword":"stefan","DateFrom":"2021-05-26T00:00:00","DateTo":"2021-06-09T00:00:00"}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (152, 20, 14, CAST(N'2021-06-13T13:54:33.8125862' AS DateTime2), N'{"Keyword":null,"DateFrom":null,"DateTo":null}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (153, 20, 4, CAST(N'2021-06-13T13:56:39.0694058' AS DateTime2), N'{"Id":40,"ProductId":0,"ColorId":1}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (154, 20, 32, CAST(N'2021-06-14T10:51:22.4163247' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test@gmail.com","UseCaseIds":[]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (155, 20, 32, CAST(N'2021-06-14T10:51:58.0713228' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (156, 20, 32, CAST(N'2021-06-14T10:52:22.8241323' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (157, 20, 30, CAST(N'2021-06-14T10:52:34.6073647' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (158, 20, 32, CAST(N'2021-06-14T10:52:57.8536694' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (159, 20, 32, CAST(N'2021-06-14T10:56:29.8163170' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (160, 20, 32, CAST(N'2021-06-14T10:58:09.5580171' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (161, 20, 32, CAST(N'2021-06-14T11:27:58.5459450' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (162, 20, 32, CAST(N'2021-06-14T11:29:12.8476651' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (163, 20, 32, CAST(N'2021-06-14T11:38:16.7456815' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (164, 20, 32, CAST(N'2021-06-14T11:41:25.7048983' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (165, 20, 30, CAST(N'2021-06-14T11:41:40.6007412' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (166, 20, 30, CAST(N'2021-06-14T11:43:21.2874397' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (167, 20, 32, CAST(N'2021-06-14T11:43:54.1754067' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (168, 20, 32, CAST(N'2021-06-14T11:50:34.5226837' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (169, 20, 30, CAST(N'2021-06-14T11:50:50.1623593' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (170, 20, 30, CAST(N'2021-06-14T11:56:55.2745642' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (171, 20, 32, CAST(N'2021-06-14T11:57:04.9331440' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (172, 20, 32, CAST(N'2021-06-14T11:58:23.5699868' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (173, 20, 32, CAST(N'2021-06-14T12:04:52.0796292' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (174, 20, 32, CAST(N'2021-06-14T12:05:24.8746351' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (175, 20, 32, CAST(N'2021-06-14T12:06:50.6303476' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (176, 20, 32, CAST(N'2021-06-14T12:08:38.2893469' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (177, 20, 30, CAST(N'2021-06-14T12:08:53.2846279' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (178, 20, 32, CAST(N'2021-06-14T12:09:03.7167757' AS DateTime2), N'{"Id":20,"FirstName":"test","LastName":"test","Email":"test2@gmail.com","UseCaseIds":[1,2,3,4]}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (179, 20, 30, CAST(N'2021-06-14T12:09:09.0806973' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (180, 21, 18, CAST(N'2021-06-14T16:09:15.0388455' AS DateTime2), N'{}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (181, 21, 9, CAST(N'2021-06-14T16:34:34.5542293' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2030,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (6).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (6).png\""],"Content-Type":["image/png"]},"Length":102810,"Name":"CoverImage","FileName":"Screenshot (6).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (182, 21, 1, CAST(N'2021-06-14T16:35:34.0739473' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (9).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (9).png\""],"Content-Type":["image/png"]},"Length":232604,"Name":"CoverImage","FileName":"Screenshot (9).png"},"Name":"Product0","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (183, 21, 9, CAST(N'2021-06-14T16:36:21.1882057' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2031,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (10).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (10).png\""],"Content-Type":["image/png"]},"Length":155332,"Name":"CoverImage","FileName":"Screenshot (10).png"},"Name":"Product112","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (184, 21, 9, CAST(N'2021-06-14T16:36:45.2371334' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2031,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (10).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (10).png\""],"Content-Type":["image/png"]},"Length":155332,"Name":"CoverImage","FileName":"Screenshot (10).png"},"Name":"Product00","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (185, 21, 9, CAST(N'2021-06-14T16:37:35.5298542' AS DateTime2), N'{"ProductColorSizes":[{"Id":44,"ProductColorId":40,"SizeId":5,"Quantity":50}],"Id":2031,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (6).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (6).png\""],"Content-Type":["image/png"]},"Length":102810,"Name":"CoverImage","FileName":"Screenshot (6).png"},"Name":"Product00","Description":"alo bre","Gender":1,"DiscountRate":0,"CurrentPrice":700.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (186, 21, 1, CAST(N'2021-06-16T14:40:01.3350353' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product8","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (187, 21, 1, CAST(N'2021-06-16T14:40:08.2360823' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":8,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product9","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (188, 21, 1, CAST(N'2021-06-16T14:40:21.7912819' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":10,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":2,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product10","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (189, 21, 1, CAST(N'2021-06-16T14:40:56.0612364' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":9,"ColorsQuantities":[{"ColorId":4,"Quantity":30},{"ColorId":3,"Quantity":25}]},{"SizeId":5,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":3,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product10","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (190, 21, 1, CAST(N'2021-06-16T14:41:10.0270618' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":6,"ColorsQuantities":[{"ColorId":5,"Quantity":10},{"ColorId":3,"Quantity":25}]},{"SizeId":5,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":3,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product10","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (191, 21, 1, CAST(N'2021-06-16T14:41:20.2532203' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":6,"ColorsQuantities":[{"ColorId":5,"Quantity":10},{"ColorId":3,"Quantity":25}]},{"SizeId":5,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":3,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product11","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (192, 21, 1, CAST(N'2021-06-16T14:41:29.6919545' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":7,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":6,"ColorsQuantities":[{"ColorId":5,"Quantity":10},{"ColorId":3,"Quantity":25}]},{"SizeId":5,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":3,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product12","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
INSERT [dbo].[AuditLogs] ([Id], [UserId], [UseCaseId], [ExecutedAt], [Data]) VALUES (193, 21, 1, CAST(N'2021-06-16T14:41:52.2844630' AS DateTime2), N'{"SizesColorsQuantities":[{"SizeId":9,"ColorsQuantities":[{"ColorId":5,"Quantity":15},{"ColorId":1,"Quantity":6}]},{"SizeId":6,"ColorsQuantities":[{"ColorId":5,"Quantity":10},{"ColorId":3,"Quantity":25}]},{"SizeId":5,"ColorsQuantities":[{"ColorId":4,"Quantity":14},{"ColorId":3,"Quantity":22}]}],"Id":0,"CoverImage":{"ContentDisposition":"form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"CoverImage\"; filename=\"Screenshot (27).png\""],"Content-Type":["image/png"]},"Length":232483,"Name":"CoverImage","FileName":"Screenshot (27).png"},"Name":"Product13","Description":"djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga","Gender":1,"DiscountRate":null,"CurrentPrice":850.0,"CategoryId":12}')
SET IDENTITY_INSERT [dbo].[AuditLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [UserId], [ProductColorSizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (7, 20, 44, 25, CAST(N'2021-06-13T13:20:18.7705527' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Carts] ([Id], [UserId], [ProductColorSizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (8, 20, 45, 3, CAST(N'2021-06-13T13:20:18.7710344' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (11, N'est', CAST(N'2021-05-21T12:24:57.5502625' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (12, N'iure', CAST(N'2021-05-21T12:24:57.5513255' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (13, N'molestiae', CAST(N'2021-05-21T12:24:57.5513298' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (14, N'dolores', CAST(N'2021-05-21T12:24:57.5513304' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (15, N'aut', CAST(N'2021-05-21T12:24:57.5513310' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (16, N'test2', CAST(N'2021-06-09T18:50:42.9386127' AS DateTime2), CAST(N'2021-06-09T18:51:06.7904748' AS DateTime2), CAST(N'2021-06-09T18:51:06.7902332' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1, N'Red', CAST(N'2021-05-21T13:53:43.3360653' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Colors] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2, N'Blue', CAST(N'2021-05-21T13:53:43.3367410' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Colors] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (3, N'Green', CAST(N'2021-05-21T13:53:43.3367440' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Colors] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (4, N'Dark', CAST(N'2021-05-21T13:53:43.3367446' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Colors] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (5, N'Yellow', CAST(N'2021-05-21T13:53:43.3367454' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Colors] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (6, N'test2', CAST(N'2021-06-09T18:21:06.3821211' AS DateTime2), CAST(N'2021-06-09T18:37:07.5867114' AS DateTime2), CAST(N'2021-06-09T18:37:07.5836298' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLines] ON 

INSERT [dbo].[OrderLines] ([Id], [OrderId], [ProductId], [Quantity], [SizeId], [Price], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive], [ProductName], [ColorId], [TotalPrice]) VALUES (5, 3, 24, 25, 5, CAST(850.00 AS Decimal(18, 2)), CAST(N'2021-06-08T17:41:34.4161053' AS DateTime2), NULL, NULL, 0, 1, N'Test1', 1, CAST(21250.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderLines] ([Id], [OrderId], [ProductId], [Quantity], [SizeId], [Price], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive], [ProductName], [ColorId], [TotalPrice]) VALUES (6, 3, 24, 3, 6, CAST(850.00 AS Decimal(18, 2)), CAST(N'2021-06-08T17:41:34.4161107' AS DateTime2), NULL, NULL, 0, 1, N'Test2', 1, CAST(2550.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderLines] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [TotalPrice], [Address], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (3, 20, CAST(23800.00 AS Decimal(18, 2)), N'Adresa 1', CAST(N'2021-06-08T17:41:34.4151577' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColors] ON 

INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (40, 24, 1, CAST(N'2021-05-25T13:18:55.3194509' AS DateTime2), CAST(N'2021-06-07T16:21:38.7423847' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (41, 24, 2, CAST(N'2021-05-25T13:18:55.4773445' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (42, 24, 3, CAST(N'2021-05-25T13:18:55.5837156' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (46, 26, 1, CAST(N'2021-05-25T13:39:37.1501807' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (47, 26, 2, CAST(N'2021-05-25T13:39:37.5618829' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (48, 26, 4, CAST(N'2021-05-25T13:39:37.7305782' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (49, 27, 1, CAST(N'2021-05-25T14:12:09.8792395' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (50, 27, 2, CAST(N'2021-05-25T14:12:10.3156301' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (51, 27, 3, CAST(N'2021-05-25T14:12:10.4174335' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1097, 1043, 4, CAST(N'2021-05-29T20:22:23.3672062' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1098, 1043, 5, CAST(N'2021-05-29T20:22:23.7024326' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1099, 1043, 3, CAST(N'2021-05-29T20:22:23.8000980' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1100, 1044, 4, CAST(N'2021-05-29T20:34:15.4639480' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1101, 1044, 5, CAST(N'2021-05-29T20:34:15.4639499' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1102, 1044, 3, CAST(N'2021-05-29T20:34:15.4639514' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2047, 2028, 5, CAST(N'2021-06-01T19:28:05.1940696' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2048, 2028, 1, CAST(N'2021-06-01T19:28:05.1940720' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2049, 2028, 4, CAST(N'2021-06-01T19:28:05.1940730' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2050, 2028, 3, CAST(N'2021-06-01T19:28:05.1940741' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2051, 2028, 2, CAST(N'2021-06-01T19:28:05.1940753' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2052, 2029, 5, CAST(N'2021-06-13T10:38:30.4819176' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2053, 2029, 1, CAST(N'2021-06-13T10:38:30.4819217' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2054, 2029, 4, CAST(N'2021-06-13T10:38:30.4819228' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2055, 2029, 3, CAST(N'2021-06-13T10:38:30.4819239' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2056, 2029, 2, CAST(N'2021-06-13T10:38:30.4819252' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2057, 2030, 5, CAST(N'2021-06-13T11:22:28.6801488' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2058, 2030, 1, CAST(N'2021-06-13T11:22:28.6801505' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2059, 2030, 4, CAST(N'2021-06-13T11:22:28.6801514' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2060, 2030, 3, CAST(N'2021-06-13T11:22:28.6801523' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2061, 2030, 2, CAST(N'2021-06-13T11:22:28.6801535' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2062, 2031, 5, CAST(N'2021-06-14T16:35:34.9122534' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2063, 2031, 1, CAST(N'2021-06-14T16:35:34.9122575' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2064, 2031, 4, CAST(N'2021-06-14T16:35:34.9122586' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2065, 2031, 3, CAST(N'2021-06-14T16:35:34.9122594' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2066, 2031, 2, CAST(N'2021-06-14T16:35:34.9122609' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2067, 2032, 5, CAST(N'2021-06-16T14:40:02.5955580' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2068, 2032, 1, CAST(N'2021-06-16T14:40:02.5955629' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2069, 2032, 4, CAST(N'2021-06-16T14:40:02.5955639' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2070, 2032, 3, CAST(N'2021-06-16T14:40:02.5955942' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2071, 2032, 2, CAST(N'2021-06-16T14:40:02.5956069' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2072, 2033, 5, CAST(N'2021-06-16T14:40:08.3159727' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2073, 2033, 1, CAST(N'2021-06-16T14:40:08.3159734' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2074, 2033, 4, CAST(N'2021-06-16T14:40:08.3159741' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2075, 2033, 3, CAST(N'2021-06-16T14:40:08.3159747' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2076, 2033, 2, CAST(N'2021-06-16T14:40:08.3159756' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2077, 2034, 5, CAST(N'2021-06-16T14:40:56.1356074' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2078, 2034, 1, CAST(N'2021-06-16T14:40:56.1356085' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2079, 2034, 4, CAST(N'2021-06-16T14:40:56.1356093' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2080, 2034, 3, CAST(N'2021-06-16T14:40:56.1356100' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2081, 2035, 5, CAST(N'2021-06-16T14:41:20.2934562' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2082, 2035, 1, CAST(N'2021-06-16T14:41:20.2934571' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2083, 2035, 3, CAST(N'2021-06-16T14:41:20.2934581' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2084, 2035, 4, CAST(N'2021-06-16T14:41:20.2934587' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2085, 2036, 5, CAST(N'2021-06-16T14:41:29.7515001' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2086, 2036, 1, CAST(N'2021-06-16T14:41:29.7515070' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2087, 2036, 3, CAST(N'2021-06-16T14:41:29.7515168' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2088, 2036, 4, CAST(N'2021-06-16T14:41:29.7515228' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2089, 2037, 5, CAST(N'2021-06-16T14:41:52.3535870' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2090, 2037, 1, CAST(N'2021-06-16T14:41:52.3535885' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2091, 2037, 3, CAST(N'2021-06-16T14:41:52.3535893' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColors] ([Id], [ProductId], [ColorId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2092, 2037, 4, CAST(N'2021-06-16T14:41:52.3535898' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[ProductColors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColorSizes] ON 

INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (44, 40, 5, 50, CAST(N'2021-05-25T13:18:55.4773493' AS DateTime2), CAST(N'2021-06-07T14:27:38.9315245' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (45, 40, 6, 4, CAST(N'2021-05-25T13:18:55.5837028' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (46, 41, 5, 5, CAST(N'2021-05-25T13:18:55.5837152' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (47, 42, 6, 2, CAST(N'2021-05-25T13:18:55.5902609' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (52, 46, 5, 10, CAST(N'2021-05-25T13:39:37.5618877' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (53, 46, 7, 4, CAST(N'2021-05-25T13:39:37.7305758' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (54, 47, 5, 5, CAST(N'2021-05-25T13:39:37.7305778' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (55, 48, 7, 2, CAST(N'2021-05-25T13:39:37.7363688' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (56, 49, 6, 10, CAST(N'2021-05-25T14:12:10.3156344' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (57, 50, 7, 4, CAST(N'2021-05-25T14:12:10.4174306' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (58, 50, 6, 5, CAST(N'2021-05-25T14:12:10.4174330' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (59, 51, 7, 2, CAST(N'2021-05-25T14:12:10.4239028' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1112, 1097, 9, 10, CAST(N'2021-05-29T20:22:23.7024369' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1113, 1097, 8, 4, CAST(N'2021-05-29T20:22:23.8000936' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1114, 1098, 9, 5, CAST(N'2021-05-29T20:22:23.8000976' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1115, 1099, 8, 2, CAST(N'2021-05-29T20:22:23.8064174' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1116, 1100, 9, 10, CAST(N'2021-05-29T20:34:15.4639492' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1117, 1100, 8, 4, CAST(N'2021-05-29T20:34:15.4639510' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1118, 1101, 9, 5, CAST(N'2021-05-29T20:34:15.4639506' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1119, 1102, 8, 2, CAST(N'2021-05-29T20:34:15.4639519' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2052, 2047, 7, 15, CAST(N'2021-06-01T19:28:05.1940713' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2053, 2048, 7, 6, CAST(N'2021-06-01T19:28:05.1940725' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2054, 2049, 9, 30, CAST(N'2021-06-01T19:28:05.1940736' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2055, 2049, 8, 14, CAST(N'2021-06-01T19:28:05.1940749' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2056, 2050, 9, 25, CAST(N'2021-06-01T19:28:05.1940745' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2057, 2051, 8, 22, CAST(N'2021-06-01T19:28:05.1940758' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2058, 2052, 7, 15, CAST(N'2021-06-13T10:38:30.4819210' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2059, 2053, 7, 6, CAST(N'2021-06-13T10:38:30.4819223' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2060, 2054, 9, 30, CAST(N'2021-06-13T10:38:30.4819234' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2061, 2054, 8, 14, CAST(N'2021-06-13T10:38:30.4819248' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2062, 2055, 9, 25, CAST(N'2021-06-13T10:38:30.4819243' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2063, 2056, 8, 22, CAST(N'2021-06-13T10:38:30.4819257' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2064, 2057, 7, 15, CAST(N'2021-06-13T11:22:28.6801500' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2065, 2058, 7, 6, CAST(N'2021-06-13T11:22:28.6801510' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2066, 2059, 9, 30, CAST(N'2021-06-13T11:22:28.6801519' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2067, 2059, 8, 14, CAST(N'2021-06-13T11:22:28.6801530' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2068, 2060, 9, 25, CAST(N'2021-06-13T11:22:28.6801527' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2069, 2061, 8, 22, CAST(N'2021-06-13T11:22:28.6801538' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2070, 2062, 7, 15, CAST(N'2021-06-14T16:35:34.9122569' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2071, 2063, 7, 6, CAST(N'2021-06-14T16:35:34.9122581' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2072, 2064, 9, 30, CAST(N'2021-06-14T16:35:34.9122590' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2073, 2064, 8, 14, CAST(N'2021-06-14T16:35:34.9122604' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2074, 2065, 9, 25, CAST(N'2021-06-14T16:35:34.9122600' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2075, 2066, 8, 22, CAST(N'2021-06-14T16:35:34.9122614' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2076, 2067, 7, 15, CAST(N'2021-06-16T14:40:02.5955622' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2077, 2068, 7, 6, CAST(N'2021-06-16T14:40:02.5955634' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2078, 2069, 9, 30, CAST(N'2021-06-16T14:40:02.5955644' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2079, 2069, 8, 14, CAST(N'2021-06-16T14:40:02.5956065' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2080, 2070, 9, 25, CAST(N'2021-06-16T14:40:02.5956061' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2081, 2071, 8, 22, CAST(N'2021-06-16T14:40:02.5956073' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2082, 2072, 7, 15, CAST(N'2021-06-16T14:40:08.3159730' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2083, 2073, 7, 6, CAST(N'2021-06-16T14:40:08.3159738' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2084, 2074, 9, 30, CAST(N'2021-06-16T14:40:08.3159744' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2085, 2074, 8, 14, CAST(N'2021-06-16T14:40:08.3159753' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2086, 2075, 9, 25, CAST(N'2021-06-16T14:40:08.3159750' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2087, 2076, 8, 22, CAST(N'2021-06-16T14:40:08.3159759' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2088, 2077, 7, 15, CAST(N'2021-06-16T14:40:56.1356078' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2089, 2078, 7, 6, CAST(N'2021-06-16T14:40:56.1356090' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2090, 2079, 9, 30, CAST(N'2021-06-16T14:40:56.1356097' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2091, 2079, 5, 14, CAST(N'2021-06-16T14:40:56.1356108' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2092, 2080, 9, 25, CAST(N'2021-06-16T14:40:56.1356104' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2093, 2080, 5, 22, CAST(N'2021-06-16T14:40:56.1356111' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2094, 2081, 7, 15, CAST(N'2021-06-16T14:41:20.2934567' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2095, 2081, 6, 10, CAST(N'2021-06-16T14:41:20.2934578' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2096, 2082, 7, 6, CAST(N'2021-06-16T14:41:20.2934574' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2097, 2083, 6, 25, CAST(N'2021-06-16T14:41:20.2934584' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2098, 2083, 5, 22, CAST(N'2021-06-16T14:41:20.2934593' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2099, 2084, 5, 14, CAST(N'2021-06-16T14:41:20.2934590' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2100, 2085, 7, 15, CAST(N'2021-06-16T14:41:29.7515038' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2101, 2085, 6, 10, CAST(N'2021-06-16T14:41:29.7515137' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2102, 2086, 7, 6, CAST(N'2021-06-16T14:41:29.7515104' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2103, 2087, 6, 25, CAST(N'2021-06-16T14:41:29.7515198' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2104, 2087, 5, 22, CAST(N'2021-06-16T14:41:29.7515287' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2105, 2088, 5, 14, CAST(N'2021-06-16T14:41:29.7515258' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2106, 2089, 9, 15, CAST(N'2021-06-16T14:41:52.3535881' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2107, 2089, 6, 10, CAST(N'2021-06-16T14:41:52.3535891' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2108, 2090, 9, 6, CAST(N'2021-06-16T14:41:52.3535887' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2109, 2091, 6, 25, CAST(N'2021-06-16T14:41:52.3535895' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2110, 2091, 5, 22, CAST(N'2021-06-16T14:41:52.3535902' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[ProductColorSizes] ([Id], [ProductColorId], [SizeId], [Quantity], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2111, 2092, 5, 14, CAST(N'2021-06-16T14:41:52.3535900' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[ProductColorSizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (24, N'Screenshot (1).png', N'Product123', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, 20, CAST(850.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 12, CAST(N'2021-05-25T13:18:55.3187353' AS DateTime2), CAST(N'2021-06-07T14:10:57.8673568' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (26, N'Screenshot (1).png', N'Product3', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 0, 10, CAST(900.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 12, CAST(N'2021-05-25T13:39:37.1497183' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (27, N'Screenshot (1).png', N'Product4', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 0, 10, CAST(900.00 AS Decimal(18, 2)), CAST(1000.00 AS Decimal(18, 2)), 12, CAST(N'2021-05-25T14:12:09.8782861' AS DateTime2), CAST(N'2021-05-25T20:05:31.0006772' AS DateTime2), CAST(N'2021-05-25T20:05:30.9154355' AS DateTime2), 1, 0)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1043, N'Screenshot (1).png', N'Product5', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, 20, CAST(680.00 AS Decimal(18, 2)), CAST(850.00 AS Decimal(18, 2)), 12, CAST(N'2021-05-29T20:22:23.3667023' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (1044, N'Screenshot (1).png', N'Product6', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, 20, CAST(680.00 AS Decimal(18, 2)), CAST(850.00 AS Decimal(18, 2)), 12, CAST(N'2021-05-29T20:34:15.4633876' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2028, N'Screenshot (1).png', N'Product7', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, 20, CAST(680.00 AS Decimal(18, 2)), CAST(850.00 AS Decimal(18, 2)), 12, CAST(N'2021-06-01T19:28:05.1935982' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2029, N'6d2ede16-b621-4df2-b64d-46a848716284.png', N'Product1234', N'alo bre', 1, 20, CAST(800.00 AS Decimal(18, 2)), CAST(850.00 AS Decimal(18, 2)), 12, CAST(N'2021-06-13T10:38:30.4812114' AS DateTime2), CAST(N'2021-06-13T11:17:40.0433133' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2030, N'1d57a55f-c8c7-4177-9693-437ff04a1b05.png', N'Product112', N'alo bre', 1, 0, CAST(700.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 12, CAST(N'2021-06-13T11:22:28.6796421' AS DateTime2), CAST(N'2021-06-14T16:34:36.8373232' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2031, N'bea3f51d-5ded-42f2-8b6c-c141b0191314.png', N'Product00', N'alo bre', 1, 0, CAST(700.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 12, CAST(N'2021-06-14T16:35:34.9114240' AS DateTime2), CAST(N'2021-06-14T16:37:35.5644642' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2032, N'bd13272b-f02d-4940-8aeb-3ccf8d3891db.png', N'Product8', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, NULL, CAST(850.00 AS Decimal(18, 2)), NULL, 12, CAST(N'2021-06-16T14:40:02.5949897' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2033, N'925447ad-8baf-481b-a774-bf75784fb8fb.png', N'Product9', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, NULL, CAST(850.00 AS Decimal(18, 2)), NULL, 12, CAST(N'2021-06-16T14:40:08.3159683' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2034, N'28e3e12c-d1b9-40ca-9f5f-e63d81c4729e.png', N'Product10', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, NULL, CAST(850.00 AS Decimal(18, 2)), NULL, 12, CAST(N'2021-06-16T14:40:56.1356018' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2035, N'8780e536-2ace-4701-8302-bd6a32d92901.png', N'Product11', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, NULL, CAST(850.00 AS Decimal(18, 2)), NULL, 12, CAST(N'2021-06-16T14:41:20.2934527' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2036, N'a7f1cac0-ae90-43b2-ac0f-b63c9aa7ef93.png', N'Product12', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, NULL, CAST(850.00 AS Decimal(18, 2)), NULL, 12, CAST(N'2021-06-16T14:41:29.7514923' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Products] ([Id], [Cover], [Name], [Description], [Gender], [DiscountRate], [CurrentPrice], [OldPrice], [CategoryId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (2037, N'42a9c131-c59d-49c4-8f69-d72feff6d730.png', N'Product13', N'djkashdjkahdjhajkdhajkhdjkashfjkashfjksbjkgnasjkgnjkasbngjklsdga', 1, NULL, CAST(850.00 AS Decimal(18, 2)), NULL, 12, CAST(N'2021-06-16T14:41:52.3535556' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (5, N'S', CAST(N'2021-05-21T13:02:34.6472337' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (6, N'M', CAST(N'2021-05-21T13:02:34.6489653' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (7, N'L', CAST(N'2021-05-21T13:02:34.6489700' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (8, N'XL', CAST(N'2021-05-21T13:02:34.6489705' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (9, N'XXL', CAST(N'2021-05-21T13:02:34.6489711' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (10, N'test', CAST(N'2021-06-09T18:42:37.7744651' AS DateTime2), CAST(N'2021-06-09T18:49:12.6768578' AS DateTime2), CAST(N'2021-06-09T18:49:12.6745258' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (13, N'test1', N'test1', N'alobre@gmail.com', N'47zjNpZX1TiSF4O5pRtEdy7l7Wo=', CAST(N'2021-05-21T18:01:11.2809008' AS DateTime2), CAST(N'2021-06-10T13:14:24.1529183' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (14, N'Larry', N'Stehr', N'Bobbie_Jenkins48@yahoo.com', N'47zjNpZX1TiSF4O5pRtEdy7l7Wo=', CAST(N'2021-05-21T18:01:11.2813374' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (20, N'test', N'test', N'test2@gmail.com', N'47zjNpZX1TiSF4O5pRtEdy7l7Wo=', CAST(N'2021-06-07T17:32:25.7738470' AS DateTime2), CAST(N'2021-06-14T10:52:22.8514837' AS DateTime2), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (21, N'admin', N'admin', N'admin@gmail.com', N'47zjNpZX1TiSF4O5pRtEdy7l7Wo=', CAST(N'2021-06-08T09:36:35.3328679' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (22, N'user', N'user', N'user@gmail.com', N'47zjNpZX1TiSF4O5pRtEdy7l7Wo=', CAST(N'2021-06-16T15:06:11.1792684' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCase] ON 

INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (9, 21, 3, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (13, 21, 6, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (14, 21, 7, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (16, 21, 10, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (21, 21, 12, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (22, 21, 13, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (25, 21, 14, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (27, 21, 15, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (43, 21, 29, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (44, 21, 30, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (47, 21, 31, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (49, 21, 32, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (50, 21, 1, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (53, 21, 9, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (54, 21, 8, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (56, 21, 8, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (70, 20, 1, CAST(N'2021-06-14T12:09:03.7466667' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (71, 20, 2, CAST(N'2021-06-14T12:09:03.7500000' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (72, 20, 3, CAST(N'2021-06-14T12:09:03.7500000' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (73, 20, 4, CAST(N'2021-06-14T12:09:03.7533333' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (74, 21, 2, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (75, 21, 5, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (76, 21, 8, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (77, 21, 11, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (78, 21, 16, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (79, 21, 17, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (80, 21, 18, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (81, 21, 19, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (82, 21, 20, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (83, 21, 21, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (84, 21, 22, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (85, 21, 23, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (86, 21, 24, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (87, 21, 25, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (88, 21, 26, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (89, 21, 27, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (90, 21, 28, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (91, 21, 33, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (92, 21, 34, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (93, 21, 35, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (94, 21, 36, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (95, 21, 37, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (96, 21, 38, CAST(N'2021-06-08T09:36:35.3333786' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (97, 22, 3, CAST(N'2021-06-16T15:06:11.1797761' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (98, 22, 11, CAST(N'2021-06-16T15:06:11.1797773' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (99, 22, 6, CAST(N'2021-06-16T15:06:11.1797778' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (100, 22, 8, CAST(N'2021-06-16T15:06:11.1797783' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (101, 22, 7, CAST(N'2021-06-16T15:06:11.1797787' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (102, 22, 10, CAST(N'2021-06-16T15:06:11.1797793' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (103, 22, 15, CAST(N'2021-06-16T15:06:11.1797797' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (104, 22, 16, CAST(N'2021-06-16T15:06:11.1797800' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (105, 22, 20, CAST(N'2021-06-16T15:06:11.1797804' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (106, 22, 18, CAST(N'2021-06-16T15:06:11.1797807' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (107, 22, 13, CAST(N'2021-06-16T15:06:11.1797811' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (108, 22, 12, CAST(N'2021-06-16T15:06:11.1797814' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (109, 22, 25, CAST(N'2021-06-16T15:06:11.1797818' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (110, 22, 29, CAST(N'2021-06-16T15:06:11.1797822' AS DateTime2), NULL, NULL, 0, 1)
INSERT [dbo].[UserUseCase] ([Id], [UserId], [UseCaseId], [CreatedAt], [UpdatedAt], [DeletedAt], [IsDeleted], [IsActive]) VALUES (111, 22, 24, CAST(N'2021-06-16T15:06:11.1797826' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[UserUseCase] OFF
GO
/****** Object:  Index [IX_AuditLogs_UserId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AuditLogs_UserId] ON [dbo].[AuditLogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_ProductColorSizeId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_ProductColorSizeId] ON [dbo].[Carts]
(
	[ProductColorSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_Name]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_Name] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Colors_Name]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Colors_Name] ON [dbo].[Colors]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_ColorId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_ColorId] ON [dbo].[OrderLines]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_OrderId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_OrderId] ON [dbo].[OrderLines]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_ProductId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_ProductId] ON [dbo].[OrderLines]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLines_SizeId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderLines_SizeId] ON [dbo].[OrderLines]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColors_ColorId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColors_ColorId] ON [dbo].[ProductColors]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColors_ProductId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColors_ProductId] ON [dbo].[ProductColors]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColorSizes_ProductColorId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColorSizes_ProductColorId] ON [dbo].[ProductColorSizes]
(
	[ProductColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColorSizes_SizeId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColorSizes_SizeId] ON [dbo].[ProductColorSizes]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Products_Name]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_Name] ON [dbo].[Products]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Sizes_Name]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sizes_Name] ON [dbo].[Sizes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCase_UserId]    Script Date: 6/16/2021 7:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCase_UserId] ON [dbo].[UserUseCase]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[OrderLines] ADD  DEFAULT ((0)) FOR [ColorId]
GO
ALTER TABLE [dbo].[OrderLines] ADD  DEFAULT ((0.0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [Cover]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[AuditLogs]  WITH CHECK ADD  CONSTRAINT [FK_AuditLogs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuditLogs] CHECK CONSTRAINT [FK_AuditLogs_Users_UserId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_ProductColorSizes_ProductColorSizeId] FOREIGN KEY([ProductColorSizeId])
REFERENCES [dbo].[ProductColorSizes] ([Id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_ProductColorSizes_ProductColorSizeId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users_UserId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Colors_ColorId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderLines]  WITH CHECK ADD  CONSTRAINT [FK_OrderLines_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderLines] CHECK CONSTRAINT [FK_OrderLines_Sizes_SizeId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Colors_ColorId]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductColorSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductColorSizes_ProductColors_ProductColorId] FOREIGN KEY([ProductColorId])
REFERENCES [dbo].[ProductColors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColorSizes] CHECK CONSTRAINT [FK_ProductColorSizes_ProductColors_ProductColorId]
GO
ALTER TABLE [dbo].[ProductColorSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductColorSizes_Sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColorSizes] CHECK CONSTRAINT [FK_ProductColorSizes_Sizes_SizeId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[UserUseCase]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCase_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCase] CHECK CONSTRAINT [FK_UserUseCase_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [shop] SET  READ_WRITE 
GO
