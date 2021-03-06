USE [master]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Goods-Management')
BEGIN
CREATE DATABASE [Goods-Management] ON  PRIMARY 
( NAME = N'Goods-Management', FILENAME = N'E:\SQl server\MSSQL.1\MSSQL\DATA\Goods-Management.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Goods-Management_log', FILENAME = N'E:\SQl server\MSSQL.1\MSSQL\DATA\Goods-Management_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
EXEC dbo.sp_dbcmptlevel @dbname=N'Goods-Management', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Goods-Management].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Goods-Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Goods-Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Goods-Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Goods-Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Goods-Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Goods-Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Goods-Management] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Goods-Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Goods-Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Goods-Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Goods-Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Goods-Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Goods-Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Goods-Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Goods-Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Goods-Management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Goods-Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Goods-Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Goods-Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Goods-Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Goods-Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Goods-Management] SET  READ_WRITE 
GO
ALTER DATABASE [Goods-Management] SET RECOVERY FULL 
GO
ALTER DATABASE [Goods-Management] SET  MULTI_USER 
GO
ALTER DATABASE [Goods-Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Goods-Management] SET DB_CHAINING OFF 
USE [Goods-Management]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[U_id] [nchar](10) NOT NULL,
	[U_name] [nchar](50) NOT NULL,
	[U_password] [nchar](15) NOT NULL,
	[U_phone] [nchar](11) NULL,
	[U_emile] [nchar](50) NULL,
	[U_qq] [nchar](11) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Goods_Stock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Goods_Stock](
	[G_stockno] [nchar](50) NOT NULL,
	[G_name] [nchar](50) NOT NULL,
	[G_price] [nchar](10) NOT NULL,
	[G_count] [nchar](10) NOT NULL,
	[G_source] [nchar](10) NULL,
	[G_totalprice] [nchar](10) NOT NULL,
	[G_people] [nchar](50) NOT NULL,
	[G_date] [nchar](10) NOT NULL,
	[G_realpay] [nchar](10) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Goods_Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Goods_Order](
	[O_id] [nchar](50) NOT NULL,
	[O_name] [nchar](50) NOT NULL,
	[O_company] [nchar](50) NOT NULL,
	[O_count] [nchar](10) NOT NULL,
	[O_price] [nchar](10) NOT NULL,
	[O_personel] [nchar](10) NOT NULL,
	[O_time] [nchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[inventory_information]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[inventory_information](
	[G_id] [nchar](10) NOT NULL,
	[G_name] [nchar](50) NOT NULL,
	[G_count] [nchar](10) NOT NULL,
	[G_purchase] [nchar](10) NOT NULL,
	[G_company] [nchar](50) NOT NULL,
	[G_date] [nchar](10) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Goods_information]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Goods_information](
	[G_id] [nchar](20) NULL,
	[G_name] [nchar](20) NULL,
	[G_material] [nchar](10) NULL,
	[G_method] [nchar](10) NULL,
	[G_purpose] [nchar](10) NULL,
	[G_count] [nchar](10) NULL,
	[G_price] [nchar](10) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company_Information]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Company_Information](
	[C_name] [nchar](50) NOT NULL,
	[C_phone] [nchar](11) NOT NULL,
	[C_methed] [nchar](10) NOT NULL,
	[C_maingoods] [nchar](20) NULL,
	[C_qulity] [nchar](200) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Administr]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Administr](
	[A_id] [nchar](10) NOT NULL,
	[A_password] [nchar](15) NOT NULL
) ON [PRIMARY]
END
