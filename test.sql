USE [master]
GO
/****** Object:  Database [Glowing]    Script Date: 2/23/2024 11:25:39 PM ******/
CREATE DATABASE [Glowing]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Glowing', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Glowing.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Glowing_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Glowing_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Glowing] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Glowing].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Glowing] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Glowing] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Glowing] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Glowing] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Glowing] SET ARITHABORT OFF 
GO
ALTER DATABASE [Glowing] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Glowing] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Glowing] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Glowing] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Glowing] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Glowing] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Glowing] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Glowing] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Glowing] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Glowing] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Glowing] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Glowing] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Glowing] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Glowing] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Glowing] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Glowing] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Glowing] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Glowing] SET RECOVERY FULL 
GO
ALTER DATABASE [Glowing] SET  MULTI_USER 
GO
ALTER DATABASE [Glowing] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Glowing] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Glowing] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Glowing] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Glowing] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Glowing] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Glowing', N'ON'
GO
ALTER DATABASE [Glowing] SET QUERY_STORE = ON
GO
ALTER DATABASE [Glowing] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Glowing]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/23/2024 11:25:39 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[AppUserId] [nvarchar](450) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FAQs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NOT NULL,
	[Status] [bit] NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsPrime] [bit] NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[SKU] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Size] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 2/23/2024 11:25:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240201152104_CreateTableAppUser', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240202142832_CreateTableSlider', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240203162402_CreateTableSection', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240207133008_CreateTableCategory', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240207143133_CreateTableAll', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240208070548_AddIsPrimary', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240210133845_UpdateSlider', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240213130741_CreateTableSize', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240214162508_AddSizeId', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240219114731_updateSKUType', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240219120446_updateSizeProperties', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240220050054_CreateTableSetting', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240221061936_BasketItem', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240221100849_UpdateCategory', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240222175500_CreateTableFAQ', N'6.0.26')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240222175628_UpdateFAQ', N'6.0.26')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ImageUrl]) VALUES (14, N'Skincare', N'c16f6e0e-92ab-43ce-ad93-80e3017f24c1post-comment-avatar-03.png')
INSERT [dbo].[Categories] ([Id], [Name], [ImageUrl]) VALUES (15, N'Bodycare', N'5e2028a3-f033-4ac3-af19-65e38e3599ddScreenshot 2024-02-22 135713.png')
INSERT [dbo].[Categories] ([Id], [Name], [ImageUrl]) VALUES (16, N'Accessories', N'244f0934-f2fa-42fd-8c60-25a472719794Screenshot 2024-02-22 135654.png')
INSERT [dbo].[Categories] ([Id], [Name], [ImageUrl]) VALUES (17, N'Haircare', N'e780d955-7849-476e-9123-4c1ae3f68ae9hero-slider-12.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (1, N'What payment methods are accepted?', N'We accept various payment methods, including credit cards, PayPal, and other secure options.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (2, N'If my order arrives damaged or faulty, what should I do?', N'In case of a damaged or faulty order, please contact our customer support immediately with photos of the issue for prompt assistance.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (3, N'How can I obtain information about the quality of the products?', N'Detailed information about the quality of our products can be found on each product''s description page.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (4, N'How can I get in touch with customer support?', N'You can contact our customer support team via email at support@example.com or by filling out the contact form on our "Contact Us" page.')
INSERT [dbo].[FAQs] ([Id], [Question], [Answer]) VALUES (5, N'How do I register for discounts and promotions?', N'Subscribe to our newsletter to stay updated on the latest promotions and discounts. You can also follow us on social media for exclusive offers.')
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (16, N'e08a22ba-da1c-4aef-9dc0-dbd9f08741eeScreenshot 2024-02-22 140816.png', 3, 1)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (17, N'37065b0f-aa5e-4378-9fc9-421445af72afScreenshot 2024-02-22 140914.png', 3, 0)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (18, N'773bcef0-1f1d-41d6-b75b-0c52994d0153Screenshot 2024-02-22 140905.png', 3, NULL)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (19, N'f4b12206-5536-4778-b253-36d2e5b97d59Screenshot 2024-02-22 141524.png', 4, 1)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (20, N'619c307e-9667-44e9-80d2-f038ccd1a539Screenshot 2024-02-22 141536.png', 4, 0)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (21, N'39c4d710-0e82-4193-b31e-5d050e31e4deScreenshot 2024-02-22 141549.png', 4, NULL)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (22, N'7f3a8dc0-3f02-43be-b7cb-7c173a4c292aproduct-gallery-01.jpg', 5, 1)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (23, N'1b4207ba-1ec1-4f38-8ddb-0454027e4147product-gallery-02.jpg', 5, 0)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (24, N'eab37b14-5fc4-4a2d-93e1-13547d032235product-gallery-03.jpg', 5, NULL)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (25, N'4723ed02-8974-46d2-9adc-1b591126e9aaproduct-gallery-04.jpg', 5, NULL)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (26, N'19292bbc-d207-43da-93f3-2ae4f77b4c38Screenshot 2024-02-22 222839.png', 6, 1)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (27, N'bbd4fb7f-647c-433a-91d2-de563542b395Screenshot 2024-02-22 222848.png', 6, 0)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (28, N'3885c381-5e26-4eb0-9c7b-5b6e8b971996Screenshot 2024-02-22 222857.png', 6, NULL)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (29, N'4ff33919-89bb-447f-920d-15f1eb5134beScreenshot 2024-02-22 223505.png', 7, 1)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (30, N'660c1ab4-6db7-4734-bb0a-9feac21e2fcfScreenshot 2024-02-22 223505.png', 7, 0)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (31, N'f0e1d777-a72a-4e9c-9e2f-bd074b591ae8Screenshot 2024-02-22 223518.png', 7, NULL)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (32, N'd25eca4c-6d65-409f-98e8-c44a726849bdScreenshot 2024-02-22 224205.png', 8, 1)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (33, N'60252864-ef31-442a-b517-937761ed5615Screenshot 2024-02-22 224205.png', 8, 0)
INSERT [dbo].[ProductImages] ([Id], [ImageUrl], [ProductId], [IsPrime]) VALUES (34, N'3f2b978e-c3b3-44a8-b083-00a9428d4aa9Screenshot 2024-02-22 224214.png', 8, NULL)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [SKU], [CategoryId], [Size], [IsDeleted]) VALUES (3, N'Hair Repair Serum', N'Strengthen and repair dry, damaged hair with the power of pure Mirsalehi Honey using this clinically proven 96% natural serum, which harnesses the potency of our Mirsalehi Honey and Bee Garden Oil Blend through encapsulated technology, ensuring a fresh dose with each application for effective nourishment, resulting in visibly healthier and revitalized hair.', CAST(30.00 AS Decimal(18, 2)), N'HC-01', 17, 30, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [SKU], [CategoryId], [Size], [IsDeleted]) VALUES (4, N'HairOil', N'Ultra-concentrated, ultra-light and unique restorative hair oil that protects against heat and eliminates frizz Olaplex Binding Oil No. 7 restores, strengthens and moisturizes all hair types. Minimizing waves and protecting against heat up to 450°F / 230°C, it significantly increases the brightness, smoothness and vibrancy of colors. Suitable for all hair types and types. How to use?- Remove the cap to apply. Turn the bottle upside down and tap the bottom of the bottle with your index finger to give a measured drop.', CAST(40.00 AS Decimal(18, 2)), N'HC-02', 17, 45, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [SKU], [CategoryId], [Size], [IsDeleted]) VALUES (5, N'Cleansing Oil', N'It helps to clean your skin without causing dryness and protecting your skin''s natural moisture balance. With its fast-rinsing formula, it leaves a clean and comfortable feeling on the skin.', CAST(45.00 AS Decimal(18, 2)), N'SK-01', 14, 45, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [SKU], [CategoryId], [Size], [IsDeleted]) VALUES (6, N'Glycolic Acid Toner', N'This 10% Glycolic Acid exfoliating toner helps reduce the appearance of pores and fine lines, as well as promoting smoother, brighter skin.', CAST(19.00 AS Decimal(18, 2)), N'SC-02', 14, 100, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [SKU], [CategoryId], [Size], [IsDeleted]) VALUES (7, N'Hideaway Mirror', N'Experience the new level of comfort with our soft technology-infused cushion. Its ergonomic design and durable materials ensure a day filled with enhanced comfort and quality.', CAST(11.00 AS Decimal(18, 2)), N'AC-01', 16, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [SKU], [CategoryId], [Size], [IsDeleted]) VALUES (8, N'Makeup bag', N'Our makeup bag combines style and functionality, offering a compact and sleek solution to keep your beauty essentials organized on the go.', CAST(18.00 AS Decimal(18, 2)), N'AC-02', 16, 1, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sections] ON 

INSERT [dbo].[Sections] ([Id], [Title], [Description], [ImageUrl]) VALUES (2, N'Free Shipping', N'Free Shipping for orders over $130', N'fa7113db-229b-42b9-936e-bdecb70043eflanding-image-01.png')
INSERT [dbo].[Sections] ([Id], [Title], [Description], [ImageUrl]) VALUES (3, N'Returns', N'Within 30 days for an exchange.', N'bb788c6f-7586-4da4-8439-fe93ed8e3ad6Screenshot 2024-02-10 175951.png')
INSERT [dbo].[Sections] ([Id], [Title], [Description], [ImageUrl]) VALUES (4, N'Online Support', N'24 hours a day, 7 days a week', N'8f404471-c17e-47c7-b9d7-f87fc1f4dd55Screenshot 2024-02-10 180152.png')
INSERT [dbo].[Sections] ([Id], [Title], [Description], [ImageUrl]) VALUES (5, N'Flexible Payment', N'Pay with Multiple Credit Cards', N'8ed05903-7c48-4778-a96a-f4f3b60993b2Screenshot 2024-02-10 180157.png')
SET IDENTITY_INSERT [dbo].[Sections] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl]) VALUES (5, N'Shiny Skin', N'  Refresh your Glowing routine', N'12ac5e9c-f350-4e36-a4eb-10c20625d113hero-slider-white-12.jpg')
INSERT [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl]) VALUES (6, N'New Product', N'Discover new products', N'480acf6b-1646-41e4-9e0c-68b3673726d1hero-slider-06.jpg')
INSERT [dbo].[Sliders] ([Id], [Title], [Description], [ImageUrl]) VALUES (7, N'All products', N'Discover all products', N'b8f2d009-8e9e-48e1-bcd7-3862b0a97167hero-slider-15.jpg')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BasketItems_AppUserId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_AppUserId] ON [dbo].[BasketItems]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_OrderId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_OrderId] ON [dbo].[BasketItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_ProductId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_ProductId] ON [dbo].[BasketItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_AppUserId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_AppUserId] ON [dbo].[Order]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 2/23/2024 11:25:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Size]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Order_OrderId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [Glowing] SET  READ_WRITE 
GO
