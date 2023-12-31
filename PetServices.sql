/****** Object:  Database [PetServices]    Script Date: 12/19/2023 4:02:20 AM ******/
CREATE DATABASE [PetServices]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [PetServices] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [PetServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetServices] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [PetServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetServices] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PetServices] SET  MULTI_USER 
GO
ALTER DATABASE [PetServices] SET ENCRYPTION ON
GO
ALTER DATABASE [PetServices] SET QUERY_STORE = ON
GO
ALTER DATABASE [PetServices] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[UserInfoID] [int] NULL,
	[PartnerInfoID] [int] NULL,
	[RoleID] [int] NULL,
	[OTPID] [int] NULL,
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Heading] [nvarchar](max) NULL,
	[PageTile] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[PublisheDate] [date] NULL,
	[Status] [bit] NULL,
	[TagID] [int] NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRoomDetail]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoomDetail](
	[RoomID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Price] [float] NULL,
	[Note] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[FeedbackStatus] [bit] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_BookingRoomDetail] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRoomServices]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoomServices](
	[OrderID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PriceService] [float] NULL,
 CONSTRAINT [PK_BookingRoomServices] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[RoomID] ASC,
	[ServiceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingServicesDetail]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingServicesDetail](
	[ServiceID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Price] [float] NULL,
	[Weight] [float] NULL,
	[PriceService] [float] NULL,
	[PetInfoID] [int] NULL,
	[PartnerInfoID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[FeedbackPartnerStatus] [bit] NULL,
	[FeedbackStatus] [bit] NULL,
	[StatusOrderService] [nvarchar](200) NULL,
 CONSTRAINT [PK_BookingSerrvicesDetail] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[NumberStart] [int] NULL,
	[ServiceID] [int] NULL,
	[RoomID] [int] NULL,
	[PartnerID] [int] NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProductDetail]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductDetail](
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[FeedbackStatus] [bit] NULL,
	[StatusOrderProduct] [nvarchar](200) NULL,
 CONSTRAINT [PK_OrderProductDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderStatus] [nvarchar](500) NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [varchar](10) NULL,
	[TypePay] [nvarchar](500) NULL,
	[FullName] [nvarchar](500) NULL,
	[UserInfoID] [int] NULL,
	[StatusPayment] [bit] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderType]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderType](
	[OrderTypeID] [int] NOT NULL,
	[OrderProduct] [bit] NULL,
	[BookingRoom] [bit] NULL,
	[BookingService] [bit] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_OrderType] PRIMARY KEY CLUSTERED 
(
	[OrderTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPS]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPS](
	[OTPID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](6) NULL,
 CONSTRAINT [PK_OTPS] PRIMARY KEY CLUSTERED 
(
	[OTPID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerInfo]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerInfo](
	[PartnerInfoID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](1000) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[CardNumber] [varchar](100) NULL,
	[ImagePartner] [varchar](max) NULL,
	[ImageCertificate] [varchar](max) NULL,
	[CardName] [varchar](100) NULL,
	[Lat] [nvarchar](500) NULL,
	[Lng] [nvarchar](500) NULL,
	[Dob] [date] NULL,
 CONSTRAINT [PK_PartnerInfo] PRIMARY KEY CLUSTERED 
(
	[PartnerInfoID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[Salary] [float] NULL,
	[DateSalary] [datetime] NULL,
	[StatusSalary] [bit] NULL,
	[PartnerInfoID] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetInfo]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetInfo](
	[PetInfoID] [int] IDENTITY(1,1) NOT NULL,
	[PetName] [nvarchar](500) NULL,
	[ImagePet] [varchar](max) NULL,
	[Species] [nvarchar](500) NULL,
	[Gender] [bit] NULL,
	[Descriptions] [nvarchar](max) NULL,
	[UserInfoID] [int] NULL,
	[Weight] [float] NULL,
	[Dob] [date] NULL,
 CONSTRAINT [PK_PetInfo] PRIMARY KEY CLUSTERED 
(
	[PetInfoID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[Desciption] [nvarchar](max) NULL,
	[Picture] [varchar](max) NULL,
	[Status] [bit] NULL,
	[Price] [float] NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL,
	[ProCategoriesID] [int] NULL,
	[Quantity] [int] NULL,
	[QuantitySold] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[ProCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](500) NULL,
	[Picture] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProCategoriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reason]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reason](
	[ReasonID] [int] IDENTITY(1,1) NOT NULL,
	[ReasonTitle] [nvarchar](max) NULL,
	[ReasonDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReasonRejected] PRIMARY KEY CLUSTERED 
(
	[ReasonID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReasonOrders]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReasonOrders](
	[ReasonOrderID] [int] IDENTITY(1,1) NOT NULL,
	[ReasonOrderTitle] [nvarchar](max) NULL,
	[ReasonOrderDescription] [nvarchar](max) NULL,
	[OrderID] [int] NULL,
	[EmailReject] [varchar](100) NULL,
	[RejectTime] [datetime] NULL,
 CONSTRAINT [PK_ReasonOrders] PRIMARY KEY CLUSTERED 
(
	[ReasonOrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Picture] [varchar](max) NULL,
	[Price] [float] NULL,
	[RoomCategoriesID] [int] NULL,
	[Slot] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomCategories]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomCategories](
	[RoomCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Picture] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_RoomCategories] PRIMARY KEY CLUSTERED 
(
	[RoomCategoriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServices]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomServices](
	[RoomID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
 CONSTRAINT [PK_RoomServices] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[ServiceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategories](
	[SerCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[SerCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Picture] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ServiceCategories] PRIMARY KEY CLUSTERED 
(
	[SerCategoriesID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Time] [float] NULL,
	[Picture] [varchar](max) NULL,
	[Price] [float] NULL,
	[SerCategoriesID] [int] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/19/2023 4:02:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserInfoID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](1000) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[ImageUser] [varchar](max) NULL,
	[Dob] [date] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserInfoID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (2, N'admin@gmail.com', N'$2a$10$aqE./PmuK7.ZzjFaO.UJZ.yS9MQBjTFZ0lOXCkNIRVuUg/wvbwHcm', 1, 1, NULL, 1, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (3, N'manager@gmail.com', N'$2a$10$owQpfPGOmMSYnSP5/1oYvOIfHjXr1jRHSXM.E6QDVpx8UEy41DM8m', 1, 2, NULL, 3, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (4, N'customer@gmail.com', N'$2a$10$i/eHzWyDLzWUo.fSWHqiUu0XwQ4FwkK5CxCSMEPXloUljNZ.Ne1k6', 1, 3, NULL, 2, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (5, N'partner@gmail.com', N'$2a$10$d/ufkhk9UYMW4ctYs9NiduWHgzrTu5eKOEt9AZqM938Q6lfQ/wPUC', 1, 18, 1, 4, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (13, N'customer1@gmail.com', N'$2a$10$kTgOzuV605admF1AT4p7LOl6zONuAL.m.P5Vaj8w78MIcI0BQd.9O', 1, 11, NULL, 2, 3, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (14, N'hungnvhe153434@fpt.edu.vn', N'$2a$10$To2zWHmy.LLQOnqQlfF.d.uJ9CSgu.mp2J5jRUJGf7hcGGu8HWgSW', 1, NULL, 3, 4, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (15, N'vanhung38ht@gmail.com', N'$2a$10$vW5IcoFTF2yApncuVlgMhO1LZz9w9OGPym6nr1B/FTQdhO8BzbTli', 1, 12, NULL, 2, 4, CAST(N'2023-09-22' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (24, N'phuchunghiep@gmail.com', N'$2a$10$zPh90H3wu/1Wiw4JaX.JI.waYYQWZbBcZ.27nyc0Mak7YaMCi.XAO', 1, 20, NULL, 2, 8, CAST(N'2023-11-28' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (26, N'ngangiang2909@gmail.com', N'$2a$10$ygSYzGNwEyYJe84P/gqu6OeXEmj5u/uuRrA2cwsN35uLVRnk2Q0XC', 1, 22, NULL, 2, 10, CAST(N'2023-11-29' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (27, N'giangthnhe153205@fpt.edu.vn', N'$2a$10$Gb1acIrasCgSgdWZTAu75OOQLzRBTn8.h3r1MoaXtlmsqXJJ8UVnC', 1, NULL, 7, 4, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (31, N'huyennguyen0924@gmail.com', N'$2a$10$Xq5Ch3QT2PBmAPq7z3VIfOlvjHGaIEhvdrlHaizAd2xfIr7..iITG', 1, 26, NULL, 2, 14, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (32, N'linhnguyen2772001@gmail.com', N'$2a$10$eL5gJmXCs9YlmyfhGPEtoeYmo2uod/Vr778ExPUSP5wPDiwYgKFPm', 1, 27, NULL, 2, 15, CAST(N'2023-12-02' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (34, N'ngangiang299@gmail.com', N'$2a$10$dfPIqOaLo0E784U3rS/CcOhwRBru/8ayN8DRFfGGx1eM5aNM3kLSa', 1, 29, NULL, 2, 17, CAST(N'2023-12-09' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (46, N'campus265@gmail.com', N'$2a$10$JWG3p7m7XqqnNN0SVhZ...Ongwr6oH2Tfoe1tPaPkB6ToO.jB5/XO', 1, 38, NULL, 2, 23, CAST(N'2023-12-14' AS Date))
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (47, N'admin123@gmail.com', N'$2a$10$yMk49nVBSbgXlPltalPaY.cFJTPMEnuuWOVYdcSf2GTPzGe7sHdpe', 1, 39, NULL, 3, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (48, N'admin1234@gmail.com', N'$2a$10$oESsO3mASy0LoAAah25akePAlKcAeygjHQLoDGKb//K9nUm54vRqa', 1, 40, 12, 4, NULL, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID], [CreateDate]) VALUES (49, N'admin12345@gmail.com', N'$2a$10$I1YVHrBON.FuxB5FqgzLEOchkyH8EDFx2TgCYAa0You3DXXQ2YYWS', 1, 41, 13, 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (1, N'<h2>I. Giới thiệu về tầm quan trọng của việc cho m&egrave;o uống thuốc đ&uacute;ng c&aacute;ch.</h2>
<h3><strong>1. Sự cần thiết của việc cho m&egrave;o uống thuốc</strong>:</h3>
<p>M&egrave;o giống như con người cũng c&oacute; thể mắc bệnh v&agrave; cần phải được điều trị bằng thuốc. Việc cho m&egrave;o uống thuốc đ&oacute;ng vai tr&ograve; quan trọng để gi&uacute;p ch&uacute;ng hồi phục nhanh ch&oacute;ng v&agrave; ngăn ngừa c&aacute;c biến chứng c&oacute; thể g&acirc;y ra hậu quả nghi&ecirc;m trọng cho sức khỏe của m&egrave;o.</p>
<figure id="attachment_6674" class="wp-caption alignnone" aria-describedby="caption-attachment-6674"><img class="size-full wp-image-6674 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/12/image.webp" alt="nuoi-chung-2" width="1200" height="599" data-ll-status="loaded">
<figcaption id="caption-attachment-6674" class="wp-caption-text">Cho ch&uacute; m&egrave;o kh&ocirc;ng gian ri&ecirc;ng</figcaption>
</figure>
<p>Việc uống thuốc cũng gi&uacute;p m&egrave;o cảm thấy thoải m&aacute;i hơn v&agrave; giảm thiểu sự kh&oacute; chịu trong qu&aacute; tr&igrave;nh bị bệnh. Do đ&oacute;, việc cho m&egrave;o uống thuốc l&agrave; v&ocirc; c&ugrave;ng cần thiết v&agrave; cần được thực hiện đ&uacute;ng c&aacute;ch.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMV0=">&nbsp;</div>
<h3>2. Tầm quan trọng của việc cho m&egrave;o uống đ&uacute;ng liều lượng v&agrave; thời gian.</h3>
<p>Việc cho m&egrave;o uống đ&uacute;ng liều lượng v&agrave; thời gian rất quan trọng để đảm bảo hiệu quả của thuốc v&agrave; tr&aacute;nh t&aacute;c dụng phụ kh&ocirc;ng mong muốn. Nếu uống &iacute;t hơn liều lượng, thuốc c&oacute; thể kh&ocirc;ng đạt hiệu quả cần thiết v&agrave; nếu uống nhiều hơn liều lượng, m&egrave;o c&oacute; thể gặp phải t&aacute;c dụng phụ đ&aacute;ng ngại.</p>
<p>Ngo&agrave;i ra, việc uống thuốc đ&uacute;ng thời gian cũng đảm bảo rằng thuốc đang hoạt động trong cơ thể của m&egrave;o v&agrave; c&oacute; thể đạt được hiệu quả tốt nhất.</p>
<figure id="attachment_6374" class="wp-caption aligncenter" aria-describedby="caption-attachment-6374"><img class="size-full wp-image-6374 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/11/tay-giun-cho-meo-con-1.jpg" alt="tay-giun-cho-meo-con-1" width="1200" height="600" data-ll-status="loaded">
<figcaption id="caption-attachment-6374" class="wp-caption-text">M&egrave;o con rất cần được tẩy giun để ph&aacute;t triển khỏe mạnh</figcaption>
</figure>
<h2>II. Những thứ cần chuẩn bị trước khi cho m&egrave;o uống thuốc</h2>
<ol>
<li>Thuốc cần cho m&egrave;o uống</li>
<li>Găng tay y tế để tr&aacute;nh bị nhiễm</li>
<li>Nước hoặc thức uống kh&aacute;c để gi&uacute;p m&egrave;o uống thuốc dễ d&agrave;ng</li>
<li>Muỗng hoặc ống ti&ecirc;m (nếu cần)</li>
<li>Khăn giấy để lau sạch sau khi cho m&egrave;o uống thuốc</li>
<li>Đọc kỹ hướng dẫn sử dụng tr&ecirc;n nh&atilde;n thuốc để đảm bảo liều lượng v&agrave; c&aacute;ch sử dụng đ&uacute;ng hướng dẫn.</li>
</ol>
<h2>III. C&aacute;c c&aacute;ch để cho m&egrave;o uống thuốc</h2>
<h3>1. Sử dụng dụng cụ hỗ trợ như ống ti&ecirc;m thuốc, ống nhỏ cho m&egrave;o uống thuốc:</h3>
<ul>
<li>Sử dụng ống ti&ecirc;m thuốc: Chọn ống ti&ecirc;m c&oacute; k&iacute;ch thước ph&ugrave; hợp với m&egrave;o, sau đ&oacute; nghi&ecirc;ng đầu m&egrave;o l&ecirc;n v&agrave; nhẹ nh&agrave;ng đưa ống ti&ecirc;m v&agrave;o họng m&egrave;o v&agrave; nhấn n&uacute;t để cho thuốc v&agrave;o.</li>
<li>Sử dụng ống nhỏ cho m&egrave;o uống thuốc: D&ugrave;ng ống nhỏ nhẹ nh&agrave;ng đưa v&agrave;o miệng m&egrave;o, nhấn giữ phần l&otilde;m của ống v&agrave; đưa thuốc v&agrave;o.</li>
</ul>
<h3>2. Pha trộn thuốc với thức ăn:</h3>
<ul>
<li>Chọn thức ăn y&ecirc;u th&iacute;ch của m&egrave;o v&agrave; pha thuốc v&agrave;o trong đ&oacute;.</li>
<li>Trộn đều để thuốc được ph&acirc;n t&aacute;n đều trong thức ăn.</li>
<li>Cho m&egrave;o ăn như b&igrave;nh thường.</li>
</ul>
<figure id="attachment_5670" class="wp-caption aligncenter" aria-describedby="caption-attachment-5670"><img class="wp-image-5670 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/pate-meo-1.jpg" alt="pate-meo-1" width="839" height="558" data-ll-status="loaded">
<figcaption id="caption-attachment-5670" class="wp-caption-text">Pate l&agrave; m&oacute;n ăn ưa th&iacute;ch của m&egrave;o</figcaption>
</figure>
<h3>3. Sử dụng b&aacute;nh thưởng hoặc m&oacute;n ăn y&ecirc;u th&iacute;ch của m&egrave;o:</h3>
<ul>
<li>Cho thuốc v&agrave;o trong m&oacute;n ăn y&ecirc;u th&iacute;ch của m&egrave;o, chẳng hạn như b&aacute;nh, pate hoặc thức ăn mềm.</li>
<li>Đảm bảo rằng m&egrave;o ăn hết to&agrave;n bộ m&oacute;n ăn, bao gồm cả thuốc.</li>
</ul>
<p><strong>Lưu &yacute;</strong>: Trước khi sử dụng phương ph&aacute;p n&agrave;o, cần phải tham khảo &yacute; kiến của b&aacute;c sĩ th&uacute; y để đảm bảo đ&uacute;ng liều lượng v&agrave; thời gian sử dụng thuốc cho m&egrave;o.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMl0=">&nbsp;</div>
<h2>IV. C&aacute;c lưu &yacute; khi cho m&egrave;o uống thuốc</h2>
<h3>1. Đảm bảo thuốc ph&ugrave; hợp cho m&egrave;o:</h3>
<p>Trước khi cho m&egrave;o uống thuốc, cần đảm bảo thuốc được chỉ định cho m&egrave;o v&agrave; kh&ocirc;ng g&acirc;y t&aacute;c dụng phụ nghi&ecirc;m trọng. Bạn n&ecirc;n hỏi &yacute; kiến ​​của b&aacute;c sĩ th&uacute; y hoặc chuy&ecirc;n gia về sức khỏe động vật trước khi sử dụng bất kỳ loại thuốc n&agrave;o.</p>
<h3>2. T&igrave;m hiểu về thuốc v&agrave; liều lượng đ&uacute;ng c&aacute;ch:</h3>
<p>Bạn cần t&igrave;m hiểu về thuốc v&agrave; liều lượng ph&ugrave; hợp để đảm bảo m&egrave;o nhận đủ lượng thuốc cần thiết. Hỏi &yacute; kiến ​​b&aacute;c sĩ th&uacute; y hoặc chuy&ecirc;n gia về sức khỏe động vật nếu bạn kh&ocirc;ng chắc chắn về c&aacute;ch sử dụng thuốc.</p>
<h3>3. Kiểm tra lại từng liều thuốc v&agrave; lịch tr&igrave;nh uống thuốc:</h3>
<p>Đảm bảo rằng m&egrave;o đ&atilde; uống đủ liều lượng v&agrave; đ&uacute;ng thời gian uống thuốc, nếu kh&ocirc;ng th&igrave; liều lượng thuốc c&oacute; thể kh&ocirc;ng đủ để điều trị hoặc kh&ocirc;ng hiệu quả. Đặt nhắc nhở hoặc ghi ch&eacute;p để kh&ocirc;ng qu&ecirc;n cho m&egrave;o uống thuốc đ&uacute;ng lịch tr&igrave;nh.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsM10=">&nbsp;</div>
<h3>4. Đảm bảo m&egrave;o uống đủ nước sau khi uống thuốc:</h3>
<p>Điều n&agrave;y rất quan trọng để gi&uacute;p m&egrave;o hấp thụ thuốc tốt hơn v&agrave; đảm bảo kh&ocirc;ng c&oacute; t&aacute;c dụng phụ. Bạn n&ecirc;n đặt nước trong khoảng c&aacute;ch thuận tiện cho m&egrave;o v&agrave; quan s&aacute;t xem m&egrave;o uống đủ nước hay kh&ocirc;ng.</p>
<figure id="attachment_5335" class="wp-caption aligncenter" aria-describedby="caption-attachment-5335"><img class="wp-image-5335 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/310973288_562294195898158_5119377692197399946_n.jpg" sizes="(max-width: 817px) 100vw, 817px" srcset="https://blogchomeo.com/wp-content/uploads/2022/10/310973288_562294195898158_5119377692197399946_n.jpg 690w, https://blogchomeo.com/wp-content/uploads/2022/10/310973288_562294195898158_5119377692197399946_n-150x150.jpg 150w" alt="meme-meo-bua-18" width="817" height="817" data-ll-status="loaded">
<figcaption id="caption-attachment-5335" class="wp-caption-text">Thằng hai hộp sữa thằng kh&ocirc;ng hộp n&agrave;o</figcaption>
</figure>
<h2>V. C&aacute;c thủ thuật khi cho m&egrave;o uống thuốc</h2>
<ul>
<li>Khi d&ugrave;ng ống nhỏ, đặt ống ở ph&iacute;a trong h&agrave;m của m&egrave;o để giảm kh&oacute; chịu cho m&egrave;o.</li>
<li>Cho m&egrave;o ăn m&oacute;n ăn y&ecirc;u th&iacute;ch của n&oacute; k&egrave;m theo thuốc.</li>
<li>Tập cho m&egrave;o quen thuốc bằng c&aacute;ch sử dụng b&aacute;nh thưởng v&agrave; giả lập việc cho m&egrave;o uống thuốc.</li>
<li>Sử dụng b&aacute;nh thưởng sau khi m&egrave;o uống thuốc để tạo động lực t&iacute;ch cực.</li>
<li>Nếu sử dụng phương ph&aacute;p pha trộn thuốc với thức ăn, h&atilde;y đảm bảo m&egrave;o ăn hết tất cả thức ăn để đảm bảo uống đ&uacute;ng liều lượng thuốc.</li>
<li>Nếu m&egrave;o kh&ocirc;ng uống thuốc, kh&ocirc;ng bắt buộc m&egrave;o uống m&agrave; h&atilde;y thử lại sau một thời gian v&agrave; c&oacute; thể thay đổi phương ph&aacute;p cho m&egrave;o uống thuốc.</li>
<li>Nếu cần, c&oacute; thể y&ecirc;u cầu sự trợ gi&uacute;p của một b&aacute;c sĩ th&uacute; y để cho m&egrave;o uống thuốc.</li>
</ul>
<p><iframe class="lazyloaded" title="YouTube video player" src="https://www.youtube.com/embed/2FJTpO1PMYE" width="760" height="515" frameborder="0" allowfullscreen="allowfullscreen" loading="lazy" data-rocket-lazyload="fitvidscompatible" data-ll-status="loaded"></iframe></p>
<p><em>Video Trấn Th&agrave;nh hướng dẫn c&aacute;ch CHO M&Egrave;O UỐNG THUỐC &ndash; Trấn Th&agrave;nh Town</em></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNF0=">&nbsp;</div>
<h2>VI. Kết luận</h2>
<p>Điều quan trọng nhất về việc&nbsp;<strong>cho m&egrave;o uống thuốc</strong>&nbsp;l&agrave; phải&nbsp;<strong>đảm bảo đ&uacute;ng liều lượng</strong>&nbsp;v&agrave;&nbsp;<strong>thời gian uống thuốc</strong>, cũng như&nbsp;<strong>đảm bảo m&egrave;o uống đủ nước</strong>&nbsp;sau khi uống thuốc để tr&aacute;nh t&aacute;c dụng phụ. B&ecirc;n cạnh đ&oacute;, cần lưu &yacute; c&aacute;c thủ thuật v&agrave; c&oacute; ki&ecirc;n nhẫn khi cho m&egrave;o uống thuốc để đạt hiệu quả tốt nhất.</p>
<p>Việc cho m&egrave;o uống thuốc đ&uacute;ng c&aacute;ch sẽ gi&uacute;p ch&uacute;ng khỏe mạnh hơn v&agrave; c&oacute; thể sống một cuộc sống vui vẻ v&agrave; đầy sức khỏe. Ch&uacute;c c&aacute;c ch&uacute; m&egrave;o của bạn v&agrave; của ch&uacute;ng ta sẽ lu&ocirc;n khỏe mạnh</p>
<div id="tudienjp">
<div class="o-search-mobile" style="top: 0px; left: 0px; display: none;">&nbsp;</div>
<div class="o-popup-tag o-bg-white o-border o-rounded o-shadow" style="width: 400px; top: 0px; left: 0px; display: none;">
<div><button class="btn-sm o-btn-close o-position-absolute o-top-0 o-end-0 o-mt-1 o-me-1" type="button" aria-label="Close"></button>
<ul class="o-nav o-nav-tabs o-pop-nav" role="tablist">
<li class="o-nav-item" role="presentation">
<div class="o-nav-link active" data-bs-toggle="tab" aria-selected="true">Từ vựng</div>
</li>
<li class="o-nav-item" role="presentation">
<div class="o-nav-link" data-bs-toggle="tab" aria-selected="false">H&aacute;n tự</div>
</li>
<li class="o-nav-item" role="presentation">
<div class="o-nav-link" data-bs-toggle="tab" aria-selected="false">Dịch</div>
</li>
</ul>
<div class="o-selected-result o-pt-1">
<div>Đang t&igrave;m kiếm ...</div>
<div class="o-fs-6 o-mt-2" style="line-height: 1.7;">
<div class="o-float-start">
<div class="o-form-check"><input id="flexCheckTudienjpLang" class="o-form-check-input" type="checkbox"><label for="flexCheckTudienjpLang"> Tiếng Anh </label></div>
</div>
<div class="o-float-end o-me-1"><a class="o-link-secondary o-text-decoration-none" href="https://tudienjp.com/" target="_blank" rel="noopener">Từ điển JP</a></div>
</div>
</div>
</div>
</div>
</div>
<div id="tudienjpOff"></div>', N'Cách cho mèo uống thuốc hiệu quả và đúng cách', N'Hướng dẫn cách Tẩy Giun Cho Mèo Con chi tiết từng bước cho người mới', N' MÈO Cách cho mèo uống thuốc hiệu quả và đúng cách 1 Tháng Tư, 2023 - by Cún cưng 5/5 - (1 bình chọn) Việc cho mèo uống thuốc đúng cách rất quan trọng để đảm bảo sức khỏe và sự phục hồi của chúng. Có nhiều cách để cho mèo uống thuốc, tùy thuộc vào tính cách và thói quen ăn uống của từng con mèo.', N'/img/Blog/image.webp', NULL, 1, 1)
INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (2, N'<h2><strong>Ch&oacute; pug gi&aacute; chung hiện nay l&agrave; bao nhi&ecirc;u?</strong></h2>
<p>Ch&oacute; Pug con gi&aacute; bao nhi&ecirc;u? Trước hết, ch&uacute;ng ta cần phải nắm được mức gi&aacute; ch&oacute; mặt xệ bao nhi&ecirc;u tiền? Bởi v&igrave; chỉ khi t&igrave;m hiểu được ch&oacute; Pug gi&aacute; bao nhi&ecirc;u đ&uacute;ng th&igrave; mới c&oacute; thể tr&aacute;nh việc mua phải những ch&uacute; ch&oacute; sức khỏe k&eacute;m hoặc l&agrave; kh&ocirc;ng đảm bảo.</p>
<p><img class="alignnone wp-image-1813 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/co-nen-mua-cho-pug-gia-500k-200k-hay-khong-1.jpg" alt="" width="700" height="394" data-ll-status="loaded"></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTBd">&nbsp;</div>
<p><strong><em>Bảng gi&aacute; chung của ch&oacute; Pug hiện nay</em></strong></p>
<figure class="w-richtext-align-fullwidth w-richtext-figure-type-image">
<div>
<table>
<tbody>
<tr>
<td><strong>Gi&aacute; ch&oacute;</strong></td>
<td><strong>Th&ocirc;ng tin ch&oacute;</strong></td>
</tr>
<tr>
<td>500.000 &ndash; 1 triệu</td>
<td>
<ul>
<li>90% l&agrave; lừa đảo</li>
<li>Ch&oacute; Ngoại h&igrave;nh kh&ocirc;ng đẹp như quảng c&aacute;o</li>
</ul>
</td>
</tr>
<tr>
<td>6-8 triệu</td>
<td>
<ul>
<li>L&agrave; ch&oacute; Pug thuần chủng sinh ra trong nước</li>
<li>C&oacute; sức khỏe ổn định</li>
<li>Loại n&agrave;y kh&ocirc;ng c&oacute; bất kỳ giấy tờ g&igrave; cả, 80% c&aacute;c b&eacute; Pug sinh ra tại Việt Nam đều kh&ocirc;ng c&oacute; giấy tờ</li>
<li>Ngoại h&igrave;nh xuất sắc, t&iacute;nh c&aacute;ch nổi trội, ph&ugrave; hợp chọn l&agrave;m ch&oacute; giống ( 8 triệu)</li>
</ul>
</td>
</tr>
<tr>
<td>10-12 triệu</td>
<td>
<ul>
<li>L&agrave; d&ograve;ng ch&oacute; Pug thuần chủng, d&ograve;ng trung, được sinh ra tại Việt Nam.</li>
<li>Gia phả + chứng nhận của VKA (<em>Vietnam Kennel Association</em>&nbsp;&ndash; Hiệp hội ch&oacute; giống Việt Nam</li>
<li>Ch&oacute; Pug gi&aacute; n&agrave;y được đảm bảo tuyệt đối về chất lượng v&agrave; độ thuần chủng</li>
</ul>
</td>
</tr>
<tr>
<td>12 &ndash; 15 triệu</td>
<td>
<ul>
<li>Ch&oacute; Pug được nhập khẩu từ c&aacute;c trại ch&oacute; Th&aacute;i Lan</li>
<li>Ch&oacute; Pug n&agrave;y tốt hơn một ch&uacute;t so với ch&oacute; nh&acirc;n giống trong nước.</li>
<li>Ch&oacute; c&oacute; kh&ocirc;ng giấy tờ chứng nhận, khai sinh. Nhưng đảm bảo về chất lượng v&agrave; ngoại h&igrave;nh đạt ti&ecirc;u chuẩn.</li>
</ul>
</td>
</tr>
<tr>
<td>18-25 triệu</td>
<td>
<ul>
<li>Pug nhập Th&aacute;i Lan</li>
<li>Đầy đủ giấy tờ của FCI Th&aacute;i</li>
<li>Những ch&uacute; ch&oacute; n&agrave;y thường được c&aacute;c trại ch&oacute; nhập khẩu về để nh&acirc;n giống</li>
</ul>
</td>
</tr>
<tr>
<td>42 &ndash; 60 triệu trở l&ecirc;n</td>
<td>
<ul>
<li>Pug được nhập khẩu trực tiếp từ Ch&acirc;u &Acirc;u</li>
<li>Được đảm bảo 100% về độ thuần chủng</li>
<li>Ch&oacute; c&oacute; giấy tờ, nguồn gốc r&otilde; r&agrave;ng</li>
<li>Hơn nữa, ch&oacute; đ&atilde; từng đi thi đấu, tham gia nhiều cuộc thi v&agrave; nhận được nhiều giải thưởng.</li>
<li>Gi&aacute; sẽ c&ograve;n cao hơn nếu ch&uacute; ch&oacute; Pug đ&oacute; c&oacute; giấy chứng nhận của FCI &ndash; Hiệp hội ch&oacute; giống Thế Giới.</li>
</ul>
</td>
</tr>
</tbody>
</table>
</div>
<figcaption></figcaption>
</figure>
<p>Tin tức thị trường:</p>
<p>Hiện nay, với&nbsp;<a href="https://blogchomeo.com/tag/pug/">Pug</a>&nbsp;kh&ocirc;ng c&oacute; giấy tờ, nhưng được ti&ecirc;m ph&ograve;ng đầy đủ c&oacute; mức gi&aacute; giao động l&agrave; 5,5, triệu đối với b&eacute; c&uacute;n 2 th&aacute;ng tuổi. Với những b&eacute; c&oacute; giấy tờ VKA đầy đủ th&igrave; mức gi&aacute; giao động trong khoảng từ 13 đến 15 triệu/ b&eacute; thuần chủng 100%, bao gồm đầy đủ xuất xứ v&agrave; được c&ocirc;ng nhận bởi Hiệp hội những người nu&ocirc;i ch&oacute; giống Việt Nam.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTFd">&nbsp;</div>
<p>Tuy nhi&ecirc;n, mức gi&aacute; con phụ thuộc nhiều v&agrave;o m&agrave;u l&ocirc;ng, gia phả, h&igrave;nh d&aacute;ng của b&eacute; nữa.</p>
<h2><strong>Ch&oacute; pug gi&aacute; 500k: sự thật hay lừa đảo?</strong></h2>
<p>Xin khẳng định với c&aacute;c bạn rằng, nếu muốn mua được 1 b&eacute; Pug thuần chủng tốt th&igrave; bạn phải bỏ ra &iacute;t nhất l&agrave; 5 triệu v&agrave; tin tức tr&ecirc;n c&aacute;c trang mạng b&aacute;n vặt, b&aacute;n h&agrave;ng dạo&nbsp;<em>ch&oacute; Pug gi&aacute; 500k</em>, thậm ch&iacute; c&ograve;n c&oacute; tin b&aacute;n ch&oacute; Pug 200k th&igrave; chắc chắn rằng đ&acirc;y l&agrave; tin tức lừa đảo.</p>
<p><img class="alignnone wp-image-1814 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/images.jpg" sizes="(max-width: 368px) 100vw, 368px" srcset="https://blogchomeo.com/wp-content/uploads/2021/07/images.jpg 225w, https://blogchomeo.com/wp-content/uploads/2021/07/images-150x150.jpg 150w" alt="" width="368" height="368" data-ll-status="loaded"></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTJd">&nbsp;</div>
<p><a href="https://blogchomeo.com/co-nen-mua-cho-pug-gia-500k-200k-hay-khong/"><em>Ch&oacute; pug gi&aacute; 500k &ndash; tin tức lừa đảo</em></a></p>
<p>Đ&oacute; chỉ l&agrave; h&igrave;nh thức c&acirc;u kh&aacute;ch đặt cọc sau đ&oacute; chặn số v&agrave; kh&ocirc;ng c&ograve;n tin tức n&agrave;o nữa, hoặc cũng c&oacute; 1 số trường hợp cung cấp ch&oacute; Pug gi&aacute; 500k tuy nhi&ecirc;n l&agrave; ch&oacute; bệnh, nhập lậu,&hellip; V&igrave; thế, h&atilde;y cảnh gi&aacute;c để tr&aacute;nh kh&ocirc;ng bị d&iacute;nh c&acirc;u mắc lừa bởi những tin tức như thế n&agrave;y nh&eacute;!</p>
<h2><strong>Hiện nay ch&oacute; pug thuần chủng gi&aacute; bao nhi&ecirc;u?&nbsp;</strong></h2>
<p>Nhu cầu mua ch&oacute; Pug hiện nay rất nhiều tuy nhi&ecirc;n giống ch&oacute; n&agrave;y sinh sản kh&aacute; k&eacute;m v&agrave; mức gi&aacute; cũng phụ thuộc v&agrave;o rất nhiều yếu tố kh&aacute;c nhau. Vậy, ch&oacute; Pug thuần chủng gi&aacute; bao nhi&ecirc;u, ch&oacute; Pug mini gi&aacute; đ&uacute;ng ch&iacute;nh x&aacute;c l&agrave; bao nhi&ecirc;u? Dưới đ&acirc;y l&agrave; một số th&ocirc;ng tin gi&aacute; ch&oacute; Pug thuần chủng bạn n&ecirc;n biết:</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTNd">&nbsp;</div>
<p><img class="wp-image-100 aligncenter lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/pug-dog-isolated-white-background.jpg" alt="" width="621" height="595" data-ll-status="loaded"></p>
<p><em>Gi&aacute; ch&oacute; Pug thuần chủng</em></p>
<h3><strong>Ch&oacute; pug thuần chủng sinh trong nước</strong></h3>
<p>Giống ch&oacute; pug bao nhi&ecirc;u tiền 1 con khi sinh trong nước? Ch&oacute; Pug thuần chủng được sinh tại c&aacute;c trại giống th&uacute; cưng trong nước c&oacute; nguồn gốc xuất xứ r&otilde; r&agrave;ng, c&oacute; x&aacute;c minh th&ocirc;ng tin chủ sở hữu nhưng kh&ocirc;ng c&oacute; giấy chứng nhận VKA th&igrave; mức gi&aacute; giao động trong khoảng 6 đến 8 triệu đồng. Đối với những b&eacute; c&oacute; gi&aacute; 8 triệu sẽ l&agrave; c&aacute;c b&eacute; sở hữu ngoại h&igrave;nh mập mạp v&agrave; xinh xắn. V&agrave; đương nhi&ecirc;n ch&oacute; Pug gi&aacute; 1tr l&agrave; 1 điều kh&ocirc;ng thể c&oacute; được.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTRd">&nbsp;</div>
<h3><strong>Ch&oacute; pug c&oacute; đầy đủ giấy tờ VKA</strong></h3>
<p>Với những b&eacute; ch&oacute; mặt xệ con gi&aacute; bao nhi&ecirc;u khi c&oacute; giấy tờ đầy đủ? Gi&aacute; 1 con ch&oacute; Pug c&oacute; đầy đủ giấy tờ VKA th&igrave; mức gi&aacute; giao động trong khoảng từ 10 đến 15 triệu. V&agrave; đ&acirc;y l&agrave; một trong những b&eacute; c&oacute; gia phả r&otilde; r&agrave;ng, hệ gen ổn định, đảm bảo thuần chủng 100%. Vậy, tin tức ch&oacute; Pug gi&aacute; 1 triệu, ch&oacute; Pug gi&aacute; 2 triệu, ch&oacute; Pug gi&aacute; 3 triệu chắc chắn l&agrave; kh&ocirc;ng thể tin được đ&uacute;ng kh&ocirc;ng n&agrave;o?</p>
<h3><strong>Gi&aacute; ch&oacute; pug&nbsp; nhập khẩu</strong></h3>
<p>Ch&oacute; Pug mini gi&aacute; bao nhi&ecirc;u nếu l&agrave; giống nhập khẩu? Gi&aacute; ch&oacute; Pug dog nhập khẩu phụ thuộc v&agrave;o quốc gia xuất xứ của b&eacute;. Ch&oacute; mặt xệ bao nhi&ecirc;u tiền một con nhập khẩu? Cụ thể như sau:</p>
<p><img class="alignnone size-full wp-image-300 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/giong-cho-pug.jpg" alt="" width="622" height="419" data-ll-status="loaded"></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTVd">&nbsp;</div>
<figure class="w-richtext-align-fullwidth w-richtext-figure-type-image">
<div>&nbsp;</div>
<figcaption><em>Ch&oacute; Pug nhập khẩu đẹp</em></figcaption>
</figure>
<ul role="list">
<li>Với những b&eacute; được nhập khẩu từ Th&aacute;i Lan mức gi&aacute; sẽ giao động khoảng 10 đến 15 triệu với những b&eacute; kh&ocirc;ng c&oacute; giấy tờ v&agrave; với những b&eacute; sở hữu đầy đủ giấy từ FCI Th&aacute;i mức gi&aacute; nằm trong khoảng 15 đến 20 triệu.</li>
<li>Ch&oacute; Pug gi&aacute; bao nhi&ecirc;u nếu nhập khẩu từ Ch&acirc;u &Acirc;u? Những b&eacute; nhập khẩu từ Ch&acirc;u &Acirc;u c&oacute; giấy tờ đầy đủ, đảm bảo l&agrave; h&agrave;ng được c&aacute;c sen săn đ&oacute;n rất nhiều. Với những b&eacute; Pug n&agrave;y, mức gi&aacute; trong khoảng 2000$-2500$.</li>
</ul>
<h2><strong>Những điều quan trọng khi mua ch&oacute; pug bạn cần biết</strong></h2>
<p>Để sở hữu được b&eacute; Pug thuần chủng gi&aacute; tốt, v&agrave; tr&aacute;nh việc mua ch&oacute; Pug gi&aacute; rẻ lừa đảo như loại ch&oacute; pug gi&aacute; 1 triệu hay ch&oacute; Pug gi&aacute; 300k c&aacute;c sen cần lưu &yacute; một số vấn đề sau đ&acirc;y:</p>
<h3><strong>Thời gian bảo h&agrave;nh</strong></h3>
<p>Thời gian bảo h&agrave;nh tốt nhất với 1 b&eacute; Pug l&agrave; 70 đến 75 ng&agrave;y. Thường th&igrave; mức thời gian bảo h&agrave;nh với c&aacute;c giống ch&oacute; th&ocirc;ng thường l&agrave; 45 ng&agrave;y. Tuy nhi&ecirc;n Pug l&agrave; giống ch&oacute; c&oacute; sức đề kh&aacute;ng yếu hơn ch&iacute;nh v&igrave; thế m&agrave; thời gian bảo h&agrave;nh cao hơn gần gấp đ&ocirc;i so với những giống ch&oacute; th&ocirc;ng thường kh&aacute;c.</p>
<h3><strong>Giấy tờ đi k&egrave;m kia mua ch&oacute; pug</strong></h3>
<p>H&atilde;y đảm bảo mua b&eacute; c&uacute;n của bạn với giấy tờ đi k&egrave;m đầy đủ. Bởi đ&oacute; ch&iacute;nh l&agrave; chứng cứ minh chứng bạn đ&atilde; mua v&agrave; bảo h&agrave;nh đ&uacute;ng thời hạn. Bạn tuyệt đối kh&ocirc;ng mua Pug nếu kh&ocirc;ng c&oacute; giấy tờ r&otilde; r&agrave;ng.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTZd">&nbsp;</div>
<h3><strong>N&ecirc;n mua ch&oacute;&nbsp; pug từ mấy th&aacute;ng tuổi</strong></h3>
<p>Bạn n&ecirc;n mua những b&eacute; Pug 2 th&aacute;ng tuổi l&agrave; tốt nhất. V&igrave; ở độ tuổi n&agrave;y, b&eacute; mới được t&aacute;ch khỏi mẹ v&igrave; thế bạn l&agrave; chủ sở hữu đầu ti&ecirc;n v&agrave; t&igrave;nh cảm d&agrave;nh cho b&eacute; cũng như ngược lại sẽ r&otilde; r&agrave;ng v&agrave; th&acirc;n thiết hơn.</p>
<p><img class="alignnone wp-image-327 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/cham-soc-cho-pug-6.jpg" alt="" width="619" height="464" data-ll-status="loaded"></p>
<p>Kh&ocirc;ng những thế, những b&eacute; pug 2 th&aacute;ng tuổi đ&atilde; c&oacute; hệ ti&ecirc;u h&oacute;a ph&aacute;t triển tốt đồng thời được ti&ecirc;m ph&ograve;ng đầy đủ sẽ tr&aacute;nh bệnh v&agrave; c&oacute; thể ph&aacute;t triển tốt hơn rất nhiều.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTdd">&nbsp;</div>
<h2><strong>Cảnh gi&aacute;c khi mua ch&oacute; pug gi&aacute; rẻ</strong></h2>
<p>Tr&ecirc;n c&aacute;c trang rao b&aacute;n vặt chắc chắn rằng tin tức b&aacute;n ch&oacute; Pug với gi&aacute; dưới&nbsp; 1 triệu -ch&oacute; Pug gi&aacute; 500k , thậm ch&iacute; b&aacute;n ch&oacute; Pug 200k hay hơn nữa l&agrave; ch&oacute; pug gi&aacute; 2 triệu, ch&oacute; pug gi&aacute; 3 triệu rất nhiều. Một lần nữa khẳng định lại với bạn rằng việc mua ch&oacute; Pug với gi&aacute; dưới 1 triệu hay ch&oacute; Pug gi&aacute; 1 triệu l&agrave; điều ho&agrave;n to&agrave;n kh&ocirc;ng c&oacute; thật. Bạn sẽ kh&ocirc;ng nhận được ch&uacute; ch&oacute; n&agrave;o cả v&agrave; thậm ch&iacute; c&ograve;n bị lừa tiền cọc.</p>
<p>V&igrave; vậy, nếu muốn sở hữu b&eacute; Pug thuần chủng giấy tờ r&otilde; r&agrave;ng h&atilde;y t&igrave;m kiếm địa chỉ b&aacute;n uy t&iacute;n, chất lượng.</p>
<p>Tr&ecirc;n đ&acirc;y l&agrave; lời giải đ&aacute;p ch&iacute;nh x&aacute;c nhất cho tin tức ch&oacute; Pug gi&aacute; rẻ như&nbsp;<a href="https://blogchomeo.com/co-nen-mua-cho-pug-gia-500k-200k-hay-khong/"><strong>ch&oacute; Pug gi&aacute; 500k</strong></a>. Hy vọng những th&ocirc;ng tin tr&ecirc;n đ&acirc;y sẽ gi&uacute;p bạn kh&ocirc;ng bị lừa đảo khi mua Pug v&agrave; biết được gi&aacute; ch&oacute; mặt xệ bao nhi&ecirc;u 1 con. Đến với&nbsp;<strong><a href="https://blogchomeo.com/">Blog ch&oacute; m&egrave;o</a></strong>&nbsp;để nhận được những kinh nghiệm mua ch&oacute; mặt xệ gi&aacute; nhi&ecirc;u l&agrave; hợp l&yacute; v&agrave; chăm s&oacute;c b&eacute; tốt nhất nh&eacute;!</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMThd">&nbsp;</div>
<p>C&aacute;c t&igrave;m kiếm li&ecirc;n quan kh&aacute;c:<em>&nbsp;ch&oacute; pug mặt xệ gi&aacute; bao nhi&ecirc;u, ch&oacute; pug con gi&aacute; bao nhi&ecirc;u, ch&oacute; mặt xệ bao nhi&ecirc;u tiền, ch&oacute; pug gi&aacute; 200k, ch&oacute; pug gi&aacute; 3 triệu, ch&oacute; pug gi&aacute; 2 triệu, ch&oacute; pug gi&aacute; bao nhi&ecirc;u, ch&oacute; pug gi&aacute; rẻ, ch&oacute; pug gi&aacute;, ch&oacute; pug gi&aacute; 1 triệu, ch&oacute; pug thuần chủng gi&aacute; bao nhi&ecirc;u, ch&oacute; pug bao nhi&ecirc;u tiền 1 con, ch&oacute; mặt xệ con gi&aacute; bao nhi&ecirc;u, mua ch&oacute; pug gi&aacute; 1tr, ch&oacute; mặt xệ bao nhi&ecirc;u 1 con, ch&oacute; mặt xệ bao nhi&ecirc;u một con, ch&oacute; mặt xệ gi&aacute; bao nhi&ecirc;u một con, ch&oacute; mặt xệ gi&aacute; bao nhi&ecirc;u tiền, ch&oacute; mặt xệ gi&aacute; bao nhiu, ch&oacute; pug bao nhi&ecirc;u 1 con, ch&oacute; pug c&oacute; gi&aacute; bao nhi&ecirc;u, ch&oacute; pug dog gi&aacute; bao nhi&ecirc;u, ch&oacute; pug gi&aacute; 300k, ch&oacute; pug mini gi&aacute; bao nhi&ecirc;u, ch&oacute; pug gi&aacute; 1tr, gi&aacute; 1 con ch&oacute; pug, gi&aacute; ch&oacute; pug dog, ch&oacute; mặt xệ bao nhi&ecirc;u tiền một con, ch&oacute; mặt xệ gi&aacute; nhi&ecirc;u, &hellip;</em></p>', N'Có nên mua chó pug giá 500k, 200k hay không? Bảng giá chó Pug 2022', N'Có nên mua chó pug giá 500k, 200k hay không? Bảng giá chó Pug 2022', N' CHÓ / HỎI ĐÁP / TIN TỨC Có nên mua chó pug giá 500k, 200k hay không? Bảng giá chó Pug 2022 6 Tháng Sáu, 2021 - by Cún cưng 4.7/5 - (12 bình chọn) Giống chó Pug hiện nay đang được rất nhiều sen lựa chọn làm bé cưng đồng hành cùng mình. Nếu như bạn đang có ý định muốn mua 1 bé Pug thì trước hết cần phải tìm hiểu về mức giá cho Pug mặt xệ giá bao nhiêu cũng như những thông tin về đặc điểm tính cách của loại giống chó này. Trên mạng xã hội có đăng tải rất nhiều tin bán chó Pug giá 500k, vậy tin tức này thực hư ra sao? Cùng tìm hiểu kỹ hơn ngay sau đây nhé!', N'/img/Blog/co-nen-mua-cho-pug-gia-500k-200k-hay-khong-1.jpg', CAST(N'2023-11-14' AS Date), 1, 2)
INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (3, N'<h2>1. Corgi Fluffy l&agrave; g&igrave;?</h2>
<p>Đại đa số giống ch&oacute; Corgi c&oacute; l&ocirc;ng ngắn v&agrave; đu&ocirc;i ngắn. Ngo&agrave;i ra ch&uacute;ng c&ograve;n c&oacute; những đặc điểm thuần chủng đ&oacute; l&agrave; ch&acirc;n ngắn v&agrave; m&igrave;nh d&agrave;i. Giống ch&oacute; n&agrave;y l&agrave; một nh&aacute;nh kh&aacute;c của Corgi c&oacute; t&ecirc;n l&agrave; Corgi Fluffy. Ch&oacute; Corgi Fluffy sở hữu bộ l&ocirc;ng d&agrave;i v&agrave; đu&ocirc;i d&agrave;i chạm đất. Đ&oacute; cũng l&agrave; những đặc điểm nổi bật nhất của ch&uacute;ng. Chiếc đu&ocirc;i của ch&uacute;ng cũng l&agrave; điểm thu h&uacute;t đối với những t&iacute;n đồ y&ecirc;u Corgi.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTZd">&nbsp;</div>
<p><img class="alignnone wp-image-209 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/corgi-fluffy.jpg" alt="" width="974" height="548" data-ll-status="loaded"></p>
<figure class="w-richtext-align-fullwidth w-richtext-figure-type-image">
<div><em>Fluffy Corgi hay c&ograve;n gọi l&agrave; Ch&oacute; Corgi l&ocirc;ng d&agrave;i</em></div>
</figure>
<h2><strong>2. Nguồn gốc, đặc điểm của ch&oacute; Corgi Fluffy</strong></h2>
<p><strong><em>Nguồn gốc:</em></strong></p>
<p>Ch&oacute; Corgi l&agrave; giống ch&oacute; c&oacute; nguồn gốc từ xứ Wales ở vương quốc Anh, dễ d&agrave;ng ph&acirc;n biệt nhờ m&agrave;u l&ocirc;ng v&agrave; đặc điểm về ngoại h&igrave;nh. Ban đầu, ch&uacute;ng chỉ c&oacute; một t&ecirc;n l&agrave; Welsh Corgi. Về sau, ch&uacute;ng được lai tạo th&agrave;nh nhiều giống ch&oacute; v&agrave; chia th&agrave;nh hai nh&oacute;m ch&iacute;nh: Corgi Pembroke v&agrave; Cardigan Corgi. Giống ch&oacute; n&agrave;y c&oacute; một t&ecirc;n gọi kh&aacute;c l&agrave; Fluffy Corgi thuộc d&ograve;ng Pembroke nhưng c&oacute; bộ l&ocirc;ng d&agrave;i đặc trưng. Hiện nay, số lượng của d&ograve;ng Corgi Pembroke đ&ocirc;ng hơn v&agrave; cũng được nu&ocirc;i phổ biến hơn. V&igrave; gi&aacute; th&agrave;nh kh&ocirc;ng qu&aacute; cao v&agrave; chế độ chăm s&oacute;c kh&ocirc;ng qu&aacute; phức tạp.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTdd">&nbsp;</div>
<p><strong><em>Đặc điểm:</em></strong></p>
<p>Ch&oacute; Corgi Fluffy l&ocirc;ng d&agrave;i c&oacute; tai dựng, h&igrave;nh tam gi&aacute;c đều, k&iacute;ch thước tỉ lệ thuận với với khu&ocirc;n mặt của ch&uacute;ng. Corgi c&oacute; mũi nhỏ, nhọn v&agrave; d&agrave;i. Ở nhiều nơi, người ta cũng gọi ch&oacute; Corgi l&agrave; Foxy Dog v&igrave; ch&uacute;ng c&oacute; khu&ocirc;n mặt kh&aacute; giống lo&agrave;i c&aacute;o. Mắt Corgi to, rất tr&ograve;n, mũi đen, h&agrave;m nhỏ v&agrave; răng sắc. Ch&uacute;ng nhai kh&aacute; khỏe n&ecirc;n thường cắn ph&aacute; đồ đạc nếu như ch&uacute;ng bị nhốt trong nh&agrave;.</p>
<ul>
<li>Ch&oacute; Corgi Fluffy m&ocirc; tả l&agrave; c&aacute;c ch&uacute; ch&oacute; c&oacute; bộ l&ocirc;ng tương đối d&agrave;i. C&aacute;c vị tr&iacute; như ngực, tai, dưới, ch&acirc;n, b&agrave;n ch&acirc;n v&agrave; ch&acirc;n sau c&oacute; l&ocirc;ng d&agrave;y v&agrave; hơn c&aacute;c bộ phận kh&aacute;c.</li>
<li>Ngoại trừ chiều d&agrave;i l&ocirc;ng. Th&igrave; ch&oacute; Ch&oacute; Corgi Fluffy c&oacute; đặc điểm ngoại h&igrave;nh của cả 2 d&ograve;ng Cardigan Corgi v&agrave; Pembroke Corgi. Những ch&uacute; ch&oacute; n&agrave;y thường c&oacute; l&ocirc;ng m&agrave;u giống như của Pembroke Welsh Corgi &ndash; m&agrave;u v&agrave;ng trắng v&agrave; m&agrave;u Fluffy. V&agrave; chiếc đu&ocirc;i giống như của d&ograve;ng Cardigan Corgi &ndash; đu&ocirc;i d&agrave;i chạm đất v&agrave; nhiều l&ocirc;ng.</li>
<li>Th&ocirc;ng thường, người ta sẽ kh&ocirc;ng để cho ch&uacute; ch&oacute; Fluffy Corgi của m&igrave;nh c&oacute; một bộ l&ocirc;ng d&agrave;i thướt tha như Fox S&oacute;c hoặc c&aacute;c giống ch&oacute; l&ocirc;ng d&agrave;i kh&aacute;c.</li>
<li>B&ecirc;n cạnh đặc điểm về bộ l&ocirc;ng. Th&igrave; Corgi Fluffy c&oacute; đặc điểm giống như một ch&uacute; ch&oacute; Corgi l&ocirc;ng ngắn th&ocirc;ng thường: Ch&acirc;n ngắn, lưng d&agrave;i, tai lớn v&agrave; tr&ograve;n. C&ugrave;ng với khu&ocirc;n mặt đầy đặn, m&otilde;m nhọn, hơi giống mặt c&aacute;o.</li>
</ul>
<p>&nbsp;<img class="alignnone wp-image-1870 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/Nguon-goc-va-dac-diem-cua-cho-Corgi-Fluffy.jpg" alt="" width="657" height="394" data-ll-status="loaded"></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMThd">&nbsp;</div>
<p><em>Nguồn gốc v&agrave; đặc điểm của ch&oacute; Corgi Fluffy</em></p>
<h2><strong>3. T&iacute;nh c&aacute;ch của Corgi Fluffy</strong></h2>
<p>Giống ch&oacute; Corgi Fluffy n&agrave;y thừa hưởng gen v&agrave; tư chất của d&ograve;ng Pembroke. Ch&uacute;ng sống rất t&igrave;nh cảm, c&oacute; xu hướng quấn chủ, muốn l&agrave;m chủ vui vẻ, biết nghe lời, dễ d&agrave;ng huấn luyện bởi sự th&ocirc;ng minh, nhanh ch&oacute;ng nghe v&agrave; hiểu được tiếng người.</p>
<p>Nhắc đến Corgi, ch&uacute;ng ta thường nhắc đến sự th&ocirc;ng minh của ch&uacute;ng. Corgi được xếp hạng 11 trong danh s&aacute;ch những giống ch&oacute; th&ocirc;ng minh nhất thế giới. Nhờ tr&iacute; th&ocirc;ng minh vượt trội, ch&oacute; Corgi Fluffy được huấn luyện rất nhanh v&agrave; dễ d&agrave;ng. Đặc biệt với những mệnh lệnh, Corgi chỉ cần huấn luyện từ 4 &ndash; 5 lần l&agrave; được.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTld">&nbsp;</div>
<p><strong>&ndash; Corgi Fluffy l&agrave; lo&agrave;i ch&oacute; trung th&agrave;nh:&nbsp;</strong>Trong suốt cuộc đời ch&oacute; Corgi Fluffy, ch&uacute;ng chỉ trung th&agrave;nh với một người chủ duy nhất. Ch&uacute;ng rất t&ocirc;n thờ v&agrave; lu&ocirc;n quấn qu&yacute;t chủ. Trong những trường hợp, khi gặp nguy hiểm, Corgi sẽ t&igrave;m c&aacute;ch bảo vệ chủ. V&agrave; ch&uacute;ng cũng sẽ chiến đấu hết m&igrave;nh v&igrave; sự an to&agrave;n của chủ nh&acirc;n.</p>
<p><img class="alignnone wp-image-1871 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/Tinh-cach-cua-Fluffy-Corgi-rat-nang-dong.jpg" alt="" width="698" height="873" data-ll-status="loaded"></p>
<p><em>T&iacute;nh c&aacute;ch của Fluffy Corgi rất năng động</em></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjBd">&nbsp;</div>
<p><strong>&ndash; Corgi Fluffy cũng kh&aacute; ương bướng:&nbsp;</strong>Trong một v&agrave;i trường hợp, ch&oacute; Corgi cũng c&oacute; một ch&uacute;t ương bướng khi kh&ocirc;ng l&agrave;m theo &yacute; của chủ nh&acirc;n. Do đ&oacute; việc huấn luyện ch&uacute;ng cũng gặp &iacute;t nhiều kh&oacute; khăn.</p>
<p>Bạn cần c&oacute; thời gian v&agrave; phương ph&aacute;p chỉ bảo th&iacute;ch hợp . Đồng thời kết hợp nhắc nhở để ch&uacute;ng thực hiện nghi&ecirc;m t&uacute;c hơn những mệnh lệnh của bạn đề ra. Đặc biệt ch&uacute;ng sủa rất dai dẳng nếu kh&ocirc;ng được nhắc nhở. Để tr&aacute;nh g&acirc;y n&ecirc;n những tiếng ồn kh&ocirc;ng mong muốn. Bạn h&atilde;y kiểm so&aacute;t t&igrave;nh c&aacute;ch của Corgi để giữ ch&uacute;ng y&ecirc;n l&agrave;nh v&agrave; th&acirc;n thiện.</p>
<p><strong>&ndash;&nbsp;<a href="https://blogchomeo.com/corgi-fluffy/">Ch&oacute; Corgi Fluffy</a>&nbsp;rất l&agrave; năng động:&nbsp;</strong>Corgi l&agrave; lo&agrave;i ch&oacute; v&ocirc; c&ugrave;ng nghịch ngợm v&agrave; năng động ch&uacute;ng cần được vui chơi, chạy nhảy mỗi ng&agrave;y để giải ph&oacute;ng năng lượng. Ngo&agrave;i ra việc chạy nhảy v&agrave; hoạt động c&ograve;n gi&uacute;p Corgi tr&aacute;nh được bệnh b&eacute;o ph&igrave;.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjFd">&nbsp;</div>
<h3><strong>L&yacute; Do N&ecirc;n Nu&ocirc;i Ch&oacute; Corgi Fluffy Hiện Nay.</strong></h3>
<p><strong>Trung th&agrave;nh, t&igrave;nh cảm.</strong></p>
<p><strong>Giống Ch&oacute; Corgi Fluffy</strong>&nbsp;rất t&igrave;nh cảm, dễ d&agrave;ng h&ograve;a nhập với c&aacute;c th&agrave;nh vi&ecirc;n trong nh&agrave;. Ch&uacute;ng đặc biệt trung th&agrave;nh v&agrave; th&iacute;ch quấn qu&yacute;t với chủ, song rất cảnh gi&aacute;c trước người lạ. Ch&iacute;nh bởi vậy Corgi l&agrave; người bạn đồng h&agrave;nh đ&aacute;ng tin cậy.</p>
<p><strong>Gi&agrave;u năng lượng.</strong></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjJd">&nbsp;</div>
<p>Mặc d&ugrave; tr&ocirc;ng c&oacute; hiền l&agrave;nh nhưng bản t&iacute;nh Corgi rất năng động. Ch&uacute;ng l&agrave; lo&agrave;i ch&oacute; c&oacute; nhiều năng lượng c&ugrave;ng sức bền dẻo dai. Giống ch&oacute; n&agrave;y th&iacute;ch chạy nhảy trong m&ocirc;i trường rộng r&atilde;i n&ecirc;n c&oacute; thể tham gia nhiều hoạt động ngo&agrave;i trời.</p>
<p><strong>Ch&acirc;n ngắn đ&aacute;ng y&ecirc;u.</strong></p>
<p>Đ&ocirc;i ch&acirc;n ngắn ch&iacute;nh l&agrave; đặc điểm nổi bật của giống ch&oacute; n&agrave;y.&nbsp;<strong>Ch&oacute; Corgi Fluffy</strong>&nbsp;ch&acirc;n ngắn đến mức ngực s&aacute;t đất sẽ c&oacute; gi&aacute; rất cao. V&igrave; theo người chơi ch&oacute; chuy&ecirc;n nghiệp th&igrave; họ coi ch&acirc;n c&agrave;ng ngắn, th&acirc;n c&agrave;ng d&agrave;i th&igrave; c&agrave;ng ngộ nghĩnh, đ&aacute;ng y&ecirc;u.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjNd">&nbsp;</div>
<p><strong>Th&ocirc;ng minh dễ bảo.</strong></p>
<p><strong>Ch&oacute; Corgi Fluffy</strong>&nbsp;đứng thứ 11 trong bảng xếp hạng những giống ch&oacute; th&ocirc;ng minh nhất của AKC. Ch&uacute;ng biết nghe lời v&agrave; rất dễ huấn luyện. Vậy n&ecirc;n việc dạy bảo Corgi kh&aacute; đơn giản so với những giống ch&oacute; cảnh kh&aacute;c.</p>
<h3><strong>Lưu &Yacute; Khi Nu&ocirc;i Dạy Corgi.</strong></h3>
<p><strong>&ndash; Ch&oacute; Corgi Fluffy</strong>&nbsp;l&agrave; giống ch&oacute; c&oacute; hệ ti&ecirc;u h&oacute;a kh&aacute; k&eacute;m. Trong qu&aacute; tr&igrave;nh nu&ocirc;i, bạn cần ch&uacute; &yacute; bổ sung chế độ dinh dưỡng ph&ugrave; hợp theo độ tuổi. Khẩu phần ăn gi&agrave;u protein, canxi v&agrave; c&aacute;c loại ngũ cốc, rau củ tốt cho ch&oacute; như bắp cải, c&agrave; rốt, tr&aacute;i c&acirc;y.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjRd">&nbsp;</div>
<p>&ndash; Ch&oacute; nhỏ rất h&aacute;u ăn n&ecirc;n bạn cần kiểm so&aacute;t lượng thức ăn ch&uacute;ng ti&ecirc;u thụ mỗi ng&agrave;y. Kh&ocirc;ng n&ecirc;n cho ch&oacute; ăn qu&aacute; nhiều hoặc dư thừa chất b&eacute;o, dễ khiến bị mắc c&aacute;c bệnh đường ruột.</p>
<p>&ndash; Tr&aacute;nh c&aacute;c loại thức ăn kh&oacute; ti&ecirc;u h&oacute;a, đồ cay n&oacute;ng, xương cứng, nội tạng động vật hoặc thức ăn qu&aacute; kh&ocirc;. Lu&ocirc;n để sẵn nước cho ch&oacute; uống v&agrave; nhớ thay nước mỗi ng&agrave;y 3 lần.</p>
<p><strong>&ndash; Ch&oacute; Corgi Fluffy</strong>&nbsp;l&agrave; lo&agrave;i ch&oacute; rất th&iacute;ch vận động, bởi vậy kh&ocirc;ng n&ecirc;n nhốt ch&uacute;ng trong nh&agrave; qu&aacute; l&acirc;u v&igrave; ch&oacute; c&oacute; thể bị stress. Bạn cần d&agrave;nh một ch&uacute;t thời gian mỗi s&aacute;ng cho ch&oacute; ra ngo&agrave;i hoạt động kết hợp với phơi nắng.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjVd">&nbsp;</div>
<p><strong>&ndash; Corgi</strong>&nbsp;l&agrave; lo&agrave;i ch&oacute; th&ocirc;ng minh, th&iacute;ch tự l&agrave;m theo &yacute; m&igrave;nh n&ecirc;n cần ki&ecirc;n nhẫn, tốt nhất n&ecirc;n huấn luyện ch&uacute;ng ngay từ khi mới bắt về. Bạn c&oacute; thể bắt đầu tập cho ch&oacute; lệnh đơn giản như đứng y&ecirc;n, ngồi xuống, nằm xuống, bắt tay,&hellip;</p>
<p>&ndash; Ngo&agrave;i ra, bạn cũng n&ecirc;n tương t&aacute;c thường xuy&ecirc;n với ch&oacute; bằng c&aacute;ch gọi t&ecirc;n v&agrave; giao tiếp bằng mắt. Cần c&oacute; h&igrave;nh thức khen ngợi, thưởng động vi&ecirc;n khi ch&oacute; ho&agrave;n th&agrave;nh tốt nhiệm vụ.</p>
<h2><strong>4. C&aacute;ch chăm s&oacute;c ch&oacute; Corgi Fluffy</strong></h2>
<p>Chăm s&oacute;c l&ocirc;ng cho Fluffy Corgi v&ocirc; c&ugrave;ng quan trọng. V&igrave; ch&uacute;ng c&oacute; bộ l&ocirc;ng d&agrave;i, d&agrave;y v&agrave; kh&ocirc;ng ph&ugrave; hợp với kh&iacute; hậu ở Việt Nam. N&ecirc;n bạn cần ch&uacute; &yacute; một số vấn đề sau trong việc chăm s&oacute;c để ch&uacute;ng c&oacute; bộ l&ocirc;ng sạch đẹp v&agrave; mượt m&agrave;.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjZd">&nbsp;</div>
<p>&ndash; Bạn n&ecirc;n chải l&ocirc;ng cho ch&oacute;&nbsp;<a href="https://blogchomeo.com/corgi-fluffy/"><strong>Fluffy Corgi</strong></a>&nbsp;mỗi ng&agrave;y. Việc chải l&ocirc;ng kh&ocirc;ng chỉ gi&uacute;p bộ l&ocirc;ng ch&uacute;ng lu&ocirc;n mượt m&agrave;, gọn g&agrave;ng. M&agrave; hơn thế nữa, điều n&agrave;y c&ograve;n gi&uacute;p loại bỏ l&ocirc;ng rụng tr&ecirc;n cơ thể ch&uacute;ng.</p>
<p>&ndash; T&iacute;nh c&aacute;ch của ch&oacute; Corgi kh&aacute; năng động, ch&uacute;ng thường xuy&ecirc;n chạy nhảy. N&ecirc;n việc bộ l&ocirc;ng lấm bẩn l&agrave; điều kh&ocirc;ng thể tr&aacute;nh khỏi. H&atilde;y sử dụng sữa tắm chuy&ecirc;n dụng cho th&uacute; cưng để ch&uacute;ng c&oacute; bộ l&ocirc;ng mượt m&agrave; v&agrave; &oacute;ng ả nhất.</p>
<p><img class="alignnone size-full wp-image-1872 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/Fluffy-Corgi-Formatted.webp" alt="" width="1024" height="681" data-ll-status="loaded"></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjdd">&nbsp;</div>
<p><em>Chăm s&oacute;c Fluffy Corgi rất quan trọng</em></p>
<p>&ndash; Bạn n&ecirc;n cắt tỉa l&ocirc;ng cho Corgi 2 &ndash; 3 th&aacute;ng 1 lần.&nbsp; T&ugrave;y điều kiện gia đ&igrave;nh m&agrave; bạn c&oacute; thể đưa Corgi đi spa cắt tỉa l&ocirc;ng. Ngo&agrave;i ra việc cắt tỉa l&ocirc;ng cần được ch&uacute; &yacute; v&agrave;o m&ugrave;a h&egrave;.</p>
<h2><strong>5. Ch&oacute; Corgi Fluffy ăn g&igrave;?</strong></h2>
<p>Nh&igrave;n chung, lo&agrave;i ch&oacute; n&agrave;y rất dễ t&iacute;nh trong khoản ăn uống, ch&uacute;ng ta c&oacute; thể cho ch&uacute;ng ăn như c&aacute;c giống ch&oacute; kh&aacute;c. Tuy nhi&ecirc;n, Corgi&nbsp; rất hay chạy nhảy n&ecirc;n cần nhiều năng lượng. V&igrave; vậy, bạn cần cung cấp cho ch&uacute;ng một khẩu phần nhiều đạm v&agrave; chất dinh dưỡng để duy tr&igrave; hoạt động của ch&uacute;ng cả ng&agrave;y.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjhd">&nbsp;</div>
<p>Tại Việt Nam, Corgi thường được chủ cho ăn cơm l&agrave; chủ yếu. Tuy nhi&ecirc;n, theo một số chuy&ecirc;n gia dinh dưỡng lĩnh vực th&uacute; y th&igrave; Corgi cần tối thiểu 70% thịt, 30% c&ograve;n lại l&agrave; cơm v&agrave; rau củ quả cũng như c&aacute;c loại thức ăn kh&aacute;c.</p>
<p><img class="alignnone size-full wp-image-1874 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/07/fluffy-corgi-playing-on-the-beach.jpg" alt="" width="1600" height="1068" data-ll-status="loaded"></p>
<p><em>Ch&oacute; Corgi Fluffy l&ocirc;ng d&agrave;i rất đ&aacute;ng y&ecirc;u</em></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMjld">&nbsp;</div>
<p>&nbsp;</p>
<p>Tr&ecirc;n đ&acirc;y l&agrave; những th&ocirc;ng tin m&agrave;&nbsp;<strong>Blog ch&oacute; m&egrave;o</strong> chia sẻ cho bạn về đặc điểm v&agrave; t&iacute;nh c&aacute;ch của ch&oacute; Corgi Fluffy hay c&ograve;n gọi l&agrave; ch&oacute; Corgi l&ocirc;ng d&agrave;i. Hy vọng rằng những th&ocirc;ng tin tr&ecirc;n sẽ gi&uacute;p bạn hiểu hơn về giống Ch&oacute; Corgi n&agrave;y.</p>', N'Tìm hiểu đặc điểm và tính cách của chó Corgi Fluffy', N'Tìm hiểu đặc điểm và tính cách của chó Corgi Fluffy', N' CHÓ / ĐẶC ĐIỂM / TIN TỨC Tìm hiểu đặc điểm và tính cách của chó Corgi Fluffy 8 Tháng Sáu, 2021 - by Cún cưng 4.7/5 - (6 bình chọn) Khi nhắc đến những chú chó cưng được nhiều người ưa thích chắc hẳn không ai có thể bỏ qua những chú chó Corgi. Với đôi chân ngắn, cặp mông to tròn và đôi mắt sáng long lanh. Chó Corgi nổi tiếng được nhiều tín đồ thú cưng săn đón. Chó Corgi có 3 dòng: Corgi Pembroke, Corgi Cardigan và Corgi Fluffy. Bài viết này các bạn hãy cùng Blog chó mèo tìm hiểu về một số đặc điểm, tính cách của chó Corgi Fluffy nhé!', N'/img/Blog/86176corgi-fluffy.jpg', CAST(N'2023-11-07' AS Date), 1, 2)
INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (4, N'<p>&nbsp;</p>
<figure id="attachment_7217" class="wp-caption aligncenter" aria-describedby="caption-attachment-7217"><img class="size-full wp-image-7217 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/04/alaska-con-map.jpeg" alt="Ch&oacute; Alaska con mập" width="1200" height="675" data-ll-status="loaded">
<figcaption id="caption-attachment-7217" class="wp-caption-text">Ch&oacute; Alaska con mập</figcaption>
</figure>
<p>Alaskan Malamute l&agrave; một giống ch&oacute; lớn, c&oacute; nguồn gốc từ Bắc Mỹ, được sử dụng chủ yếu để k&eacute;o xe tải nhẹ hoặc xe trượt tuyết. Ch&uacute;ng nổi tiếng với vẻ ngo&agrave;i đẹp mắt, sức mạnh, t&iacute;nh trung th&agrave;nh v&agrave; khả năng chịu đựng thời tiết khắc nghiệt. Giống ch&oacute; n&agrave;y c&oacute; l&ocirc;ng d&agrave;y, đ&ocirc;i mắt s&acirc;u v&agrave; đặc biệt th&iacute;ch hợp cho m&ocirc;i trường lạnh gi&aacute;.</p>
<h2>I. Giới thiệu chung về ch&oacute; alaska con mập</h2>
<p>Ch&oacute; Alaska, c&ograve;n gọi l&agrave;&nbsp;<a href="https://vi.wikipedia.org/wiki/Alaska_Malamute">Alaskan Malamute</a>, l&agrave; một giống ch&oacute; c&oacute;&nbsp;<a href="https://blogchomeo.com/nguon-goc-xuat-xu-cho-alaska/">nguồn gốc</a>&nbsp;từ Bắc Mỹ. Ch&uacute;ng nổi tiếng với vẻ ngo&agrave;i đẹp mắt, sức mạnh v&agrave; sự trung th&agrave;nh với con người. Trong b&agrave;i viết n&agrave;y, ch&uacute;ng ta sẽ t&igrave;m hiểu về ch&oacute; Alaska con mập &ndash; một phi&ecirc;n bản đ&aacute;ng y&ecirc;u v&agrave; đặc biệt của giống ch&oacute; n&agrave;y.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMV0=">&nbsp;</div>
<h2>A. Đặc điểm nổi bật của ch&oacute; alaska con mập</h2>
<p><strong>Ch&oacute; Alaska con mập</strong>&nbsp;c&oacute; k&iacute;ch thước lớn hơn so với ch&oacute; Alaska th&ocirc;ng thường. Ch&uacute;ng c&oacute; trọng lượng từ 40-60kg v&agrave; chiều cao từ 58-64cm tại vai. L&ocirc;ng của ch&uacute;ng d&agrave;y, mượt v&agrave; c&oacute; m&agrave;u sắc đa dạng, từ trắng, x&aacute;m, đen đến n&acirc;u đỏ.</p>
<figure id="attachment_7219" class="wp-caption aligncenter" aria-describedby="caption-attachment-7219"><img class="size-full wp-image-7219 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/04/alaska-con-map-2.jpeg" alt="T&ecirc;n &quot;ch&oacute; Alaska con mập&quot; chỉ đơn giản l&agrave; c&aacute;ch gọi t&ecirc;n d&acirc;n d&atilde;, để chỉ một số ch&oacute; Alaska c&oacute; thể hơi mập hơn so với ti&ecirc;u chuẩn chung của giống ch&oacute; n&agrave;y" width="1200" height="675" data-ll-status="loaded">
<figcaption id="caption-attachment-7219" class="wp-caption-text">T&ecirc;n &ldquo;ch&oacute; Alaska con mập&rdquo; chỉ đơn giản l&agrave; c&aacute;ch gọi t&ecirc;n d&acirc;n d&atilde;, để chỉ một số ch&oacute; Alaska c&oacute; thể hơi mập hơn so với ti&ecirc;u chuẩn chung của giống ch&oacute; n&agrave;y</figcaption>
</figure>
<h2>B. T&iacute;nh c&aacute;ch v&agrave; đặc trưng của giống ch&oacute; n&agrave;y</h2>
<p>Ch&oacute; Alaska con mập th&acirc;n thiện, trung th&agrave;nh v&agrave; y&ecirc;u thương gia đ&igrave;nh của m&igrave;nh. Ch&uacute;ng th&ocirc;ng minh v&agrave; nhanh nhẹn, rất th&iacute;ch hợp để huấn luyện. Tuy nhi&ecirc;n, ch&uacute;ng cũng c&oacute; bản t&iacute;nh cứng đầu n&ecirc;n cần phải được gi&aacute;o dục một c&aacute;ch ki&ecirc;n nhẫn.</p>
<h2>II. C&aacute;ch chăm s&oacute;c ch&oacute; Alaska con mập</h2>
<h3>A. Chế độ dinh dưỡng ph&ugrave; hợp</h3>
<ol>
<li>
<h4>Thức ăn kh&ocirc; v&agrave; ẩm</h4>
</li>
</ol>
<p>Ch&oacute; Alaska con mập cần c&oacute; chế độ dinh dưỡng c&acirc;n bằng, bao gồm thức ăn kh&ocirc; v&agrave; thức ăn ẩm. Thức ăn kh&ocirc; gi&uacute;p ch&uacute;ng duy tr&igrave; sức khỏe răng miệng, trong khi thức ăn ẩm cung cấp nước v&agrave; đa dạng dinh dưỡng.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMl0=">&nbsp;</div>
<ol start="2">
<li>
<h4>Thức ăn dinh dưỡng ph&ugrave; hợp với độ tuổi</h4>
</li>
</ol>
<p>Cần ch&uacute; &yacute; chọn thức ăn ph&ugrave; hợp với độ tuổi của ch&oacute;. Ch&oacute; con cần nhiều protein v&agrave; chất b&eacute;o hơn để ph&aacute;t triển, trong khi ch&oacute; trưởng th&agrave;nh cần chế độ ăn uống giảm calo để tr&aacute;nh b&eacute;o ph&igrave;.</p>
<blockquote>
<p>Để hiểu chi tiết hơn về c&aacute;ch nu&ocirc;i ch&oacute; Alaska h&atilde;y&nbsp;<a href="https://blogchomeo.com/cach-nuoi-cho-alaska/">click v&agrave;o đ&acirc;y</a></p>
</blockquote>
<h3>B. Lịch tập luyện v&agrave; hoạt động thể chất</h3>
<ol>
<li>
<h4>C&aacute;c hoạt động thể chất ph&ugrave; hợp</h4>
</li>
</ol>
<p>Ch&oacute; Alaska con mập y&ecirc;u th&iacute;ch hoạt động thể chất v&agrave; cần được vận động thường xuy&ecirc;n để duy tr&igrave; sức khỏe. C&aacute;c hoạt động ph&ugrave; hợp bao gồm đi bộ, chạy bộ, bơi lội v&agrave; chơi đ&ugrave;a với chủ. Ch&uacute;ng cũng c&oacute; thể tham gia v&agrave;o c&aacute;c m&ocirc;n thể thao ch&oacute; như xổ giữa, k&eacute;o xe v&agrave; agility.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsM10=">&nbsp;</div>
<figure id="attachment_7218" class="wp-caption aligncenter" aria-describedby="caption-attachment-7218"><img class="wp-image-7218 size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/04/Alaskan_Malamute.jpeg" alt="Ch&oacute; Alaska con mập y&ecirc;u th&iacute;ch hoạt động thể chất v&agrave; cần được vận động thường xuy&ecirc;n để duy tr&igrave; sức khỏe." width="801" height="1200" data-ll-status="loaded">
<figcaption id="caption-attachment-7218" class="wp-caption-text">Ch&oacute; Alaska con mập y&ecirc;u th&iacute;ch hoạt động thể chất v&agrave; cần được vận động thường xuy&ecirc;n để duy tr&igrave; sức khỏe.</figcaption>
</figure>
<ol start="2">
<li>
<h4>Lịch tr&igrave;nh tập luyện</h4>
</li>
</ol>
<p>Để giữ cho ch&oacute; Alaska con mập khỏe mạnh, bạn n&ecirc;n d&agrave;nh &iacute;t nhất 30-60 ph&uacute;t mỗi ng&agrave;y để tập luyện c&ugrave;ng ch&uacute;ng. Tập luyện c&oacute; thể được chia th&agrave;nh nhiều đợt ngắn trong ng&agrave;y. H&atilde;y nhớ giữ cho ch&uacute;ng được thả tự do trong khu vực an to&agrave;n để ch&uacute;ng c&oacute; thể vận động tự nhi&ecirc;n.</p>
<h3>C. Chăm s&oacute;c sức khỏe</h3>
<ol>
<li>
<h4>Ti&ecirc;m ph&ograve;ng v&agrave; kiểm tra sức khỏe định kỳ</h4>
</li>
</ol>
<p>Đảm bảo rằng ch&oacute; Alaska con mập của bạn được ti&ecirc;m ph&ograve;ng đầy đủ v&agrave; thăm kh&aacute;m sức khỏe định kỳ. H&atilde;y theo d&otilde;i lịch ti&ecirc;m ph&ograve;ng v&agrave; thảo luận với b&aacute;c sĩ th&uacute; y về những loại vaccine cần thiết.</p>
<ol start="2">
<li>
<h4>Chăm s&oacute;c l&ocirc;ng v&agrave; da</h4>
</li>
</ol>
<p>Do l&ocirc;ng d&agrave;y v&agrave; mượt, ch&oacute; Alaska con mập cần được chải l&ocirc;ng thường xuy&ecirc;n để ngăn rụng l&ocirc;ng v&agrave; giữ cho da khỏe mạnh. H&atilde;y chải l&ocirc;ng &iacute;t nhất một lần mỗi tuần v&agrave; tắm cho ch&uacute;ng &iacute;t nhất một lần mỗi th&aacute;ng.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNF0=">&nbsp;</div>
<ol start="3">
<li>
<h4>Ph&ograve;ng tr&aacute;nh c&aacute;c bệnh thường gặp</h4>
</li>
</ol>
<p>Ch&oacute; Alaska con mập c&oacute; thể gặp một số vấn đề sức khỏe như bệnh tim, bệnh xương khớp v&agrave; b&eacute;o ph&igrave;. H&atilde;y ch&uacute; &yacute; đến biểu hiện của ch&uacute;ng v&agrave; thảo luận với b&aacute;c sĩ th&uacute; y nếu c&oacute; dấu hiệu bất thường.</p>
<figure id="attachment_2517" class="wp-caption alignnone" aria-describedby="caption-attachment-2517"><img class="size-full wp-image-2517 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/08/cho-alaska-5.jpg" alt="cho-alaska-5" width="800" height="450" data-ll-status="loaded">
<figcaption id="caption-attachment-2517" class="wp-caption-text">C&aacute;c bệnh thường gặp ở ch&oacute; Alaska như bệnh tim, bệnh xương khớp v&agrave; b&eacute;o ph&igrave;</figcaption>
</figure>
<h2>III. C&aacute;c điều cần lưu &yacute; khi nu&ocirc;i ch&oacute; Alaska con mập</h2>
<h3>A. M&ocirc;i trường sống</h3>
<p><strong>Ch&oacute; Alaska con mập</strong>&nbsp;cần một kh&ocirc;ng gian sống rộng r&atilde;i để vận động. H&atilde;y đảm bảo rằng ch&uacute;ng c&oacute; đủ kh&ocirc;ng gian trong nh&agrave; hoặc s&acirc;n vườn để chạy nhảy v&agrave; chơi đ&ugrave;a.</p>
<figure id="attachment_2516" class="wp-caption aligncenter" aria-describedby="caption-attachment-2516"><img class="size-full wp-image-2516 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/08/cho-alaska-4.jpg" alt="cho-alaska-4" width="800" height="533" data-ll-status="loaded">
<figcaption id="caption-attachment-2516" class="wp-caption-text">M&ocirc;i trường sống của ch&oacute; Alaska</figcaption>
</figure>
<h3>B. Gi&aacute;o dục v&agrave; huấn luyện ch&oacute;</h3>
<p>Ch&oacute; Alaska con mập th&ocirc;ng minh v&agrave; c&oacute; thể học nhanh, nhưng cần sự ki&ecirc;n nhẫn trong qu&aacute; tr&igrave;nh huấn luyện. H&atilde;y bắt đầu huấn luyện sớm v&agrave; sử dụng phương ph&aacute;p thưởng để khuyến kh&iacute;ch ch&uacute;ng. H&atilde;y nhớ duy tr&igrave; sự nhất qu&aacute;n v&agrave; ki&ecirc;n định trong việc huấn luyện.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNV0=">&nbsp;</div>
<figure id="attachment_3526" class="wp-caption aligncenter" aria-describedby="caption-attachment-3526"><img class="size-full wp-image-3526 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/09/tuoi-tho-cua-cho-alaska-5.jpg" alt="tuoi-tho-cua-cho-alaska-4" width="800" height="548" data-ll-status="loaded">
<figcaption id="caption-attachment-3526" class="wp-caption-text">Vận động cho ch&oacute;</figcaption>
</figure>
<h3>C. Tương t&aacute;c x&atilde; hội với con người v&agrave; động vật kh&aacute;c</h3>
<p>Ch&oacute; Alaska con mập th&acirc;n thiện v&agrave; th&iacute;ch giao tiếp với mọi người cũng như c&aacute;c lo&agrave;i động vật kh&aacute;c. H&atilde;y giới thiệu ch&uacute;ng với nhiều người v&agrave; động vật kh&aacute;c nhau để ph&aacute;t triển kỹ năng x&atilde; hội của ch&uacute;ng. H&atilde;y dạy ch&uacute;ng c&aacute;ch ứng xử đ&uacute;ng mực khi gặp người lạ hoặc động vật lạ.</p>
<h2>IV. Gi&aacute; cả v&agrave; địa chỉ mua ch&oacute; alaska con mập uy t&iacute;n</h2>
<h3>A. Gi&aacute; cả tham khảo</h3>
<p>Gi&aacute; của ch&oacute; Alaska con mập phụ thuộc v&agrave;o nhiều yếu tố như giống, độ tuổi, xuất xứ v&agrave; chất lượng sức khỏe. Gi&aacute; tham khảo cho một ch&oacute; Alaska con mập c&oacute; thể từ 1.000 đến 3.000 USD.</p>
<h3>B. C&aacute;c địa chỉ mua ch&oacute; uy t&iacute;n</h3>
<p>Để mua ch&oacute; Alaska con mập, h&atilde;y chọn c&aacute;c cơ sở nh&acirc;n giống, trại giống ch&oacute; hoặc c&aacute;c cửa h&agrave;ng th&uacute; cưng uy t&iacute;n. H&atilde;y đảm bảo rằng ch&uacute;ng được ti&ecirc;m ph&ograve;ng đầy đủ, kiểm tra sức khỏe v&agrave; c&oacute; giấy tờ ch&iacute;nh thống.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNl0=">&nbsp;</div>
<figure id="attachment_56" class="wp-caption aligncenter" aria-describedby="caption-attachment-56"><img class="wp-image-56 size-full lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2021/06/dac-diem-cho-alaska.jpg" alt="Mua Ch&oacute; ALaska Malamute tại c&aacute;c cơ sở nh&acirc;n giống, trại giống uy t&iacute;n" width="1200" height="675" data-ll-status="loaded">
<figcaption id="caption-attachment-56" class="wp-caption-text">Mua Ch&oacute; ALaska Malamute tại c&aacute;c cơ sở nh&acirc;n giống, trại giống uy t&iacute;n</figcaption>
</figure>
<h3>C. Lưu &yacute; khi mua ch&oacute; alaska con mập</h3>
<p><strong>Khi mua ch&oacute; Alaska con mập, h&atilde;y ch&uacute; &yacute; đến c&aacute;c điều sau:</strong></p>
<ul>
<li>Kiểm tra t&igrave;nh trạng sức khỏe của ch&oacute;, bao gồm l&ocirc;ng, da, mắt, tai v&agrave; răng.</li>
<li>Hỏi về lịch sử ti&ecirc;m ph&ograve;ng v&agrave; kiểm tra sức khỏe.</li>
<li>T&igrave;m hiểu về t&iacute;nh c&aacute;ch của ch&oacute; v&agrave; đ&aacute;nh gi&aacute; liệu ch&uacute;ng c&oacute; ph&ugrave; hợp với gia đ&igrave;nh bạn hay kh&ocirc;ng.</li>
<li>H&atilde;y y&ecirc;u cầu xem giấy tờ ch&iacute;nh thống của ch&oacute;, bao gồm giấy ph&eacute;p nh&acirc;n giống v&agrave; giấy chứng nhận sức khỏe.\</li>
</ul>
<h2>V. Hỏi đ&aacute;p phổ biến:</h2>
<p>&nbsp;</p>
<ol>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&oacute; Alaska con mập c&oacute; k&iacute;ch thước như thế n&agrave;o?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập c&oacute; trọng lượng từ 40-60kg v&agrave; chiều cao từ 58-64cm tại vai.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&uacute;ng c&oacute; t&iacute;nh c&aacute;ch ra sao?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập th&acirc;n thiện, trung th&agrave;nh, th&ocirc;ng minh v&agrave; nhanh nhẹn, nhưng cũng c&oacute; bản t&iacute;nh cứng đầu.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&uacute;ng cần chế độ ăn uống như thế n&agrave;o?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập cần chế độ ăn uống c&acirc;n bằng, bao gồm thức ăn kh&ocirc;, thức ăn ẩm v&agrave; c&aacute;c chất dinh dưỡng ph&ugrave; hợp với độ tuổi.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&uacute;ng cần bao nhi&ecirc;u vận động h&agrave;ng ng&agrave;y?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập cần &iacute;t nhất 30-60 ph&uacute;t vận động mỗi ng&agrave;y để duy tr&igrave; sức khỏe.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;L&agrave;m thế n&agrave;o để chăm s&oacute;c l&ocirc;ng của ch&uacute;ng?&nbsp;<strong>Trả lời:</strong>&nbsp;Chải l&ocirc;ng &iacute;t nhất một lần mỗi tuần v&agrave; tắm cho ch&uacute;ng &iacute;t nhất một lần mỗi th&aacute;ng.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&oacute; Alaska con mập c&oacute; th&iacute;ch hợp với trẻ em kh&ocirc;ng?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&uacute;ng th&acirc;n thiện v&agrave; y&ecirc;u thương gia đ&igrave;nh, th&iacute;ch hợp với trẻ em nếu được gi&aacute;o dục v&agrave; gi&aacute;m s&aacute;t đ&uacute;ng c&aacute;ch.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&uacute;ng c&oacute; thể sống trong m&ocirc;i trường n&oacute;ng kh&ocirc;ng?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập th&iacute;ch nghi tốt với thời tiết lạnh, nhưng cũng c&oacute; thể sống trong m&ocirc;i trường n&oacute;ng nếu được chăm s&oacute;c đ&uacute;ng c&aacute;ch.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&uacute;ng c&oacute; dễ huấn luyện kh&ocirc;ng?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập th&ocirc;ng minh v&agrave; c&oacute; khả năng học nhanh, nhưng cần sự ki&ecirc;n nhẫn trong qu&aacute; tr&igrave;nh huấn luyện.</li>
<li><strong>C&acirc;u hỏi:</strong>&nbsp;Ch&uacute;ng c&oacute; mối quan hệ như thế n&agrave;o với c&aacute;c lo&agrave;i động vật kh&aacute;c?&nbsp;<strong>Trả lời:</strong>&nbsp;Ch&oacute; Alaska con mập thường th&acirc;n thiện với c&aacute;c lo&agrave;i động vật kh&aacute;c, nhưng cần được giới thiệu v&agrave; huấn luyện x&atilde; hội từ sớm.</li>
</ol>
<h2>VI. Kết luận</h2>
<p><strong>Ch&oacute; Alaska con mập</strong>&nbsp;l&agrave; một giống ch&oacute; đẹp mắt, trung th&agrave;nh v&agrave; th&acirc;n thiện. Để chăm s&oacute;c ch&uacute;ng đ&uacute;ng c&aacute;ch, h&atilde;y ch&uacute; &yacute; đến chế độ dinh dưỡng, tập luyện, sức khỏe v&agrave; m&ocirc;i trường sống ph&ugrave; hợp. Bằng c&aacute;ch tu&acirc;n thủ những hướng dẫn tr&ecirc;n, bạn sẽ c&oacute; một người bạn đ&aacute;ng y&ecirc;u v&agrave; khỏe mạnh b&ecirc;n cạnh.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsN10=">&nbsp;</div>
<p><strong>C&aacute;c kiến thức chi tiết về Ch&oacute; Alaska:</strong></p>
<ul>
<li><a href="https://blogchomeo.com/nguon-goc-xuat-xu-cho-alaska/">Nguồn gốc ch&oacute; alaska</a></li>
<li><a href="https://blogchomeo.com/cach-nuoi-cho-alaska/">C&aacute;ch nu&ocirc;i ch&oacute; alaska</a></li>
<li><a href="https://blogchomeo.com/cho-alaska-an-gi/">Thức ăn ch&oacute; alaska</a></li>
<li><a href="https://blogchomeo.com/cho-alaska-giant-khong-lo/">Gi&aacute; ch&oacute; alaska</a></li>
<li><a href="https://blogchomeo.com/hoi-dap-cho-alaska/">Hỏi đ&aacute;p về ch&oacute; alaska</a></li>
<li><a href="https://blogchomeo.com/mua-cho-alaska-gia-re/">C&oacute; n&ecirc;n mua ch&oacute; alaska gi&aacute; rẻ kh&ocirc;ng?</a></li>
<li><a href="https://blogchomeo.com/kinh-nghiem-nuoi-cho-alaska-2-thang-tuoi/">Kinh nghiệm nu&ocirc;i ch&oacute; alaska 2 th&aacute;ng tuổi</a></li>
<li><a href="https://blogchomeo.com/cho-alaska-co-nhung-mau-gi/">Ch&oacute; alaska c&oacute; những m&agrave;u g&igrave;?</a></li>
</ul>
<p>Nếu bạn đang c&acirc;n nhắc mua một ch&oacute; Alaska con mập, h&atilde;y lưu &yacute; c&aacute;c điều cần kiểm tra khi mua ch&oacute; v&agrave; chọn c&aacute;c địa chỉ uy t&iacute;n để đảm bảo bạn mang về một ch&uacute; ch&oacute; khỏe mạnh v&agrave; hạnh ph&uacute;c. Với sự chăm s&oacute;c, t&igrave;nh y&ecirc;u v&agrave; ki&ecirc;n nhẫn, chắc chắn ch&oacute; Alaska con mập sẽ trở th&agrave;nh một th&agrave;nh vi&ecirc;n đ&aacute;ng y&ecirc;u v&agrave; kh&ocirc;ng thể thiếu trong gia đ&igrave;nh bạn.</p>', N'Chó Alaska Con Mập: Hướng Dẫn Nuôi Dưỡng Và Chăm Sóc Chi Tiết', N'Chó Alaska Con Mập: Hướng Dẫn Nuôi Dưỡng Và Chăm Sóc Chi Tiết', N' CHÓ Chó Alaska Con Mập: Hướng Dẫn Nuôi Dưỡng Và Chăm Sóc Chi Tiết 1 Tháng Tư, 2023 - by Cún cưng 5/5 - (1 bình chọn) Chó Alaska con mập là cách gọi tên dân dã, để chỉ một số chó Alaska có thể hơi mập hơn so với tiêu chuẩn chung của giống chó này, thuộc giống chó Alaskan Malamute', N'/img/Blog/14832alaska-con-map-2.jpeg', CAST(N'2023-11-06' AS Date), 1, 2)
INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (5, N'<h2><strong>1. Triệt sản l&agrave; g&igrave;?</strong></h2>
<p>Triệt sản (<em>hay thiến</em>) đ&acirc;y l&agrave; một phẫu thuật<strong>&nbsp;loại bỏ cơ quan sinh dục&nbsp;</strong>của động vật. Việc n&agrave;y nhằm loại bỏ khả năng sinh sản của th&uacute; cưng một c&aacute;ch vĩnh viễn.</p>
<ul>
<li aria-level="1">Đối với con đực: Qu&aacute; tr&igrave;nh triệt sản l&agrave; qu&aacute; tr&igrave;nh cắt bỏ tinh ho&agrave;n của ch&oacute; m&egrave;o đực (h&agrave;nh động n&agrave;y thường được gọi l&agrave; thiến)</li>
<li aria-level="1">Đối với con c&aacute;i: Qu&aacute; tr&igrave;nh triệt sản nhằm mục đ&iacute;ch loại bỏ buồng trứng v&agrave; tử cung</li>
</ul>
<p>Triệt sản ch&oacute; c&aacute;i kh&ocirc;ng đơn giản như cuộc phẫu thuật triệt sản (thiến/hoạn) m&agrave; ch&oacute; đực nhận được. M&agrave; đ&oacute; l&agrave; cuộc phẫu thuật lớn hơn v&agrave; cần d&ugrave;ng đến g&acirc;y m&ecirc; to&agrave;n th&acirc;n.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMV0=">&nbsp;</div>
<figure id="attachment_5530" class="wp-caption aligncenter" aria-describedby="caption-attachment-5530"><a href="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-3-1.jpg"><img class="wp-image-5530 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-3-1.jpg" alt="triet-san-cho-cai-khi-nao-3" width="800" height="391" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-5530" class="wp-caption-text">Phẫu thuật triệt sản cho ch&oacute; c&aacute;i sẽ lớn hơn ch&oacute; đực</figcaption>
</figure>
<h2><strong>2. Triệt sản ch&oacute; c&oacute; lợi &iacute;ch g&igrave;?</strong></h2>
<p>Triệt sản cho ch&oacute; c&aacute;i mang lại nhiều lợi &iacute;ch hơn bạn nghĩ đấy. Một số lợi &iacute;ch như sau:</p>
<ul>
<li aria-level="1">Gi&uacute;p ch&oacute; c&aacute;i tr&aacute;nh thai, chấm dứt nguy cơ&nbsp;<a href="https://blogchomeo.com/lam-the-nao-de-biet-cho-mang-thai/">ch&oacute; mang thai</a>&nbsp;ngo&agrave;i &yacute; muốn&nbsp;</li>
<li aria-level="1">Giảm nguy cơ mắc c&aacute;c&nbsp;<a href="https://blogchomeo.com/benh-thuong-gap-o-cho/">bệnh</a>: Vi&ecirc;m tử cung t&iacute;ch mủ, ung thư tuyến v&uacute;&hellip;</li>
<li aria-level="1">Tr&aacute;nh thu h&uacute;t ch&oacute; đực&nbsp;</li>
<li aria-level="1">Loại bỏ một số&nbsp;<a href="https://blogchomeo.com/lam-the-nao-de-khu-mui-hoi-cua-cho-nguyen-nhan-va-cach-khac-phuc/">m&ugrave;i h&ocirc;i</a>&nbsp;tr&ecirc;n người ch&oacute; c&aacute;i</li>
<li aria-level="1">Giải quyết việc ch&oacute; c&aacute;i trở n&ecirc;n k&iacute;ch động trong thời kỳ động dục</li>
</ul>
<blockquote>
<p>Xem th&ecirc;m:&nbsp;<a href="https://blogchomeo.com/triet-san-cho-cho-meo/">Triệt Sản cho Boss &ndash; Lợi hay hại, c&oacute; n&ecirc;n triệt sản cho Ch&oacute; M&egrave;o?</a></p>
</blockquote>
<h2><strong>3. N&ecirc;n triệt sản ch&oacute; c&aacute;i khi n&agrave;o l&agrave; ph&ugrave; hợp?</strong></h2>
<p>Giải đ&aacute;p cho c&acirc;u hỏi &ldquo;Triệt sản ch&oacute; c&aacute;i khi n&agrave;o?&rdquo; l&agrave;: Những con ch&oacute; c&aacute;i khỏe mạnh, đủ khả năng phẫu thuật sẽ thực hiện phẫu thuật triệt sản trong độ tuổi<strong>&nbsp;từ khoảng 6-9 th&aacute;ng</strong>&nbsp;l&agrave; tốt nhất. Tuy nhi&ecirc;n chắc chắn hơn về thời gian triệt sản của ch&oacute; c&aacute;i. Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n t&igrave;m&nbsp;<strong>hỏi &yacute; kiến của b&aacute;c sĩ th&uacute; y.</strong>&nbsp;B&aacute;c sĩ th&uacute; y sẽ xem x&eacute;t thể trạng hiện tại của ch&oacute;. Sau đ&oacute; mới đưa ra những khuyến c&aacute;o về thời gian triệt sản th&iacute;ch hợp cho ch&uacute; ch&oacute; của bạn.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMl0=">&nbsp;</div>
<figure id="attachment_5526" class="wp-caption aligncenter" aria-describedby="caption-attachment-5526"><a href="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-1.jpg"><img class="wp-image-5526 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-1.jpg" alt="triet-san-cho-cai-khi-nao-1" width="800" height="458" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-5526" class="wp-caption-text">Cần chọn thời điểm ph&ugrave; hợp để triệt sản cho ch&oacute; c&aacute;i</figcaption>
</figure>
<p>Một lưu &yacute; nữa về thời điểm triệt sản ch&oacute; c&aacute;i l&agrave; tốt nhất n&ecirc;n l&agrave;m<strong>&nbsp;trước chu kỳ dậy th&igrave; đầu ti&ecirc;n</strong>&nbsp;của ch&uacute;ng. Chu kỳ động dục đầu ti&ecirc;n của ch&oacute; c&aacute;i thường sẽ xảy ra v&agrave;o khoảng 6-7 th&aacute;ng tuổi. Nhiều b&aacute;c sĩ th&uacute; y sẽ đợi đến khi ch&oacute; c&aacute;i gần s&aacute;t tuổi &ldquo;dậy th&igrave;&rdquo; th&igrave; mới quyết định triệt sản. Bởi l&uacute;c đ&oacute; ch&uacute;ng mới c&oacute; khả năng chịu đựng được lượng thuốc g&acirc;y m&ecirc; cần thiết.</p>
<blockquote>
<p>Xem th&ecirc;m:&nbsp;<a href="https://blogchomeo.com/cho-salo-la-gi-dau-hieu-nhan-biet-cho-salo/">Ch&oacute; salo l&agrave; g&igrave;? Dấu hiệu nhận biết ch&oacute; salo</a></p>
</blockquote>
<p>Với ch&oacute; c&oacute; độ tuổi lớn hơn 6-9 th&aacute;ng, việc triệt sản sẽ&nbsp;<strong>kh&oacute; khăn&nbsp;</strong>hơn. Nếu bạn đ&atilde; lỡ qua &ldquo;thời điểm v&agrave;ng&rdquo; để triệt sản cho ch&oacute; c&aacute;i. Th&igrave; lần sau bạn sẽ phải t&iacute;nh to&aacute;n chu kỳ động dục của n&oacute; trước khi triệt sản. C&aacute;c b&aacute;c sĩ th&uacute; y kh&ocirc;ng khuyến kh&iacute;ch bạn đưa ch&oacute; đi triệt sản khi ch&uacute;ng vẫn c&ograve;n đang trong thời kỳ động dục. Họ sẽ<strong>&nbsp;đợi từ 2-3 th&aacute;ng, sau khi chu kỳ động dục của ch&oacute; c&aacute;i kết th&uacute;c&nbsp;</strong>rồi mới tiến h&agrave;nh phẫu thuật triệt sản.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsM10=">&nbsp;</div>
<h2><strong>4. Triệt sản ch&oacute; c&aacute;i bao nhi&ecirc;u tiền?</strong></h2>
<p>Gi&aacute; triệt sản ch&oacute; c&aacute;i sẽ dao động từ&nbsp;<strong>500.000 đồng đến 1.000.000 đồng.&nbsp;</strong>Gi&aacute; tiền&nbsp;t&ugrave;y theo c&acirc;n nặng v&agrave; độ tuổi của ch&oacute;. Phẫu thuật triệt sản cho ch&oacute; c&aacute;i l&agrave; rất quan trọng. Tốt nhất bạn n&ecirc;n lựa chọn cơ sở lớn, chất lượng v&agrave; đừng ham rẻ cho ch&oacute; triệt sản tại những nơi k&eacute;m uy t&iacute;n nh&eacute;!</p>
<h2><strong>5. #9 lưu &yacute; khi triệt sản cho ch&oacute; c&aacute;i</strong></h2>
<p>Triệt sản cho ch&oacute; c&aacute;i l&agrave; cuộc phẫu thuật lớn v&agrave; quan trọng. V&igrave; vậy, bạn cần lưu &yacute; một số vấn đề sau để đảm bảo c&ocirc; ch&oacute; của bạn được khỏe mạnh:</p>
<ul>
<li aria-level="1">Chỉ đưa ch&oacute; rời khỏi th&uacute; y khi đ&atilde; tỉnh thuốc m&ecirc; (mở mắt, ng&oacute;c đầu, cử động&hellip;)</li>
<li aria-level="1">Khi đưa c&uacute;n về nh&agrave;, đặt ch&uacute;ng ở vị tr&iacute; tho&aacute;ng m&aacute;t, y&ecirc;n tĩnh, &iacute;t người qua lại để ch&oacute; c&oacute; thể nghỉ ngơi.</li>
<li aria-level="1">V&agrave;i tiếng sau triệt sản, ch&oacute; c&aacute;i sẽ c&oacute; một số biểu hiện như loạng choạng, đi xi&ecirc;u vẹo, mắt đờ đẫn, gương mặt chưa ho&agrave;n to&agrave;n tỉnh t&aacute;o&hellip; Đ&acirc;y l&agrave; những biểu hiện ho&agrave;n to&agrave;n b&igrave;nh thường do thuốc m&ecirc; vẫn chưa hết t&aacute;c dụng. V&igrave; vậy bạn kh&ocirc;ng cần phải lo lắng. Sau v&agrave;i tiếng, c&ocirc; ch&oacute; của bạn sẽ tỉnh hẳn.</li>
<li aria-level="1">Kh&ocirc;ng cho/&eacute;p ch&oacute; ăn ngay sau khi triệt sản.</li>
<li aria-level="1">Giữ vệ sinh vết mổ của c&uacute;n.</li>
<li aria-level="1">Kh&ocirc;ng cho ch&oacute; nằm ra đất, c&aacute;t, nơi ẩm ướt v&agrave; k&eacute;m vệ sinh để tr&aacute;nh nhiễm tr&ugrave;ng vết thương.</li>
<li aria-level="1">Quan s&aacute;t v&agrave; theo d&otilde;i c&uacute;n thật kỹ trong suốt 24 tiếng đầu ti&ecirc;n sau triệt sản để kịp thời ph&aacute;t hiện c&aacute;c trường hợp bất thường nếu c&oacute;, như: Vết thương chảy m&aacute;u li&ecirc;n tục, bung chỉ&hellip;&nbsp;</li>
<li aria-level="1">Đưa ch&oacute; đến th&uacute; y để được can thiệp kịp thời nếu ch&uacute;ng c&oacute; những biểu hiện lạ</li>
<li aria-level="1">Đưa c&ocirc; ch&oacute; của bạn đến th&uacute; y ti&ecirc;m hậu phẫu theo lời dặn của b&aacute;c sĩ.</li>
</ul>
<figure id="attachment_5529" class="wp-caption aligncenter" aria-describedby="caption-attachment-5529"><a href="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-2-1.jpg"><img class="wp-image-5529 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/10/triet-san-cho-cai-khi-nao-2-1.jpg" alt="triet-san-cho-cai-khi-nao-2" width="800" height="450" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-5529" class="wp-caption-text">Phẫu thuật triệt sản cho ch&oacute; c&aacute;i</figcaption>
</figure>
<h2>6. Kết luận</h2>
<p>Như vậy,&nbsp;<strong>Blog Ch&oacute; M&egrave;o</strong>&nbsp;đ&atilde; trả lời cho bạn c&acirc;u hỏi: N&ecirc;n triệt sản ch&oacute; c&aacute;i khi n&agrave;o? Hy vọng qua b&agrave;i viết n&agrave;y bạn sẽ nắm r&otilde; được thời điểm th&iacute;ch hợp để triệt sản cho c&ocirc; ch&oacute; của m&igrave;nh. H&atilde;y lu&ocirc;n chăm s&oacute;c thật tốt cho ch&uacute;ng nh&eacute;!</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNF0=">&nbsp;</div>
<p><strong>Ngo&agrave;i ra, nếu bạn quan t&acirc;m về triệt sản ở m&egrave;o, c&oacute; thể tham khảo b&agrave;i viết sau:</strong></p>
<ol>
<li aria-level="1"><a href="https://blogchomeo.com/thien-meo-duc-bao-nhieu-tien/">Thiến m&egrave;o đực bao nhi&ecirc;u tiền, c&oacute; n&ecirc;n thiến m&egrave;o đực kh&ocirc;ng</a></li>
<li aria-level="1"><a href="https://blogchomeo.com/triet-san-meo-cai/">Triệt sản m&egrave;o c&aacute;i v&agrave; những lưu &yacute; cực k&igrave; quan trọng cho người nu&ocirc;i</a></li>
<li aria-level="1"><a href="https://blogchomeo.com/lam-the-nao-de-meo-het-gao-duc/">L&agrave;m thế n&agrave;o để m&egrave;o hết g&agrave;o đực?</a></li>
</ol>', N'Triệt sản chó cái khi nào tốt nhất? 9 lưu ý khi triệt sản chó cái', N'Triệt sản chó cái khi nào tốt nhất? 9 lưu ý khi triệt sản chó cái', N' CÁCH NUÔI / CHÓ / HỎI ĐÁP Triệt sản chó cái khi nào tốt nhất? 9 lưu ý khi triệt sản chó cái 12 Tháng Mười, 2022 - by Pug Loan 5/5 - (9 bình chọn) Nếu bạn đang phân vân không biết nên triệt sản chó cái khi nào là tốt nhất thì bài viết này sẽ giúp bạn vấn đề đó. Cách xử lý khi cô chó của bạn đã qua thời điểm tốt nhất để triệt sản cũng sẽ được hé lộ. Cùng Blog Chó Mèo theo dõi ngay nhé!', N'/img/Blog/87188triet-san-cho-cai-khi-nao-3-1.jpg', CAST(N'2023-11-09' AS Date), 1, 2)
INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (6, N'<h2 id="toc_0"><strong>1. Bị M&egrave;o cắn c&oacute; sao kh&ocirc;ng? Vết thương chảy m&aacute;u th&igrave; sao?</strong></h2>
<blockquote>
<p>Theo<a href="https://en.wikipedia.org/wiki/Cat_bite">&nbsp;Wikipedia</a>: &ldquo;<strong><span class="">Vết cắn của m&egrave;o</span></strong><span class="">&nbsp;l&agrave; vết cắn do m&egrave;o nh&agrave; g&acirc;y ra cho người, m&egrave;o kh&aacute;c v&agrave; động vật kh&aacute;c</span><span class="">.&nbsp;</span><sup id="cite_ref-MSW3fc_1-0" class="reference"></sup><sup id="cite_ref-ITIS_F.c._2-0" class="reference"></sup><span class="">Dữ liệu từ&nbsp;</span><span class="">Hoa Kỳ</span><span class="">&nbsp;cho thấy vết cắn của m&egrave;o chiếm từ 5&ndash;15% tổng số vết cắn do động vật g&acirc;y ra cho con người.&rdquo;</span></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMV0=">&nbsp;</div>
</blockquote>
<p>Hiện nay, m&egrave;o được kh&aacute; nhiều gia đ&igrave;nh sử dụng l&agrave;m vật nu&ocirc;i trong nh&agrave;. Tuy nhi&ecirc;n trong cơ thể của m&egrave;o vẫn c&oacute; chứa nhiều virus &ndash; vi khuẩn độc hại đối với sức khỏe con người th&ocirc;ng qua đường nước bọt.</p>
<figure id="attachment_4351" class="wp-caption aligncenter" aria-describedby="caption-attachment-4351"><a href="https://blogchomeo.com/wp-content/uploads/2022/09/iStock-613210756-1024x683-1.jpg"><img class="wp-image-4351 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/09/iStock-613210756-1024x683-1.jpg" alt="bi-meo-can-co-sao-khong-1" width="800" height="534" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-4351" class="wp-caption-text">M&egrave;o cắn c&oacute; thể trở n&ecirc;n nguy hiểm</figcaption>
</figure>
<p>Đặc biệt, tại nước ta hiện nay việc thực hiện ti&ecirc;m&nbsp;<strong><a href="https://blogchomeo.com/tiem-phong-cho-dai-can-bao-nhieu-tien/">vacxin ph&ograve;ng dại cho ch&oacute; m&egrave;o</a></strong>&nbsp;vẫn chưa được phổ biến rộng r&atilde;i. Thậm ch&iacute; nhiều gia đ&igrave;nh chỉ c&oacute; &yacute; định ti&ecirc;m vacxin đối với những giống ch&oacute; &ndash; m&egrave;o lai đắt tiền, c&ograve;n m&egrave;o ta th&igrave; thường ngược lại.</p>
<p>Mặc d&ugrave; bạn c&oacute; thể tr&aacute;nh khỏi việc vuốt ve th&uacute; cưng của m&igrave;nh để kh&ocirc;ng bị cắn, nhưng thực sự kh&oacute; cưỡng lại với những tiếng &ldquo;meo meo&rdquo; ngọt ng&agrave;o đ&oacute;. Theo nhiều th&ocirc;ng tin từ Trung t&acirc;m Kiểm so&aacute;t v&agrave; Ph&ograve;ng ngừa Dịch bệnh CDC cho biết, tr&ecirc;n da &ndash; ph&acirc;n &ndash; nước bọt của m&egrave;o c&oacute; chứa nhiều&nbsp;<strong>vi khuẩn l&acirc;y lan độc hại</strong>.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMl0=">&nbsp;</div>
<p>Nếu v&ocirc; t&igrave;nh bị m&egrave;o cắn chảy m&aacute;u hoặc bị m&egrave;o cắn ở đầu ng&oacute;n tay, bạn sẽ thường ph&acirc;n v&acirc;n v&agrave; đặt ra c&acirc;u hỏi bị m&egrave;o cắn c&oacute; sao kh&ocirc;ng?. C&oacute; độc kh&ocirc;ng? C&oacute; nguy hiểm kh&ocirc;ng?.</p>
<p>Thực tế nếu bị m&egrave;o cắn v&agrave; kh&ocirc;ng được xử l&yacute; với những biện ph&aacute;p y học kịp thời, bạn sẽ c&oacute; thể bị l&acirc;y nhiễm bệnh dại. Đặc biệt, nếu để l&acirc;u m&agrave; kh&ocirc;ng chữa trị c&oacute; thể gặp c&aacute;c vấn đề li&ecirc;n quan tới sức khỏe, ảnh hưởng tới t&iacute;nh mạng khi ph&aacute;t bệnh.</p>
<h2 id="toc_1"><strong>2. M&egrave;o c&oacute; thể l&acirc;y bệnh dại cho bạn kh&ocirc;ng?</strong></h2>
<blockquote>
<p>M&egrave;o c&oacute; thể l&acirc;y<strong>&nbsp;bệnh dại</strong>&nbsp;cho bạn nếu m&egrave;o mắc bệnh dại.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsM10=">&nbsp;</div>
</blockquote>
<p>Để hạn chế phải đưa ra những c&acirc;u hỏi như BỊ m&egrave;o cắn c&oacute; sao kh&ocirc;ng, Cũng như hạn chế việc l&acirc;y bệnh dại từ th&uacute; cưng. Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n hạn chế tiếp x&uacute;c gần hoặc tr&ecirc;u đ&ugrave;a với những trường hợp m&egrave;o dưới đ&acirc;y.</p>
<figure id="attachment_4352" class="wp-caption aligncenter" aria-describedby="caption-attachment-4352"><a href="https://blogchomeo.com/wp-content/uploads/2022/09/gray-cat-biting-owners-hand.jpg"><img class="wp-image-4352 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/09/gray-cat-biting-owners-hand.jpg" alt="bi-meo-can-co-sao-khong-2" width="800" height="412" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-4352" class="wp-caption-text">M&egrave;o cắn c&oacute; thể l&acirc;y virut nguy hiểm</figcaption>
</figure>
<p>&nbsp;</p>
<blockquote>
<p><strong><em>Khi m&egrave;o c&oacute; những dấu hiệu bất thường th&igrave; kh&ocirc;ng n&ecirc;n tr&ecirc;u đ&ugrave;a</em></strong></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNF0=">&nbsp;</div>
</blockquote>
<ul>
<li aria-level="1">M&egrave;o mới mang về nu&ocirc;i nhưng xuất hiện hiện tượng ốm</li>
<li aria-level="1">M&egrave;o đ&atilde; thất lạc l&acirc;u ng&agrave;y trở về nh&agrave;</li>
<li aria-level="1">M&egrave;o đực dưới 3 năm tuổi v&agrave; đang đến m&ugrave;a giao phối</li>
<li aria-level="1">M&egrave;o hoang, m&egrave;o thất lạc</li>
<li aria-level="1">M&egrave;o chưa ti&ecirc;m vacxin ph&ograve;ng ngừa</li>
<li aria-level="1">M&egrave;o xuất hiện những biểu hiện như cắn, c&agrave;o khi tr&ecirc;u chọc, tiết nhiều nước bọt, sủi bọt m&eacute;p, ăn những thứ kh&aacute;c thường như m&oacute;ng ch&acirc;n, gỗ,&hellip;</li>
</ul>
<p>B&ecirc;n tr&ecirc;n l&agrave; một số&nbsp;<strong><a href="https://blogchomeo.com/trieu-chung-bi-cho-dai-can/">dấu hiệu bệnh dại xuất hiện ở ch&oacute; v&agrave; m&egrave;o</a></strong>&nbsp;n&oacute;i chung. Bạn cần ch&uacute; &yacute; đến những điều n&agrave;y để c&oacute; biện ph&aacute;p xử l&yacute; kịp thời.</p>
<h2 id="toc_2"><strong>3. Kh&ocirc;ng n&ecirc;n ăn g&igrave; khi bị m&egrave;o cắn?</strong></h2>
<p>Nếu kh&ocirc;ng may mắn khi bạn bị m&egrave;o c&agrave;o hoặc cắn chảy m&aacute;u trong qu&aacute; tr&igrave;nh vuốt ve hay tr&ecirc;u đ&ugrave;a ch&uacute;ng. Bạn cần hạn chế hoặc tạm dừng ăn c&aacute;c thực phẩm dưới đ&acirc;y nh&eacute;:</p>
<blockquote>
<p><strong><em>Bị m&egrave;o cắn kh&ocirc;ng n&ecirc;n ăn đồ nếp, rau muống, thịt b&ograve;, &hellip; tr&aacute;nh ảnh hưởng tới vết sẹo sau n&agrave;y</em></strong></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNV0=">&nbsp;</div>
</blockquote>
<ul>
<li aria-level="1"><strong>Đồ nếp</strong>: Bởi đ&acirc;y l&agrave; thực phẩm dễ khiến vết thương m&egrave;o cắn bị sưng nhức, g&acirc;y kh&oacute; chịu cho ch&iacute;nh bạn. Do đ&oacute;, n&ecirc;n hạn chế ăn c&aacute;c đồ nếp như x&ocirc;i, b&aacute;nh nếp, &hellip;</li>
<li aria-level="1"><strong>Rau muống</strong>: Từ xa xưa, khi xuất hiện c&aacute;c vết thương hở th&igrave; &ocirc;ng b&agrave; ta đ&atilde; lu&ocirc;n dặn d&ograve; việc kh&ocirc;ng ăn rau muống l&uacute;c n&agrave;y. Bởi trong rau muống c&oacute; chứa c&aacute;c th&agrave;nh phần g&acirc;y kh&oacute; liền vết thương, ảnh hưởng tới thẩm mỹ của vết sẹo sau n&agrave;y.</li>
<li aria-level="1"><strong>Trứng v&agrave; c&aacute;c thực phẩm từ trứng</strong>: Bởi khi ăn trứng, vết sẹo của bạn sẽ h&igrave;nh th&agrave;nh lớp da liền mới với sắc tố s&aacute;ng hơn so với phần da c&ograve;n lại. Ch&iacute;nh v&igrave; vậy, c&oacute; thể g&acirc;y n&ecirc;n những lớp da loang lổ, mất thẩm mỹ.</li>
<li aria-level="1"><strong>Thịt b&ograve;</strong>: Bị m&egrave;o cắn ki&ecirc;ng ăn g&igrave;? H&atilde;y hạn chế ăn thịt b&ograve; bởi đ&acirc;y l&agrave; thực phẩm c&oacute; chứa h&agrave;m lượng đạm cao, cũng như khả năng hạn chế qu&aacute; tr&igrave;nh l&agrave;nh vết thương diễn ra chậm v&agrave; sẹo rối m&agrave;u g&acirc;y mất thẩm mỹ.</li>
</ul>
<p>Ngo&agrave;i những thực phẩm cơ bản n&ecirc;n tr&aacute;nh ra th&igrave; bạn vẫn c&oacute; thể ăn những thực phẩm kh&aacute;c mỗi ng&agrave;y. Đặc biệt l&agrave; n&ecirc;n bổ sung th&ecirc;m nhiều loại rau xanh, tr&aacute;i c&acirc;y để tăng sức đề kh&aacute;ng, th&uacute;c đẩy qu&aacute; tr&igrave;nh hồi phục tốt hơn.</p>
<h2 id="toc_3"><strong>4. Những c&aacute;ch xử l&yacute; vết thương an to&agrave;n cho bạn</strong></h2>
<p>C&acirc;u trả lời cho c&acirc;u hỏi &ldquo;m&egrave;o cắn c&oacute; sao kh&ocirc;ng?&rdquo; l&agrave; bạn cần xử l&yacute; gấp vết thương v&agrave; thực hiện một số kh&acirc;u xử l&yacute; an to&agrave;n kh&aacute;c để bảo vệ sức khỏe cho bạn ngay l&uacute;c n&agrave;y.</p>
<h3 id="toc_4"><strong>4.1. Xử l&yacute; nhanh vết thương tại nh&agrave;</strong></h3>
<p>Khi bị m&egrave;o cắn chảy m&aacute;u hoặc vết thương s&acirc;u do m&egrave;o c&agrave;o, việc đầu ti&ecirc;n phải l&agrave;m l&agrave; bạn cần nhanh ch&oacute;ng rửa sạch vết thương với x&agrave; ph&ograve;ng v&agrave; nước sạch.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsNl0=">&nbsp;</div>
<ul>
<li><strong>Bước 1</strong>: Nếu vết thương chảy m&aacute;u th&igrave; bạn vẫn n&ecirc;n rửa vết thương dưới v&ograve;i nước sạch v&agrave; để m&aacute;u chảy, tạm thời chưa n&ecirc;n cầm m&aacute;u.</li>
<li><strong>Bước 2</strong>: bạn n&ecirc;n sử dụng dung dịch s&aacute;t khuẩn hoặc b&ocirc;i thuốc khử tr&ugrave;ng l&ecirc;n vết thương. Điều n&agrave;y gi&uacute;p tiệt tr&ugrave;ng vết thương, hạn chế vi khuẩn.</li>
<li><strong>Bước 3</strong>: sử dụng miếng vải sạch hoặc bằng c&aacute; nh&acirc;n để băng hờ vết thương tr&aacute;nh trầy xước th&ecirc;m v&agrave; gi&uacute;p vết thương mau l&agrave;nh.</li>
</ul>
<blockquote>
<p><strong><em>BỊ m&egrave;o cắn c&oacute; sao kh&ocirc;ng? N&ecirc;n vệ sinh v&agrave; xử l&yacute; vết thương nhanh ch&oacute;ng dưới v&ograve;i nước chảy</em></strong></p>
</blockquote>
<h3 id="toc_5"><strong>4.2. Thực hiện ti&ecirc;m ph&ograve;ng dại v&agrave; uốn v&aacute;n tại cơ sở y tế</strong></h3>
<p>Bị m&egrave;o cắn bao l&acirc;u th&igrave; ch&iacute;ch ngừa? Bạn n&ecirc;n đến cơ sở y tế trong thời gian sớm nhất. Tại đ&acirc;y c&aacute;c b&aacute;c sĩ chuy&ecirc;n m&ocirc;n sẽ tư vấn v&agrave; hướng dẫn bạn thực hiện ti&ecirc;m ph&ograve;ng dại an to&agrave;n nhất.</p>
<p>Thời gian để thực hiện ti&ecirc;m ph&ograve;ng cần được thực hiện c&agrave;ng sớm c&agrave;ng tốt, bạn n&ecirc;n gặp b&aacute;c sĩ sau khi bị m&egrave;o cắn trong v&ograve;ng trước 24h.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsN10=">&nbsp;</div>
<blockquote>
<p><strong><em>Thực hiện ti&ecirc;m ph&ograve;ng uốn v&aacute;n để bảo vệ sức khỏe kịp thời</em></strong></p>
</blockquote>
<h3 id="toc_6"><strong>4.3. Theo d&otilde;i th&uacute; cưng của bạn trong những ng&agrave;y tiếp theo</strong></h3>
<p>Để c&oacute; được c&acirc;u trả lời ch&iacute;nh x&aacute;c nhất về m&egrave;o cắn c&oacute; sao kh&ocirc;ng?. Bạn cần theo d&otilde;i v&agrave;&nbsp;chăm s&oacute;c th&uacute; cưng&nbsp;của m&igrave;nh trong v&ograve;ng 14 ng&agrave;y sau đ&oacute;. Với những biểu hiện kh&aacute;c thường như hung dữ, bỏ ăn, chảy nước d&atilde;i, nuốt kh&oacute; v&agrave; thậm ch&iacute; l&agrave; chết trong v&ograve;ng 7 -10 ng&agrave;y.</p>
<p>L&uacute;c n&agrave;y bạn cần phải thường xuy&ecirc;n tới cơ sở y tế để được tư vấn v&agrave; thực hiện c&aacute;c mũi ti&ecirc;m ph&ograve;ng tiếp theo trong v&ograve;ng 1 th&aacute;ng.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsOF0=">&nbsp;</div>
<h2 id="toc_7"><strong>5. C&aacute;ch khắc phục v&agrave; hạn chế bị m&egrave;o cắn hiệu quả</strong></h2>
<blockquote>
<p>Theo<a href="https://www.wikihow.vn/Ng%C4%83n-m%C3%A8o-c%E1%BA%AFn-v%C3%A0-c%C3%A0o">&nbsp;WikiHow</a>: &rdquo; Ch&uacute;ng kh&ocirc;ng c&agrave;o hoặc cắn v&agrave; thường sẽ cố hết sức để tr&aacute;nh khỏi những t&igrave;nh huống nguy hiểm. Nhưng cũng c&oacute; l&uacute;c bỗng nhi&ecirc;n ch&uacute; m&egrave;o cưng của bạn tấn c&ocirc;ng khiến chủ của m&igrave;nh bị thương. Ngo&agrave;i cảm gi&aacute;c đau đớn, vết m&egrave;o c&agrave;o hoặc cắn c&oacute; thể bị nhiễm tr&ugrave;ng, do đ&oacute; tốt nhất l&agrave; bạn đừng để t&igrave;nh huống n&agrave;y xảy ra.&rdquo;</p>
</blockquote>
<figure id="attachment_4353" class="wp-caption aligncenter" aria-describedby="caption-attachment-4353"><a href="https://blogchomeo.com/wp-content/uploads/2022/09/not-to-bite.jpg"><img class="wp-image-4353 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/09/not-to-bite.jpg" alt="bi-meo-can-co-sao-khong-3" width="800" height="400" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-4353" class="wp-caption-text">Huấn luyện để tr&aacute;nh việc m&egrave;o cắn</figcaption>
</figure>
<p>M&egrave;o cắn c&oacute; sao kh&ocirc;ng? Việc cắn hay c&agrave;o l&agrave; một bản năng cơ bản của lo&agrave;i m&egrave;o, ch&uacute;ng được dạy ngay từ khi sinh ra đời. V&agrave; tất nhi&ecirc;n l&agrave; ch&uacute;ng kh&ocirc;ng hề biết răng hay m&oacute;ng vuốt của m&igrave;nh lại ảnh hưởng tới những người xung quanh.</p>
<p>Do đ&oacute;, để khắc phục v&agrave; hạn chế bị m&egrave;o cắn hiệu quả th&igrave; ngay b&acirc;y giờ h&atilde;y đ&agrave;o tạo th&uacute; cưng của bạn. Việc được &ldquo;gi&aacute;o dục&rdquo; tốt sẽ gi&uacute;p th&uacute; cưng biết được c&aacute;c quy tắc ri&ecirc;ng v&agrave; c&oacute; thể th&acirc;n thiện với mọi người trong gia đ&igrave;nh.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsOV0=">&nbsp;</div>
<h3 id="toc_8"><strong>5.1. Kh&ocirc;ng bao giờ chơi với m&egrave;o bằng tay của bạn</strong></h3>
<p>Điều đầu ti&ecirc;n trong việc hạn chế bị m&egrave;o cắn v&agrave; thực hiện huấn luyện th&uacute; cưng của bạn trở n&ecirc;n &ldquo;hiền l&agrave;nh&rdquo; hơn ch&iacute;nh l&agrave; kh&ocirc;ng bao giờ chơi với th&uacute; cưng bằng tay, b&agrave;n tay, ng&oacute;n tay, ng&oacute;n ch&acirc;n của m&igrave;nh.</p>
<p>Bạn n&ecirc;n dạy th&uacute; cưng của m&igrave;nh biết rằng tay kh&ocirc;ng phải đồ chơi. Việc thường xuy&ecirc;n tr&ecirc;u đ&ugrave;a m&egrave;o cưng của bạn bằng ng&oacute;n tay hay ng&oacute;n ch&acirc;n, điều n&agrave;y sẽ khuyến kh&iacute;ch m&egrave;o c&agrave;o v&agrave; cắn một c&aacute;ch kh&ocirc;ng kiểm so&aacute;t.</p>
<p>Bạn cũng n&ecirc;n dạy c&aacute;c b&eacute; m&egrave;o một số b&agrave;i&nbsp;<strong><a href="https://blogchomeo.com/lam-the-nao-de-meo-quan-chu/">huấn luyện nhằm gi&uacute;p m&egrave;o của c&aacute;c bạn nghe lời v&agrave; ngoan ngo&atilde;n v&agrave; quấn chủ hơn.</a></strong></p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTBd">&nbsp;</div>
<blockquote>
<p><strong><em>Kh&ocirc;ng n&ecirc;n chơi hay tr&ecirc;u đ&ugrave;a th&uacute; cưng bằng ng&oacute;n tay, ng&oacute;n ch&acirc;n của m&igrave;nh</em></strong></p>
</blockquote>
<h3 id="toc_9"><strong>5.2. Cung cấp đồ chơi ri&ecirc;ng cho m&egrave;o tương t&aacute;c</strong></h3>
<p>Thay v&igrave; sử dụng ch&iacute;nh ng&oacute;n tay, ng&oacute;n ch&acirc;n của m&igrave;nh để tr&ecirc;u đ&ugrave;a với Pets, bạn h&atilde;y mua cho ch&uacute;ng những m&oacute;n đồ chơi ri&ecirc;ng. Hiện nay tr&ecirc;n thị trường b&aacute;n kh&aacute; nhiều mẫu đồ chơi bắt mắt, đảm bảo th&uacute; cưng sẽ rất th&iacute;ch th&uacute;.</p>
<p>Đồ chơi kh&ocirc;ng chỉ gi&uacute;p m&egrave;o luyện tập th&ecirc;m được bản năng bắt chuột nhanh nhạy, m&agrave; c&ograve;n mang lại sự an to&agrave;n cho ch&iacute;nh bạn nữa đ&oacute;.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMTFd">&nbsp;</div>
<blockquote>
<p><strong><em>N&ecirc;n mua cho th&uacute; cưng đồ chơi chuy&ecirc;n biệt để tr&aacute;nh bị m&egrave;o cắn, c&agrave;o</em></strong></p>
</blockquote>
<h2>6. Kết luận</h2>
<figure id="attachment_4355" class="wp-caption aligncenter" aria-describedby="caption-attachment-4355"><a href="https://blogchomeo.com/wp-content/uploads/2022/09/244170-2121x1414-Scottish-fold-biting.jpg"><img class="wp-image-4355 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2022/09/244170-2121x1414-Scottish-fold-biting.jpg" alt="bi-meo-can-co-sao-khong-4" width="800" height="533" data-ll-status="loaded"></a>
<figcaption id="caption-attachment-4355" class="wp-caption-text">Hạn chế nguy cơ bị m&egrave;o cắn nha bạn</figcaption>
</figure>
<p>Tr&ecirc;n đ&acirc;y l&agrave; một số kinh nghiệm blog ch&oacute; m&egrave;o tổng hợp được về c&aacute;ch xử l&yacute; khi bị m&egrave;o cắn. Hy vọng ch&uacute;ng t&ocirc;i đ&atilde; cung cấp được kiến thức cần thiết cho bạn đọc. Xin ch&uacute;c bạn đọc những giờ ph&uacute;t đọc b&agrave;i thoải m&aacute;i v&agrave; thứ gi&atilde;n.</p>', N'Bị mèo cắn có sao không, cần xử lý như thế nào khi bị mèo cắn', N'Bị mèo cắn có sao không, cần xử lý như thế nào khi bị mèo cắn', N'Mèo vẫn luôn là động vật được yêu thích trong các dòng thú cưng ngày nay. Và tất nhiên, dù thế nào đi chăng nữa thì chúng vẫn là một động vật có bản năng phòng thủ cao với những chiếc răng và móng sắc nhọn khi chúng sợ hãi. Vậy nếu vô tình bạn bị mèo cắn có sao không? Lúc này bạn nên làm gì? Kiêng ăn gì và xử lý như thế nào để an toàn cho cả Pets và chính bạn. Blog chó mèo có ở đây để giúp bạn giải thích điều này.  Bị mèo cắn có sao không? Nên kiêng ăn gì và xử lý như thế nào?', N'/img/Blog/15687244170-2121x1414-Scottish-fold-biting.jpg', CAST(N'2023-11-09' AS Date), 1, 1)
INSERT [dbo].[Blogs] ([BlogID], [Content], [Heading], [PageTile], [Description], [ImageURL], [PublisheDate], [Status], [TagID]) VALUES (7, N'<h2>1. Phối giống ch&oacute; &ndash; 7 bước theo quy tr&igrave;nh chuy&ecirc;n nghiệp của hiệp hội AKC quốc tế</h2>
<figure id="attachment_6826" class="wp-caption aligncenter" aria-describedby="caption-attachment-6826"><img class="wp-image-6826 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/02/istockphoto-636519830-612x612-1.jpg" alt="cho-phoi-giong-1" width="800" height="533" data-ll-status="loaded">
<figcaption id="caption-attachment-6826" class="wp-caption-text">Cho ch&oacute; phối giống l&agrave; một qu&aacute; tr&igrave;nh kh&aacute; k&igrave; c&ocirc;ng với những nh&agrave; nh&acirc;n giống</figcaption>
</figure>
<div id="__next">
<div class="overflow-hidden w-full h-full relative">
<div class="flex h-full flex-1 flex-col md:pl-[260px]">
<div class="flex-1 overflow-hidden">
<div class="react-scroll-to-bottom--css-bgfru-79elbk h-full dark:bg-gray-800">
<div class="react-scroll-to-bottom--css-bgfru-1n7m0yu">
<div class="flex flex-col items-center text-sm dark:bg-gray-800">
<div class="w-full border-b border-black/10 dark:border-gray-900/50 text-gray-800 dark:text-gray-100 group bg-gray-50 dark:bg-[#444654]">
<div class="text-base gap-4 md:gap-6 m-auto md:max-w-2xl lg:max-w-2xl xl:max-w-3xl p-4 md:py-6 flex lg:px-0">
<div class="relative flex w-[calc(100%-50px)] flex-col gap-1 md:gap-3 lg:w-[calc(100%-115px)]">
<div class="flex flex-grow flex-col gap-3">
<div class="min-h-[20px] flex flex-col items-start gap-4 whitespace-pre-wrap">
<div class="markdown prose w-full break-words dark:prose-invert light">
<p><strong><a href="https://www.akc.org/">American Kennel Club (AKC)</a></strong>&nbsp;đưa ra c&aacute;c hướng dẫn về việc nh&acirc;n giống ch&oacute; c&oacute; tr&aacute;ch nhiệm, bao gồm c&aacute;c bước sau:</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMV0=">&nbsp;</div>
<ol>
<li><strong>Chọn ch&oacute; giống:</strong>&nbsp;Chọn một con ch&oacute; đực v&agrave; c&aacute;i c&oacute; những đặc điểm mong muốn v&agrave; kh&ocirc;ng c&oacute; vấn đề về sức khỏe di truyền. Những con ch&oacute; cũng phải đ&aacute;p ứng c&aacute;c ti&ecirc;u chuẩn giống AKC.</li>
<li><strong>Kiểm tra sức khỏe:</strong>&nbsp;Y&ecirc;u cầu ch&oacute; giống trải qua c&aacute;c cuộc kiểm tra sức khỏe như đ&aacute;nh gi&aacute; chứng loạn sản xương h&ocirc;ng, kiểm tra mắt v&agrave; x&eacute;t nghiệm di truyền để đảm bảo ch&uacute;ng khỏe mạnh v&agrave; kh&ocirc;ng mắc c&aacute;c bệnh di truyền. AKC cung cấp một danh s&aacute;ch kiểm tra sức khỏe được khuyến nghị cho c&aacute;c giống ch&oacute; kh&aacute;c nhau.</li>
<li><strong>X&aacute;c định thời điểm phối giống ph&ugrave; hợp</strong>: Cần hiểu chu kỳ kinh nguyệt của ch&oacute; c&aacute;i v&agrave; x&aacute;c định thời điểm phối giống ph&ugrave; hợp. Th&ocirc;ng qua&nbsp;<strong><a href="https://blogchomeo.com/cho-salo-la-gi-dau-hieu-nhan-biet-cho-salo/">dấu hiệu nhận biết ch&oacute; salo</a></strong>&nbsp;m&agrave; ch&uacute;ng ta c&oacute; thể x&aacute;c định được những điều n&agrave;y tương đối ch&iacute;nh x&aacute;c.</li>
<li><strong>Chuẩn bị v&agrave; giao phối:</strong>&nbsp;Ch&oacute; c&aacute;i thường được chuẩn bị cho giao phối bằng c&aacute;ch cung cấp một m&ocirc;i trường thoải m&aacute;i v&agrave; kh&ocirc;ng căng thẳng. Con ch&oacute; đực sau đ&oacute; được giới thiệu với con c&aacute;i v&agrave; việc giao phối được ph&eacute;p diễn ra tự nhi&ecirc;n.</li>
<li><strong>X&aacute;c nhận mang thai:</strong>&nbsp;Sau khi giao phối, việc mang thai của ch&oacute; c&aacute;i c&oacute; thể được x&aacute;c nhận th&ocirc;ng qua x&eacute;t nghiệm m&aacute;u hoặc si&ecirc;u &acirc;m.</li>
<li><strong>Đẻ con v&agrave; nu&ocirc;i dạy ch&oacute; con:</strong>&nbsp;Ch&oacute; c&aacute;i sẽ sinh ra những ch&uacute; ch&oacute; con v&agrave; người chăn nu&ocirc;i c&oacute; tr&aacute;ch nhiệm chăm s&oacute;c chu đ&aacute;o cho cả ch&oacute; mẹ v&agrave; ch&oacute; con. AKC khuyến nghị rằng ch&oacute; con n&ecirc;n được giao tiếp x&atilde; hội v&agrave; tiếp x&uacute;c với nhiều h&igrave;nh ảnh, &acirc;m thanh v&agrave; trải nghiệm kh&aacute;c nhau.</li>
<li><strong>B&agrave;n giao ch&oacute; con:</strong>&nbsp;Sau khi ch&oacute; con đủ lớn, ch&uacute;ng c&oacute; thể được đặt với những người chủ mới đ&atilde; được s&agrave;ng lọc kỹ lưỡng v&agrave; ph&ugrave; hợp với ch&oacute; con. AKC khuyến nghị c&aacute;c nh&agrave; lai tạo n&ecirc;n cung cấp hợp đồng bằng văn bản v&agrave; đảm bảo sức khỏe cho từng người mua ch&oacute; con.</li>
</ol>
<p>Điều quan trọng cần lưu &yacute; l&agrave; việc phối giống ch&oacute; c&oacute; tr&aacute;ch nhiệm đ&ograve;i hỏi nhiều kiến ​​thức, nguồn lực v&agrave; cam kết, đồng thời cần t&igrave;m kiếm sự hướng dẫn của những cơ sở g&acirc;y giống v&agrave; b&aacute;c sĩ th&uacute; y c&oacute; kinh nghiệm. Trong qu&aacute; tr&igrave;nh mang thai, cần nhận biết&nbsp;<strong><a href="https://blogchomeo.com/lam-the-nao-de-biet-cho-mang-thai/">dấu hiệu ch&oacute; mang thai</a></strong>,<strong><a href="https://blogchomeo.com/dau-hieu-cho-sap-de-va-nhung-luu-y-quan-trong/">&nbsp;dấu hiệu ch&oacute; sắp đẻ</a>,&nbsp;<a href="https://blogchomeo.com/cho-kho-de/">dấu hiệu ch&oacute; kh&oacute; để</a></strong>&nbsp;hoặc&nbsp;<a href="https://blogchomeo.com/dau-hieu-cho-say-thai-can-biet/"><strong>dấu hiệu ch&oacute; xảy thai</strong></a><strong><a href="https://blogchomeo.com/nuoi-cho-de/">&nbsp;</a></strong>để kịp thời xử l&yacute;. T&igrave;m hiểu về&nbsp;<strong><a href="https://blogchomeo.com/nuoi-cho-de/">c&aacute;ch nu&ocirc;i ch&oacute; đẻ</a>&nbsp;</strong>cũng l&agrave; điều n&ecirc;n l&agrave;m trong thời gian n&agrave;y.</p>
<figure id="attachment_6824" class="wp-caption aligncenter" aria-describedby="caption-attachment-6824"><img class="size-full wp-image-6824 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/02/800px-French_Bulldog_with_puppies.jpg" alt="cho-phoi-giong-3" width="800" height="545" data-ll-status="loaded">
<figcaption id="caption-attachment-6824" class="wp-caption-text">Chăm s&oacute;c ch&oacute; đẻ l&agrave; một trong những bước quan trọng của qu&aacute; tr&igrave;nh phối giống ch&oacute;</figcaption>
</figure>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<h2>2. 7 nguy&ecirc;n tắc di truyền trong phối giống ch&oacute;</h2>
<figure id="attachment_6828" class="wp-caption aligncenter" aria-describedby="caption-attachment-6828"><img class="wp-image-6828 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/02/why_do_dogs_get_stuck_when_mating_2432_600_square.jpg" sizes="(max-width: 800px) 100vw, 800px" srcset="https://blogchomeo.com/wp-content/uploads/2023/02/why_do_dogs_get_stuck_when_mating_2432_600_square.jpg 600w, https://blogchomeo.com/wp-content/uploads/2023/02/why_do_dogs_get_stuck_when_mating_2432_600_square-150x150.jpg 150w" alt="cho-phoi-giong-2" width="800" height="800" data-ll-status="loaded">
<figcaption id="caption-attachment-6828" class="wp-caption-text">Đảm bảo c&aacute;c nguy&ecirc;n tắc trong phối giống ch&oacute; gi&uacute;p ch&uacute;ng giữ được nguồn gen thuần chủng tốt</figcaption>
</figure>
<p>Ngo&agrave;i việc hiểu c&aacute;c bước li&ecirc;n quan đến phối giống ch&oacute;, điều quan trọng l&agrave; phải hiểu c&aacute;c nguy&ecirc;n tắc di truyền đằng sau việc phối giống.</p>
<ol>
<li><strong>Chọn giống ch&oacute; ph&ugrave; hợp:</strong>&nbsp;Chọn giống ch&oacute; c&oacute; t&iacute;nh c&aacute;ch, kỹ năng v&agrave; sức khỏe ph&ugrave; hợp với mục đ&iacute;ch sử dụng của bạn.</li>
<li><strong>Xem x&eacute;t sức khỏe:</strong>&nbsp;Chọn giống ch&oacute; c&oacute; sức khỏe tốt v&agrave; được kiểm so&aacute;t bệnh tật.</li>
<li><strong>Xem x&eacute;t nguồn gốc:</strong>&nbsp;Chọn giống ch&oacute; c&oacute; nguồn gốc r&otilde; r&agrave;ng v&agrave; được x&aacute;c nhận bởi c&aacute;c tổ chức chuy&ecirc;n ng&agrave;nh.</li>
<li><strong>Kiểm tra n&ograve;i ch&oacute;:</strong>&nbsp;Xem x&eacute;t gia đ&igrave;nh của giống ch&oacute; v&agrave; c&aacute;c t&iacute;nh c&aacute;ch của cha mẹ v&agrave; c&aacute;c c&aacute; thể kh&aacute;c của giống.</li>
<li><strong>Xem x&eacute;t tuổi</strong>: Chọn giống ch&oacute; trong khoảng tuổi ph&ugrave; hợp để phối giống.</li>
<li><strong>Hạn chế sử dụng giống ch&oacute; c&oacute; t&iacute;nh c&aacute;ch xấu:</strong>&nbsp;Tr&aacute;nh phối giống với ch&oacute; c&oacute; t&iacute;nh c&aacute;ch xấu hoặc dễ g&acirc;y rối loạn.</li>
<li><strong>Sử dụng kỹ thuật phối giống ch&iacute;nh x&aacute;c:</strong>&nbsp;Sử dụng kỹ thuật phối giống ch&iacute;nh x&aacute;c để đảm bảo t&iacute;nh di truyền tốt nhất.</li>
</ol>
<p>C&aacute;c bước n&agrave;y n&ecirc;n được kiểm so&aacute;t nghi&ecirc;m ngặt nhằm tr&aacute;nh&nbsp;<strong><a href="https://blogchomeo.com/giao-phoi-can-huyet-o-cho-meo/">t&igrave;nh trạng giao phối cận huyết c&oacute; thể xảy ra ở ch&oacute; m&egrave;o</a></strong>. Điều n&agrave;y c&oacute; thể để lại nhiều hệ quả nghiệm trọng trong qu&aacute; tr&igrave;nh nh&acirc;n giống.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsMl0=">&nbsp;</div>
<h2>3. 5 b&agrave;i kiểm tra sức khỏe v&agrave; x&eacute;t nghiệm di truyền trong phối giống ch&oacute;</h2>
<figure id="attachment_6827" class="wp-caption aligncenter" aria-describedby="caption-attachment-6827"><img class="wp-image-6827 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/02/pomeranian-dog-mating.jpg" alt="cho-phoi-giong-4" width="800" height="450" data-ll-status="loaded">
<figcaption id="caption-attachment-6827" class="wp-caption-text">C&aacute;c b&agrave;i kiểm tra sức khỏe v&agrave; nguồn gen di truyền gi&uacute;p nhận định nguồn gen thuần trong phối giống ch&oacute;</figcaption>
</figure>
<p>Để đảm bảo sức khỏe của ch&oacute; giống v&agrave; ch&oacute; con của ch&uacute;ng, điều quan trọng l&agrave; phải tiến h&agrave;nh kiểm tra sức khỏe thường xuy&ecirc;n v&agrave; x&eacute;t nghiệm di truyền.</p>
<ol>
<li><strong>Thăm kh&aacute;m chuy&ecirc;n s&acirc;u:</strong>&nbsp;H&atilde;y đến với chuy&ecirc;n gia vật nu&ocirc;i hoặc b&aacute;c sĩ th&uacute; y để kiểm tra sức khỏe của giống ch&oacute;.</li>
<li><strong>X&eacute;t nghiệm bệnh tật:</strong>&nbsp;Y&ecirc;u cầu giống ch&oacute; được kiểm tra cho c&aacute;c bệnh đặc trưng.</li>
<li><strong>X&eacute;t nghiệm gen:</strong>&nbsp;Y&ecirc;u cầu x&eacute;t nghiệm gen để x&aacute;c định c&aacute;c gốc giống v&agrave; t&igrave;nh trạng di truyền của giống ch&oacute;.</li>
<li><strong>Xem x&eacute;t t&igrave;nh trạng sức khỏe của cha mẹ:</strong>&nbsp;Xem x&eacute;t sức khỏe của cha mẹ v&agrave; t&igrave;nh trạng di truyền của họ để đảm bảo rằng giống ch&oacute; được di truyền một c&aacute;ch tốt nhất.</li>
<li><strong>Xem x&eacute;t lịch sử gia đ&igrave;nh:</strong>&nbsp;Xem x&eacute;t lịch sử gia đ&igrave;nh của giống ch&oacute; để đảm bảo rằng kh&ocirc;ng c&oacute; bất kỳ t&igrave;nh trạng di truyền nguy hiểm n&agrave;o.</li>
</ol>
<h2>4. Thiết bị v&agrave; vật tư cần thiết cho phối giống ch&oacute;</h2>
<p>Khi phối giống ch&oacute;, điều quan trọng l&agrave; phải c&oacute; sẵn thiết bị v&agrave; vật tư ph&ugrave; hợp. Điều n&agrave;y c&oacute; thể bao gồm hộp đẻ, đồ cho con b&uacute; v&agrave; c&aacute;c vật dụng kh&aacute;c để gi&uacute;p đảm bảo sức khỏe cho ch&oacute; con.</p>
<ol>
<li><strong>Khu vực phối giống ch&oacute;:</strong>&nbsp;Cần c&oacute; một khu vực y&ecirc;n tĩnh, ri&ecirc;ng tư v&agrave; dễ d&agrave;ng quản l&yacute; để phối giống ch&oacute;.</li>
<li><strong>Nh&agrave; kho</strong>: Cần c&oacute; một nh&agrave; kho để lưu trữ vật tư v&agrave; thiết bị li&ecirc;n quan đến việc phối giống ch&oacute;.</li>
<li><strong>Bảng đ&aacute;nh gi&aacute; sức khỏe:</strong>&nbsp;Cần c&oacute; một bảng đ&aacute;nh gi&aacute; sức khỏe để đ&aacute;nh gi&aacute; t&igrave;nh trạng sức khỏe của giống ch&oacute;.</li>
<li><strong>Thiết bị đo nhiệt độ:</strong>&nbsp;Cần c&oacute; một thiết bị đo nhiệt độ để đo nhiệt độ của khu vực phối giống ch&oacute;.</li>
<li><strong>Thiết bị chăm s&oacute;c sức khỏe:</strong>&nbsp;Cần c&oacute; một số thiết bị chăm s&oacute;c sức khỏe như m&aacute;y x&eacute;t nghiệm bệnh tật, m&aacute;y chẩn đo&aacute;n v&agrave; thiết bị chữa bệnh, m&aacute;y sưởi, m&aacute;y thở,&hellip;</li>
<li><strong>Phụ kiện:</strong>&nbsp;Cần c&oacute; một số phụ kiện như thức ăn, nước uống, giường ngủ v&agrave; c&aacute;c phụ kiện kh&aacute;c để đảm bảo sức khỏe tốt nhất cho giống ch&oacute;.</li>
</ol>
<figure id="attachment_6829" class="wp-caption aligncenter" aria-describedby="caption-attachment-6829"><img class="wp-image-6829 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/02/istockphoto-946759070-640x640-1.jpg" alt="cho-phoi-giong-6" width="800" height="450" data-ll-status="loaded">
<figcaption id="caption-attachment-6829" class="wp-caption-text">Qu&aacute; tr&igrave;nh phối giống cần nhiều dụng cụ hỗ trợ để gi&uacute;p việc nh&acirc;n giống đạt hiệu quả cao</figcaption>
</figure>
<h2>5. C&acirc;n nhắc đạo đức v&agrave; nh&acirc;n đạo trong phối giống ch&oacute;</h2>
<figure id="attachment_6825" class="wp-caption aligncenter" aria-describedby="caption-attachment-6825"><img class="wp-image-6825 lazyloaded" src="https://blogchomeo.com/wp-content/uploads/2023/02/320799-1600x1066-loving-chihuahua-dogs.jpg" alt="cho-phoi-giong-5" width="800" height="533" data-ll-status="loaded">
<figcaption id="caption-attachment-6825" class="wp-caption-text">Nếu bạn l&agrave; một nh&agrave; lai tạo c&oacute; đạo đức, n&ecirc;n quan t&acirc;m đến sức khỏe của những ch&uacute; ch&oacute; trong qu&aacute; tr&igrave;nh nh&acirc;n giống</figcaption>
</figure>
<p>Cuối c&ugrave;ng, điều quan trọng l&agrave; phải xem x&eacute;t c&aacute;c c&acirc;n nhắc về đạo đức v&agrave; nh&acirc;n đạo li&ecirc;n quan đến việc nh&acirc;n giống ch&oacute;.</p>
<div class="code-block code-block-1" data-ai="WzEsMCwiQmxvY2sgMSIsIiIsM10=">&nbsp;</div>
<blockquote>
<p><strong>Điều n&agrave;y bao gồm:</strong></p>
<ul>
<li>Ch&oacute; được đối xử y&ecirc;u thương</li>
<li>Cung cấp dịch vụ chăm s&oacute;c ph&ugrave; hợp cho ch&oacute; con</li>
<li>Tr&aacute;nh mọi hoạt động chăn nu&ocirc;i v&agrave; &eacute;p đẻ c&oacute; thể g&acirc;y hại cho ch&oacute; hoặc ảnh hưởng đến chất lượng cuộc sống của ch&uacute;ng.</li>
</ul>
</blockquote>
<h2>6. Kết luận</h2>
<p>Phối giống ch&oacute; l&agrave; một qu&aacute; tr&igrave;nh phức tạp v&agrave; l&acirc;u d&agrave;i, nhưng điều quan trọng l&agrave; phải tiếp cận n&oacute; một c&aacute;ch cẩn thận v&agrave; chuy&ecirc;n nghiệp để đảm bảo sức khỏe v&agrave; hạnh ph&uacute;c của những ch&uacute; ch&oacute; tham gia. Bằng c&aacute;ch l&agrave;m theo c&aacute;c hướng dẫn n&agrave;y v&agrave; t&igrave;m kiếm sự hỗ trợ v&agrave; hướng dẫn từ c&aacute;c tổ chức v&agrave; nh&agrave; lai tạo c&oacute; uy t&iacute;n, bạn c&oacute; thể thực hiện phối giống ch&oacute; của m&igrave;nh tốt nhất. Trau dồi cho bản th&acirc;n những&nbsp;<strong><a href="https://blogchomeo.com/kinh-nghiem-phoi-giong-cho-cho/">kinh nghiệm phối giống cho ch&oacute;</a></strong>&nbsp;trong qu&aacute; tr&igrave;nh nu&ocirc;i c&oacute; thể gi&uacute;p &iacute;ch cho bạn rất nhiều.</p>
<p>Theo d&otilde;i&nbsp;<strong><a href="https://blogchomeo.com/">Blog ch&oacute; m&egrave;o</a></strong> để cập nhật th&ecirc;m những th&ocirc;ng tin chất lượng về th&uacute; cưng v&agrave; động vật n&oacute;i chung.</p>', N'7 bước phối giống chó theo quy trình chuẩn của hiệp hội AKC', N'7 bước phối giống chó theo quy trình chuẩn của hiệp hội AKC', N' CÁCH NUÔI / CHÓ / TIN TỨC 7 bước phối giống chó theo quy trình chuẩn của hiệp hội AKC 9 Tháng Hai, 2023 - by Bình Pug 5/5 - (8 bình chọn) Nếu bạn đang cân nhắc việc phối giống chó, điều quan trọng là phải hiểu quy trình và những thông tin liên quan. Cho dù bạn là một nhà phối giống tạo dày dạn kinh nghiệm hay mới bắt đầu, điều cần thiết là nên tiếp cận việc phối giống một cách cẩn thận và chuyên nghiệp để đảm bảo sức khỏe và tinh thần của những chú chó. Việc này cũng nhằm giữ được độ tinh khiết trong nguồn gen của các giống chó thuần chủng. Những giống chó khác nhau thì có nguồn gen và kiểu hình khác nhau, việc phối giống sẽ giúp chó giữ được các tiêu chuẩn này.  Trong bài đăng trên blog này, chúng ta sẽ xem xét kỹ hơn các thông tin quan trọng liên quan đến việc phối giống chó.', N'/img/Blog/73540320799-1600x1066-loving-chihuahua-dogs.jpg', CAST(N'2023-11-09' AS Date), 1, 2)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
INSERT [dbo].[BookingRoomDetail] ([RoomID], [OrderID], [Price], [Note], [StartDate], [EndDate], [FeedbackStatus], [TotalPrice]) VALUES (10, 292, 55000, NULL, CAST(N'2023-12-17T12:00:00.000' AS DateTime), CAST(N'2023-12-17T15:00:00.000' AS DateTime), 1, 179000)
INSERT [dbo].[BookingRoomDetail] ([RoomID], [OrderID], [Price], [Note], [StartDate], [EndDate], [FeedbackStatus], [TotalPrice]) VALUES (10, 305, 55000, NULL, CAST(N'2023-12-20T17:00:00.000' AS DateTime), CAST(N'2023-12-21T17:00:00.000' AS DateTime), NULL, 1328000)
INSERT [dbo].[BookingRoomDetail] ([RoomID], [OrderID], [Price], [Note], [StartDate], [EndDate], [FeedbackStatus], [TotalPrice]) VALUES (10, 306, 55000, NULL, CAST(N'2023-12-19T17:00:00.000' AS DateTime), CAST(N'2023-12-21T17:00:00.000' AS DateTime), NULL, 2648000)
GO
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (292, 10, 6, 2000)
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (292, 10, 10, 2000)
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (292, 10, 14, 10000)
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (305, 10, 7, 3000)
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (305, 10, 11, 5000)
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (306, 10, 7, 3000)
INSERT [dbo].[BookingRoomServices] ([OrderID], [RoomID], [ServiceID], [PriceService]) VALUES (306, 10, 11, 5000)
GO
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (6, 290, 2000, 8, 102000, NULL, 1, CAST(N'2023-12-17T12:00:00.000' AS DateTime), CAST(N'2023-12-17T13:30:00.000' AS DateTime), 1, 1, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (6, 294, 2000, 11, 102000, NULL, 1, CAST(N'2023-12-18T12:00:00.000' AS DateTime), CAST(N'2023-12-18T13:30:00.000' AS DateTime), NULL, NULL, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (6, 299, 2000, 8, 102000, NULL, 3, CAST(N'2023-12-17T16:00:00.000' AS DateTime), CAST(N'2023-12-17T17:30:00.000' AS DateTime), 1, 1, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (14, 297, 10000, 11, 110000, NULL, 1, CAST(N'2023-12-20T12:00:00.000' AS DateTime), CAST(N'2023-12-20T13:30:00.000' AS DateTime), 1, 1, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (15, 295, 5000, 12, 155000, NULL, 1, CAST(N'2023-12-19T12:00:00.000' AS DateTime), CAST(N'2023-12-19T13:00:00.000' AS DateTime), 1, 1, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (15, 296, 5000, 12, 105000, NULL, 1, CAST(N'2023-12-21T12:00:00.000' AS DateTime), CAST(N'2023-12-21T13:00:00.000' AS DateTime), NULL, 1, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (15, 300, 5000, 11, 105000, NULL, 1, CAST(N'2023-12-19T12:00:00.000' AS DateTime), CAST(N'2023-12-19T13:00:00.000' AS DateTime), NULL, NULL, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (15, 301, 5000, 12, 105000, NULL, 1, CAST(N'2023-12-20T12:00:00.000' AS DateTime), CAST(N'2023-12-20T13:00:00.000' AS DateTime), NULL, NULL, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (15, 302, 5000, 12, 105000, NULL, NULL, CAST(N'2023-12-20T12:00:00.000' AS DateTime), CAST(N'2023-12-20T13:00:00.000' AS DateTime), NULL, NULL, N'Placed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (15, 303, 5000, 12, 105000, NULL, 1, CAST(N'2023-12-19T12:00:00.000' AS DateTime), CAST(N'2023-12-19T13:00:00.000' AS DateTime), NULL, NULL, N'Completed')
INSERT [dbo].[BookingServicesDetail] ([ServiceID], [OrderID], [Price], [Weight], [PriceService], [PetInfoID], [PartnerInfoID], [StartTime], [EndTime], [FeedbackPartnerStatus], [FeedbackStatus], [StatusOrderService]) VALUES (16, 293, 5000, 10, 105000, NULL, 3, CAST(N'2023-12-17T12:00:00.000' AS DateTime), CAST(N'2023-12-17T14:00:00.000' AS DateTime), NULL, 1, N'Completed')
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (203, N'Nhân viên nhiệt tình, thân thiện, vui vẻ, hoạt bát', 5, 6, NULL, 1, NULL, 12, 290)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (204, N'sản phẩm tuyệt vời, đóng gói cẩn thận, giao hàng nhanh chóng', 5, NULL, NULL, NULL, 7, 3, 291)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (205, N'Phòng đẹp, thoải mái cho thú cưng của tôi. Dịch vụ đi kèm tiện lợi, bổ ích cho thú cưng của tôi. Cảm ơn cửa hàng', 5, NULL, 10, NULL, NULL, 29, 292)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (206, N'Dịch vụ nhanh chóng, cẩn thận tuyệt vời, ủng hộ mãi mãi. ', 5, 16, NULL, NULL, NULL, 12, 293)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (207, N'sadb fdsb ads fads fsd fasd fads f', 5, 14, NULL, 1, NULL, 3, 297)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (208, N'wqe wefwqefwqefewfqwef wef qewf ', 5, 15, NULL, NULL, NULL, 3, 296)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (209, N'asdf sdf sdf wefwefewfewfwqewecwecqwe cqwe cqw ', 5, NULL, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (210, N'qwer qewr qwer 23r 2q3r q32r 23r32f23f2q3fq32 f23f', 5, NULL, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (211, N'1234 132423 4 2134 132 4132 41234 1234 123 4', 5, NULL, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (212, N'qwe qwer qwer qwe rqwe rqwe rqwe rqwe rqwe rqew rqw', 5, NULL, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (213, N'qwe qwer qwer qwe rqwe rqwe rqwe rqwe rqwe rqew rqw', 5, NULL, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (214, N'qwe qwer qwer qwe rqwe rqwe rqwe rqwe rqwe rqew rqw', 5, NULL, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (215, N'qwer oqweir opwqe oruqewor oqwpeur opqewr qwer ', 5, 15, NULL, 1, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (216, N'qwe rwqeu riouqweio ruqweiru oiqwerqwer qwer ', 5, 15, NULL, NULL, NULL, 3, 295)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (217, N'dịch vụ nhanh chóng, biến thú cưng của tôi trông đẹp hơn', 5, 6, NULL, NULL, NULL, 12, 299)
INSERT [dbo].[Feedback] ([FeedbackID], [Content], [NumberStart], [ServiceID], [RoomID], [PartnerID], [ProductID], [UserID], [OrderId]) VALUES (218, N'nhân viên tuyệt vời, chăm chỉ, thân thiện', 5, 6, NULL, 3, NULL, 12, 299)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID], [FeedbackStatus], [StatusOrderProduct]) VALUES (100, 25000, 7, 291, 1, N'Delivered')
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID], [FeedbackStatus], [StatusOrderProduct]) VALUES (1, 25000, 7, 301, NULL, N'Delivered')
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID], [FeedbackStatus], [StatusOrderProduct]) VALUES (10, 25000, 15, 298, NULL, N'Delivered')
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID], [FeedbackStatus], [StatusOrderProduct]) VALUES (1, 25000, 15, 303, NULL, N'Delivered')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (290, CAST(N'2023-12-16T01:51:23.360' AS DateTime), N'Completed', N'Tỉnh Hà Tĩnh', N'Thành phố Hà Tĩnh', N'Tỉnh Hà Tĩnh', N'Thạch Linh - Hà Tĩnh @', N'0964418085', N'vnpay', N'Nguyễn Văn Hùng', 12, 1, 102000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (291, CAST(N'2023-12-16T01:58:06.840' AS DateTime), N'Completed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'vnpay', N'Nguyễn Văn Khách', 3, 1, 2500000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (292, CAST(N'2023-12-16T02:01:28.073' AS DateTime), N'Confirmed', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Thành phố Hà Nội', N'19 ngõ 93 Vũ Hữu', N'0362543040', N'vnpay', N'Thành Giang', 29, 1, 179000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (293, CAST(N'2023-12-16T02:09:48.033' AS DateTime), N'Completed', N'Tỉnh Hà Tĩnh', N'Thành phố Hà Tĩnh', N'Tỉnh Hà Tĩnh', N'Thạch Linh - Hà Tĩnh @', N'0964418085', N'vnpay', N'Nguyễn Văn Hùng', 12, 1, 105000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (294, CAST(N'2023-12-16T02:09:55.287' AS DateTime), N'Confirmed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 0, 102000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (295, CAST(N'2023-12-17T00:50:06.403' AS DateTime), N'Confirmed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 0, 155000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (296, CAST(N'2023-12-17T00:50:44.783' AS DateTime), N'Confirmed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 0, 105000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (297, CAST(N'2023-12-17T00:51:01.677' AS DateTime), N'Confirmed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 0, 110000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (298, CAST(N'2023-12-17T01:41:20.573' AS DateTime), N'Completed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 1, 250000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (299, CAST(N'2023-12-17T14:28:32.903' AS DateTime), N'Confirmed', N'Tỉnh Hà Tĩnh', N'Thành phố Hà Tĩnh', N'Tỉnh Hà Tĩnh', N'Thạch Linh - Hà Tĩnh @', N'0964418085', N'vnpay', N'Nguyễn Văn Hùng', 12, 1, 102000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (300, CAST(N'2023-12-18T16:28:43.387' AS DateTime), N'Completed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 1, 105000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (301, CAST(N'2023-12-18T16:31:38.803' AS DateTime), N'Completed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 1, 130000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (302, CAST(N'2023-12-18T16:33:19.073' AS DateTime), N'Placed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 0, 105000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (303, CAST(N'2023-12-18T16:33:33.120' AS DateTime), N'Completed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'cash', N'Nguyễn Văn Khách', 3, 1, 130000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (305, CAST(N'2023-12-18T16:38:09.693' AS DateTime), N'Confirmed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'vnpay', N'Nguyễn Văn Khách', 3, 1, 1328000)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [Phone], [TypePay], [FullName], [UserInfoID], [StatusPayment], [TotalPrice]) VALUES (306, CAST(N'2023-12-18T16:48:09.683' AS DateTime), N'Confirmed', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Tỉnh Yên Bái', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'0918273645', N'vnpay', N'Nguyễn Văn Khách', 3, 1, 2648000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OTPS] ON 

INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (1, N'383724')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (2, N'252772')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (3, N'818309')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (4, N'860871')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (5, N'743540')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (6, N'686377')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (7, N'497973')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (8, N'968744')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (10, N'582684')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (12, N'922044')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (13, N'778052')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (14, N'691324')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (15, N'771499')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (17, N'673557')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (23, N'716783')
SET IDENTITY_INSERT [dbo].[OTPS] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerInfo] ON 

INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate], [CardName], [Lat], [Lng], [Dob]) VALUES (1, N'Nguyễn Văn', N'Phát', N'0987654321', N'Tỉnh Lào Cai', N'Huyện Si Ma Cai', N'Tỉnh Lào Cai', N'si ma cai lào cai', N'Tôi là một cá nhân năng động và sáng tạo, luôn hướng đến sự phát triển và học hỏi. Với tư duy tích cực và lòng nhiệt huyết, tôi không ngừng khám phá và chinh phục những thách thức mới. Sự tò mò và sự ham học là động lực lớn của cuộc sống của tôi.

Trong sự nghiệp, tôi thường chú trọng đến việc xây dựng mối quan hệ tốt với đồng nghiệp và đối tác. Tôi tin rằng sự hợp tác và giao tiếp hiệu quả là chìa khóa để đạt được mục tiêu chung. Khả năng làm việc nhóm và giải quyết vấn đề một cách linh hoạt là những điểm mạnh của tôi.

Với đam mê về công nghệ và sáng tạo, tôi không ngừng theo đuổi kiến thức mới và áp dụng chúng vào công việc hàng ngày. Tôi là người sẵn sàng thí nghiệm và chấp nhận thất bại nhưng không bao giờ từ bỏ.

Ngoài ra, tôi luôn đặt sự cân bằng giữa công việc và cuộc sống cá nhân. Tôi coi trọng thời gian gia đình và bản thân để giữ cho tinh thần và tinh thần làm việc của mình luôn ổn định và tích cực.

Tóm lại, tôi là người có tinh thần lạc quan, sẵn sàng đối mặt với thách thức và không ngừng phát triển bản thân để đạt được sự thành công và hạnh phúc trong cả công việc và cuộc sống.', N'0987654321', N'/img/Profile/1313311498thucungtainha.jpg', N'https://i.pinimg.com/564x/f0/36/20/f03620d8a87708b90e4bc43aa06e3603.jpg', N'VietinBank', N'21.0044514', N'105.5122808', CAST(N'2001-09-28' AS Date))
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate], [CardName], [Lat], [Lng], [Dob]) VALUES (3, N'Nguyễn Văn', N'Hùng', N'0964418085', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Thành phố Hà Nội', N'đại học FPT', NULL, NULL, N'/img/Profile/96364inbound2717745994249519706.png', N'/img/Partner/40903background.png', NULL, N'21.0132904', N'105.5173634', CAST(N'2001-01-10' AS Date))
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate], [CardName], [Lat], [Lng], [Dob]) VALUES (7, N'Thành Hữu', N'Ngân Giang', N'0362543040', N'Thành phố Hà Nội', N'Quận Thanh Xuân', N'Thành phố Hà Nội', N'19 ngõ 93 Vũ Hữu', NULL, N'22212312312', N'/img/Profile/12006315526733_641658247661815_6792488698387025806_n1.jpg', N'/img/Certificate/47334anh-chung-chi-hanh-nghe.png', N'VietinBank', NULL, NULL, CAST(N'2001-09-29' AS Date))
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate], [CardName], [Lat], [Lng], [Dob]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate], [CardName], [Lat], [Lng], [Dob]) VALUES (13, N'test', N'ter', N'0123456789', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Thành phố Hà Nội', N'abc qwe qwefwqef owjef wqjefjwqef jwqef qwasfd', N'khong co gi de mo ta', N'1231237481234123', N'/img/Profile/32020116661600w-sk47afVzfio.webp', NULL, N'VietinBank', NULL, NULL, CAST(N'2023-06-20' AS Date))
SET IDENTITY_INSERT [dbo].[PartnerInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[PetInfo] ON 

INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID], [Weight], [Dob]) VALUES (20, N'Chó_Mật', N'/img/Pet/12642cho.png', N'Phốc Sóc ', NULL, N'Cute - Dễ thương - Ngoan hiền - Trắng', 12, 10, CAST(N'2023-09-02' AS Date))
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID], [Weight], [Dob]) VALUES (21, N'Chuột Hamster', N'/img/Pet/65932chuothamster.jpg', N'Hamster', 1, N'Ham ăn', 12, 8, CAST(N'2023-12-01' AS Date))
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID], [Weight], [Dob]) VALUES (26, N'Rio', N'/img/Pet/675958286114394corgi-fluffy.jpg', N'Giống cho anh ', 1, NULL, 3, 12, CAST(N'2023-12-05' AS Date))
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID], [Weight], [Dob]) VALUES (29, N'MiMi', N'/img/Pet/260444448739921spachothucung.jpg', N'Mèo Ai Cập', 0, NULL, 3, 11, CAST(N'2023-12-07' AS Date))
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID], [Weight], [Dob]) VALUES (60, N'MiMi', N'/img/Pet/6299877863320799-1600x1066-loving-chihuahua-dogs.jpg', N'Giống cho anh ', 1, NULL, 27, 12, CAST(N'2023-12-13' AS Date))
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID], [Weight], [Dob]) VALUES (61, N'MiMi', N'/img/Pet/4989167134320799-1600x1066-loving-chihuahua-dogs.jpg', N'Giống cho anh ', NULL, NULL, 27, 12, CAST(N'2023-12-17' AS Date))
SET IDENTITY_INSERT [dbo].[PetInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (1, N'Xúc xích cho mèo vị cá biển BIOLINE Cat Cod Sausage', N'Xúc xích cho mèo vị cá biển BIOLINE Cat Cod Sausage là một loại thức ăn bổ sung tươi ngon và tự nhiên cho mèo yêu của bạn. Sản phẩm được sản xuất từ thịt cá biển tươi ngon, ít chất béo, ít calo và sử dụng nước tinh khiết.', N'/img/Product/xucxichchomeovicabien.jpg', 1, 70000, NULL, CAST(N'2023-12-18' AS Date), 1, 1000, 218)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (2, N'Xúc xích cho mèo vị phô mai MEOWOW Mozzarella & Taurine Stick', N'Xúc xích cho mèo vị cá ngừ hun khói MEOWOW Smoked Tuna Meat Stick là món ăn nhẹ bổ dưỡng chất lượng cao dành cho mèo được làm từ cá ngừ trắng cao cấp.', N'/img/Product/xucxichchomeoviphomai.jpg', 1, 250000, NULL, CAST(N'2023-12-05' AS Date), 1, 1000, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (3, N'Xúc xích cho mèo vị cá ngừ hun khói MEOWOW Smoked Tuna Meat Stick', N'Xúc xích cho mèo vị cá ngừ hun khói MEOWOW Smoked Tuna Meat Stick là món ăn nhẹ bổ dưỡng chất lượng cao dành cho mèo được làm từ cá ngừ trắng cao cấp.', N'/img/Product/xucxichchomeovicanguhunkhoi.jpg', 1, 65000, NULL, CAST(N'2023-12-05' AS Date), 1, 1000, 110)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (4, N'Xúc xích cho chó vị phô mai BOWWOW Cheese Sausage', N'Xúc xích cho chó vị phô mai BOWWOW Cheese Sausage bổ dưỡng được yêu thích. Đây là thực phẩm bổ sung giúp việc huấn luyện thú cưng dễ dàng và hiệu quả hơn. Kết cấu mềm mại, dễ dàng sử dụng cho chó con và chó già răng yếu.', N'/img/Product/xucxichchochoviphomai.jpg', 1, 65000, CAST(N'2023-11-29' AS Date), CAST(N'2023-12-05' AS Date), 2, 1000, 120)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (5, N'Xương cho chó gặm làm sạch răng VEGEBRAND 360 Bone Prevent Tartar', N'Xương cho chó gặm làm sạch răng VEGEBRAND 360 Bone Prevent Tartar là thức ăn dinh dưỡng dành riêng cho các giống chó.', N'/img/Product/xuongchogamlamsachrang.jpg', 1, 60000, CAST(N'2023-11-11' AS Date), CAST(N'2023-12-05' AS Date), 4, 1000, 120)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (6, N'Thức ăn cho chó con cỡ nhỏ ROYAL CANIN Mini Puppy', N'Thức ăn cho chó con cỡ nhỏ ROYAL CANIN Mini Puppy dành cho các giống chó con dưới 10 tháng tuổi. Với công thức đặc chế riêng cho nhu cầu dinh dưỡng của chó con thuộc các giống cỡ nhỏ. Thức ăn cho chó con (các giống chó cỡ nhỏ) được nghiên cứu để cung cấp dinh dưỡng theo nhu cầu thực tế của chó con.', N'/img/Product/thucanchochoconho.jpg', 1, 215000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 2, 1000, 220)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (7, N'Bánh thưởng cho chó vị thịt bò VEGEBRAND Orgo Freshening Biscuit Bacon Beef', N'Bánh thưởng cho chó vị thịt bò VEGEBRAND Orgo Freshening Biscuit Bacon Beef có tác dụng làm sạch răng cho chó vị thịt bò. Sản phẩm có chứa các thành phần bạc hà tự nhiên kết hợp với hương vị thịt bò, có khả năng loại bỏ các vi khuẩn gây hôi miệng cho chú chó của bạn một cách nhanh chóng. Sản phẩm có thể kết hợp dùng để huấn luyện.', N'/img/Product/banhthuongchochovithitbo.jpg', 1, 25000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 2, 899, 757)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (8, N'Pate cho chó vị thịt bò IRIS OHYAMA One Care Beef', N'Pate cho chó vị thịt bò IRIS OHYAMA One Care Beef là sản phẩm dành cho tất cả giống chó. Với thành phần hoàn toàn từ tự nhiên và thịt bò.', N'/img/Product/patechochovithitbo.jpg', 1, 35000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 2, 1000, 136)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (9, N'Pate cho chó nước sốt vị thịt bò PEDIGREE Pouch Beef', N'Pate cho chó nước sốt vị thịt bò PEDIGREE Pouch Beef với hương vị kích thích dành cho cún biếng ăn, có thể trộn với cơm, hạt khô để tạo mùi cho thức ăn. Ngoài ra trong trường hợp không có thức ăn sẵn cho vật nuôi, có thể dùng để cho cún ăn trực tiếp.', N'/img/Product/patechochonuocsotvithitbo.jpg', 1, 25000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 2, 1000, 169)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (10, N'Xương cho chó vị thịt bò VEGEBRAND Orgo Nutrients Beef', N'Xương cho chó vị thịt bò VEGEBRAND Orgo Nutrients Beef dành cho các giống chó có kích thước trung bình có chứa vị thịt bò.', N'/img/Product/xuongchochovithitbo.jpg', 1, 25000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 2, 1000, 1151)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (11, N'Quần áo cho mèo AMBABY PET 2JXF192', N'Quần áo cho chó mèo AMBABY PET 2JXF192 là sản phẩm dành cho mèo.', N'/img/Product/quanaochomeo.jpg', 1, 225000, CAST(N'2023-11-08' AS Date), CAST(N'2023-12-05' AS Date), 12, 1000, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (12, N'Mũ cho mèo AMBABY PET 1JXS081', N'Mũ cho mèo AMBABY PET 1JXS081 là sản phẩm dành cho tất cả giống mèo.', N'/img/Product/muchomeo.jpg', 1, 155000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 3, 1000, 94)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (13, N'Vòng cổ mèo hình vân gỗ HAND IN HAND Pet Collar', N'Vòng cổ mèo hình vân gỗ HAND IN HAND Pet Collar kèm chuông lục lạc gắn đeo cổ giúp bảo vệ và kiểm soát thú cưng cưng an toàn hơn. Sử dụng cho mèo có chu vi cổ từ 15 cm đến 45 cm.', N'/img/Product/vongcochomeo.jpg', 1, 50000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 3, 1000, 79)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (14, N'Vòng cổ cho mèo kèm dây dắt AMBABY PET 1JXS051', N'Vòng cổ cho mèo kèm dây dắt AMBABY PET 1JXS051 là sản phẩm dùng cho tất cả giống mèo theo từng kích cỡ phù hợp.', N'/img/Product/product14.jpg', 1, 225000, CAST(N'2023-11-07' AS Date), NULL, 3, 1000, 99)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (15, N'Chuông lục lạc cho mèo PAW hình mặt đáng yêu', N'Chuông lục lạc cho mèo PAW hình mặt đáng yêu. Với đầy đủ sắc màu và kích cỡ khác nhau. Phù hợp với tất cả các giống mèo.', N'/img/Product/chuongluclacchomeo.jpg', 1, 25000, CAST(N'2023-11-08' AS Date), CAST(N'2023-12-05' AS Date), 13, 989, 151)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (16, N'Rọ mõm chó hình mỏ vịt PAW Aduck', N'Rọ mõm chó hình mỏ vịt PAW Aduck là sản phẩm dành cho tất cả giống chó.', N'/img/Product/romomcho.jpg', 1, 75000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 4, 1000, 134)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (17, N'Bảng tên cho chó PAW Quick-Tag Pet ID', N'Bảng tên cho chó PAW Quick-Tag Pet ID sử dụng công nghệ sản xuất tiên tiến hình cục xương rất đáng yêu. Kích thước size nhỏ 4×2 cm.', N'/img/Product/bangtenchocho.jpg', 1, 50000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 4, 0, 1124)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (18, N'Xích cho chó đai ngực cỡ mini HAND IN HAND', N'Xích cho chó đai ngực Hand In Hand là sản phẩm dành cho tất cả giống chó cỡ mini.', N'/img/Product/product18.jpg', 1, 80000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 4, 999, 122)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (19, N'Vòng cổ cho chó lớn PAW bằng da đính cườm cao cấp', N'Vòng cổ cho chó lớn PAW bằng da đính cườm cao cấp là sản phẩm dành cho tất cả giống chó.

', N'/img/Product/vongcochochobangda.jpg', 1, 350000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 4, 999, 103)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [UpdateDate], [ProCategoriesID], [Quantity], [QuantitySold]) VALUES (20, N'Xích cho chó đai ngực cỡ to TOUCH DOG', N'Xích cho chó đai ngực cỡ to TOUCH DOG là sản phẩm dành cho tất cả giống chó.

', N'/img/Product/xichchochodainguccuto.jpg', 1, 325000, CAST(N'2023-11-07' AS Date), CAST(N'2023-12-05' AS Date), 4, 1000, 110)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (1, N'Thức ăn cho mèo', N'Sản phẩm dành cho mèo cưng, cung cấp đầy đủ chất cho bé - mèo', N'/img/ProductCategory/procategory1.jpg', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (2, N'Thức ăn cho chó', N'Sản phẩm dành cho cún cưng', N'/img/ProductCategory/procategory2.jpg', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (3, N'Phụ kiện cho mèo', N'Phụ kiện dành riêng cho mèo cưng', N'/img/ProductCategory/procategory1.jpg', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (4, N'Phụ kiện cho chó', N'Phụ kiện dành riêng cho cún cưng', N'/img/ProductCategory/procategory4.jpg', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (11, N'Dụng cụ y tế ', N'Dụng cụ y tế dành cho chó mèo', N'https://nld.mediacdn.vn/zoom/700_438/291774122806476800/2021/9/8/2704-meo-16310700426461865483800.jpg                                                                                                   ', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (12, N'Quần Áo', N'Quần áo dành cho thú cưng', N'https://vietgiftmarket.com/wp-content/uploads/2018/10/shop-quan-ao-cho-cho-meo.jpg                                                                                                                      ', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (13, N'Đồ chơi', N'Đồ chơi dành cho thú cưng', N'https://petmaster.vn/wp-content/uploads/2020/06/1-9.jpg                                                                                                                                                 ', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (14, N'Vệ sinh', N'Danh mục này chứa các sản phẩm vệ sinh dành cho thú cưng như bột cát vệ sinh cho mèo, giấy thảm vệ sinh, nước tẩy mùi vệ sinh, bông tẩy tai, và các sản phẩm khác để giữ vệ sinh và sạch sẽ cho thú cưng', N'https://bizweb.dktcdn.net/thumb/grande/100/229/172/products/tam-lot-thuong1.jpg                                                                                                                         ', 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (15, N'Chuồng và lồng', N'Danh mục này chứa các sản phẩm chuồng và lồng dành cho thú cưng như chuồng cho chó, lồng cho mèo, chuồng vận chuyển, và các loại chuồng và lồng khác để cung cấp nơi ở an toàn và thoải mái cho thú cưng.', N'https://vn-test-11.slatic.net/p/8a3a1ab9d0d66198c95250dde874bf03.jpg_800x800Q100.jpg                                                                                                                    ', 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Reason] ON 

INSERT [dbo].[Reason] ([ReasonID], [ReasonTitle], [ReasonDescription]) VALUES (1, N'Thay đổi đơn hàng', N'Tôi muốn thay đổi đơn hàng(sản phẩm, dịch vụ, nhân viên, ....)')
INSERT [dbo].[Reason] ([ReasonID], [ReasonTitle], [ReasonDescription]) VALUES (2, N'Cập nhật đơn hàng', N'Tôi muốn cập nhật lại đơn hàng(tên, địa chỉ, số điện thoại, số lượng, dịch vụ, ....)')
INSERT [dbo].[Reason] ([ReasonID], [ReasonTitle], [ReasonDescription]) VALUES (3, N'Không muốn đặt đơn hàng', N'Tôi không còn có nhu cầu đặt đơn nữa')
INSERT [dbo].[Reason] ([ReasonID], [ReasonTitle], [ReasonDescription]) VALUES (4, N'Về vị trí', N'Tôi đang không ở gần địa chỉ cần thực hiện dịch vụ.  Mong quý khách thông cảm!')
INSERT [dbo].[Reason] ([ReasonID], [ReasonTitle], [ReasonDescription]) VALUES (5, N'Quá tải', N'Nhân viên hiện đang quá tải, không thể nhận đơn.  Mong quý khách thông cảm!')
INSERT [dbo].[Reason] ([ReasonID], [ReasonTitle], [ReasonDescription]) VALUES (6, N'Không thể nhận đơn', N'Vì một vài lí do, chúng tôi hiện tại không thể nhận đơn. Mong quý khách thông cảm!')
SET IDENTITY_INSERT [dbo].[Reason] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'ADMIN')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'CUSTOMER')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'MANAGER')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'PARTNER')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (1, N'Phòng T1 cho thú cưng tối đa 10kg', N'Căn phòng thường cho thú cưng có trọng lượng tối đa 10kg là một không gian thoải mái và thân thiện, tạo điều kiện tốt nhất cho sự nghỉ ngơi và giải trí của thú cưng. Sàn nhà được trải phủ bởi lớp thảm nhẹ nhàng, tạo cảm giác ấm cúng và êm dịu cho bàn chân nhỏ của thú cưng. Góc chơi chứa một số đồ chơi như bóng nhựa, đồ chơi nhựa nổ nhẹ, và đồ chơi gặm chải, tạo cơ hội cho thú cưng thư giãn và vận động.', 1, N'/img/Room/Room1.jpg', 30000, 2, 12)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (2, N'Phòng T2 cho thú cưng tối đa 20kg', N'Căn phòng thường cho thú cưng có trọng lượng tối đa 20kg là một không gian thoải mái và thân thiện, tạo điều kiện tốt nhất cho sự nghỉ ngơi và giải trí của thú cưng. Sàn nhà được trải phủ bởi lớp thảm nhẹ nhàng, tạo cảm giác ấm cúng và êm dịu cho bàn chân nhỏ của thú cưng. Góc chơi chứa một số đồ chơi như bóng nhựa, đồ chơi nhựa nổ nhẹ, và đồ chơi gặm chải, tạo cơ hội cho thú cưng thư giãn và vận động.', 1, N'/img/Room/Room2.jpg', 35000, 2, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (3, N'Phòng T3 cho thú cưng tối đa 10kg', N'Căn phòng thường cho thú cưng có trọng lượng tối đa 30kg là một không gian thoải mái và thân thiện, tạo điều kiện tốt nhất cho sự nghỉ ngơi và giải trí của thú cưng. Sàn nhà được trải phủ bởi lớp thảm nhẹ nhàng, tạo cảm giác ấm cúng và êm dịu cho bàn chân nhỏ của thú cưng. Góc chơi chứa một số đồ chơi như bóng nhựa, đồ chơi nhựa nổ nhẹ, và đồ chơi gặm chải, tạo cơ hội cho thú cưng thư giãn và vận động.', 1, N'/img/Room/Room3.jpg', 40000, 2, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (4, N'Phòng V1 cho thú cưng tối đa 10kg', N'Phòng VIP dành cho thú cưng có trọng lượng tối đa 10kg là một không gian sang trọng và thoải mái, nơi thú cưng có thể tận hưởng những trải nghiệm đặc biệt. Sàn nhà được trang bị lớp thảm mềm mại, có thể là loại thảm chống bám bẩn hoặc thảm vật liệu cao cấp, tạo cảm giác êm dịu và sang trọng. Góc ngủ có chiếc giường chất liệu cao cấp, được trang bị chăn mền mềm mại và đèn đọc sách hoặc đèn trang trí để tạo không gian thư giãn. Góc chơi có đủ đồ chơi hiện đại và sáng tạo như đồ chơi tương tác điện tử, đèn laser tương tác, và các đồ chơi chăm sóc sức khỏe. Khu vực ăn được trang bị bát ăn và chén nước cao cấp, có thể là loại có thiết kế thời trang hoặc được làm từ vật liệu chống nước. Góc chăm sóc với dịch vụ spa nhỏ, bao gồm cả những sản phẩm chăm sóc da và móng đặc biệt cho thú cưng.', 1, N'/img/Room/phongv1.jpg', 70000, 1, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (5, N'Phòng V2 cho thú cưng tối đa 20kg', N'Phòng VIP dành cho thú cưng có trọng lượng tối đa 20kg là một không gian sang trọng và thoải mái, nơi thú cưng có thể tận hưởng những trải nghiệm đặc biệt. Sàn nhà được trang bị lớp thảm mềm mại, có thể là loại thảm chống bám bẩn hoặc thảm vật liệu cao cấp, tạo cảm giác êm dịu và sang trọng. Góc ngủ có chiếc giường chất liệu cao cấp, được trang bị chăn mền mềm mại và đèn đọc sách hoặc đèn trang trí để tạo không gian thư giãn. Góc chơi có đủ đồ chơi hiện đại và sáng tạo như đồ chơi tương tác điện tử, đèn laser tương tác, và các đồ chơi chăm sóc sức khỏe. Khu vực ăn được trang bị bát ăn và chén nước cao cấp, có thể là loại có thiết kế thời trang hoặc được làm từ vật liệu chống nước. Góc chăm sóc với dịch vụ spa nhỏ, bao gồm cả những sản phẩm chăm sóc da và móng đặc biệt cho thú cưng.', 1, N'/img/Room/phongv2.jpg', 75000, 1, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (6, N'Phòng V3 cho thú cưng tối đa 30kg', N'Phòng VIP dành cho thú cưng có trọng lượng tối đa 30kg là một không gian sang trọng và thoải mái, nơi thú cưng có thể tận hưởng những trải nghiệm đặc biệt. Sàn nhà được trang bị lớp thảm mềm mại, có thể là loại thảm chống bám bẩn hoặc thảm vật liệu cao cấp, tạo cảm giác êm dịu và sang trọng. Góc ngủ có chiếc giường chất liệu cao cấp, được trang bị chăn mền mềm mại và đèn đọc sách hoặc đèn trang trí để tạo không gian thư giãn. Góc chơi có đủ đồ chơi hiện đại và sáng tạo như đồ chơi tương tác điện tử, đèn laser tương tác, và các đồ chơi chăm sóc sức khỏe. Khu vực ăn được trang bị bát ăn và chén nước cao cấp, có thể là loại có thiết kế thời trang hoặc được làm từ vật liệu chống nước. Góc chăm sóc với dịch vụ spa nhỏ, bao gồm cả những sản phẩm chăm sóc da và móng đặc biệt cho thú cưng.', 1, N'/img/Room/phongv3.jpg', 80000, 1, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (7, N'Phòng V4 cho thú cưng lớn hơn 40kg', N'Phòng VIP dành cho thú cưng có trọng lượng có thể lớn 40kg là một không gian sang trọng và thoải mái, nơi thú cưng có thể tận hưởng những trải nghiệm đặc biệt. Sàn nhà được trang bị lớp thảm mềm mại, có thể là loại thảm chống bám bẩn hoặc thảm vật liệu cao cấp, tạo cảm giác êm dịu và sang trọng. Góc ngủ có chiếc giường chất liệu cao cấp, được trang bị chăn mền mềm mại và đèn đọc sách hoặc đèn trang trí để tạo không gian thư giãn. Góc chơi có đủ đồ chơi hiện đại và sáng tạo như đồ chơi tương tác điện tử, đèn laser tương tác, và các đồ chơi chăm sóc sức khỏe. Khu vực ăn được trang bị bát ăn và chén nước cao cấp, có thể là loại có thiết kế thời trang hoặc được làm từ vật liệu chống nước. Góc chăm sóc với dịch vụ spa nhỏ, bao gồm cả những sản phẩm chăm sóc da và móng đặc biệt cho thú cưng.', 1, N'/img/Room/phongv4.jpg', 100000, 1, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (10, N'Phòng cho thú cưng tối đa 10kg', N'Căn phòng cho thú cưng có trọng lượng tối đa 10kg là một không gian chăm sóc đặc biệt, thiết kế với sự nhỏ gọn và an toàn làm trọng điểm chính. Góc ngủ có một chiếc giường nhỏ với chăn mền êm ái, tạo điểm nghỉ ngơi thoải mái và ấm cúng. Góc chơi được trang bị những đồ chơi nhỏ, như bóng nhựa, đồ chơi nổ nhẹ, và chuỗi đèn nhỏ để kích thích tình tò mò của thú cưng. Đèn trang trí treo trên trần tạo ra ánh sáng nhẹ nhàng, đủ để làm nổi bật không gian mà không gây chói lọi hoặc làm phiền giấc ngủ của thú cưng. Góc ăn được thiết kế với một bát ăn và chén nước, giúp thú cưng dễ dàng tiếp cận và tự phục vụ.', 1, N'/img/Room/Phongt1.jpg', 50000, 4, 10)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (11, N'Phòng giành cho thú cưng tối đa 20kg', N'Căn phòng dành cho thú cưng có trọng lượng tối đa 20kg được thiết kế đặc biệt để tạo ra một môi trường an toàn, thoải mái và giáo dục cho những thú cưng nhỏ đáng yêu. Một chiếc giường nhỏ nhưng thoải mái được đặt ở một góc nhỏ, tạo điểm tâm lý tưởng để thú cưng có thể thư giãn và ngủ. Góc chơi được trang bị đủ đồ chơi phù hợp với kích thước nhỏ của thú cưng, như bóng nhựa, đồ chơi gặm chải, và đồ chơi nổ để kích thích sự tò mò.

', 1, N'/img/Room/Phongt3.jpg', 60000, 4, 12)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (12, N'Phòng giành cho thú cưng tối đa 30kg', N'Căn phòng dành cho thú cưng có trọng lượng tối đa 30kg là một không gian an toàn và thoải mái, được thiết kế đặc biệt để đáp ứng nhu cầu của những thú cưng có trọng lượng lớn. Kích thước của căn phòng này được điều chỉnh sao cho phù hợp với kích thước và hoạt động tự nhiên của thú cưng, đồng thời đảm bảo không gian không quá rộng lớn, tạo cảm giác an toàn và bảo vệ.', 1, N'/img/Room/Phongt4.jpg', 70000, 4, 12)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (22, N'Phòng đặc biệt', N'Phòng đặc biệt là phòng duy nhất trong hệ thống chúng tôi, giành cho 1 thú cưng được ở. 
Phòng có màu sắc tươi tắn trải rộng khắp căn phòng, tạo nên bức tranh vui nhộn và tràn đầy năng lượng tích cực. Sàn nhà được trải phủ bởi một lớp thảm êm dịu, tạo cảm giác thoải mái cho bất kỳ bước chân nào của thú cưng. Góc này của căn phòng là một thế giới riêng tư với đủ đồ chơi và đồ dùng cần thiết, từ những chiếc bóng nhựa màu sắc cho đến những chiếc chuột nhựa kêu lạ lùng.
Trên tường, có những bức tranh dễ thương với hình ảnh của những chú thú cưng đáng yêu, tạo nên không khí ấm cúng và vui tươi. Ánh sáng mềm mại từ những đèn trang trí treo trên trần nhà tạo ra bầu không khí ấm áp, đủ để làm dịu đi cảm xúc của thú cưng. Một góc nhỏ được chăm sóc đặc biệt, với chiếc giường êm ái và ấm áp, là nơi lý tưởng để thú cưng có thể nghỉ ngơi sau những giờ phút chơi đùa mệt mỏi. Các phụ kiện như đồ chơi nổ, bóng xốp và thậm chí là một chiếc chuỗi đèn nhỏ để tạo điểm nhấn thêm phần phong cách và vui nhộn.
Cuối cùng, không thể thiếu trong căn phòng là một khu vực nhỏ với đủ thức ăn và nước, đảm bảo thú cưng luôn có đủ năng lượng để thỏa sức vui chơi. Cảm giác của căn phòng này không chỉ là một nơi dành cho thú cưng, mà còn là một biểu tượng của tình yêu và quan tâm mà chủ nhân dành cho những thành viên nhỏ bé trong gia đình.', 1, N'/img/Room/phongvip1slot.jpg', 150000, 1, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomCategories] ON 

INSERT [dbo].[RoomCategories] ([RoomCategoriesID], [RoomCategoriesName], [Desciptions], [Picture], [Status]) VALUES (1, N'Phòng VIP', N'Loại phòng cao cấp dành cho thú cưng', N'/img/RoomCategory/RoomCategory1.jpg', 1)
INSERT [dbo].[RoomCategories] ([RoomCategoriesID], [RoomCategoriesName], [Desciptions], [Picture], [Status]) VALUES (2, N'Phòng Thường', N'Loại phòng thường dành cho thú cưng', N'/img/RoomCategory/RoomCategory2.jpg', 1)
INSERT [dbo].[RoomCategories] ([RoomCategoriesID], [RoomCategoriesName], [Desciptions], [Picture], [Status]) VALUES (4, N'Phòng Theo Giờ', N'Loại phòng đặt trong ngày', N'/img/RoomCategory/RoomCategory2.jpg', 1)
SET IDENTITY_INSERT [dbo].[RoomCategories] OFF
GO
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (1, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (1, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (2, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (2, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (3, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (3, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 7)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 8)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 9)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 10)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (4, 15)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 7)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 8)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 9)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 10)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (5, 15)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 7)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 8)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 9)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 10)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (6, 15)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 7)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 8)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 9)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 10)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (7, 15)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (10, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (10, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (11, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (11, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (11, 15)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (12, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (12, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (12, 15)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 5)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 6)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 7)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 8)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 9)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 10)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 14)
INSERT [dbo].[RoomServices] ([RoomID], [ServiceID]) VALUES (22, 15)
GO
SET IDENTITY_INSERT [dbo].[ServiceCategories] ON 

INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (1, N'DỊCH VỤ LÀM ĐẸP CHO THÚ CƯNG', N'Dịch vụ làm đẹp cho thú cưng là một dịch vụ chăm sóc thú cưng chuyên nghiệp, giúp cải thiện ngoại hình và tạo cảm giác thoải mái cho các thú cưng của bạn.', N'/img/ServiceCategory/lamdepthucung.jpg', 1)
INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (2, N'DỊCH VỤ HUẤN LUYỆN THÚ CƯNG', N'Dịch vụ huấn luyện thú cưng là một dịch vụ quan trọng giúp cải thiện hành vi, nắm bắt các kỹ năng và giao tiếp hiệu quả giữa chủ nhân và thú cưng.', N'/img/ServiceCategory/huanluyenthucung.jpg', 1)
INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (3, N'DỊCH VỤ CHĂM SÓC THÚ CƯNG TẠI NHÀ', N'Dịch vụ chăm sóc thú cưng tại nhà là một dịch vụ tiện lợi và quan trọng cho các chủ nhân thú cưng khi họ cần phải rời nhà trong một thời gian dài hoặc khi họ muốn đảm bảo rằng thú cưng của họ được chăm sóc tốt trong môi trường quen thuộc. ', N'/img/ServiceCategory/chamthutainha.jpg', 1)
INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (4, N'DỊCH VỤ DẮT THÚ ĐI DẠO', N'Dịch vụ dắt thú đi dạo là một hoạt động thú vị và hữu ích cho cả thú cưng và chủ nhân. Dịch vụ này thường được cung cấp bởi các chuyên gia hoặc người yêu thú cưng có kinh nghiệm, và có thể được tìm thấy ở các cửa hàng thú cưng, trung tâm chăm sóc thú cưng hoặc thông qua các cá nhân cung cấp dịch vụ độc lập.', N'/img/ServiceCategory/datthudidao.jpg', 1)
SET IDENTITY_INSERT [dbo].[ServiceCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (5, N'Tắm rửa và vệ sinh', N'Dịch vụ này bao gồm việc tắm rửa, làm sạch lông, và vệ sinh tổng thể cho thú cưng. Chó và mèo cần được tắm rửa định kỳ để loại bỏ bụi bẩn, mùi kháng, và bã nhờn trên da.', 1, 2, N'/img/Service/service1.jpg', 200000, 1)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (6, N'Cắt tỉa lông', N'Cắt tỉa lông có thể được thực hiện để duy trì lông thú cưng trong tình trạng sạch sẽ và thoải mái. Điều này bao gồm cắt tỉa lông dài, tạo kiểu, và cắt móng.', 1, 1.5, N'/img/Service/service2.jpg', 75000, 1)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (7, N'Làm móng', N'Làm móng cho chó và mèo là một phần quan trọng trong dịch vụ làm đẹp. Cắt móng đúng cách giúp tránh tình trạng móng quá dài gây đau và vấn đề về sức khỏe.', 1, 1, N'/img/Service/service3.jpg', 150000, 1)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (8, N'Làm sạch tai và mắt', N'Làm sạch tai và mắt giúp ngăn ngừa nhiễm trùng và tạo cảm giác thoải mái cho thú cưng. Điều này bao gồm loại bỏ bã nhờn, lông dư thừa, và mảng bám bẩn.', 1, 0.5, N'/img/Service/service4.jpg', 150000, 1)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (9, N'Dịch vụ làm đẹp đặc biệt', N'Ngoài các dịch vụ cơ bản, dịch vụ làm đẹp còn có thể bao gồm làm sạch răng, tạo kiểu móng tay, và làm đẹp da dưới sự chăm sóc của các chuyên gia.', 1, 2, N'/img/Service/service5.jpg', 300000, 1)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (10, N'Kiểu tóc và trang điểm cho thú cưng', N'Một số dịch vụ làm đẹp cho thú cưng cung cấp các dịch vụ làm đẹp đặc biệt, như tạo kiểu lông, nhuộm lông, và trang điểm cho thú cưng để tạo ra một diện mạo độc đáo hoặc phù hợp với mùa hồi hương.', 1, 1.5, N'/img/Service/service6.jpg', 200000, 1)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (11, N'Huấn luyện thú cưng', N'Dịch vụ huấn luyện thú cưng thường được cung cấp bởi những người có kiến thức và kinh nghiệm trong việc làm việc với các loại thú cưng khác nhau, bao gồm chó, mèo, thú cưng có lông, thú cưng có vây, và nhiều loại khác.', 1, 2.5, N'/img/Service/service7.png', 200000, 2)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (12, N'Giao tiếp chủ nhân thú cưng', N'Đào tạo thú cưng không chỉ là việc dạy chúng các kỹ năng, mà còn là việc cải thiện giao tiếp giữa thú cưng và chủ nhân. Điều này có thể giúp tạo ra mối quan hệ mạnh mẽ và tin cậy giữa hai bên.', 1, 1.5, N'/img/Service/service8.jpg', 350000, 2)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (13, N'Kỹ năng cơ bản và nâng cao', N'Dịch vụ này bao gồm cả việc dạy thú cưng các kỹ năng cơ bản như ngồi, nằm, và không chạy xa, cũng như các kỹ năng nâng cao như đi dạo dưới sự kiểm soát hoặc thực hiện các thao tác cụ thể.', 1, 2, N'/img/Service/service9.jpg', 450000, 2)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (14, N'Dịch vụ dắt thú đi dạo', N'Các dịch vụ này thường được cung cấp bởi những người có kiến thức về thú cưng, đặc biệt là về loại thú cưng mà họ đang dắt đi dạo, như chó, mèo, hoặc thú cưng khác.', 1, 1.5, N'/img/Service/service10.jpg', 200000, 4)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (15, N'Chăm sóc y tế', N'Nếu thú cưng cần thuốc hoặc chăm sóc y tế đặc biệt, dịch vụ chăm sóc tại nhà có thể bao gồm việc đảm bảo rằng thú cưng được đưa đi thăm bác sĩ thú y, được tiêm phòng, hoặc nhận bất kỳ dịch vụ y tế nào cần thiết.', 1, 1, N'/img/Service/service11.jpg', 150000, 3)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Time], [Picture], [Price], [SerCategoriesID]) VALUES (16, N'Giao tiếp với thú cưng', N'Người cung cấp dịch vụ chăm sóc thú cưng tại nhà thường biết cách tương tác với thú cưng và tạo môi trường thoải mái cho họ, giúp thú cưng không cảm thấy cô đơn và lo lắng trong thời gian chủ nhân vắng mặt.', 0, 2, N'/img/Service/service12.jpg', 5000, 3)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagID], [TagName], [Status]) VALUES (1, N'Mèo', 1)
INSERT [dbo].[Tags] ([TagID], [TagName], [Status]) VALUES (2, N'Chó', 1)
INSERT [dbo].[Tags] ([TagID], [TagName], [Status]) VALUES (3, N'Cách chăm sóc thú cưng', 1)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (1, N'AD', N'MIN', N'0999999999', N'ADMIN', N'ADMIN', N'ADMIN', N'ADMIN', N'ADMIN', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (2, N'Quản ', N'Lý', N'0969886688', N'Thành phố Hà Nội', N'Huyện Thạch Thất', N'Xã Thạch Hoà', N'Đại học FPT', NULL, N'/img/Profile/64387manager.jpg', CAST(N'2001-06-13' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (3, N'Nguyễn Văn', N'Khách', N'0918273645', N'Tỉnh Yên Bái', N'Thành phố Yên Bái', N'Phường Nguyễn Phúc', N'số 01 - đường Hai Bà Trưng - Phường Nguyễn Phúc - Thành Phố Yên Bái', N'Khách hàng thân thiên vui tính', N'/img/24395partnerava.png', CAST(N'2001-09-08' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (11, N'Võ ', N'Tòng', N'0987654321', N'Tỉnh Phú Thọ', N'Huyện Hạ Hoà', N'Tỉnh Phú Thọ', N'11.2 Phú Thọ Hạ Hoà', NULL, N'/img/62749Screenshot 2023-12-01 214617.png', CAST(N'2005-06-11' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (12, N'Nguyễn Văn', N'Hùng', N'0964418085', N'Tỉnh Hà Tĩnh', N'Thành phố Hà Tĩnh', N'Tỉnh Hà Tĩnh', N'Thạch Linh - Hà Tĩnh @', NULL, N'/img/80603ava.jpg', CAST(N'2001-01-10' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (18, N'Nguyễn Văn', N'Hùng', N'0987654321', N'Tỉnh Lào Cai', N'Huyện Si Ma Cai', N'Tỉnh Lào Cai', N'si ma cai lào cai', N'Tôi là một cá nhân năng động và sáng tạo, luôn hướng đến sự phát triển và học hỏi. Với tư duy tích cực và lòng nhiệt huyết, tôi không ngừng khám phá và chinh phục những thách thức mới. Sự tò mò và sự ham học là động lực lớn của cuộc sống của tôi.

Trong sự nghiệp, tôi thường chú trọng đến việc xây dựng mối quan hệ tốt với đồng nghiệp và đối tác. Tôi tin rằng sự hợp tác và giao tiếp hiệu quả là chìa khóa để đạt được mục tiêu chung. Khả năng làm việc nhóm và giải quyết vấn đề một cách linh hoạt là những điểm mạnh của tôi.

Với đam mê về công nghệ và sáng tạo, tôi không ngừng theo đuổi kiến thức mới và áp dụng chúng vào công việc hàng ngày. Tôi là người sẵn sàng thí nghiệm và chấp nhận thất bại nhưng không bao giờ từ bỏ.

Ngoài ra, tôi luôn đặt sự cân bằng giữa công việc và cuộc sống cá nhân. Tôi coi trọng thời gian gia đình và bản thân để giữ cho tinh thần và tinh thần làm việc của mình luôn ổn định và tích cực.

Tóm lại, tôi là người có tinh thần lạc quan, sẵn sàng đối mặt với thách thức và không ngừng phát triển bản thân để đạt được sự thành công và hạnh phúc trong cả công việc và cuộc sống.', N'/img/Profile/1313311498thucungtainha.jpg', NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (20, N'Hưng', N'Hưng', N'0327709576', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (22, N'Thành Hữu', N'Ngân Giang', N'0362543040', N'Thành phố Hà Nội', N'Quận Thanh Xuân', N'Phường Thanh Xuân Bắc', N'19 ngõ 93 Vũ Hữu', N'Yêu thú cưng', N'/img/00539315526733_641658247661815_6792488698387025806_n1.jpg', CAST(N'2001-09-29' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (26, NULL, N'Khánh Huyền', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (27, N'linh', N'nguyễn', N'0979276001', N'Thành phố Hà Nội', N'Huyện Thạch Thất', N'Thành phố Hà Nội', N'thôn phúc tiến', NULL, N'/img/53340ve-hoa-tulip-1-1.jpg', CAST(N'2001-07-27' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (29, N'Thành', N'Giang', N'0362543040', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Thành phố Hà Nội', N'19 ngõ 93 Vũ Hữu', NULL, N'/img/07763cambg_3.jpg', CAST(N'2001-09-29' AS Date))
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (38, NULL, N'NewUserTest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser], [Dob]) VALUES (41, N'test', N'ter', N'0123456789', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Thành phố Hà Nội', N'abc qwe qwefwqef owjef wqjefjwqef jwqef qwasfd', N'khong co gi de mo ta', N'/img/43857procategory4.jpg', CAST(N'2022-01-29' AS Date))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_OTPS] FOREIGN KEY([OTPID])
REFERENCES [dbo].[OTPS] ([OTPID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_OTPS]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_PartnerInfo] FOREIGN KEY([PartnerInfoID])
REFERENCES [dbo].[PartnerInfo] ([PartnerInfoID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_PartnerInfo]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_UserInfo]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Tags1] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Tags1]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Orders]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Room]
GO
ALTER TABLE [dbo].[BookingRoomServices]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomServices_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[BookingRoomServices] CHECK CONSTRAINT [FK_BookingRoomServices_Orders]
GO
ALTER TABLE [dbo].[BookingRoomServices]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomServices_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[BookingRoomServices] CHECK CONSTRAINT [FK_BookingRoomServices_Room]
GO
ALTER TABLE [dbo].[BookingRoomServices]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomServices_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[BookingRoomServices] CHECK CONSTRAINT [FK_BookingRoomServices_Services]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Orders]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_PartnerInfo] FOREIGN KEY([PartnerInfoID])
REFERENCES [dbo].[PartnerInfo] ([PartnerInfoID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_PartnerInfo]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_PetInfo] FOREIGN KEY([PetInfoID])
REFERENCES [dbo].[PetInfo] ([PetInfoID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_PetInfo]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Services]
GO
ALTER TABLE [dbo].[OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProductDetail] CHECK CONSTRAINT [FK_OrderProductDetail_Orders]
GO
ALTER TABLE [dbo].[OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProductDetail] CHECK CONSTRAINT [FK_OrderProductDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_UserInfo]
GO
ALTER TABLE [dbo].[OrderType]  WITH CHECK ADD  CONSTRAINT [FK_OrderType_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_Orders]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PartnerInfo] FOREIGN KEY([PartnerInfoID])
REFERENCES [dbo].[PartnerInfo] ([PartnerInfoID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PartnerInfo]
GO
ALTER TABLE [dbo].[PetInfo]  WITH CHECK ADD  CONSTRAINT [FK_PetInfo_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[PetInfo] CHECK CONSTRAINT [FK_PetInfo_UserInfo]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategories] FOREIGN KEY([ProCategoriesID])
REFERENCES [dbo].[ProductCategories] ([ProCategoriesID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategories]
GO
ALTER TABLE [dbo].[ReasonOrders]  WITH CHECK ADD  CONSTRAINT [FK_ReasonOrders_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[ReasonOrders] CHECK CONSTRAINT [FK_ReasonOrders_Orders]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomCategories] FOREIGN KEY([RoomCategoriesID])
REFERENCES [dbo].[RoomCategories] ([RoomCategoriesID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomCategories]
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD  CONSTRAINT [FK_RoomServices_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[RoomServices] CHECK CONSTRAINT [FK_RoomServices_Room]
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD  CONSTRAINT [FK_RoomServices_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[RoomServices] CHECK CONSTRAINT [FK_RoomServices_Services]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_ServiceCategories] FOREIGN KEY([SerCategoriesID])
REFERENCES [dbo].[ServiceCategories] ([SerCategoriesID])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_ServiceCategories]
GO
ALTER DATABASE [PetServices] SET  READ_WRITE 
GO
