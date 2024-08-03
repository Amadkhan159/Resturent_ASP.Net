USE [master]
GO
/****** Object:  Database [ResturentDb]    Script Date: 8/3/2024 4:53:31 PM ******/
CREATE DATABASE [ResturentDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ResturentDb', FILENAME = N'C:\Databases\ResturentDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'ResturentDb_log', FILENAME = N'C:\Databases\ResturentDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ResturentDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ResturentDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ResturentDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ResturentDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ResturentDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ResturentDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ResturentDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ResturentDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ResturentDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ResturentDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ResturentDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ResturentDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ResturentDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ResturentDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ResturentDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ResturentDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ResturentDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ResturentDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ResturentDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ResturentDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ResturentDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ResturentDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ResturentDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ResturentDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ResturentDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ResturentDb] SET  MULTI_USER 
GO
ALTER DATABASE [ResturentDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ResturentDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ResturentDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ResturentDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ResturentDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ResturentDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ResturentDb] SET QUERY_STORE = OFF
GO
USE [ResturentDb]
GO
/****** Object:  User [admin]    Script Date: 8/3/2024 4:53:37 PM ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[AddressTypeTable]    Script Date: 8/3/2024 4:53:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressTypeTable](
	[AddressTypeID] [int] IDENTITY(1,1) NOT NULL,
	[AddressType] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_AddressTypeTable] PRIMARY KEY CLUSTERED 
(
	[AddressTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderTable](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_GenderTable] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatusTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatusTable](
	[ReservationStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationStatus] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ReservationStatusTable] PRIMARY KEY CLUSTERED 
(
	[ReservationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItemCategoryTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItemCategoryTable](
	[StockItemCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[StockItemCategory] [nvarchar](250) NOT NULL,
	[CreatedBy_UserID] [int] NOT NULL,
	[VisibleStatusID] [int] NOT NULL,
 CONSTRAINT [PK_StockItemCategoryTable] PRIMARY KEY CLUSTERED 
(
	[StockItemCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItemIngredientTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItemIngredientTable](
	[StockItemIngredientID] [int] IDENTITY(1,1) NOT NULL,
	[StockItemID] [int] NOT NULL,
	[StockItemIngredientPhotoPath] [varchar](500) NULL,
	[StockItemIngredientTitle] [nvarchar](500) NOT NULL,
	[CreatedBy_UserID] [int] NOT NULL,
 CONSTRAINT [PK_StockItemIngredientTable] PRIMARY KEY CLUSTERED 
(
	[StockItemIngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItemTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItemTable](
	[StockItemID] [int] IDENTITY(1,1) NOT NULL,
	[StockItemCategoryID] [int] NOT NULL,
	[ItemPhotoPath] [varchar](500) NULL,
	[StockItemTitle] [nvarchar](350) NOT NULL,
	[ItemSize] [nvarchar](150) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[RegisterDate] [date] NULL,
	[VisibleStatusID] [int] NOT NULL,
	[CreatedBy_UserID] [int] NOT NULL,
 CONSTRAINT [PK_StockItemTable] PRIMARY KEY CLUSTERED 
(
	[StockItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockMenuCategoryTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockMenuCategoryTable](
	[StockMenuCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[StockMenuCategory] [nvarchar](500) NOT NULL,
	[CreatedBy_UserID] [int] NOT NULL,
 CONSTRAINT [PK_StockMenuCategoryTable] PRIMARY KEY CLUSTERED 
(
	[StockMenuCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockMenuItemTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockMenuItemTable](
	[StockMenuItemID] [int] IDENTITY(1,1) NOT NULL,
	[StockMenuCategoryID] [int] NOT NULL,
	[StockItemID] [int] NOT NULL,
	[VisibleStatusID] [int] NOT NULL,
	[CreatedBy_UserID] [int] NOT NULL,
 CONSTRAINT [PK_StockMenuItemTable] PRIMARY KEY CLUSTERED 
(
	[StockMenuItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableReservationTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableReservationTable](
	[TableReservationID] [int] IDENTITY(1,1) NOT NULL,
	[Reservation_UserID] [int] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[EmailAddress] [varchar](350) NOT NULL,
	[MobileNo] [varchar](20) NOT NULL,
	[ReservationRequestDate] [date] NOT NULL,
	[ReservationDateTime] [datetime] NOT NULL,
	[NoOfPersons] [int] NOT NULL,
	[ProcessBy_UserID] [int] NOT NULL,
	[ReservationStatusID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TableReservationTable] PRIMARY KEY CLUSTERED 
(
	[TableReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddressTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressTable](
	[UserAddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AddressTypeID] [int] NOT NULL,
	[FullAddress] [nvarchar](max) NOT NULL,
	[VisibleStatusID] [int] NOT NULL,
	[CreatedBy_UserID] [int] NOT NULL,
 CONSTRAINT [PK_UserAddressTable] PRIMARY KEY CLUSTERED 
(
	[UserAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetailTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetailTable](
	[UserDetailID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserDetailProviderDate] [date] NOT NULL,
	[PhotoPath] [nvarchar](500) NULL,
	[ID_Number] [varchar](50) NULL,
	[EducationLevel] [nvarchar](500) NULL,
	[EducationLastDegreeScanPhotoPath] [varchar](500) NULL,
	[LastExperienceScanPhotoPath] [varchar](500) NULL,
	[CreatedBy_UserID] [int] NOT NULL,
 CONSTRAINT [PK_UserDetailTable] PRIMARY KEY CLUSTERED 
(
	[UserDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatusTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatusTable](
	[UserStatusID] [int] IDENTITY(1,1) NOT NULL,
	[UserStatus] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_UserStatus Table] PRIMARY KEY CLUSTERED 
(
	[UserStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NULL,
	[ContactNo] [nvarchar](20) NOT NULL,
	[EmailAddress] [varchar](250) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[UserStatusID] [int] NOT NULL,
	[UserStatusChangeDate] [date] NOT NULL,
	[GenderID] [int] NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisibleStatusTable]    Script Date: 8/3/2024 4:53:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisibleStatusTable](
	[VisibleStatusID] [int] IDENTITY(1,1) NOT NULL,
	[VisibleStatus] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_VisibleStatusTable] PRIMARY KEY CLUSTERED 
(
	[VisibleStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AddressTypeTable] ON 

INSERT [dbo].[AddressTypeTable] ([AddressTypeID], [AddressType]) VALUES (1, N'Personal Address')
INSERT [dbo].[AddressTypeTable] ([AddressTypeID], [AddressType]) VALUES (2, N'Home Address')
INSERT [dbo].[AddressTypeTable] ([AddressTypeID], [AddressType]) VALUES (3, N'Work Address')
INSERT [dbo].[AddressTypeTable] ([AddressTypeID], [AddressType]) VALUES (4, N'Other Address')
SET IDENTITY_INSERT [dbo].[AddressTypeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[GenderTable] ON 

INSERT [dbo].[GenderTable] ([GenderID], [GenderTitle]) VALUES (1, N'Male')
INSERT [dbo].[GenderTable] ([GenderID], [GenderTitle]) VALUES (2, N'Female')
INSERT [dbo].[GenderTable] ([GenderID], [GenderTitle]) VALUES (3, N'Other')
INSERT [dbo].[GenderTable] ([GenderID], [GenderTitle]) VALUES (4, N'NON BINARYY')
SET IDENTITY_INSERT [dbo].[GenderTable] OFF
GO
SET IDENTITY_INSERT [dbo].[ReservationStatusTable] ON 

INSERT [dbo].[ReservationStatusTable] ([ReservationStatusID], [ReservationStatus]) VALUES (1, N'Processing')
INSERT [dbo].[ReservationStatusTable] ([ReservationStatusID], [ReservationStatus]) VALUES (2, N'Approved')
INSERT [dbo].[ReservationStatusTable] ([ReservationStatusID], [ReservationStatus]) VALUES (3, N'Reject')
INSERT [dbo].[ReservationStatusTable] ([ReservationStatusID], [ReservationStatus]) VALUES (4, N'No Space')
INSERT [dbo].[ReservationStatusTable] ([ReservationStatusID], [ReservationStatus]) VALUES (5, N'All Reserved')
SET IDENTITY_INSERT [dbo].[ReservationStatusTable] OFF
GO
SET IDENTITY_INSERT [dbo].[StockItemCategoryTable] ON 

INSERT [dbo].[StockItemCategoryTable] ([StockItemCategoryID], [StockItemCategory], [CreatedBy_UserID], [VisibleStatusID]) VALUES (1, N'Cold Drinks', 3, 1)
INSERT [dbo].[StockItemCategoryTable] ([StockItemCategoryID], [StockItemCategory], [CreatedBy_UserID], [VisibleStatusID]) VALUES (2, N'Dishes', 3, 1)
INSERT [dbo].[StockItemCategoryTable] ([StockItemCategoryID], [StockItemCategory], [CreatedBy_UserID], [VisibleStatusID]) VALUES (3, N'Breakfast', 3, 1)
INSERT [dbo].[StockItemCategoryTable] ([StockItemCategoryID], [StockItemCategory], [CreatedBy_UserID], [VisibleStatusID]) VALUES (4, N'TEA', 3, 1)
SET IDENTITY_INSERT [dbo].[StockItemCategoryTable] OFF
GO
SET IDENTITY_INSERT [dbo].[StockItemTable] ON 

INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (1, 2, N'~/Content/StockItemPhoto/stir-fried-beef.jpg', N'Stir-fried Beef', N'Plate', 10, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (2, 2, N'~/Content/StockItemPhoto/marinara-pasta.jpg', N'Marinara Pasta', N'Double Plate', 20, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (3, 3, N'~/Content/StockItemPhoto/red-tea.jpg', N'Red Tea', N'One Cup', 4, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (4, 3, N'~/Content/StockItemPhoto/appam.jpg', N'Appam', N'Single', 2, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (5, 2, N'~/Content/StockItemPhoto/tomato-soup.jpg', N'Tomato Soup', N'Plate', 18, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (6, 2, N'~/Content/StockItemPhoto/swedish-meatballs.jpg', N'Swedish Meatballs', N'Plate', 15, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (7, 3, N'~/Content/StockItemPhoto/black-tea.jpg', N'Black Tea', N'One Cup', 4, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (8, 1, N'~/Content/StockItemPhoto/cocacola-can.jpg', N'Coca Cola', N'250 M/ltr', 3, NULL, 1, 3)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (9, 1, N'~/Content/StockItemPhoto/pepsi-can.jpg', N'Pepsi', N'1 ltr', 4, NULL, 1, 5)
INSERT [dbo].[StockItemTable] ([StockItemID], [StockItemCategoryID], [ItemPhotoPath], [StockItemTitle], [ItemSize], [UnitPrice], [RegisterDate], [VisibleStatusID], [CreatedBy_UserID]) VALUES (11, 1, N'~/Content/StockItemPhoto/11.jpg', N'ICE LEMON TEA', N'SMALL', 1, NULL, 1, 3)
SET IDENTITY_INSERT [dbo].[StockItemTable] OFF
GO
SET IDENTITY_INSERT [dbo].[StockMenuCategoryTable] ON 

INSERT [dbo].[StockMenuCategoryTable] ([StockMenuCategoryID], [StockMenuCategory], [CreatedBy_UserID]) VALUES (1, N'Breakfast', 1)
INSERT [dbo].[StockMenuCategoryTable] ([StockMenuCategoryID], [StockMenuCategory], [CreatedBy_UserID]) VALUES (2, N'Lunch', 1)
INSERT [dbo].[StockMenuCategoryTable] ([StockMenuCategoryID], [StockMenuCategory], [CreatedBy_UserID]) VALUES (3, N'Dinner', 1)
INSERT [dbo].[StockMenuCategoryTable] ([StockMenuCategoryID], [StockMenuCategory], [CreatedBy_UserID]) VALUES (4, N'Drinks', 1)
INSERT [dbo].[StockMenuCategoryTable] ([StockMenuCategoryID], [StockMenuCategory], [CreatedBy_UserID]) VALUES (5, N'Others', 1)
SET IDENTITY_INSERT [dbo].[StockMenuCategoryTable] OFF
GO
SET IDENTITY_INSERT [dbo].[StockMenuItemTable] ON 

INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (1, 3, 2, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (2, 1, 3, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (3, 1, 4, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (4, 3, 6, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (5, 2, 5, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (6, 4, 8, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (7, 1, 7, 1, 3)
INSERT [dbo].[StockMenuItemTable] ([StockMenuItemID], [StockMenuCategoryID], [StockItemID], [VisibleStatusID], [CreatedBy_UserID]) VALUES (8, 4, 9, 1, 5)
SET IDENTITY_INSERT [dbo].[StockMenuItemTable] OFF
GO
SET IDENTITY_INSERT [dbo].[TableReservationTable] ON 

INSERT [dbo].[TableReservationTable] ([TableReservationID], [Reservation_UserID], [FullName], [EmailAddress], [MobileNo], [ReservationRequestDate], [ReservationDateTime], [NoOfPersons], [ProcessBy_UserID], [ReservationStatusID], [Description]) VALUES (5, 4, N'Mike Weeler', N'abcd@gmail.com', N'12345678', CAST(N'2024-07-17' AS Date), CAST(N'2024-07-18T20:00:00.000' AS DateTime), 4, 3, 2, N'Your Table Is Booked')
INSERT [dbo].[TableReservationTable] ([TableReservationID], [Reservation_UserID], [FullName], [EmailAddress], [MobileNo], [ReservationRequestDate], [ReservationDateTime], [NoOfPersons], [ProcessBy_UserID], [ReservationStatusID], [Description]) VALUES (12, 4, N'Mike Family', N'mike@gmail.com', N'123454', CAST(N'2024-07-17' AS Date), CAST(N'2024-07-18T21:00:00.000' AS DateTime), 3, 3, 2, N'All tables full')
INSERT [dbo].[TableReservationTable] ([TableReservationID], [Reservation_UserID], [FullName], [EmailAddress], [MobileNo], [ReservationRequestDate], [ReservationDateTime], [NoOfPersons], [ProcessBy_UserID], [ReservationStatusID], [Description]) VALUES (13, 4, N'Anderson', N'and@gmail.com', N'123456789', CAST(N'2024-07-18' AS Date), CAST(N'2024-07-18T22:00:00.000' AS DateTime), 6, 3, 4, N'All Table Pre-Booked')
INSERT [dbo].[TableReservationTable] ([TableReservationID], [Reservation_UserID], [FullName], [EmailAddress], [MobileNo], [ReservationRequestDate], [ReservationDateTime], [NoOfPersons], [ProcessBy_UserID], [ReservationStatusID], [Description]) VALUES (14, 4, N'Peeter', N'Pet@gmail.com', N'12345678', CAST(N'2024-07-18' AS Date), CAST(N'2024-07-18T23:00:00.000' AS DateTime), 8, 3, 2, N'Your Table is Booked')
SET IDENTITY_INSERT [dbo].[TableReservationTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatusTable] ON 

INSERT [dbo].[UserStatusTable] ([UserStatusID], [UserStatus]) VALUES (1, N'Pending')
INSERT [dbo].[UserStatusTable] ([UserStatusID], [UserStatus]) VALUES (2, N'Active')
INSERT [dbo].[UserStatusTable] ([UserStatusID], [UserStatus]) VALUES (3, N'De-Active')
INSERT [dbo].[UserStatusTable] ([UserStatusID], [UserStatus]) VALUES (4, N'Suspended')
INSERT [dbo].[UserStatusTable] ([UserStatusID], [UserStatus]) VALUES (5, N'Termenated')
INSERT [dbo].[UserStatusTable] ([UserStatusID], [UserStatus]) VALUES (6, N'dEADAA')
SET IDENTITY_INSERT [dbo].[UserStatusTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [ContactNo], [EmailAddress], [RegistrationDate], [UserStatusID], [UserStatusChangeDate], [GenderID]) VALUES (3, 1, N'Thalish', N'123456', N'Thalish', N'Al Wasee', N'12345678', N'thalishwaseem@gmail.com', CAST(N'2024-07-18' AS Date), 1, CAST(N'2024-07-17' AS Date), 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [ContactNo], [EmailAddress], [RegistrationDate], [UserStatusID], [UserStatusChangeDate], [GenderID]) VALUES (4, 3, N'Mike123', N'12345678wE', N'Mike', N'Weeler', N'12345678', N'abcd@gmail.com', CAST(N'2024-07-15' AS Date), 1, CAST(N'0001-01-01' AS Date), 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [ContactNo], [EmailAddress], [RegistrationDate], [UserStatusID], [UserStatusChangeDate], [GenderID]) VALUES (5, 2, N'Staff', N'12345', N'Johan', N'Carter', N'123456789', N'adcde@gmail.com', CAST(N'2024-07-19' AS Date), 1, CAST(N'0001-02-08' AS Date), 1)
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [FirstName], [LastName], [ContactNo], [EmailAddress], [RegistrationDate], [UserStatusID], [UserStatusChangeDate], [GenderID]) VALUES (6, 4, N'arish03', N'strangerthings', N'Arish', N'Tayalan', N'0127920232', N'arish.t@yahoo.com', CAST(N'2024-07-19' AS Date), 1, CAST(N'0001-01-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[UserTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypeTable] ON 

INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (2, N'Staff')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (3, N'Customer')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (4, N'Thalish')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (5, N'ARISH')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (6, N'DDACAA')
SET IDENTITY_INSERT [dbo].[UserTypeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[VisibleStatusTable] ON 

INSERT [dbo].[VisibleStatusTable] ([VisibleStatusID], [VisibleStatus]) VALUES (1, N'Visible')
INSERT [dbo].[VisibleStatusTable] ([VisibleStatusID], [VisibleStatus]) VALUES (2, N'Not Visible')
INSERT [dbo].[VisibleStatusTable] ([VisibleStatusID], [VisibleStatus]) VALUES (3, N'HELLO')
SET IDENTITY_INSERT [dbo].[VisibleStatusTable] OFF
GO
ALTER TABLE [dbo].[StockItemCategoryTable]  WITH CHECK ADD  CONSTRAINT [FK_StockItemCategoryTable_VisibleStatusTable] FOREIGN KEY([VisibleStatusID])
REFERENCES [dbo].[VisibleStatusTable] ([VisibleStatusID])
GO
ALTER TABLE [dbo].[StockItemCategoryTable] CHECK CONSTRAINT [FK_StockItemCategoryTable_VisibleStatusTable]
GO
ALTER TABLE [dbo].[StockItemIngredientTable]  WITH CHECK ADD  CONSTRAINT [FK_StockItemIngredientTable_StockItemTable] FOREIGN KEY([StockItemID])
REFERENCES [dbo].[StockItemTable] ([StockItemID])
GO
ALTER TABLE [dbo].[StockItemIngredientTable] CHECK CONSTRAINT [FK_StockItemIngredientTable_StockItemTable]
GO
ALTER TABLE [dbo].[StockItemTable]  WITH CHECK ADD  CONSTRAINT [FK_StockItemTable_StockItemCategoryTable] FOREIGN KEY([StockItemCategoryID])
REFERENCES [dbo].[StockItemCategoryTable] ([StockItemCategoryID])
GO
ALTER TABLE [dbo].[StockItemTable] CHECK CONSTRAINT [FK_StockItemTable_StockItemCategoryTable]
GO
ALTER TABLE [dbo].[StockItemTable]  WITH CHECK ADD  CONSTRAINT [FK_StockItemTable_VisibleStatusTable] FOREIGN KEY([VisibleStatusID])
REFERENCES [dbo].[VisibleStatusTable] ([VisibleStatusID])
GO
ALTER TABLE [dbo].[StockItemTable] CHECK CONSTRAINT [FK_StockItemTable_VisibleStatusTable]
GO
ALTER TABLE [dbo].[StockMenuItemTable]  WITH CHECK ADD  CONSTRAINT [FK_StockMenuItemTable_StockItemTable] FOREIGN KEY([StockItemID])
REFERENCES [dbo].[StockItemTable] ([StockItemID])
GO
ALTER TABLE [dbo].[StockMenuItemTable] CHECK CONSTRAINT [FK_StockMenuItemTable_StockItemTable]
GO
ALTER TABLE [dbo].[StockMenuItemTable]  WITH CHECK ADD  CONSTRAINT [FK_StockMenuItemTable_StockMenuCategoryTable] FOREIGN KEY([StockMenuCategoryID])
REFERENCES [dbo].[StockMenuCategoryTable] ([StockMenuCategoryID])
GO
ALTER TABLE [dbo].[StockMenuItemTable] CHECK CONSTRAINT [FK_StockMenuItemTable_StockMenuCategoryTable]
GO
ALTER TABLE [dbo].[StockMenuItemTable]  WITH CHECK ADD  CONSTRAINT [FK_StockMenuItemTable_VisibleStatusTable] FOREIGN KEY([VisibleStatusID])
REFERENCES [dbo].[VisibleStatusTable] ([VisibleStatusID])
GO
ALTER TABLE [dbo].[StockMenuItemTable] CHECK CONSTRAINT [FK_StockMenuItemTable_VisibleStatusTable]
GO
ALTER TABLE [dbo].[TableReservationTable]  WITH CHECK ADD  CONSTRAINT [FK_TableReservationTable_Process_UserTable2] FOREIGN KEY([ProcessBy_UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[TableReservationTable] CHECK CONSTRAINT [FK_TableReservationTable_Process_UserTable2]
GO
ALTER TABLE [dbo].[TableReservationTable]  WITH CHECK ADD  CONSTRAINT [FK_TableReservationTable_ReservationStatusTable] FOREIGN KEY([ReservationStatusID])
REFERENCES [dbo].[ReservationStatusTable] ([ReservationStatusID])
GO
ALTER TABLE [dbo].[TableReservationTable] CHECK CONSTRAINT [FK_TableReservationTable_ReservationStatusTable]
GO
ALTER TABLE [dbo].[TableReservationTable]  WITH CHECK ADD  CONSTRAINT [FK_TableReservationTable_UserTable] FOREIGN KEY([Reservation_UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[TableReservationTable] CHECK CONSTRAINT [FK_TableReservationTable_UserTable]
GO
ALTER TABLE [dbo].[UserAddressTable]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressTable_AddressTypeTable] FOREIGN KEY([AddressTypeID])
REFERENCES [dbo].[AddressTypeTable] ([AddressTypeID])
GO
ALTER TABLE [dbo].[UserAddressTable] CHECK CONSTRAINT [FK_UserAddressTable_AddressTypeTable]
GO
ALTER TABLE [dbo].[UserAddressTable]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[UserAddressTable] CHECK CONSTRAINT [FK_UserAddressTable_UserTable]
GO
ALTER TABLE [dbo].[UserAddressTable]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressTable_VisibleStatusTable] FOREIGN KEY([VisibleStatusID])
REFERENCES [dbo].[VisibleStatusTable] ([VisibleStatusID])
GO
ALTER TABLE [dbo].[UserAddressTable] CHECK CONSTRAINT [FK_UserAddressTable_VisibleStatusTable]
GO
ALTER TABLE [dbo].[UserDetailTable]  WITH CHECK ADD  CONSTRAINT [FK_UserDetailTable_UserTable] FOREIGN KEY([UserDetailID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[UserDetailTable] CHECK CONSTRAINT [FK_UserDetailTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_GenderTable] FOREIGN KEY([GenderID])
REFERENCES [dbo].[GenderTable] ([GenderID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_GenderTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserStatusTable] FOREIGN KEY([UserStatusID])
REFERENCES [dbo].[UserStatusTable] ([UserStatusID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserStatusTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTypeTable1] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTypeTable1]
GO
USE [master]
GO
ALTER DATABASE [ResturentDb] SET  READ_WRITE 
GO
