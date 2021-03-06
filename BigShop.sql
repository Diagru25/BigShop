USE [master]
GO
/****** Object:  Database [BigShop]    Script Date: 6/11/2018 9:18:59 PM ******/
CREATE DATABASE [BigShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BigShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BigShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BigShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BigShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BigShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BigShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BigShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BigShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BigShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BigShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BigShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BigShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BigShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BigShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BigShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BigShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BigShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BigShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BigShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BigShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BigShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BigShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BigShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BigShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BigShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BigShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BigShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BigShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BigShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BigShop] SET  MULTI_USER 
GO
ALTER DATABASE [BigShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BigShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BigShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BigShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BigShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BigShop', N'ON'
GO
USE [BigShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifedDate] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDiscriptions] [nchar](10) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UserID] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifedDate] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDiscriptions] [nchar](10) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [nchar](10) NULL,
	[Tag] [nvarchar](500) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentTag](
	[TagID] [varchar](50) NOT NULL,
	[ContentID] [bigint] NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer_endow]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_endow](
	[UserID] [bigint] NOT NULL,
	[EndowID] [bigint] NOT NULL,
	[DateUsed] [date] NULL,
 CONSTRAINT [PK_Customer_endow] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[EndowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerType]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Point] [int] NULL,
 CONSTRAINT [PK_CustomerType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endow]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endow](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Promotion] [int] NULL,
	[Point] [int] NULL,
	[CustomerTypeID] [bigint] NULL,
 CONSTRAINT [PK_Endow] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Content] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_FeedBack_CreatedDate_1]  DEFAULT (getdate()),
	[Status] [int] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_Menu_DisplayOrder_1]  DEFAULT ((1)),
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[Name] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()),
	[UserID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAdress] [nvarchar](250) NULL,
	[ShipEmail] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Product_Price_1]  DEFAULT ((0)),
	[PromotionPrice] [decimal](18, 0) NULL CONSTRAINT [DF_Product_PromotionPrice_1]  DEFAULT ((0)),
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_Product_Quantity_1]  DEFAULT ((0)),
	[CategoryID] [bigint] NULL,
	[BrandID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Product_CreatedDate_1]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifedDate] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL,
	[MetaKeywords] [bigint] NULL,
	[MetaDiscriptions] [nchar](10) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Product_Status_1]  DEFAULT ((1)),
	[TopHot] [datetime] NULL,
	[ViewCount] [nchar](10) NULL CONSTRAINT [DF_Product_ViewCount_1]  DEFAULT ((0)),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_ProductCategory_DisplayOrder_1]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_ProductCategory_CreatedDate_1]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifedDate] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDiscriptions] [nchar](10) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategory_Status_1]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_ProductCategory_ShowOnHome_1]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategorySmall]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategorySmall](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[ProductCategoryID] [int] NULL,
	[DisplayOrder] [int] NULL CONSTRAINT [DF_ProductCategorySmall_DisplayOrder]  DEFAULT ((0)),
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_ProductCategorySmall_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [varchar](50) NULL,
	[ModifedDate] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL CONSTRAINT [DF_ProductCategorySmall_ModifedBy]  DEFAULT ('admin'),
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDiscriptions] [nchar](10) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategorySmall_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_ProductCategorySmall_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductCategorySmall] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifedDate] [datetime] NULL,
	[ModifedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[Name] [nvarchar](50) NULL,
	[ID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[PassWord] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Dayofbirth] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL CONSTRAINT [DF_User_CreatedDate_1]  DEFAULT (getdate()),
	[Status] [bit] NULL CONSTRAINT [DF_User_Status]  DEFAULT ((1)),
	[Type] [int] NULL CONSTRAINT [DF_User_Type]  DEFAULT ((0)),
	[CumulativePoint] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInRole]    Script Date: 6/11/2018 9:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInRole](
	[RoleID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserInRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [ProductID], [Quantity], [UserID], [Status]) VALUES (1, 1, 2, 3, 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[Customer_endow] ([UserID], [EndowID], [DateUsed]) VALUES (11, 0, NULL)
SET IDENTITY_INSERT [dbo].[CustomerType] ON 

INSERT [dbo].[CustomerType] ([ID], [Name], [Point]) VALUES (1, N'Normal', 0)
INSERT [dbo].[CustomerType] ([ID], [Name], [Point]) VALUES (2, N'Bronze', 200)
INSERT [dbo].[CustomerType] ([ID], [Name], [Point]) VALUES (3, N'Silver', 500)
INSERT [dbo].[CustomerType] ([ID], [Name], [Point]) VALUES (4, N'Gold', 1200)
INSERT [dbo].[CustomerType] ([ID], [Name], [Point]) VALUES (5, N'Platinum', 2400)
INSERT [dbo].[CustomerType] ([ID], [Name], [Point]) VALUES (10002, N'Master', 6000)
SET IDENTITY_INSERT [dbo].[CustomerType] OFF
SET IDENTITY_INSERT [dbo].[Endow] ON 

INSERT [dbo].[Endow] ([ID], [Name], [Promotion], [Point], [CustomerTypeID]) VALUES (1, N'Giảm giá 10%', 10, 30, 1)
INSERT [dbo].[Endow] ([ID], [Name], [Promotion], [Point], [CustomerTypeID]) VALUES (2, N'Giảm giá 20%', 20, 100, 2)
INSERT [dbo].[Endow] ([ID], [Name], [Promotion], [Point], [CustomerTypeID]) VALUES (3, N'Giảm giá 50%', 50, 300, 5)
INSERT [dbo].[Endow] ([ID], [Name], [Promotion], [Point], [CustomerTypeID]) VALUES (4, N'Giảm giá 70%', 70, 1000, 10002)
SET IDENTITY_INSERT [dbo].[Endow] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([ID], [Name], [Email], [Content], [CreatedDate], [Status]) VALUES (1, N'Sơn', N'hhg@gmail.com', N'Trang web that la dep. Dich vu tuyet voi', CAST(N'2017-12-03 22:29:51.563' AS DateTime), 1)
INSERT [dbo].[FeedBack] ([ID], [Name], [Email], [Content], [CreatedDate], [Status]) VALUES (2, N'Giang', N'son@gmail.com', N'That khong the tin noi. Qua tuyet voi', CAST(N'2017-12-03 22:30:50.423' AS DateTime), 1)
INSERT [dbo].[FeedBack] ([ID], [Name], [Email], [Content], [CreatedDate], [Status]) VALUES (13, N'Khách hành 1', N'customer @gmail.com', N'Trang web thật là tuyệt vời . Vỗ tay !!', CAST(N'2017-12-13 16:16:37.593' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Chính sách và quy định', N'/chinh-sach-va-quy-dinh', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Đổi trả sản phẩm', N'/doi-tra-san-pham', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Bảo hành', N'/bao-hanh', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Phản hồi', N'/phan-hoi', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Apple', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Samsung', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Sony', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'Tosiba', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (9, N'Panasonic', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (10, N'Canon', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (11, N'HTC', N'#', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (12, N'LG', N'#', 1, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([Name], [ID]) VALUES (N'Menu footer 1', 1)
INSERT [dbo].[MenuType] ([Name], [ID]) VALUES (N'Menu footer 2', 2)
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (18, NULL, NULL, N'giang', N'0975632563', N'2045- Thuỵ Phương - Từ Liêm - Hà Nội ', N'dfsdfsdf@gmail.com', 2)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (20, NULL, NULL, N'HTC One M', N'0986356236', N'201- Đại Kim - Hoàng Mai - Hà Nội ', N'gfgfigu@fdfsdf.co', 2)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (21, NULL, NULL, N'dfsdf', N'09653265365', N'205- Nam Đồng - Đống Đa - Hà Nội ', N'gfgf@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (22, NULL, NULL, N'dfsdf', N'09653265365', N'205- Nam Đồng - Đống Đa - Hà Nội ', N'gfgf@gmail.com', 2)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (23, NULL, NULL, N'sdfasf', N'0985632215', N'231- Chu Minh - Ba Vì - Hà Nội ', N'cicovixcv@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (24, NULL, NULL, N'abc', N'0985632563', N'221- Phương Liên - Đống Đa - Hà Nội ', N'fasdfs@gmail.com', 2)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (25, NULL, NULL, N'son', N'0985326320', N'220- Quán Thánh - Ba Đình - Hà Nội ', N'fdfsdf@fsdfsd.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (26, NULL, NULL, N'giang', N'0985562322', N'121- Mỏ Chè - Sông Công - Thái Nguyên ', N'fadfa@fdsfsd.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (27, NULL, NULL, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (28, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (29, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (30, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (31, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (32, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (33, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (34, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (35, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (36, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (37, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (38, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (39, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (40, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (41, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (42, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (43, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 12, N'giang', N'0916325326', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (44, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 3, N'Sơn', N'', N'', N'', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [UserID], [ShipName], [ShipMobile], [ShipAdress], [ShipEmail], [Status]) VALUES (45, CAST(N'2018-06-11 00:00:00.000' AS DateTime), 3, N'Sơn', N'', N'', N'', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 18, 1, CAST(4200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 20, 1, CAST(4200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 21, 1, CAST(4200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (12, 22, 1, CAST(4200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 23, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 29, 11, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 30, 2, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 31, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 32, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 33, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 34, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10016, 36, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 20, 1, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 21, 1, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 22, 1, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 25, 1, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 26, 1, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 27, 1, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10017, 28, 6, CAST(7899000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10019, 18, 1, CAST(15999000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10019, 25, 1, CAST(15999000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10019, 26, 1, CAST(15999000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10019, 35, 1, CAST(15999000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10020, 24, 1, CAST(20000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10022, 38, 1, CAST(19003000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10022, 39, 1, CAST(19003000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10022, 40, 1, CAST(19003000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10023, 37, 20, CAST(15623000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10023, 41, 1, CAST(15623000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10023, 42, 1, CAST(15623000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10023, 43, 1, CAST(15623000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10023, 44, 2, CAST(15623000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10023, 45, 5, CAST(15623000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (12, N'Samsung Galaxy j7 Pro', N'A01', N'samsung-galaxy-j7-pro', NULL, N'/Assets/client/images/Phone/Phone1.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/files/Untitled.png</Image><Image>http://localhost:64898/ckfinder/userfiles/files/1482469218313954830.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/files/a_n.png</Image></Images>', CAST(4200000 AS Decimal(18, 0)), NULL, NULL, 0, 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10016, N'Xiao Mi Mi4', N'A01', N'xiao-mi-mi4', N'', N'/Assets/client/images/xiao-mi-mi4.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/files/Untitled.png</Image><Image>http://localhost:64898/ckfinder/userfiles/files/a_n.png</Image></Images>', CAST(2500000 AS Decimal(18, 0)), NULL, NULL, 2, 5, 18, NULL, 24, NULL, NULL, NULL, NULL, 26, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10017, N'HTC One M9', N'A01', N'htc-one-m9', N'', N'/Assets/client/images/htc-one-m9.jpg', NULL, CAST(7899000 AS Decimal(18, 0)), NULL, NULL, 6, 5, 12, NULL, 12, NULL, NULL, NULL, NULL, 20, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10019, N'Samsung Galaxy S7 Edge', N'A01', N'samsung-galaxy-s7-edge', N'', N'/Assets/client/images/samsung-galaxy-s7-edge.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/files/Untitled.png</Image><Image>http://localhost:64898/ckfinder/userfiles/files/a_n.png</Image><Image>http://localhost:64898/ckfinder/userfiles/files/1482469218313954830.jpg</Image></Images>', CAST(15999000 AS Decimal(18, 0)), NULL, NULL, 29, 5, 11, NULL, 12, NULL, NULL, NULL, NULL, 20, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10020, N'IphoneX', N'A01', N'iphonex', N'', N'/Assets/client/images/iphonex.png', NULL, CAST(20000000 AS Decimal(18, 0)), NULL, NULL, 20, 5, 20, NULL, 12, NULL, NULL, NULL, NULL, 20, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10021, N'Android Tivi Sony 4K KD-43X7500E', N'A02', N'android-tivi-sony-4k-kd43x7500e', N'', N'/Assets/client/images/android-tivi-sony-4k-kd-43x7500e.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/files/tivi-sony-kd-43x7500e-7-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/files/tivi-sony-kd-43x7500e-3-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/files/tivi-sony-kd-43x7500e-5-org.jpg</Image></Images>', CAST(13650000 AS Decimal(18, 0)), NULL, NULL, 12, 1, 1, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10022, N'Internet Tivi Sony 4K 65 inch KD-65X7000E', N'A02', N'internet-tivi-sony-4k-65-inch-kd65x7000e', N'', N'/Assets/client/images/internet-tivi-sony-4k-65-inch-kd-65x7000e.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/files/tivi-sony-kd-65x7000e-2-2-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/files/tivi-sony-kd-65x7000e-4-2-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/files/tivi-sony-kd-65x7000e-5-2-org.jpg</Image></Images>', CAST(19003000 AS Decimal(18, 0)), NULL, NULL, 15, 1, 1, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10023, N'Smart Tivi Samsung 4K 49 inch UA49MU6100', N'A02', N'smart-tivi-samsung-4k-49-inch-ua49mu6100', N'', N'/Assets/client/images/smart-tivi-samsung-4k-49-inch-ua49mu6100.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/images/tivi-samsung-ua49mu6100-2-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/tivi-samsung-ua49mu6100-3-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/tivi-samsung-ua49mu6100-4-480x480.jpg</Image></Images>', CAST(15623000 AS Decimal(18, 0)), NULL, NULL, 87, 1, 2, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10024, N'Internet Tivi Samsung 49 inch UA49J5200', NULL, N'internet-tivi-samsung-49-inch-ua49j5200', N'', N'/Assets/client/images/internet-tivi-samsung-49-inch-ua49j5200.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/images/tivi-samsung-49-inch-ua49j5200-3-2-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/tivi-samsung-49-inch-ua49j5200-4-2-org.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/tivi-samsung-49-inch-ua49j5200-6-org.jpg</Image></Images>', CAST(18000000 AS Decimal(18, 0)), NULL, NULL, 20, 1, 2, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10025, N'Dell Insprion 3462', NULL, N'dell-insprion-3462', N'', N'/Assets/client/images/dell-insprion-3462.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-1.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-2.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-3-1.jpg</Image></Images>', CAST(1500000 AS Decimal(18, 0)), NULL, NULL, 15, 2, 6, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10026, N'Dell Insprion 7370', NULL, N'dell-insprion-7370', N'', N'/Assets/client/images/dell-insprion-7370.jpg', NULL, CAST(23000000 AS Decimal(18, 0)), NULL, NULL, 16, 2, 6, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10027, N'Dell Insprion 7373', NULL, N'dell-insprion-7373', N'', N'/Assets/client/images/dell-insprion-7373.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-1.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-2.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-3-1.jpg</Image></Images>', CAST(1600000 AS Decimal(18, 0)), NULL, NULL, 36, 2, 6, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10031, N'Asus X541UA-GO1345', NULL, N'asus-x541uago1345', N'', N'/Assets/client/images/asus-x541ua-go1345.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-1.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-2.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-3-1.jpg</Image></Images>', CAST(15000000 AS Decimal(18, 0)), NULL, NULL, 23, 2, 23, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [BrandID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [TopHot], [ViewCount]) VALUES (10032, N'Asus X431UA-GO1345', NULL, N'asus-x431uago1345', N'', N'/Assets/client/images/asus-x431ua-go1345.jpg', N'<Images><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-1.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-2.jpg</Image><Image>http://localhost:64898/ckfinder/userfiles/images/dell-inspiron-3462-n4200-4gb-500gb-dos-6pftf11-3-1.jpg</Image></Images>', CAST(2000000 AS Decimal(18, 0)), NULL, NULL, 53, 2, 23, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (1, N'TIVI', N'tivi', NULL, 1, NULL, CAST(N'2017-10-10 01:46:25.287' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (2, N'LAPTOP', N'laptop', NULL, 1, NULL, CAST(N'2017-10-10 01:46:48.777' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (3, N'TỦ LẠNH', N'tu-lanh', NULL, 1, NULL, CAST(N'2017-10-10 01:47:39.827' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (4, N'MÁY GIẶT', N'may-giat', NULL, 1, NULL, CAST(N'2017-10-10 01:48:46.787' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (5, N'ĐIỆN THOẠI', N'dien-thoai', NULL, 1, NULL, CAST(N'2017-10-10 01:49:04.367' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (6, N'GIA DỤNG', N'gia-dung', NULL, 2, NULL, CAST(N'2017-10-10 01:49:48.417' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (7, N'TABLET', N'tablet', NULL, 2, NULL, CAST(N'2017-10-10 01:50:08.870' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (8, N' ĐIỆN TỬ ÂM THANH', N'dien-tu-am-thanh', NULL, 2, NULL, CAST(N'2017-10-10 01:51:33.510' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (10, N' ĐIỆN LẠNH', N'dien-lanh', NULL, 2, NULL, CAST(N'2017-11-13 23:36:23.400' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[ProductCategorySmall] ON 

INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (1, N'SONY', N'sony', 1, 0, NULL, CAST(N'2017-10-10 01:53:36.007' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (2, N'SAMSUNG', N'samsung', 1, 0, NULL, CAST(N'2017-10-10 01:53:50.070' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (3, N'LG', N'lg', 1, 0, NULL, CAST(N'2017-10-10 01:53:58.077' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (4, N'TCL', N'tcl', 1, 0, NULL, CAST(N'2017-10-10 01:54:05.407' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (5, N'PANASONIC', N'panasonic', 1, 0, NULL, CAST(N'2017-10-10 01:54:20.357' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (6, N'DELL', N'dell', 2, 0, NULL, CAST(N'2017-10-10 01:55:26.417' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (7, N'HP', N'hp', 2, 0, NULL, CAST(N'2017-10-10 01:55:31.520' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (8, N'ACER', N'acer', 2, 0, NULL, CAST(N'2017-10-10 01:55:40.797' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (11, N'SAMSUNG', N'samsung', 5, 0, NULL, CAST(N'2017-10-10 04:31:09.887' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (12, N'HTC', N'htc', 5, 0, NULL, CAST(N'2017-10-10 04:31:21.403' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (13, N'SONY', N'sony', 3, 0, NULL, CAST(N'2017-10-31 22:26:54.680' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (14, N'SAMSUNG', N'samsung', 3, 0, NULL, CAST(N'2017-10-31 22:27:43.203' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (15, N'LG', N'lg', 4, 0, NULL, CAST(N'2017-10-31 22:28:53.803' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (16, N'TCL', N'tcl', 4, 0, NULL, CAST(N'2017-10-31 22:32:20.623' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (17, N'ASUS', N'asus', 5, 0, NULL, CAST(N'2017-11-07 09:24:56.717' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (18, N'XIAOMI', N'xiaomi', 5, 0, NULL, CAST(N'2017-11-08 13:55:40.673' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (20, N'APPLE', N'apple', 5, 0, NULL, CAST(N'2017-11-13 23:33:14.317' AS DateTime), NULL, NULL, N'admin', NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (21, N'BPHONE', N'bphone', 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (22, N'LG', N'lg', 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[ProductCategorySmall] ([ID], [Name], [MetaTitle], [ProductCategoryID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifedDate], [ModifedBy], [MetaKeywords], [MetaDiscriptions], [Status], [ShowOnHome]) VALUES (23, N'ASUS', N'asus', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategorySmall] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Root')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [PassWord], [Name], [Address], [Email], [Dayofbirth], [Phone], [CreatedDate], [Status], [Type], [CumulativePoint]) VALUES (3, N'diagru25', N'1', N'Sơn', N'Nghĩa Tân - Cầu Giấy - Hà Nội', N'fsaf2@mail.com', CAST(N'1981-05-11' AS Date), N'0916325326', CAST(N'1996-10-25' AS Date), 1, 1, 1309)
INSERT [dbo].[User] ([ID], [UserName], [PassWord], [Name], [Address], [Email], [Dayofbirth], [Phone], [CreatedDate], [Status], [Type], [CumulativePoint]) VALUES (10, N'cayidm', N'1', N'Giang', N'Nghĩa Tân - Cầu Giấy - Hà Nội', N'fsaf2@mail.com', CAST(N'1982-06-11' AS Date), N'0916325326', CAST(N'2017-10-31' AS Date), 1, 2, 500)
INSERT [dbo].[User] ([ID], [UserName], [PassWord], [Name], [Address], [Email], [Dayofbirth], [Phone], [CreatedDate], [Status], [Type], [CumulativePoint]) VALUES (11, N'customer', N'1', N'cs', N'Nghĩa Tân - Cầu Giấy - Hà Nội', N'fsaf2@mail.com', CAST(N'1992-06-25' AS Date), N'0916325326', CAST(N'2017-12-12' AS Date), 1, 0, 2551)
INSERT [dbo].[User] ([ID], [UserName], [PassWord], [Name], [Address], [Email], [Dayofbirth], [Phone], [CreatedDate], [Status], [Type], [CumulativePoint]) VALUES (12, N'customer1', N'abc123', N'giang', N'- Yên Lư - Yên Dũng - Bắc Giang ', N'fsaf2@mail.com', CAST(N'1962-03-15' AS Date), N'0916325326', CAST(N'2018-06-11' AS Date), 1, 0, 4007)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserInRole] ([RoleID], [UserName]) VALUES (1, N'diagru25')
INSERT [dbo].[UserInRole] ([RoleID], [UserName]) VALUES (2, N'diagru25')
INSERT [dbo].[UserInRole] ([RoleID], [UserName]) VALUES (3, N'customer')
INSERT [dbo].[UserInRole] ([RoleID], [UserName]) VALUES (3, N'diagru25')
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status_1]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount_1]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder_1]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status_1]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [BigShop] SET  READ_WRITE 
GO
