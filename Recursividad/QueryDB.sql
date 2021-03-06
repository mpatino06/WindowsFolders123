USE [master]
GO
/****** Object:  Database [DBDataIfx]    Script Date: 22/01/2020 22:48:53 ******/
CREATE DATABASE [DBDataIfx]

GO
ALTER DATABASE [DBDataIfx] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBDataIfx].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBDataIfx] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBDataIfx] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBDataIfx] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBDataIfx] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBDataIfx] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBDataIfx] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBDataIfx] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBDataIfx] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBDataIfx] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBDataIfx] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBDataIfx] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBDataIfx] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBDataIfx] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBDataIfx] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBDataIfx] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBDataIfx] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBDataIfx] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBDataIfx] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBDataIfx] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBDataIfx] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBDataIfx] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBDataIfx] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBDataIfx] SET RECOVERY FULL 
GO
ALTER DATABASE [DBDataIfx] SET  MULTI_USER 
GO
ALTER DATABASE [DBDataIfx] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBDataIfx] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBDataIfx] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBDataIfx] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBDataIfx] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBDataIfx', N'ON'
GO
USE [DBDataIfx]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 22/01/2020 22:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NULL,
	[FolderId] [int] NOT NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folder]    Script Date: 22/01/2020 22:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PathFile] [nvarchar](max) NULL,
	[IsSubFolder] [bit] NOT NULL,
	[Parent] [int] NULL,
 CONSTRAINT [PK_Folder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([Id], [FileName], [FolderId]) VALUES (1, N'prueba.txt', 1)
INSERT [dbo].[Files] ([Id], [FileName], [FolderId]) VALUES (2, N'prueba2.txt', 1)
INSERT [dbo].[Files] ([Id], [FileName], [FolderId]) VALUES (3, N'archivo3.txt', 3)
INSERT [dbo].[Files] ([Id], [FileName], [FolderId]) VALUES (4, N'archivo4.txt', 3)
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[Folder] ON 

INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (1, N'D:\Folder1', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (2, N'D:\Folder2', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (3, N'D:\Folder3', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (4, N'D:\Folder4', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (5, N'SubFolder1', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (6, N'SubFolder2', 1, 2)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (7, N'D:\Folder5', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (8, N'D:\Folder6', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (9, N'D:\Folder7', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (10, N'SubFolder1_1', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (11, N'SubFolder1_2', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (12, N'SubFolder1_3', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (13, N'SubFolder1_4', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (14, N'SubFolder2_1', 1, 2)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (15, N'SubFolder2_2', 1, 2)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (16, N'SubFolder2_3', 1, 2)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (17, N'SubFolder2_4', 1, 2)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (18, N'D:\Folder9', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (19, N'SubFolder1_5', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (20, N'SubFolder1_6', 1, 1)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (21, N'D\Folder8', 0, NULL)
INSERT [dbo].[Folder] ([Id], [PathFile], [IsSubFolder], [Parent]) VALUES (22, N'SubFolder3_1', 1, 3)
SET IDENTITY_INSERT [dbo].[Folder] OFF
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Folder] FOREIGN KEY([FolderId])
REFERENCES [dbo].[Folder] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Folder]
GO
USE [master]
GO
ALTER DATABASE [DBDataIfx] SET  READ_WRITE 
GO
