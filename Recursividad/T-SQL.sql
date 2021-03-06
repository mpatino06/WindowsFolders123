USE [master]
GO
/****** Object:  Database [DbDataIfxInventory]    Script Date: 22/01/2020 18:10:27 ******/
CREATE DATABASE [DbDataIfxInventory]
GO
ALTER DATABASE [DbDataIfxInventory] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbDataIfxInventory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbDataIfxInventory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbDataIfxInventory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbDataIfxInventory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbDataIfxInventory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbDataIfxInventory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET RECOVERY FULL 
GO
ALTER DATABASE [DbDataIfxInventory] SET  MULTI_USER 
GO
ALTER DATABASE [DbDataIfxInventory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbDataIfxInventory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbDataIfxInventory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbDataIfxInventory] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DbDataIfxInventory] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbDataIfxInventory', N'ON'
GO
USE [DbDataIfxInventory]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/01/2020 18:10:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 22/01/2020 18:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 22/01/2020 18:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Updated] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 22/01/2020 18:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Description], [Status], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (1, N'LIBROS', 0, CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Description], [Status], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (2, N'GOLOSINAS', 0, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Category] ([Id], [Description], [Status], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (3, N'COSMETICOS', 0, CAST(N'2020-01-20T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([Id], [ProductId], [Quantity], [Created], [CreatedBy], [Type]) VALUES (1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-01-22T17:23:02.637' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Code], [Description], [Status], [CategoryId], [Quantity], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (1, N'00001', N'AGENDA 50 HOJAS', 0, 1, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-01-21T00:00:00.000' AS DateTime), 1, CAST(N'2020-01-22T17:23:02.630' AS DateTime), 1)
INSERT [dbo].[Product] ([Id], [Code], [Description], [Status], [CategoryId], [Quantity], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (2, N'00002', N'CUADERNO SIMPLE 100 HOJAS', 0, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1, CAST(N'2020-01-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Code], [Description], [Status], [CategoryId], [Quantity], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (4, N'00003', N'CUADERNO CUADRICULADO', 0, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1, CAST(N'2020-01-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Code], [Description], [Status], [CategoryId], [Quantity], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (5, N'00004', N'GALLETAS OREO ', 0, 2, CAST(2.00 AS Decimal(18, 2)), CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1, CAST(N'2020-01-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([Id], [Code], [Description], [Status], [CategoryId], [Quantity], [Created], [CreatedBy], [Updated], [UpdatedBy]) VALUES (7, N'00005', N'GALLETAS OREO PAQ 100 UD', 0, 2, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-01-22T00:00:00.000' AS DateTime), 1, CAST(N'2020-01-22T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [Password], [Email], [Created], [FirstName], [LastName]) VALUES (1, N'Mpatino', N'HDGGDYD55ERERERXX4545', N'mpatino06@hotmail.com', CAST(N'2020-01-22T00:00:00.000' AS DateTime), N'Miguel Angel', N'Patiño')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Product]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProductQty]    Script Date: 22/01/2020 18:10:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_AddProductQty]
	@id int,
	@quantity decimal(18,2),
	@userid int
AS
BEGIN
	  DECLARE @ProductDate AS DATETIME
	  DECLARE @ProductQty AS DECIMAL(18,2)

	  SELECT 
		@ProductQty = Quantity,
		@ProductDate = Updated
	  FROM Product
	  WHERE Id = @id


	  IF(  (CAST(@ProductDate as date) = (CAST(GETDATE() as date))) )
		BEGIN
		   PRINT('EL PRODUCTO CONTIENE REGISTROS INGRESADOS EL DIA DE HOY')
		END
	   ELSE
		 BEGIN

		  UPDATE Product
		   SET Quantity = (@ProductQty + @quantity),
		       Updated =  GETDATE(),
			   UpdatedBy = 	@userid	   
		  WHERE Id = @id

		  INSERT INTO History ([ProductId],[Quantity],[Created],[CreatedBy],[Type]) 
		  VALUES (@id,@quantity,GETDATE(),@userid,0)

		 END

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0.Entrada 1.Salida 2.Defectuoso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'History', @level2type=N'COLUMN',@level2name=N'Type'
GO
USE [master]
GO
ALTER DATABASE [DbDataIfxInventory] SET  READ_WRITE 
GO



--////////////
SELECT P.Id, P.Description, P.Created, C.Description 
FROM Product P 
INNER JOIN Category C on P.CategoryId = C.Id
WHERE DATEPART(MONTH, P.Created) = MONTH(GETDATE())
ORDER BY C.Description

SELECT H.Id, P.Description, H.Quantity, H.Created, DATEPART(DAY, H.Created) as DayOfMonth FROM History H 
INNER JOIN Product P ON h.ProductId = P.Id
WHERE DATEPART(MONTH, H.Created) = MONTH(GETDATE())