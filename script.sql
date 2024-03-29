USE [master]
GO
/****** Object:  Database [Vacancy]    Script Date: 12/2/2019 4:39:04 PM ******/
CREATE DATABASE [Vacancy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vacancy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Vacancy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vacancy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Vacancy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Vacancy] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vacancy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vacancy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vacancy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vacancy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vacancy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vacancy] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vacancy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vacancy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vacancy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vacancy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vacancy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vacancy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vacancy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vacancy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vacancy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vacancy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vacancy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vacancy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vacancy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vacancy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vacancy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vacancy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vacancy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vacancy] SET RECOVERY FULL 
GO
ALTER DATABASE [Vacancy] SET  MULTI_USER 
GO
ALTER DATABASE [Vacancy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vacancy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vacancy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vacancy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vacancy] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vacancy', N'ON'
GO
ALTER DATABASE [Vacancy] SET QUERY_STORE = OFF
GO
USE [Vacancy]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Vacancy]
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_barkodstr]    Script Date: 12/2/2019 4:39:04 PM ******/
CREATE TYPE [dbo].[nvarchar_barkodstr] FROM [nvarchar](25) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_belgeno]    Script Date: 12/2/2019 4:39:04 PM ******/
CREATE TYPE [dbo].[nvarchar_belgeno] FROM [nvarchar](20) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_evrakseri]    Script Date: 12/2/2019 4:39:04 PM ******/
CREATE TYPE [dbo].[nvarchar_evrakseri] FROM [nvarchar](6) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[nvarchar_maxhesapisimno]    Script Date: 12/2/2019 4:39:04 PM ******/
CREATE TYPE [dbo].[nvarchar_maxhesapisimno] FROM [nvarchar](90) NULL
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryLangs]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryLangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LangId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_CategoryLangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[Id] [int] NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Mesaj] [nvarchar](350) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experiences]    Script Date: 12/2/2019 4:39:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experiences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Experiences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobLangs]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobLangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[JobId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_JobLangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[JobTypeId] [int] NOT NULL,
	[ExperienceId] [int] NOT NULL,
	[Location] [int] NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Salary] [decimal](18, 0) NULL,
	[Deadline] [datetime] NOT NULL,
	[PublishDate] [datetime] NOT NULL,
	[Code] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypeLangs]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypeLangs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[JobTypeId] [int] NOT NULL,
	[LangId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_JobTypeLangs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_JobTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LinkElements]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkElements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Question] [nvarchar](50) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LinkElements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Links]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Text] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceElements]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceElements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ServiceElements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LangId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribers]    Script Date: 12/2/2019 4:39:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Subscribers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([Id], [LangId], [Title], [Description], [Photo]) VALUES (2, 1, N'10.00.000-dən çox + İş', N'Buradakı məzmun, buradakı məzmun ''oxunan İngilis dilinə oxşayır. Bir çox masaüstü nəşr paketlər və veb səhifə redaktorları indi Lorem Ipsum''u standart model mətni və axtarış olaraq istifadə edirlər', N'20191121063210thumb-1.png')
INSERT [dbo].[Abouts] ([Id], [LangId], [Title], [Description], [Photo]) VALUES (3, 2, N'Over 10,00,000 + Jobs', N'Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for', N'20191121063316thumb-1.png')
INSERT [dbo].[Abouts] ([Id], [LangId], [Title], [Description], [Photo]) VALUES (4, 3, N'Более 10 000 000 + рабочих мест', N'Контент здесь, контент здесь », что делает его похожим на читаемый английский. Многие настольные издания пакеты и редакторы веб-страниц теперь используют Lorem Ipsum.', N'20191121063406thumb-1.png')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Name], [Email], [Password], [Token]) VALUES (1, N'Nuri Ahmad', N'nuri.akhmadzade@gmail.com', N'AJjKAXn3GxRoTz93kuiTJm28VjBpgDhseVcdQgIPdmj8GXWhdy/VhgRkooV8ckqpcQ==', N'91e04867-090d-43d9-b253-7cd913975658')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Status]) VALUES (11, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (12, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (13, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (14, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (15, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (16, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (17, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (18, 1)
INSERT [dbo].[Categories] ([Id], [Status]) VALUES (19, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[CategoryLangs] ON 

INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (18, N'İnformasiya texnologiyaları', 1, 11, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (19, N'Information Technology', 2, 11, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (21, N'Информационные технологии', 3, 11, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (22, N'Maliyyə', 1, 12, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (23, N'Finance', 2, 12, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (24, N'Финансы', 3, 12, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (25, N'Marketinq', 1, 13, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (26, N'Marketing', 2, 13, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (27, N'Маркетинг', 3, 13, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (28, N'Təhsil və elm', 1, 17, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (29, N'Education and Science', 2, 17, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (30, N'Образование и наука', 3, 17, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (31, N'Xidmət', 1, 18, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (32, N'Service', 2, 18, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (33, N'Oбслуживание', 3, 18, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (34, N'Satış', 1, 19, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (35, N'Selling', 2, 19, 1)
INSERT [dbo].[CategoryLangs] ([Id], [Name], [LangId], [CategoryId], [Status]) VALUES (36, N'Для продажи', 3, 19, 1)
SET IDENTITY_INSERT [dbo].[CategoryLangs] OFF
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [Name], [Photo], [Address], [Email], [Website], [Status]) VALUES (1, N'ASB Bank', N'20191121065251asb.jpg', N'3 Zərifə Əliyeva, Bakı 1005', N'info@asb.com', N'www.asb.az', 1)
INSERT [dbo].[Companies] ([Id], [Name], [Photo], [Address], [Email], [Website], [Status]) VALUES (2, N'SOCAR ', N'20191121065334socar.jpg', N'Tbilisi pr-ti, Chirag plaza', N'info@socar.com', N'www.socar.az', 1)
INSERT [dbo].[Companies] ([Id], [Name], [Photo], [Address], [Email], [Website], [Status]) VALUES (3, N'Code Academy', N'20191121065430unnamed.jpg', N'Nizami küçəsi 203B', N'info@code.edu.az', N'www.code.edu.az', 1)
INSERT [dbo].[Companies] ([Id], [Name], [Photo], [Address], [Email], [Website], [Status]) VALUES (4, N'Baku Engineering University', N'201911210656241551427261_600.jpg', N'120 Həsən Aliyev Absheron', N'info@beu.edu.az', N'www.beu.az', 1)
INSERT [dbo].[Companies] ([Id], [Name], [Photo], [Address], [Email], [Website], [Status]) VALUES (5, N'Parkway Inn Hotel&Spa', N'20191127044104download.jfif', N'Heydar Aliyev Ave 5', N'info@parkwayinn.az', N'www.parkwayinn.az', 1)
SET IDENTITY_INSERT [dbo].[Companies] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Location], [Email], [Phone]) VALUES (1, N' Məhəmməd hadi 51', N'nuri.akhmadzade@gmail.com', N'+994702834525')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
INSERT [dbo].[Email] ([Id], [Subject], [Mail], [Mesaj]) VALUES (1, N'Yeni Vakansiya', N'polypackaze@gmai.com', N'Hormetli bla')
SET IDENTITY_INSERT [dbo].[Experiences] ON 

INSERT [dbo].[Experiences] ([Id], [Name], [Status]) VALUES (1, N'1 ', 1)
INSERT [dbo].[Experiences] ([Id], [Name], [Status]) VALUES (3, N'1 - 3', 1)
INSERT [dbo].[Experiences] ([Id], [Name], [Status]) VALUES (4, N'3 - 5', 1)
INSERT [dbo].[Experiences] ([Id], [Name], [Status]) VALUES (5, N'5+', 1)
SET IDENTITY_INSERT [dbo].[Experiences] OFF
SET IDENTITY_INSERT [dbo].[JobLangs] ON 

INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (25, 1, 29, N'Backend Developer Axtarılır', N'Namizədə tələblər
- C#, ASP.NET(WEB FORM), ASP.NET MVC-də iş təcrübəsi
- Javascript, jQuery,Ajax, Angularjs(Arzu olunandır)
- C# proqramçı, yaş 21-30
- Dev Express
- HTML5, CSS3
- MSSQL Server ilə işləyə bilmək
- Web Servis və web servis client yaza bilmək
- Analitik düşünmə qabiliyyəti
- Sərbəst araşdırma qabiliyyəti', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (26, 2, 29, N'Hiring Backend Developer', N'Requirements for the candidate
- Experience in C #, ASP.NET (WEB FORM), ASP.NET MVC
- Javascript, jQuery, Ajax, Angularjs (Required)
- C # Programmer, age 21-30
- Dev Express
- HTML5, CSS3
- Ability to work with MSSQL Server
- Ability to write Web Service and web service client
- Analytical thinking
- Free research ability', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (27, 3, 29, N'Найм Backend Девелопер', N'Требования к кандидату
- Опыт работы на C #, ASP.NET (WEB FORM), ASP.NET MVC
- Javascript, JQuery, Ajax, Angularjs (обязательно)
- программист на C #, 21-30 лет
- Dev Express
- HTML5, CSS3
- Возможность работы с MSSQL Server.
- Возможность написания веб-сервиса и клиента веб-сервиса
- аналитическое мышление
- Бесплатная исследовательская способность', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (28, 1, 30, N'MÜHASİB Axtarılır', N'İş barədə məlumat
- İnternet bank əməliyyatlarının, debitor və kreditorlarla hesablaşmaların aparılması
- Vergi hesabatlarının hazırlanması (ƏDV; ÖMV; gəlir vergisi)
- Statistika hesabatlarının hazırlanıb, təqdim edilməsi
- Mühasibatliq modulu üzrə 1 C əməliyyatlarının aparılması
- Gömrük bəyannamələri ilə bağlı əməliyyatların icrası
- Dövlət orqanları ilə yazışmaların aparılması

Biz Sizə nə təklif edirik:
- Peşəkar, mehriban komandada iş
- Etibarlı şirkətdə karyera qurmaq imkanı
- Professional və maddi yüksəliş üçün imkanların mövcudluğu;t
- İş qrafiki: 9:00-dan 18:00-dək

Namizədə tələblər
- İqtisadiyyat, maliyyə və ya müvafiq sahədə ali təhsil
- Mühasibatlıq üzrə ən azı 3 il iş təcrübəsi
- 1C (8.3) proqramında işləmək bacarığı
- MS Office proqramları üzrə qabaqcıl istifadə biliyi
- Komandada valtında işləmə bacarığı
- ACCA, CIMA sertifikatı olan (və yaxud təhsil alan) namizədlərə üstünlük verilir

CV-lərinizi hr@bsc-group.az elektron ünvanına “ Mühasib” başlığı altında göndərməyiniz xahiş olunur.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (29, 2, 30, N'Hiring Accountant', N'Job information
- Internet banking transactions, accounts receivable and creditors
- Preparation of tax returns (VAT; RMB; Income tax)
- Preparation and submission of statistical reports
- Conducting 1 C transactions on the accounting module
- Execution of customs declarations
- Correspondence with state bodies

What we offer to you:
- Working in a professional, friendly team
- Opportunity for career in a reliable company
- Opportunities for professional and material advancement t
- Schedule: from 9:00 to 18:00

Requirements for the candidate
- Higher education in economics, finance or related fields
- At least 3 years of experience in accounting
- Ability to work with 1C (8.3)
- Advanced computer skills in MS Office applications
- Ability to work in team currency
- Candidates with ACCA or CIMA certification (or training) are preferred

Please send your CVs to hr@bsc-group.az under the heading “Accountant”.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (30, 3, 30, N'Найм бухгалтера', N'Информация о работе
- Интернет-банкинг транзакций, дебиторской задолженности и кредиторов
- Подготовка налоговых деклараций (НДС; юаней; подоходный налог)
- Подготовка и сдача статистической отчетности
- Проведение 1 С транзакций на учетном модуле
- оформление таможенных деклараций
- переписка с государственными органами

Что мы предлагаем вам:
- Работа в профессиональной, дружной команде
- Возможность построить карьеру в надежной компании
- Возможности для профессионального и материального развития т
- Расписание: с 9:00 до 18:00

Требования к кандидату
- Высшее образование в области экономики, финансов или смежных областях
- Минимум 3 года опыта в бухгалтерском учете
- Умение работать с 1С (8,3)
- Расширенные навыки работы с компьютером в приложениях MS Office
- Умение работать в валюте команды
- Кандидаты с сертификатом ACCA или CIMA (или обучение) являются предпочтительными

Пожалуйста, присылайте свои резюме на hr@bsc-group.az под заголовком «Бухгалтер».', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (31, 1, 39, N'KREDİT MÜTƏXƏSSİS', N'İş barədə məlumat
- Müştəri cəlb etmə bacarığı
- Kredit portfelini formalaşdırmaq və idarə etmək bacarığı
- Prosedur qaydaları ilə tələb olunduğu kimi kredit portfelinin yüksək keyfiyyətini saxlamaq
- Kredit məhsulları üzrə xidmətlər və onların monitorinqi
- Kredit müraciətlərinin qiymətləndirilməsi və analizi qabiliyyəti
- İş qrafiki : Həftə içi - 09:00-dan 18:00-dək
- İstirahət günləri: Şənbə və Bazar günləri

Namizədə tələblər
- İqtisadiyyat, və ya maliyyə-kredit sahəsində ali təhsil
- Kiçik və orta biznes kreditləşməsi sahəsində ən azı bir il iş təcrübəsi arzuolunandır
- Yaxşı ünsiyyət, rabitə və komanda ilə işləmək bacarığı
- İşdə dəqiqlik və detallara fikir vermək qabiliyyəti
- İngilis və rus dilindən müəyyən səviyyədə biliklərə malik olma', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (32, 2, 39, N'CREDIT SPECIALIST', N'Job information
- Ability to attract a customer
- Ability to form and manage a loan portfolio
- Maintain high quality of loan portfolio as required by the rules of procedure
- Credit products services and their monitoring
- Ability to evaluate and analyze credit applications
- Schedule: Weekdays - 09:00 to 18:00
- Weekends: Saturdays and Sundays

Requirements for the candidate
- Higher education in economics or finance and credit
- At least one year of experience in small and medium business lending is desirable
- Good communication, communication and teamwork skills
- Accuracy and ability to respond to details
- Have a certain level of knowledge of English and Russian', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (33, 3, 39, N'КРЕДИТ СПЕЦИАЛИСТ', N'Информация о работе
- Возможность привлечь клиента
- Возможность формирования и управления кредитным портфелем.
- Поддерживать высокое качество кредитного портфеля в соответствии с правилами процедуры
- Услуги кредитных продуктов и их мониторинг
- Возможность оценивать и анализировать кредитные заявки
- Расписание: будние дни - с 09:00 до 18:00
- Праздники: суббота и воскресенье

Требования к кандидату
- Высшее образование в области экономики или финансов и кредита
- Желателен как минимум годовой опыт кредитования малого и среднего бизнеса.
- Хорошие навыки общения, общения и командной работы
- Точность и умение реагировать на детали
- иметь определенный уровень знаний английского и русского', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (34, 1, 40, N'XADİMƏ', N'İş barədə məlumat
- Müəyyən olunmuş otaqların təmizlənməsi
- Ümumi təmizlik işləri
- Rəhbərliyin göstərişinə əsasən sair təmizlik işləri

- İş şəraiti:
- Əmək Məcəlləsinə əsasən sənədləşmə
- 09:00-18:00 iş saatları
- Həftədə bir dəfə istirahət
- Həftədə bir dəfə 12:00-dan 21:00-dək iş qrafiki
- Maaşdan əlavə iş qabiliyyətinə əsasən bonuslar

Namizədə tələblər
- 30-49 yaş arası xanımlar və bəylər
- Təmizlik sahəsində İş təcrübəsi
- Düzgün görkəmli
- Gülərüz
- Təmizkar
- Kollektivdə işləmə baçarığı

QEYD: Zənglə işçi qəbul olunmur, yalnız göstərilən e-mail adresinə öz CV-nizi göndərin. Xahiş edirik, zəng etməyin', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (35, 2, 40, N'Hiring MAID', N'Job information
- Clean up certain rooms
- General cleaning work
- Other cleaning activities as instructed by the management

- Working conditions:
- Documentation under the Labor Code
- 09: 00-18: 00 business hours
- Rest once a week
- Schedule a week from 12:00 to 21:00
- Bonuses based on overtime ability

Requirements for the candidate
- Ladies and gentlemen aged 30-49
- Experience in cleaning
- Exactly outstanding
- Smiling
- Cleaner
- Working in a collective bar

NOTE: The employee is not accepted by the call, just send your CV to the specified email address. Please do not call', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (36, 3, 40, N'Cлужанка', N'Информация о работе
- Убирать определенные комнаты
- Генеральная уборка
- Прочие виды уборки в соответствии с указаниями руководства.

- Условия работы:
- Документация в соответствии с Трудовым кодексом
- с 09:00 до 18:00
- отдыхать раз в неделю
- Расписание на неделю с 12:00 до 21:00
- Бонусы, основанные на сверхурочной способности

Требования к кандидату
- Дамы и господа, в возрасте 30-49 лет
- Опыт работы по уборке
- Точно выдающийся
- ты улыбаешься
- уборщик
- работа в коллективном баре

ПРИМЕЧАНИЕ: сотрудник не принимается по вызову, просто отправьте свое резюме на указанный адрес электронной почты. Пожалуйста, не звоните', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (37, 1, 41, N'RESEPŞN', N'İş barədə məlumat
- Qonaqların qarşılanması
- Ödənişlərin qəbul olunması və qeydiyyata alınması
- Qonaqların qeydiyyata alınması
- Qonaqların yerləşdirilməsi
- Məlumatın verilməsi
- Qonaqların istəklərini imkanlar daxilində dərhal yerinə yetirmək
- Telefon zənglərinə cavab vermək
- Mailləri yoxlamaq və cavab vermək
- Rəhbərliyin göstərişlərini yerinə yetirmək
- İş şəraiti:
- Əmək məcəlləsinə əsasən sənədləşmə
- İş qrafiki bir gündən bir gecə növbəsi
- Həftədə bir gün istirahət

Namizədə tələblər
- Dil bilikəri - Rus (Mütləqdir), İngilis - danışıq səviyyəsi (Mütləqdir)
- Kompyuter bilikləri - MS office və Hotel PMS proqramları(tərəfimizdən öyrədilir), internetdə axtarma qabiliyyəti
- Gülərüz
- Düzgün görkəmli

QEYD: Zənglə işçi qəbul olunmur, ancaq göstərilən e-mail adresə CV-nizi göndərin. Xahiş edirik, zəng etməyin.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (38, 2, 41, N'RESEPSIONER', N'Job information
- Greetings
- Acceptance and registration of payments
- Registration of guests
- Accommodation of guests
- Providing information
- Immediately fulfill the wishes of the guests within the facilities
- Answer phone calls
- Check and respond to items
- Follow the instructions of the management
- Working conditions:
- Documentation according to the Labor Code
- One-night shifts in work schedule
- One day a week

Requirements for the candidate
- Linguistics - Russian (Absolute), English - Level of Speech (Absolute)
- Computer skills - MS office and Hotel PMS software (taught by us), internet search capability
- Smiling
- Exactly outstanding

NOTE: Calling staff is not accepted, but please send your CV to the specified email address. Please do not call.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (39, 3, 41, N'ПРИЕМ', N'Информация о работе
- привет
- Прием и регистрация платежей
- регистрация гостей
- размещение гостей
- Предоставление информации
- Немедленно выполнить пожелания гостей на объекте
- отвечать на телефонные звонки
- Проверить и ответить на предметы
- Следуйте инструкциям руководства
- Условия работы:
- Документация в соответствии с Трудовым кодексом
- однодневные смены в графике работы
- один день в неделю

Требования к кандидату
- Лингвистика - Русский (Абсолют), Английский - Уровень речи (Абсолют)
- Навыки работы на компьютере - Программное обеспечение MS office и Hotel PMS (обучаемое нами), возможность поиска в Интернете
- ты улыбаешься
- Точно выдающийся

ПРИМЕЧАНИЕ: вызов персонала не принимается, но, пожалуйста, отправьте свое резюме на указанный адрес электронной почты. Пожалуйста, не звоните.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (40, 1, 43, N'LARAVEL PROQRAMÇI', N'İş barədə məlumat
- Lazımi proqramın gündəlik işinin təşkili
- Proqram təminatının kodunun yazılması, məlumat - bazaları ilə işləmək, kodun diaqnostika və test olunmasını təmin etmək
- Şirkətin informasiya texnologiyaları üzrə inkişaf strategiyasına uyğun olaraq proqramların etibarlı və davamlı fəaliyyəti təmin etmək
- 5 günlük iş qrafiki, 09:00-dan 18:00-dək
- İstirahət günləri: şənbə və bazar
- İş yeri : Bakı şəhəri, Gənclik metrosu, Zooparkın yaxınlığı
- Əmək haqqı namizədin qabiliyyəti əsasında müəyyən olunacaq

Namizədə tələblər
- Minimum 2-3 illik iş təcrübəsi
- PHP (OOP, MVC, ORM)
- Laravel Framework ( mütləqdir )
- MySQL (proqramçı səviyyəsində sorğuları yazıb optimallaşdırmaq bacarığı)
- HTML5, CSS3 (Bootstrap4) üzrə biliklər
- Javascript (jQuery, AJAX, JSON)
- Web servislərlə işləmək bacarığı

Müraciət etmək istəyən namizədlər CV-lərini və portfoliolarını azerishiq@azerishiq.az ünvanına göndərmələri və mövzu hissəsində "Laravel proqramçı" qeyd etmələri xahiş olunur.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (41, 2, 43, N'LARAVEL PROGRAMMER', N'Job information
- Organization of daily work of the required program
- Software code writing, database - working with databases, providing code diagnostics and testing
- Ensure reliable and sustainable operation of programs in accordance with the company''s IT development strategy
- 5-day work schedule, from 09:00 to 18:00
- Weekends: Saturday and Sunday
- Place of work: Baku subway, Youth subway, proximity to Zoo
- Wages will be determined based on the candidate''s ability

Requirements for the candidate
- Minimum 2-3 years experience
- PHP (OOP, MVC, ORM)
- Laravel Framework (optional)
- MySQL (programmer-level querying and optimization)
- Knowledge of HTML5, CSS3 (Bootstrap4)
- Javascript (jQuery, AJAX, JSON)
- Ability to work with Web services

Candidates who wish to apply are asked to send their CVs and portfolios to azerishiq@azerishiq.az and to mark "Laravel Programmer" in the topic section.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (42, 3, 43, N'ЛАРАВЕЛ ПРОГРАММИСТ', N'Информация о работе
- Организация ежедневной работы по необходимой программе.
- Написание программного кода, базы данных - работа с базами данных, обеспечение диагностики и тестирования кода
- Обеспечить надежную и устойчивую работу программ в соответствии со стратегией развития ИТ компании.
- 5-дневный график работы, с 09:00 до 18:00
- выходные дни: суббота и воскресенье
- Место работы: Бакинское метро, ​​Молодежное метро, ​​близость к зоопарку
- Заработная плата будет определяться исходя из способностей кандидата

Требования к кандидату
- Минимум 2-3 года опыта
- PHP (ООП, MVC, ORM)
- Laravel Framework (опционально)
- MySQL (запросы и оптимизация на уровне программиста)
- Знание HTML5, CSS3 (Bootstrap4)
- Javascript (jQuery, AJAX, JSON)
- Умение работать с веб-сервисами.

Кандидатов, желающих подать заявку, просят прислать свои резюме и портфолио на azerishiq@azerishiq.az и отметить «Программист Laravel» в разделе темы.', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (55, 1, 55, N'PR1', N'kugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjl', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (56, 2, 55, N'PR2', N'kugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjl', 1)
INSERT [dbo].[JobLangs] ([Id], [LangId], [JobId], [Title], [Description], [Status]) VALUES (57, 3, 55, N'PR3', N'kugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjlkugbjxlnklvbjc;ma'';bjl', 1)
SET IDENTITY_INSERT [dbo].[JobLangs] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (28, 11, 1, 1, 3, 1, N'20191126050102company-logo-3.png', CAST(1200 AS Decimal(18, 0)), CAST(N'2019-11-30T00:00:00.000' AS DateTime), CAST(N'2019-11-26T05:01:02.617' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (29, 11, 2, 2, 4, 1, N'20191129213924company-logo-3.png', CAST(2000 AS Decimal(18, 0)), CAST(N'2019-12-27T00:00:00.000' AS DateTime), CAST(N'2019-11-29T22:18:59.883' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (30, 12, 4, 1, 3, 1, N'20191126051834company-logo-9.png', CAST(800 AS Decimal(18, 0)), CAST(N'2019-12-30T00:00:00.000' AS DateTime), CAST(N'2019-11-26T05:18:34.883' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (39, 12, 1, 1, 1, 4, N'20191127031614company-logo-8.png', CAST(500 AS Decimal(18, 0)), CAST(N'2019-11-30T00:00:00.000' AS DateTime), CAST(N'2019-11-27T03:16:14.183' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (40, 18, 5, 2, 1, 1, N'20191127044338company-logo-2.png', CAST(400 AS Decimal(18, 0)), CAST(N'2019-11-30T00:00:00.000' AS DateTime), CAST(N'2019-11-27T04:43:38.990' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (41, 18, 5, 1, 3, 1, N'20191127044622company-logo-3.png', CAST(800 AS Decimal(18, 0)), CAST(N'2019-11-30T00:00:00.000' AS DateTime), CAST(N'2019-11-27T04:46:22.560' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (43, 11, 1, 1, 3, 1, N'20191127120801company-logo-1.png', CAST(1500 AS Decimal(18, 0)), CAST(N'2019-12-12T00:00:00.000' AS DateTime), CAST(N'2019-11-27T12:08:01.033' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (45, 11, 2, 1, 1, 1, N'20191127135014company-logo-3.png', CAST(1200 AS Decimal(18, 0)), CAST(N'2019-11-15T00:00:00.000' AS DateTime), CAST(N'2019-11-27T13:50:14.200' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (46, 11, 2, 1, 1, 1, N'20191127135050company-logo-8.png', CAST(1200 AS Decimal(18, 0)), CAST(N'2019-11-29T00:00:00.000' AS DateTime), CAST(N'2019-11-27T13:50:50.243' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (48, 11, 2, 1, 1, 1, N'20191127135110company-logo-3.png', CAST(1200 AS Decimal(18, 0)), CAST(N'2019-11-29T00:00:00.000' AS DateTime), CAST(N'2019-11-27T13:51:10.810' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (50, 11, 2, 1, 1, 1, N'20191127135235company-logo-2.png', CAST(1200 AS Decimal(18, 0)), CAST(N'2019-11-30T00:00:00.000' AS DateTime), CAST(N'2019-11-27T13:52:35.613' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (51, 17, 3, 3, 3, 1, N'20191129223757asb.jpg', CAST(1500 AS Decimal(18, 0)), CAST(N'2019-11-14T00:00:00.000' AS DateTime), CAST(N'2019-11-29T22:37:57.920' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (52, 17, 3, 3, 3, 1, N'20191129223819asb.jpg', CAST(1500 AS Decimal(18, 0)), CAST(N'2019-11-14T00:00:00.000' AS DateTime), CAST(N'2019-11-29T22:38:19.913' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (53, 13, 2, 3, 4, 3, N'20191129223950asb.jpg', CAST(1500 AS Decimal(18, 0)), CAST(N'2019-11-23T00:00:00.000' AS DateTime), CAST(N'2019-11-29T22:39:50.843' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (54, 13, 3, 3, 1, 3, N'20191129224232company-logo-1.png', CAST(200 AS Decimal(18, 0)), CAST(N'2019-11-15T00:00:00.000' AS DateTime), CAST(N'2019-11-29T22:42:33.567' AS DateTime), 1, 1)
INSERT [dbo].[Jobs] ([Id], [CategoryId], [CompanyId], [JobTypeId], [ExperienceId], [Location], [Photo], [Salary], [Deadline], [PublishDate], [Code], [Status]) VALUES (55, 11, 3, 2, 3, 1, N'20191130161904asb.jpg', CAST(200 AS Decimal(18, 0)), CAST(N'2019-11-29T00:00:00.000' AS DateTime), CAST(N'2019-11-30T16:19:04.060' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[JobTypeLangs] ON 

INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (6, N'Tam iş günü', 1, 1, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (7, N'Full Time', 1, 2, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (8, N'Полный день', 1, 3, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (9, N'Yarım iş günü', 2, 1, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (10, N'Part time', 2, 2, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (11, N'Полдня', 2, 3, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (12, N'Azad işçi', 3, 1, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (13, N'Freelance', 3, 2, 1)
INSERT [dbo].[JobTypeLangs] ([Id], [Name], [JobTypeId], [LangId], [Status]) VALUES (14, N'Cвободный художник', 3, 3, 1)
SET IDENTITY_INSERT [dbo].[JobTypeLangs] OFF
SET IDENTITY_INSERT [dbo].[JobTypes] ON 

INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (1, 1)
INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (2, 1)
INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (3, 1)
INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (4, 1)
INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (5, 1)
INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (6, 1)
INSERT [dbo].[JobTypes] ([Id], [Status]) VALUES (7, 1)
SET IDENTITY_INSERT [dbo].[JobTypes] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([Id], [Name]) VALUES (1, N'AZ')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (2, N'EN')
INSERT [dbo].[Languages] ([Id], [Name]) VALUES (3, N'RU')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[LinkElements] ON 

INSERT [dbo].[LinkElements] ([Id], [LangId], [Question], [Answer]) VALUES (1, 1, N'Müştərilərimizdən necə ödəniş alırıq?', N'Lorem Ipsum''un keçidlərində bir çox dəyişiklik mövcuddur, lakin əksəriyyəti biraz inandırılmış yumor və ya hətta bir qədər də inanılmaz görünən randomizə edilmiş sözlər ilə bir şəkildə dəyişdirildi. Lorem Ipsumun bir keçidindən istifadə etmək niyyətindəsiniz. İnternetdəki bütün Lorem Ipsum generatorları zəruri hallarda əvvəlcədən təyin edilmiş bölmələri təkrar etməyə meyllidirlər.')
INSERT [dbo].[LinkElements] ([Id], [LangId], [Question], [Answer]) VALUES (2, 2, N'How we take payment from our customers?
', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.')
INSERT [dbo].[LinkElements] ([Id], [LangId], [Question], [Answer]) VALUES (3, 3, N'Как мы принимаем оплату от наших клиентов?', N'Существует множество вариаций отрывков Lorem Ipsum, но большинство претерпело изменения в той или иной форме из-за введенного юмора или случайных слов, которые не выглядят даже немного правдоподобными. Если вы собираетесь использовать проход Lorem Ipsum. Все генераторы Lorem Ipsum в Интернете имеют тенденцию повторять заранее определенные фрагменты по мере необходимости.')
SET IDENTITY_INSERT [dbo].[LinkElements] OFF
SET IDENTITY_INSERT [dbo].[Links] ON 

INSERT [dbo].[Links] ([Id], [LangId], [Title], [Description], [Status]) VALUES (1, 1, N'Sizin Cavabınız', N'Tez-tez verilən suallar', 1)
INSERT [dbo].[Links] ([Id], [LangId], [Title], [Description], [Status]) VALUES (2, 2, N'Your answer here', N'Frequently Asked Questions', 1)
INSERT [dbo].[Links] ([Id], [LangId], [Title], [Description], [Status]) VALUES (3, 3, N'Ваш ответ здесь', N'Часто задаваемые вопросы', 1)
SET IDENTITY_INSERT [dbo].[Links] OFF
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Name], [Status]) VALUES (1, N'Baki', 1)
INSERT [dbo].[Location] ([Id], [Name], [Status]) VALUES (2, N'Qazax', 1)
INSERT [dbo].[Location] ([Id], [Name], [Status]) VALUES (3, N'Gence', 1)
INSERT [dbo].[Location] ([Id], [Name], [Status]) VALUES (4, N'Sumqayit', 1)
SET IDENTITY_INSERT [dbo].[Location] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [Name], [Email], [Phone], [Subject], [Text]) VALUES (3, N'Nuri Ahmad', N'nuri.akhmadzade@gmail.com', N'+994702834525', N'Basliq', N'Salam? Netersen? Ne var ne yox? Hardasan?')
INSERT [dbo].[Messages] ([Id], [Name], [Email], [Phone], [Subject], [Text]) VALUES (9, N'dcsdc', N'nuru@gmail.com', N'sdcdsc', N'dsc', N'dscdscdsc')
INSERT [dbo].[Messages] ([Id], [Name], [Email], [Phone], [Subject], [Text]) VALUES (10, N'cdscdsc', N'dscdsc@gmail.com', N'dscds', N'cdsc', N'dscdsc')
INSERT [dbo].[Messages] ([Id], [Name], [Email], [Phone], [Subject], [Text]) VALUES (11, N'dcs', N'cdscsdcsd@dsc.com', N'sdc', N'c', N'sdcdsc')
INSERT [dbo].[Messages] ([Id], [Name], [Email], [Phone], [Subject], [Text]) VALUES (13, N'hgdf', N'nuri.akhmadzade@gmail.com', N'+994702834526', N'Test', N'yrtunhbgcsmynhbgf')
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Id], [Name], [Location], [Photo], [Status]) VALUES (3, N'Crocusoft LLC', N'Məhəmməd hadi 51', N'201911191738581.jpg', 1)
INSERT [dbo].[Partners] ([Id], [Name], [Location], [Photo], [Status]) VALUES (5, N'Asb bank', N'Məhəmməd hadi 51', N'20191119173911author.jpg', 1)
INSERT [dbo].[Partners] ([Id], [Name], [Location], [Photo], [Status]) VALUES (6, N'Code Academy', N'Məhəmməd hadi 51', N'201911191739223.jpg', 1)
SET IDENTITY_INSERT [dbo].[Partners] OFF
SET IDENTITY_INSERT [dbo].[ServiceElements] ON 

INSERT [dbo].[ServiceElements] ([Id], [LangId], [Question], [Answer]) VALUES (1, 1, N'Oficiona nədir?', N'Lorem Ipsum''un keçidlərində bir çox dəyişiklik mövcuddur, lakin əksəriyyəti biraz inandırılmış yumor və ya hətta bir qədər də inanılmaz görünən randomizə edilmiş sözlər ilə bir şəkildə dəyişdirildi. Lorem Ipsumun bir keçidindən istifadə etmək niyyətindəsiniz. İnternetdəki bütün Lorem Ipsum generatorları zəruri hallarda əvvəlcədən təyin edilmiş bölmələri təkrar etməyə meyllidirlər.')
INSERT [dbo].[ServiceElements] ([Id], [LangId], [Question], [Answer]) VALUES (2, 2, N'What is Oficiona ?', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.')
INSERT [dbo].[ServiceElements] ([Id], [LangId], [Question], [Answer]) VALUES (3, 3, N'Что такое официона?', N'Существует множество вариаций отрывков Lorem Ipsum, но большинство претерпело изменения в той или иной форме из-за введенного юмора или случайных слов, которые не выглядят даже немного правдоподобными. Если вы собираетесь использовать проход Lorem Ipsum. Все генераторы Lorem Ipsum в Интернете имеют тенденцию повторять заранее определенные фрагменты по мере необходимости.')
INSERT [dbo].[ServiceElements] ([Id], [LangId], [Question], [Answer]) VALUES (4, 1, N'Burada məhsulunuzu necə satırıq?', N'Lorem Ipsum''un keçidlərində bir çox dəyişiklik mövcuddur, lakin əksəriyyəti biraz inandırılmış yumor və ya hətta bir qədər də inanılmaz görünən randomizə edilmiş sözlər ilə bir şəkildə dəyişdirildi. Lorem Ipsumun bir keçidindən istifadə etmək niyyətindəsiniz. İnternetdəki bütün Lorem Ipsum generatorları zəruri hallarda əvvəlcədən təyin edilmiş bölmələri təkrar etməyə meyllidirlər.')
INSERT [dbo].[ServiceElements] ([Id], [LangId], [Question], [Answer]) VALUES (5, 2, N'How we sell your product here ?', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.')
INSERT [dbo].[ServiceElements] ([Id], [LangId], [Question], [Answer]) VALUES (6, 3, N'Как мы продаем ваш продукт здесь?', N'Существует множество вариаций отрывков Lorem Ipsum, но большинство претерпело изменения в той или иной форме из-за введенного юмора или случайных слов, которые не выглядят даже немного правдоподобными. Если вы собираетесь использовать проход Lorem Ipsum. Все генераторы Lorem Ipsum в Интернете имеют тенденцию повторять заранее определенные фрагменты по мере необходимости.')
SET IDENTITY_INSERT [dbo].[ServiceElements] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [LangId], [Title], [Description], [Status]) VALUES (4, 1, N'Sizin Cavabınız', N'Tez-tez verilən suallar', 1)
INSERT [dbo].[Services] ([Id], [LangId], [Title], [Description], [Status]) VALUES (9, 2, N'Your answer here', N'Frequently Asked Questions', 1)
INSERT [dbo].[Services] ([Id], [LangId], [Title], [Description], [Status]) VALUES (10, 3, N'Ваш ответ здесь', N'Часто задаваемые вопросы', 1)
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Subscribers] ON 

INSERT [dbo].[Subscribers] ([Id], [Email], [Status]) VALUES (1, N'nuri.akhmadzade@gmail.com', 1)
INSERT [dbo].[Subscribers] ([Id], [Email], [Status]) VALUES (13, N'nuri.akhmadzade@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Subscribers] OFF
ALTER TABLE [dbo].[Abouts]  WITH CHECK ADD  CONSTRAINT [FK_Abouts_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Abouts] CHECK CONSTRAINT [FK_Abouts_Languages]
GO
ALTER TABLE [dbo].[CategoryLangs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryLangs_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoryLangs] CHECK CONSTRAINT [FK_CategoryLangs_Categories]
GO
ALTER TABLE [dbo].[CategoryLangs]  WITH CHECK ADD  CONSTRAINT [FK_CategoryLangs_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[CategoryLangs] CHECK CONSTRAINT [FK_CategoryLangs_Languages]
GO
ALTER TABLE [dbo].[JobLangs]  WITH CHECK ADD  CONSTRAINT [FK_JobLangs_Jobs] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobLangs] CHECK CONSTRAINT [FK_JobLangs_Jobs]
GO
ALTER TABLE [dbo].[JobLangs]  WITH CHECK ADD  CONSTRAINT [FK_JobLangs_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[JobLangs] CHECK CONSTRAINT [FK_JobLangs_Languages]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Categories]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Companies]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Experiences] FOREIGN KEY([ExperienceId])
REFERENCES [dbo].[Experiences] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Experiences]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_JobTypes] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_JobTypes]
GO
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Location] FOREIGN KEY([Location])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Location]
GO
ALTER TABLE [dbo].[JobTypeLangs]  WITH CHECK ADD  CONSTRAINT [FK_JobTypeLangs_JobTypes] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([Id])
GO
ALTER TABLE [dbo].[JobTypeLangs] CHECK CONSTRAINT [FK_JobTypeLangs_JobTypes]
GO
ALTER TABLE [dbo].[JobTypeLangs]  WITH CHECK ADD  CONSTRAINT [FK_JobTypeLangs_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[JobTypeLangs] CHECK CONSTRAINT [FK_JobTypeLangs_Languages]
GO
ALTER TABLE [dbo].[LinkElements]  WITH CHECK ADD  CONSTRAINT [FK_LinkElements_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[LinkElements] CHECK CONSTRAINT [FK_LinkElements_Languages]
GO
ALTER TABLE [dbo].[Links]  WITH CHECK ADD  CONSTRAINT [FK_Links_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Links] CHECK CONSTRAINT [FK_Links_Languages]
GO
ALTER TABLE [dbo].[ServiceElements]  WITH CHECK ADD  CONSTRAINT [FK_ServiceElements_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[ServiceElements] CHECK CONSTRAINT [FK_ServiceElements_Languages]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_Languages] FOREIGN KEY([LangId])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_Languages]
GO
USE [master]
GO
ALTER DATABASE [Vacancy] SET  READ_WRITE 
GO
