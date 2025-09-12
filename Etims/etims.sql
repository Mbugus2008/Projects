USE [master]
GO
/****** Object:  Database [Etims]    Script Date: 07/20/2024 18:11:44 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Etims')
BEGIN
CREATE DATABASE [Etims] ON  PRIMARY 
( NAME = N'Etims', FILENAME = N'{0}Etims.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Etims_log', FILENAME = N'{0}Etims_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Etims].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Etims] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Etims] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Etims] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Etims] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Etims] SET ARITHABORT OFF 
GO
ALTER DATABASE [Etims] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Etims] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Etims] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Etims] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Etims] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Etims] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Etims] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Etims] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Etims] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Etims] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Etims] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Etims] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Etims] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Etims] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Etims] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Etims] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Etims] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Etims] SET RECOVERY FULL 
GO
ALTER DATABASE [Etims] SET  MULTI_USER 
GO
ALTER DATABASE [Etims] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Etims] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Etims', N'ON'
GO
USE [Etims]
GO
/****** Object:  Table [dbo].[CreditNote]    Script Date: 07/20/2024 18:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CreditNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CreditNote](
	[invoiceNumber] [nvarchar](50) NOT NULL,
	[customerPin] [nvarchar](50) NULL,
	[customerName] [nvarchar](50) NULL,
	[paymentTypeCode] [nchar](10) NULL,
	[saleDate] [date] NULL,
	[totalAmount] [float] NULL,
	[totalTaxableAmount] [float] NULL,
	[totalTaxAmount] [float] NULL,
	[modifierId] [nvarchar](50) NULL,
	[modifierName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CreditNote] PRIMARY KEY CLUSTERED 
(
	[invoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/20/2024 18:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[itemCode] [nvarchar](50) NOT NULL,
	[itemClassificationCode] [nvarchar](50) NULL,
	[itemTypeCode] [nvarchar](50) NULL,
	[itemName] [nvarchar](50) NULL,
	[originCode] [nvarchar](50) NULL,
	[taxationTypeCode] [nvarchar](50) NULL,
	[batchNumber] [nvarchar](50) NULL,
	[barCode] [nvarchar](50) NULL,
	[defaultPrice] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 07/20/2024 18:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sale]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sale](
	[invoiceNumber] [nvarchar](50) NOT NULL,
	[customerPin] [nvarchar](50) NULL,
	[customerName] [nvarchar](50) NULL,
	[paymentTypeCode] [nchar](10) NULL,
	[saleDate] [date] NULL,
	[totalAmount] [float] NULL,
	[totalTaxableAmount] [float] NULL,
	[totalTaxAmount] [float] NULL,
	[modifierId] [nvarchar](50) NULL,
	[modifierName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[invoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Sale Item]    Script Date: 07/20/2024 18:11:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sale Item]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sale Item](
	[ItemName] [nvarchar](50) NULL,
	[ItemCode] [nvarchar](50) NOT NULL,
	[ItemClassificationCode] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[UnitPrice] [float] NULL,
	[DiscountRate] [float] NULL,
	[DiscountAmount] [float] NULL,
	[TaxationTypeCode] [nvarchar](50) NULL,
	[TaxAmount] [float] NULL,
	[TotalAmount] [float] NULL,
	[Modifier Id] [nvarchar](50) NULL,
	[Modifier Name] [nvarchar](50) NULL,
	[InvoiceNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sale Item] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC,
	[InvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [master]
GO
ALTER DATABASE [Etims] SET  READ_WRITE 
GO
