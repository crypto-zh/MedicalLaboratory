USE [master]
GO
/****** Object:  Database [MedicalLaboratory]    Script Date: 01.06.2021 18:41:46 ******/
CREATE DATABASE [MedicalLaboratory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedicalLaboratory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MedicalLaboratory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MedicalLaboratory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MedicalLaboratory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MedicalLaboratory] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedicalLaboratory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedicalLaboratory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedicalLaboratory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedicalLaboratory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedicalLaboratory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedicalLaboratory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET RECOVERY FULL 
GO
ALTER DATABASE [MedicalLaboratory] SET  MULTI_USER 
GO
ALTER DATABASE [MedicalLaboratory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedicalLaboratory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedicalLaboratory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedicalLaboratory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MedicalLaboratory] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedicalLaboratory', N'ON'
GO
ALTER DATABASE [MedicalLaboratory] SET QUERY_STORE = OFF
GO
USE [MedicalLaboratory]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[PostId] [int] NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestServices]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestServices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_RequestServices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateOfCreation] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Cost] [money] NOT NULL,
	[DeadlineForCompletion] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[RequestWithServices]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[RequestWithServices] as
SELECT Request.Id, Request.DateOfCreation, Client.LastName+' '+LEFT(Client.FirstName, 1)+'. ' + LEFT(Client.Patronymic, 1)+'.' as ClientInfo, Employee.LastName +' '+LEFT(Employee.FirstName, 1)+'. ' + LEFT(Employee.Patronymic, 1)+'.' as UserInfo, 
        STUFF((SELECT ', '+Service.Title FROM Service 
        JOIN RequestServices ON Service.Id = RequestServices.ServiceId
        WHERE Request.Id = RequestServices.RequestId
        FOR xml path('')), 1, 1, '') Services, (SELECT SUM(Service.Cost) FROM Service JOIN RequestServices ON Service.Id = RequestServices.ServiceId
        WHERE Request.Id = RequestServices.RequestId ) as Summ
FROM Request, Client, [User], Employee
WHERE Client.Id = Request.ClientId
AND [User].Id = Request.UserId AND Employee.Id = [User].EmployeeId;
GO
/****** Object:  Table [dbo].[Analyzes]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analyzes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestServicesId] [int] NOT NULL,
	[DateCompletion] [datetime] NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Analyzes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorizationHistory]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorizationHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Successfully] [bit] NOT NULL,
 CONSTRAINT [PK_AuthorizationHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 01.06.2021 18:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Analyzes] ON 

INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (14, 4, CAST(N'2021-05-15T00:00:00.000' AS DateTime), N'Понижен гемоглобин; повышены эритроциты; все остальные показатели в норме')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (15, 51, CAST(N'2021-05-31T00:00:00.000' AS DateTime), N'Повышен уровень лейкоцитов; все остальные показатели в норме')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (16, 72, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Подозрение глоумеронефрит')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (17, 20, CAST(N'2021-05-26T00:00:00.000' AS DateTime), N'Аллерген не обнаружен')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (18, 66, CAST(N'2021-05-20T00:00:00.000' AS DateTime), N'Аллерген обнаружен')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (20, 74, CAST(N'2021-05-17T00:00:00.000' AS DateTime), N'Аллерген не обнаружен')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (21, 22, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Обнаружен пролапс метрального клапона 1 степени')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (22, 21, CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'Нарушение углеводного обмена')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (23, 65, CAST(N'2021-06-02T00:00:00.000' AS DateTime), N'Обнаружен гипотиреоз')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (24, 78, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Нарушено питание, обнаружена гипопротеинемия')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (25, 71, CAST(N'2021-06-03T00:00:00.000' AS DateTime), N'Отсутствие разграничения стенки на нормальные слои')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (26, 75, CAST(N'2021-06-03T00:00:00.000' AS DateTime), N'Варикозно расширенные вены желудка')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (27, 77, CAST(N'2021-06-04T00:00:00.000' AS DateTime), N'Воспаление внутренней полости органа')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (28, 70, CAST(N'2021-06-05T00:00:00.000' AS DateTime), N'Гепатит в острой и хронической форме')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (29, 79, CAST(N'2021-06-04T00:00:00.000' AS DateTime), N'Цирроз печени')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (30, 68, CAST(N'2021-06-01T00:00:00.000' AS DateTime), N'Дыхательная синусовая аритмия')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (31, 76, CAST(N'2021-06-03T00:00:00.000' AS DateTime), N'Узловая экстрасистология')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (32, 67, CAST(N'2021-06-04T00:00:00.000' AS DateTime), N'Обнаружен перелом тазобедренной кости')
INSERT [dbo].[Analyzes] ([Id], [RequestServicesId], [DateCompletion], [Result]) VALUES (33, 69, CAST(N'2021-06-08T00:00:00.000' AS DateTime), N'Обнаружена доброкачественная опухоль')
SET IDENTITY_INSERT [dbo].[Analyzes] OFF
GO
SET IDENTITY_INSERT [dbo].[AuthorizationHistory] ON 

INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (1, 2, CAST(N'2021-05-09T12:29:11.653' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (2, 1, CAST(N'2021-05-09T13:05:56.700' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (3, 1, CAST(N'2021-05-09T13:17:42.603' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (4, 2, CAST(N'2021-05-09T13:17:53.837' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (5, 1, CAST(N'2021-05-09T13:18:43.250' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (6, 3, CAST(N'2021-05-09T13:20:44.550' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (7, 3, CAST(N'2021-05-09T13:23:38.017' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (8, 3, CAST(N'2021-05-09T13:24:11.957' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (9, 1, CAST(N'2021-05-09T13:27:53.543' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (10, 1, CAST(N'2021-05-09T13:44:01.737' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (11, 1, CAST(N'2021-05-09T13:44:30.527' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (12, 1, CAST(N'2021-05-09T13:44:58.233' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (13, 1, CAST(N'2021-05-09T13:47:04.260' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (14, 1, CAST(N'2021-05-09T14:10:08.037' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (15, 2, CAST(N'2021-05-09T14:10:23.507' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (16, 2, CAST(N'2021-05-09T14:13:00.260' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (17, 2, CAST(N'2021-05-09T14:20:42.807' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (18, 2, CAST(N'2021-05-09T14:21:03.267' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (19, 1, CAST(N'2021-05-09T14:31:01.507' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (20, 1, CAST(N'2021-05-09T14:32:07.153' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (21, 1, CAST(N'2021-05-09T14:33:33.747' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (22, 1, CAST(N'2021-05-09T14:33:37.550' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (23, 2, CAST(N'2021-05-09T14:33:54.300' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (24, 1, CAST(N'2021-05-09T14:40:29.043' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (25, 1, CAST(N'2021-05-09T14:40:48.900' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (26, 1, CAST(N'2021-05-09T14:46:25.510' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (27, 1, CAST(N'2021-05-09T14:50:52.660' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (28, 1, CAST(N'2021-05-09T15:02:00.723' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (29, 1, CAST(N'2021-05-09T15:03:13.800' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (30, 1, CAST(N'2021-05-09T15:48:04.377' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (31, 1, CAST(N'2021-05-09T15:50:13.230' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (32, 1, CAST(N'2021-05-09T16:00:12.623' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (33, 1, CAST(N'2021-05-09T16:02:32.487' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (34, 2, CAST(N'2021-05-09T16:02:52.553' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (35, 1, CAST(N'2021-05-09T16:05:09.173' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (36, 1, CAST(N'2021-05-09T16:05:42.087' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (37, 2, CAST(N'2021-05-09T16:06:35.873' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (38, 1, CAST(N'2021-05-09T16:13:51.720' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (39, 1, CAST(N'2021-05-09T16:34:05.613' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (40, 2, CAST(N'2021-05-09T16:45:26.533' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (41, 2, CAST(N'2021-05-09T17:04:53.787' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (42, 2, CAST(N'2021-05-09T17:09:41.177' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (43, 2, CAST(N'2021-05-09T17:23:48.730' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (44, 1, CAST(N'2021-05-09T17:24:45.540' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (45, 2, CAST(N'2021-05-09T17:24:58.230' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (46, 3, CAST(N'2021-05-09T17:39:54.630' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (47, 1, CAST(N'2021-05-09T17:40:32.503' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (48, 3, CAST(N'2021-05-09T17:40:57.003' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (49, 3, CAST(N'2021-05-09T17:47:40.440' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (50, 2, CAST(N'2021-05-09T17:47:51.983' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (51, 1, CAST(N'2021-05-09T17:47:59.273' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (52, 3, CAST(N'2021-05-09T17:48:25.450' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (53, 3, CAST(N'2021-05-09T17:49:02.427' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (54, 2, CAST(N'2021-05-09T18:36:42.270' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (55, 1, CAST(N'2021-05-09T19:28:21.247' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (56, 1, CAST(N'2021-05-09T19:32:33.473' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (57, 2, CAST(N'2021-05-09T19:33:02.623' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (58, 3, CAST(N'2021-05-09T19:33:25.107' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (59, 1, CAST(N'2021-05-09T19:36:26.520' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (60, 1, CAST(N'2021-05-09T19:51:33.080' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (61, 1, CAST(N'2021-05-09T19:59:16.927' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (62, 1, CAST(N'2021-05-09T20:05:45.053' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (63, 1, CAST(N'2021-05-09T20:14:11.773' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (64, 1, CAST(N'2021-05-09T20:20:51.973' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (65, 1, CAST(N'2021-05-09T20:47:53.217' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (66, 1, CAST(N'2021-05-09T20:49:53.500' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (67, 2, CAST(N'2021-05-09T20:55:23.563' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (68, 1, CAST(N'2021-05-09T20:58:56.333' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (69, 1, CAST(N'2021-05-09T21:03:05.593' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (70, 2, CAST(N'2021-05-09T21:04:28.990' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (71, 1, CAST(N'2021-05-09T21:05:27.537' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (72, 1, CAST(N'2021-05-09T21:06:11.357' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (73, 1, CAST(N'2021-05-09T21:07:54.633' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (74, 1, CAST(N'2021-05-09T21:09:05.690' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (75, 1, CAST(N'2021-05-09T21:17:09.687' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (76, 1, CAST(N'2021-05-09T21:17:53.307' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (77, 1, CAST(N'2021-05-09T21:19:26.843' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (78, 1, CAST(N'2021-05-09T21:21:46.990' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (79, 1, CAST(N'2021-05-09T23:35:06.400' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (80, 1, CAST(N'2021-05-09T23:36:36.127' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (81, 1, CAST(N'2021-05-09T23:38:08.523' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (82, 1, CAST(N'2021-05-09T23:39:39.187' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (83, 1, CAST(N'2021-05-09T23:40:06.157' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (84, 1, CAST(N'2021-05-09T23:41:05.613' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (85, 1, CAST(N'2021-05-09T23:41:34.897' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (86, 1, CAST(N'2021-05-09T23:45:53.353' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (87, 1, CAST(N'2021-05-09T23:47:18.317' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (88, 1, CAST(N'2021-05-09T23:48:04.417' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (89, 1, CAST(N'2021-05-09T23:48:39.573' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (90, 1, CAST(N'2021-05-09T23:49:26.360' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (91, 1, CAST(N'2021-05-09T23:58:42.580' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (92, 1, CAST(N'2021-05-10T00:00:58.727' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (93, 1, CAST(N'2021-05-10T00:05:20.133' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (94, 1, CAST(N'2021-05-10T00:10:02.100' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (95, 1, CAST(N'2021-05-10T00:10:43.250' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (96, 1, CAST(N'2021-05-10T00:11:41.013' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (97, 1, CAST(N'2021-05-10T00:12:50.887' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (98, 1, CAST(N'2021-05-10T00:14:36.953' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (99, 1, CAST(N'2021-05-10T00:16:48.360' AS DateTime), 1)
GO
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (100, 1, CAST(N'2021-05-10T00:17:23.483' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (101, 1, CAST(N'2021-05-10T00:18:07.603' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (102, 1, CAST(N'2021-05-10T00:18:27.883' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (103, 1, CAST(N'2021-05-10T00:19:49.210' AS DateTime), 0)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (104, 1, CAST(N'2021-05-10T00:19:56.647' AS DateTime), 0)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (105, 1, CAST(N'2021-05-10T00:20:04.897' AS DateTime), 0)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (106, 1, CAST(N'2021-05-10T00:20:10.893' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (107, 1, CAST(N'2021-05-10T00:25:37.457' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (108, 1, CAST(N'2021-05-10T00:26:18.727' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (109, 2, CAST(N'2021-05-10T00:28:44.763' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (110, 1, CAST(N'2021-05-10T12:13:40.033' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (111, 1, CAST(N'2021-05-10T13:51:40.880' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (112, 2, CAST(N'2021-05-10T13:52:12.397' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (113, 1, CAST(N'2021-05-10T14:27:35.900' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (114, 1, CAST(N'2021-05-10T14:28:11.713' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (115, 1, CAST(N'2021-05-10T14:28:34.037' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (116, 1, CAST(N'2021-05-10T14:29:02.163' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (117, 1, CAST(N'2021-05-10T14:29:29.313' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (118, 1, CAST(N'2021-05-10T14:32:42.233' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (119, 1, CAST(N'2021-05-10T22:55:19.113' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (120, 2, CAST(N'2021-05-10T22:57:10.410' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (121, 1, CAST(N'2021-05-10T23:09:40.527' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (122, 1, CAST(N'2021-05-11T11:09:09.513' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (123, 2, CAST(N'2021-05-11T11:10:43.810' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (124, 1, CAST(N'2021-05-11T16:10:33.887' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (125, 1, CAST(N'2021-05-11T16:11:03.503' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (126, 1, CAST(N'2021-05-11T16:22:06.263' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (127, 1, CAST(N'2021-05-11T16:28:57.447' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (128, 1, CAST(N'2021-05-11T16:35:37.503' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (129, 1, CAST(N'2021-05-11T16:37:05.270' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (130, 1, CAST(N'2021-05-11T16:44:47.680' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (131, 1, CAST(N'2021-05-11T16:58:39.537' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (132, 1, CAST(N'2021-05-12T09:43:58.610' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (133, 1, CAST(N'2021-05-12T09:48:34.483' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (134, 1, CAST(N'2021-05-12T14:56:16.697' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (135, 1, CAST(N'2021-05-12T14:56:35.570' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (136, 1, CAST(N'2021-05-12T15:00:49.163' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (137, 1, CAST(N'2021-05-12T15:05:31.710' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (138, 1, CAST(N'2021-05-12T15:05:41.997' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (139, 1, CAST(N'2021-05-12T15:10:48.717' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (140, 1, CAST(N'2021-05-12T15:11:07.423' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (141, 1, CAST(N'2021-05-12T15:12:11.980' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (142, 1, CAST(N'2021-05-12T15:14:11.637' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (143, 1, CAST(N'2021-05-12T15:14:24.753' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (144, 1, CAST(N'2021-05-12T15:14:55.267' AS DateTime), 0)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (145, 1, CAST(N'2021-05-12T15:14:59.560' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (146, 1, CAST(N'2021-05-12T21:23:48.727' AS DateTime), 0)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (147, 1, CAST(N'2021-05-12T21:23:55.577' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (148, 1, CAST(N'2021-05-12T21:28:51.403' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (149, 1, CAST(N'2021-05-12T21:30:17.777' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (150, 1, CAST(N'2021-05-12T21:52:24.177' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (151, 1, CAST(N'2021-05-12T22:01:27.360' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (152, 1, CAST(N'2021-05-12T22:03:33.363' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (153, 1, CAST(N'2021-05-12T22:07:49.217' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (154, 1, CAST(N'2021-05-12T22:08:46.213' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (155, 1, CAST(N'2021-05-12T22:11:37.930' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (156, 1, CAST(N'2021-05-12T22:16:50.197' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (157, 1, CAST(N'2021-05-12T22:17:17.767' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (158, 1, CAST(N'2021-05-12T22:30:29.030' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (159, 1, CAST(N'2021-05-12T22:36:06.973' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (160, 1, CAST(N'2021-05-12T22:36:36.860' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (161, 1, CAST(N'2021-05-12T22:39:01.107' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (162, 1, CAST(N'2021-05-12T22:40:16.187' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (163, 1, CAST(N'2021-05-12T22:40:57.620' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (164, 1, CAST(N'2021-05-12T22:45:21.570' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (165, 1, CAST(N'2021-05-12T22:47:42.630' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (166, 1, CAST(N'2021-05-12T22:57:06.053' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (167, 1, CAST(N'2021-05-12T22:58:03.220' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (168, 1, CAST(N'2021-05-12T23:03:45.667' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (169, 1, CAST(N'2021-05-13T21:10:44.267' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (170, 1, CAST(N'2021-05-13T21:21:27.790' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (171, 1, CAST(N'2021-05-13T23:07:05.260' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (172, 1, CAST(N'2021-05-13T23:13:42.190' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (173, 1, CAST(N'2021-05-13T23:14:25.340' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (174, 1, CAST(N'2021-05-13T23:14:57.890' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (175, 1, CAST(N'2021-05-13T23:16:33.370' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (176, 1, CAST(N'2021-05-13T23:22:12.473' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (177, 1, CAST(N'2021-05-13T23:23:40.990' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (178, 1, CAST(N'2021-05-13T23:24:50.110' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (179, 1, CAST(N'2021-05-13T23:25:26.263' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (180, 1, CAST(N'2021-05-13T23:27:18.873' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (181, 1, CAST(N'2021-05-13T23:27:40.183' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (182, 1, CAST(N'2021-05-13T23:33:45.747' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (183, 1, CAST(N'2021-05-13T23:35:20.823' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (184, 1, CAST(N'2021-05-13T23:38:32.457' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (185, 1, CAST(N'2021-05-13T23:42:36.703' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (186, 1, CAST(N'2021-05-13T23:43:41.127' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (187, 1, CAST(N'2021-05-13T23:44:06.190' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (188, 1, CAST(N'2021-05-14T22:34:33.087' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (189, 1, CAST(N'2021-05-14T22:43:28.433' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (190, 1, CAST(N'2021-05-14T22:46:12.530' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (191, 1, CAST(N'2021-05-14T22:50:38.043' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (192, 1, CAST(N'2021-05-14T22:53:00.330' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (193, 1, CAST(N'2021-05-14T22:56:03.743' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (194, 1, CAST(N'2021-05-14T23:00:25.103' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (195, 1, CAST(N'2021-05-14T23:06:47.320' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (196, 1, CAST(N'2021-05-14T23:07:57.347' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (197, 1, CAST(N'2021-05-14T23:08:15.477' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (198, 1, CAST(N'2021-05-14T23:08:40.597' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (199, 1, CAST(N'2021-05-14T23:09:31.567' AS DateTime), 1)
GO
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (200, 1, CAST(N'2021-05-14T23:11:40.523' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (201, 1, CAST(N'2021-05-15T10:56:58.303' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (204, 1, CAST(N'2021-05-15T10:58:03.710' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (205, 1, CAST(N'2021-05-15T10:59:12.570' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (206, 1, CAST(N'2021-05-15T11:00:45.927' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (207, 1, CAST(N'2021-05-15T11:03:20.663' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (208, 3, CAST(N'2021-05-16T06:12:00.733' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (209, 3, CAST(N'2021-05-16T06:42:01.640' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (210, 3, CAST(N'2021-05-16T06:46:17.690' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (211, 3, CAST(N'2021-05-16T06:48:56.223' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (212, 3, CAST(N'2021-05-16T06:51:32.667' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (213, 3, CAST(N'2021-05-16T06:57:22.187' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (214, 3, CAST(N'2021-05-16T06:58:14.210' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (215, 2, CAST(N'2021-05-16T06:59:09.857' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (216, 3, CAST(N'2021-05-16T07:50:44.403' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (217, 3, CAST(N'2021-05-16T07:54:43.333' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (218, 3, CAST(N'2021-05-16T07:55:26.320' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (219, 3, CAST(N'2021-05-16T07:56:17.747' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (220, 3, CAST(N'2021-05-16T07:59:08.020' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (221, 2, CAST(N'2021-05-16T08:02:45.517' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (222, 2, CAST(N'2021-05-16T11:34:20.597' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (223, 2, CAST(N'2021-05-16T11:36:12.000' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (224, 2, CAST(N'2021-05-16T11:41:20.460' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (225, 3, CAST(N'2021-05-16T11:41:35.617' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (226, 2, CAST(N'2021-05-16T11:41:53.813' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (227, 2, CAST(N'2021-05-16T11:44:33.163' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (228, 2, CAST(N'2021-05-16T11:50:10.900' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (229, 2, CAST(N'2021-05-16T11:52:53.443' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (230, 2, CAST(N'2021-05-16T11:53:30.683' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (231, 2, CAST(N'2021-05-16T11:55:09.610' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (232, 2, CAST(N'2021-05-16T12:07:24.413' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (233, 2, CAST(N'2021-05-16T12:08:39.890' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (234, 2, CAST(N'2021-05-16T12:13:08.810' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (235, 2, CAST(N'2021-05-16T12:24:49.790' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (236, 2, CAST(N'2021-05-16T12:25:30.727' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (237, 2, CAST(N'2021-05-16T12:56:41.500' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (238, 2, CAST(N'2021-05-16T12:58:00.167' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (239, 2, CAST(N'2021-05-16T12:58:39.780' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (240, 2, CAST(N'2021-05-16T12:59:34.327' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (241, 2, CAST(N'2021-05-16T13:08:58.077' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (242, 2, CAST(N'2021-05-16T13:25:15.363' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (243, 2, CAST(N'2021-05-16T14:27:54.940' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (244, 2, CAST(N'2021-05-16T14:32:31.743' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (245, 2, CAST(N'2021-05-16T14:37:45.453' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (246, 2, CAST(N'2021-05-16T15:21:44.813' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (247, 2, CAST(N'2021-05-16T15:24:01.060' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (248, 2, CAST(N'2021-05-16T15:26:16.800' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (249, 2, CAST(N'2021-05-16T15:27:50.960' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (250, 2, CAST(N'2021-05-16T15:31:00.543' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (251, 2, CAST(N'2021-05-16T15:33:37.280' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (252, 2, CAST(N'2021-05-16T15:36:54.823' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (253, 2, CAST(N'2021-05-16T15:37:49.593' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (254, 2, CAST(N'2021-05-16T15:38:44.080' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (255, 3, CAST(N'2021-05-16T21:14:04.257' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (256, 3, CAST(N'2021-05-16T21:15:51.900' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (257, 3, CAST(N'2021-05-16T21:17:08.047' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (258, 3, CAST(N'2021-05-16T21:19:34.187' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (259, 3, CAST(N'2021-05-16T21:22:22.317' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (260, 3, CAST(N'2021-05-16T21:24:33.273' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (261, 3, CAST(N'2021-05-16T21:25:13.193' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (262, 3, CAST(N'2021-05-16T23:13:45.127' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (263, 3, CAST(N'2021-05-16T23:14:33.573' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (264, 3, CAST(N'2021-05-17T10:39:34.493' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (265, 3, CAST(N'2021-05-17T10:40:14.743' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (266, 3, CAST(N'2021-05-17T10:43:53.383' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (267, 3, CAST(N'2021-05-17T10:46:58.917' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (268, 3, CAST(N'2021-05-17T11:03:19.760' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (269, 3, CAST(N'2021-05-17T11:51:16.770' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (270, 3, CAST(N'2021-05-17T11:54:02.497' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (271, 3, CAST(N'2021-05-17T11:57:09.097' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (272, 3, CAST(N'2021-05-17T12:04:31.457' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (273, 3, CAST(N'2021-05-17T12:05:06.400' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (274, 3, CAST(N'2021-05-17T12:05:35.977' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (275, 3, CAST(N'2021-05-17T12:08:23.177' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (276, 3, CAST(N'2021-05-17T12:13:32.940' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (277, 2, CAST(N'2021-05-17T23:03:56.077' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (278, 2, CAST(N'2021-05-17T23:04:46.327' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (279, 2, CAST(N'2021-05-17T23:08:03.110' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (280, 2, CAST(N'2021-05-17T23:12:15.417' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (281, 2, CAST(N'2021-05-18T17:26:21.933' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (282, 3, CAST(N'2021-05-18T17:26:31.983' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (283, 3, CAST(N'2021-05-18T17:56:50.533' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (284, 3, CAST(N'2021-05-18T18:18:50.523' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (285, 3, CAST(N'2021-05-18T18:42:10.837' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (286, 3, CAST(N'2021-05-18T18:45:29.657' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (287, 3, CAST(N'2021-05-18T19:06:37.317' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (288, 3, CAST(N'2021-05-18T19:07:13.300' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (289, 3, CAST(N'2021-05-18T22:17:20.657' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (290, 3, CAST(N'2021-05-19T17:19:40.453' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (291, 1, CAST(N'2021-05-19T20:26:46.183' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (292, 2, CAST(N'2021-05-19T20:28:21.700' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (293, 3, CAST(N'2021-05-19T20:29:10.273' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (294, 1, CAST(N'2021-05-19T20:30:46.373' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (295, 3, CAST(N'2021-05-19T22:32:41.360' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (296, 3, CAST(N'2021-05-19T22:33:23.060' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (297, 3, CAST(N'2021-05-19T22:40:53.503' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (298, 3, CAST(N'2021-05-20T20:59:04.203' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (299, 3, CAST(N'2021-05-20T21:00:30.793' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (300, 3, CAST(N'2021-05-20T21:01:10.117' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (301, 3, CAST(N'2021-05-20T21:01:53.070' AS DateTime), 1)
GO
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (302, 3, CAST(N'2021-05-20T21:02:35.263' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (303, 3, CAST(N'2021-05-20T21:03:27.433' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (304, 3, CAST(N'2021-05-20T21:04:18.987' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (305, 3, CAST(N'2021-05-20T21:05:31.460' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (306, 3, CAST(N'2021-05-20T21:08:54.063' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (307, 3, CAST(N'2021-05-20T21:09:49.493' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (308, 3, CAST(N'2021-05-20T21:10:20.143' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (309, 3, CAST(N'2021-05-20T21:11:44.583' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (310, 3, CAST(N'2021-05-20T21:12:28.207' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (311, 3, CAST(N'2021-05-20T21:19:26.350' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (312, 3, CAST(N'2021-05-20T21:20:29.763' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (313, 3, CAST(N'2021-05-20T21:21:12.527' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (314, 3, CAST(N'2021-05-20T21:22:03.420' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (315, 3, CAST(N'2021-05-20T21:24:04.100' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (316, 3, CAST(N'2021-05-20T21:24:49.900' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (317, 3, CAST(N'2021-05-20T21:26:30.747' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (318, 3, CAST(N'2021-05-20T21:27:52.767' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (319, 3, CAST(N'2021-05-20T21:28:38.157' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (320, 3, CAST(N'2021-05-20T21:29:15.157' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (321, 3, CAST(N'2021-05-20T21:30:03.870' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (322, 3, CAST(N'2021-05-20T21:32:20.260' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (323, 3, CAST(N'2021-05-20T21:34:28.107' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (324, 3, CAST(N'2021-05-20T21:35:30.053' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (325, 3, CAST(N'2021-05-20T21:37:04.230' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (326, 3, CAST(N'2021-05-20T21:39:22.240' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (327, 3, CAST(N'2021-05-20T21:41:00.983' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (328, 3, CAST(N'2021-05-20T21:44:42.770' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (329, 3, CAST(N'2021-05-20T21:45:16.080' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (330, 3, CAST(N'2021-05-20T21:47:37.700' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (331, 3, CAST(N'2021-05-20T21:49:07.653' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (332, 3, CAST(N'2021-05-20T21:57:12.683' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (333, 3, CAST(N'2021-05-20T22:07:03.903' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (334, 3, CAST(N'2021-05-20T22:20:49.543' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (335, 3, CAST(N'2021-05-20T22:22:21.513' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (336, 3, CAST(N'2021-05-20T22:23:31.250' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (337, 3, CAST(N'2021-05-20T22:26:00.143' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (338, 3, CAST(N'2021-05-20T22:28:19.720' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (339, 3, CAST(N'2021-05-20T22:30:48.870' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (340, 3, CAST(N'2021-05-20T22:35:06.563' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (341, 3, CAST(N'2021-05-20T22:36:09.453' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (342, 3, CAST(N'2021-05-20T22:36:40.393' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (343, 3, CAST(N'2021-05-20T22:37:59.380' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (344, 3, CAST(N'2021-05-20T22:38:50.517' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (345, 3, CAST(N'2021-05-20T22:40:27.420' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (346, 3, CAST(N'2021-05-20T22:43:03.833' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (347, 3, CAST(N'2021-05-20T22:47:14.183' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (348, 3, CAST(N'2021-05-20T22:47:41.050' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (349, 3, CAST(N'2021-05-20T22:50:23.807' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (350, 3, CAST(N'2021-05-20T22:51:13.340' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (351, 3, CAST(N'2021-05-20T22:51:51.997' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (352, 3, CAST(N'2021-05-20T22:52:37.807' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (353, 3, CAST(N'2021-05-20T22:53:36.810' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (354, 3, CAST(N'2021-05-20T22:54:06.860' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (355, 3, CAST(N'2021-05-20T22:56:13.063' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (356, 3, CAST(N'2021-05-20T22:57:15.570' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (357, 3, CAST(N'2021-05-20T22:57:50.703' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (358, 3, CAST(N'2021-05-20T23:01:19.617' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (359, 3, CAST(N'2021-05-20T23:02:36.350' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (360, 3, CAST(N'2021-05-20T23:07:26.120' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (361, 3, CAST(N'2021-05-20T23:13:00.853' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (362, 3, CAST(N'2021-05-20T23:24:42.893' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (363, 3, CAST(N'2021-05-21T00:11:57.987' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (364, 3, CAST(N'2021-05-21T08:33:21.730' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (365, 3, CAST(N'2021-05-21T08:35:30.420' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (366, 2, CAST(N'2021-05-21T18:20:10.870' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (367, 2, CAST(N'2021-05-21T18:23:10.180' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (368, 2, CAST(N'2021-05-21T18:49:35.093' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (369, 2, CAST(N'2021-05-21T18:50:21.097' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (370, 2, CAST(N'2021-05-21T18:57:20.340' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (371, 2, CAST(N'2021-05-21T19:01:01.290' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (372, 2, CAST(N'2021-05-21T19:02:22.043' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (373, 2, CAST(N'2021-05-21T19:03:44.427' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (374, 2, CAST(N'2021-05-21T19:04:54.337' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (375, 2, CAST(N'2021-05-21T19:07:48.743' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (376, 2, CAST(N'2021-05-21T19:09:30.840' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (377, 2, CAST(N'2021-05-21T19:11:24.013' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (378, 2, CAST(N'2021-05-21T19:14:06.120' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (379, 2, CAST(N'2021-05-21T19:17:11.660' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (380, 2, CAST(N'2021-05-21T19:18:20.967' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (381, 2, CAST(N'2021-05-21T19:39:41.310' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (382, 2, CAST(N'2021-05-21T19:43:00.520' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (383, 2, CAST(N'2021-05-21T19:43:40.003' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (384, 2, CAST(N'2021-05-21T19:45:02.567' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (385, 2, CAST(N'2021-05-21T19:47:12.913' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (386, 2, CAST(N'2021-05-21T19:49:05.360' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (387, 2, CAST(N'2021-05-21T19:53:15.460' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (388, 2, CAST(N'2021-05-21T19:54:31.117' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (389, 2, CAST(N'2021-05-21T20:00:23.100' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (390, 2, CAST(N'2021-05-21T20:01:55.977' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (391, 2, CAST(N'2021-05-21T20:02:28.083' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (392, 2, CAST(N'2021-05-21T20:04:20.293' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (393, 2, CAST(N'2021-05-21T20:05:33.937' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (394, 2, CAST(N'2021-05-21T20:08:34.633' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (395, 2, CAST(N'2021-05-21T20:10:38.227' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (396, 2, CAST(N'2021-05-21T20:12:39.280' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (397, 2, CAST(N'2021-05-21T20:13:53.770' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (398, 2, CAST(N'2021-05-21T20:14:51.813' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (399, 2, CAST(N'2021-05-21T20:17:20.280' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (400, 2, CAST(N'2021-05-21T21:07:23.690' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (401, 2, CAST(N'2021-05-21T21:09:09.240' AS DateTime), 1)
GO
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (402, 2, CAST(N'2021-05-21T21:10:32.900' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (403, 2, CAST(N'2021-05-21T21:12:28.597' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (404, 2, CAST(N'2021-05-21T21:13:18.220' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (405, 2, CAST(N'2021-05-21T21:17:48.917' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (406, 2, CAST(N'2021-05-21T21:18:52.720' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (407, 2, CAST(N'2021-05-21T21:19:58.460' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (408, 2, CAST(N'2021-05-21T21:33:10.803' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (409, 2, CAST(N'2021-05-21T21:33:49.793' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (410, 3, CAST(N'2021-05-21T21:41:32.317' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (411, 3, CAST(N'2021-05-21T21:42:21.030' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (412, 3, CAST(N'2021-05-21T21:47:56.603' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (413, 3, CAST(N'2021-05-21T21:49:51.193' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (414, 3, CAST(N'2021-05-21T21:50:44.710' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (415, 3, CAST(N'2021-05-21T21:51:41.437' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (416, 1, CAST(N'2021-05-21T22:01:25.477' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (417, 1, CAST(N'2021-05-21T22:10:03.587' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (418, 2, CAST(N'2021-05-21T22:11:03.937' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (419, 1, CAST(N'2021-05-21T22:11:15.020' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (420, 2, CAST(N'2021-05-21T22:12:37.247' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (421, 2, CAST(N'2021-05-21T22:17:08.743' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (422, 3, CAST(N'2021-05-21T22:17:41.373' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (423, 1, CAST(N'2021-05-21T22:32:47.300' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (424, 2, CAST(N'2021-05-21T22:36:49.030' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (425, 3, CAST(N'2021-05-21T22:37:26.940' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (426, 1, CAST(N'2021-05-21T22:43:01.487' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (427, 2, CAST(N'2021-05-21T22:43:19.940' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (428, 3, CAST(N'2021-05-21T22:43:36.227' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (429, 1, CAST(N'2021-05-21T22:50:49.977' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (430, 2, CAST(N'2021-05-22T23:39:46.347' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (431, 2, CAST(N'2021-05-23T11:41:48.023' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (432, 2, CAST(N'2021-05-23T11:43:19.933' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (433, 2, CAST(N'2021-05-23T11:47:10.300' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (434, 2, CAST(N'2021-05-23T11:49:43.067' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (435, 2, CAST(N'2021-05-23T11:51:41.000' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (436, 2, CAST(N'2021-05-23T11:53:58.053' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (437, 2, CAST(N'2021-05-23T11:57:44.963' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (438, 2, CAST(N'2021-05-23T12:01:00.163' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (439, 2, CAST(N'2021-05-23T12:03:34.813' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (440, 2, CAST(N'2021-05-23T12:04:49.177' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (441, 2, CAST(N'2021-05-23T12:06:24.270' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (442, 2, CAST(N'2021-05-23T12:07:28.763' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (443, 2, CAST(N'2021-05-23T12:09:40.090' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (444, 2, CAST(N'2021-05-23T12:10:17.737' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (445, 2, CAST(N'2021-05-23T12:11:49.427' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (446, 2, CAST(N'2021-05-23T12:12:43.123' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (447, 2, CAST(N'2021-05-23T12:13:41.820' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (448, 2, CAST(N'2021-05-23T12:15:37.030' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (449, 2, CAST(N'2021-05-23T12:16:14.553' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (450, 2, CAST(N'2021-05-23T12:19:21.307' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (451, 2, CAST(N'2021-05-23T19:51:36.083' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (452, 2, CAST(N'2021-05-23T19:54:33.120' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (453, 3, CAST(N'2021-05-26T21:59:32.847' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (454, 3, CAST(N'2021-05-26T22:02:46.953' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (455, 3, CAST(N'2021-05-26T22:05:23.840' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (456, 2, CAST(N'2021-05-27T01:31:41.440' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (457, 2, CAST(N'2021-05-27T03:16:00.880' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (458, 2, CAST(N'2021-05-27T03:17:01.453' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (459, 2, CAST(N'2021-05-27T03:19:22.750' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (460, 2, CAST(N'2021-05-27T03:33:26.297' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (461, 3, CAST(N'2021-05-27T03:42:08.173' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (462, 2, CAST(N'2021-05-31T18:21:40.893' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (463, 1, CAST(N'2021-05-31T18:23:29.137' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (464, 5, CAST(N'2021-05-31T18:27:29.343' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (465, 5, CAST(N'2021-05-31T18:31:54.437' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (473, 5, CAST(N'2021-05-31T18:38:49.663' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (475, 2, CAST(N'2021-05-31T18:40:38.157' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (476, 2, CAST(N'2021-05-31T18:40:54.120' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (477, 10, CAST(N'2021-05-31T18:42:45.360' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (479, 2, CAST(N'2021-05-31T18:52:43.317' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (480, 3, CAST(N'2021-05-31T19:20:35.150' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (481, 3, CAST(N'2021-05-31T19:35:44.373' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (482, 3, CAST(N'2021-05-31T19:38:07.813' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (483, 2, CAST(N'2021-06-01T09:17:02.690' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (484, 1, CAST(N'2021-06-01T14:56:07.337' AS DateTime), 1)
INSERT [dbo].[AuthorizationHistory] ([Id], [UserId], [Date], [Successfully]) VALUES (485, 1, CAST(N'2021-06-01T14:56:42.443' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AuthorizationHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (1, N'Федотов', N'Осип', N'Анатольевич', N'+7 (590) 702-33-06')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (2, N'Дементьев', N'Вадим', N'Ростиславович', N'+7 (792) 330-46-15')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (3, N'Александров', N'Станислав', N'Эдуардович', N'+7 (183) 164-05-12')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (4, N'Ефремов', N'Витольд', N'Авксентьевич', N'+7 (931) 922-14-03')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (5, N'Белозёрова', N'Диана', N'Антоновна', N'+7 (999) 174-59-87')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (6, N'Комиссарова', N'Амалия', N'Робертовна', N'+7 (224) 647-46-32')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (7, N'Ершов', N'Глеб', N'Федорович', N'+7 (268) 298-40-82')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (8, N'Лазарев', N'Алексей', N'Богданович', N'+7 (055) 737-37-48')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (9, N'Андреева', N'Патрисия', N'Валерьевна', N'+7 (968) 953-81-26')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (10, N'Овчинникова', N'Лаура', N'Еремеевна', N'+7 (853) 829-33-79')
INSERT [dbo].[Client] ([Id], [LastName], [FirstName], [Patronymic], [Phone]) VALUES (22, N'ШПАК', N'АРТЕМ', N'Юрьевич', N'+7 (967) 329-42-13')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (1, N'Смирнов', N'Мартын', N'Арсеньевич', 1, N'+7 (912) 843-41-82', N'haddawy@live.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (2, N'Большаков', N'Вадим', N'Данилович', 2, N'+7 (386) 641-13-37', N'uncle@gmail.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (3, N'Афанасьева', N'Розалия', N'Макаровна', 3, N'+7 (661) 413-23-32', N'malattia@hotmail.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (4, N'Галкин', N'Эрик', N'Онисимович', 3, N'+7 (759) 873-77-39', N'snunez@verizon.net')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (5, N'Гусева', N'Роза', N'Дмитриевна', 2, N'+7 (232) 064-51-84', N'martyloo@live.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (7, N'Силин', N'Глеб', N'Мэлсович', 1, N'+7 (928) 397-23-23', N'rjones@aol.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (12, N'Журавлёв', N'Леонтий', N'Яковлевич', 1, N'+7 (403) 308-56-96', N'cmdrgravy@me.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (14, N'Арькова', N'Александра', N'Олеговна', 2, N'+7 (795) 330-46-15', N'jacks@aol.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (15, N'Костина', N'Любава', N'Авксентьевна', 3, N'+7 (619) 959-21-87', N'gordonjcp@hotmail.com')
INSERT [dbo].[Employee] ([Id], [LastName], [FirstName], [Patronymic], [PostId], [Phone], [Email]) VALUES (16, N'Артемьева', N'Лиза', N'Максимовна', 1, N'+7 (696) 972-70-21', N'snunez@yahoo.ca')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title]) VALUES (1, N'Администратор')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (2, N'Менеджер')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (3, N'Бухгалтер')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (1, CAST(N'2021-05-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (2, CAST(N'2021-05-14T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (111, CAST(N'2021-05-21T20:04:27.950' AS DateTime), 22, 2)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (117, CAST(N'2021-05-31T18:32:09.293' AS DateTime), 10, 5)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (118, CAST(N'2021-05-31T18:32:19.603' AS DateTime), 9, 5)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (119, CAST(N'2021-05-31T18:32:28.753' AS DateTime), 8, 5)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (120, CAST(N'2021-05-31T18:33:07.587' AS DateTime), 7, 5)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (131, CAST(N'2021-05-31T18:38:58.940' AS DateTime), 6, 5)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (133, CAST(N'2021-05-31T18:40:46.463' AS DateTime), 5, 2)
INSERT [dbo].[Request] ([Id], [DateOfCreation], [ClientId], [UserId]) VALUES (134, CAST(N'2021-05-31T18:41:18.440' AS DateTime), 3, 2)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestServices] ON 

INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (4, 2, 1)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (20, 1, 3)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (21, 1, 5)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (22, 1, 4)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (51, 111, 1)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (65, 2, 5)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (66, 2, 3)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (67, 117, 11)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (68, 117, 8)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (69, 118, 12)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (70, 119, 7)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (71, 119, 6)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (72, 120, 2)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (74, 120, 3)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (75, 131, 6)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (76, 133, 8)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (77, 134, 6)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (78, 134, 5)
INSERT [dbo].[RequestServices] ([Id], [RequestId], [ServiceId]) VALUES (79, 134, 7)
SET IDENTITY_INSERT [dbo].[RequestServices] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (1, N'Общий анализ крови', 500.0000, 2, N'Указанный срок не включает день взятия биоматериала')
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (2, N'Общий анализ мочи', 300.0000, 2, N'Указанный срок не включает день взятия биоматериала')
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (3, N'Аллерген Candida albicans m5', 590.0000, 1, N'Указанный срок не включает день взятия биоматериала')
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (4, N'УЗИ сердца (ЭХОКГ)', 2500.0000, 1, NULL)
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (5, N'УЗИ мягких тканей', 1200.0000, 1, NULL)
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (6, N'УЗИ желудка', 900.0000, 1, NULL)
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (7, N'УЗИ печени', 1100.0000, 1, NULL)
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (8, N'ЭКГ (кардиограмма)', 600.0000, 5, N'')
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (11, N'Рентген', 450.0000, 1, N'')
INSERT [dbo].[Service] ([Id], [Title], [Cost], [DeadlineForCompletion], [Description]) VALUES (12, N'МРТ головного мозга', 3000.0000, 2, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (1, N'admins', N'2AEFC34200A294A3CC7DB81B43A81873', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (2, N'manager', N'1D0258C2440A8D19E716292B231E3190', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (3, N'counter', N'886BB73B3156B0AA24AAC99D2DE0B238', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (4, N'galkin_e_o', N'E10ADC3949BA59ABBE56E057F20F883E', 4)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (5, N'guseva_r_d', N'E10ADC3949BA59ABBE56E057F20F883E', 5)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (6, N'silin_g_m', N'E10ADC3949BA59ABBE56E057F20F883E', 7)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (7, N'zhuravlev_l_ya', N'E10ADC3949BA59ABBE56E057F20F883E', 12)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (9, N'kostina_l_a', N'E10ADC3949BA59ABBE56E057F20F883E', 15)
INSERT [dbo].[User] ([Id], [Login], [Password], [EmployeeId]) VALUES (10, N'artemieva_l_m', N'E10ADC3949BA59ABBE56E057F20F883E', 16)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Analyzes]  WITH CHECK ADD  CONSTRAINT [FK_Analyzes_RequestServices] FOREIGN KEY([RequestServicesId])
REFERENCES [dbo].[RequestServices] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Analyzes] CHECK CONSTRAINT [FK_Analyzes_RequestServices]
GO
ALTER TABLE [dbo].[AuthorizationHistory]  WITH CHECK ADD  CONSTRAINT [FK_AuthorizationHistory_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AuthorizationHistory] CHECK CONSTRAINT [FK_AuthorizationHistory_User]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Client]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [dbo].[RequestServices]  WITH CHECK ADD  CONSTRAINT [FK_RequestServices_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[Request] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestServices] CHECK CONSTRAINT [FK_RequestServices_Request]
GO
ALTER TABLE [dbo].[RequestServices]  WITH CHECK ADD  CONSTRAINT [FK_RequestServices_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestServices] CHECK CONSTRAINT [FK_RequestServices_Service]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Employee]
GO
USE [master]
GO
ALTER DATABASE [MedicalLaboratory] SET  READ_WRITE 
GO
