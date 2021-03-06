USE [master]
GO
/****** Object:  Database [ToDoList_<IAGT>]    Script Date: 2/20/2018 7:21:38 PM ******/
CREATE DATABASE [ToDoList_<IAGT>]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToDoList__IAGT_', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ToDoList__IAGT_.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToDoList__IAGT__log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ToDoList__IAGT__log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ToDoList_<IAGT>] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToDoList_<IAGT>].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToDoList_<IAGT>] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET  MULTI_USER 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToDoList_<IAGT>] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToDoList_<IAGT>] SET QUERY_STORE = OFF
GO
USE [ToDoList_<IAGT>]
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
USE [ToDoList_<IAGT>]
GO
/****** Object:  Table [dbo].[ItemInfo]    Script Date: 2/20/2018 7:21:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemInfo](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](150) NOT NULL,
	[statusId] [int] NOT NULL,
	[PriorityId] [int] NOT NULL,
	[Archived] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
	[ModDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
 CONSTRAINT [PK_ItemInfo] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTags]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTags](
	[ItemTagId] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_ItemTags] PRIMARY KEY CLUSTERED 
(
	[ItemTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriorityNames]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityNames](
	[PriorityId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PriorityNames] PRIMARY KEY CLUSTERED 
(
	[PriorityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusNames]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusNames](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StatusNames] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ItemView]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ItemView]
AS
SELECT        dbo.ItemInfo.Title, dbo.ItemInfo.Description, dbo.Tag.Title AS Tag, dbo.StatusNames.Title AS Status, dbo.PriorityNames.Title AS Priority, dbo.ItemInfo.CreationDate, dbo.ItemInfo.DueDate, dbo.ItemInfo.Archived
FROM            dbo.ItemInfo INNER JOIN
                         dbo.ItemTags ON dbo.ItemTags.ItemId = dbo.ItemTags.ItemId INNER JOIN
                         dbo.PriorityNames ON dbo.ItemInfo.PriorityId = dbo.PriorityNames.PriorityId INNER JOIN
                         dbo.StatusNames ON dbo.ItemInfo.statusId = dbo.StatusNames.StatusId INNER JOIN
                         dbo.Tag ON dbo.ItemTags.TagId = dbo.Tag.TagId
GO
SET IDENTITY_INSERT [dbo].[ItemInfo] ON 

INSERT [dbo].[ItemInfo] ([ItemId], [Title], [Description], [statusId], [PriorityId], [Archived], [CreationDate], [ModDate], [DueDate]) VALUES (4, N'Read Harry Potter', N'Finish reading the first harry potter book to my kids', 2, 5, 0, CAST(N'2018-01-30' AS Date), CAST(N'2018-01-30' AS Date), CAST(N'2019-12-31' AS Date))
INSERT [dbo].[ItemInfo] ([ItemId], [Title], [Description], [statusId], [PriorityId], [Archived], [CreationDate], [ModDate], [DueDate]) VALUES (5, N'Write film script', N'Start writing for the avengers age of Josue Fan fiction movie.', 1, 1, 1, CAST(N'2018-01-30' AS Date), CAST(N'2018-01-30' AS Date), CAST(N'2018-02-01' AS Date))
INSERT [dbo].[ItemInfo] ([ItemId], [Title], [Description], [statusId], [PriorityId], [Archived], [CreationDate], [ModDate], [DueDate]) VALUES (6, N'Ace Academy', N'Demonstrate my computer skills to achieve the ultime honor, work at softtek', 4, 2, 0, CAST(N'2018-01-30' AS Date), CAST(N'2018-01-30' AS Date), CAST(N'2018-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[ItemInfo] OFF
SET IDENTITY_INSERT [dbo].[ItemTags] ON 

INSERT [dbo].[ItemTags] ([ItemTagId], [TagId], [ItemId]) VALUES (4, 1, 4)
INSERT [dbo].[ItemTags] ([ItemTagId], [TagId], [ItemId]) VALUES (5, 2, 4)
INSERT [dbo].[ItemTags] ([ItemTagId], [TagId], [ItemId]) VALUES (6, 3, 4)
SET IDENTITY_INSERT [dbo].[ItemTags] OFF
SET IDENTITY_INSERT [dbo].[PriorityNames] ON 

INSERT [dbo].[PriorityNames] ([PriorityId], [Title]) VALUES (1, N'1. Critical')
INSERT [dbo].[PriorityNames] ([PriorityId], [Title]) VALUES (2, N'2. High')
INSERT [dbo].[PriorityNames] ([PriorityId], [Title]) VALUES (3, N'3. Important')
INSERT [dbo].[PriorityNames] ([PriorityId], [Title]) VALUES (4, N'4. Normal')
INSERT [dbo].[PriorityNames] ([PriorityId], [Title]) VALUES (5, N'5. Low')
SET IDENTITY_INSERT [dbo].[PriorityNames] OFF
SET IDENTITY_INSERT [dbo].[StatusNames] ON 

INSERT [dbo].[StatusNames] ([StatusId], [Title]) VALUES (1, N'Draft')
INSERT [dbo].[StatusNames] ([StatusId], [Title]) VALUES (2, N'InProgress')
INSERT [dbo].[StatusNames] ([StatusId], [Title]) VALUES (3, N'Canceled')
INSERT [dbo].[StatusNames] ([StatusId], [Title]) VALUES (4, N'Done')
SET IDENTITY_INSERT [dbo].[StatusNames] OFF
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([TagId], [Title]) VALUES (1, N'Personal')
INSERT [dbo].[Tag] ([TagId], [Title]) VALUES (2, N'School')
INSERT [dbo].[Tag] ([TagId], [Title]) VALUES (3, N'Work')
INSERT [dbo].[Tag] ([TagId], [Title]) VALUES (4, N'Chruch')
INSERT [dbo].[Tag] ([TagId], [Title]) VALUES (5, N'Children')
SET IDENTITY_INSERT [dbo].[Tag] OFF
ALTER TABLE [dbo].[ItemInfo]  WITH CHECK ADD  CONSTRAINT [FK_ItemInfo_PriorityNames] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[PriorityNames] ([PriorityId])
GO
ALTER TABLE [dbo].[ItemInfo] CHECK CONSTRAINT [FK_ItemInfo_PriorityNames]
GO
ALTER TABLE [dbo].[ItemInfo]  WITH CHECK ADD  CONSTRAINT [FK_ItemInfo_StatusNames] FOREIGN KEY([statusId])
REFERENCES [dbo].[StatusNames] ([StatusId])
GO
ALTER TABLE [dbo].[ItemInfo] CHECK CONSTRAINT [FK_ItemInfo_StatusNames]
GO
ALTER TABLE [dbo].[ItemTags]  WITH CHECK ADD  CONSTRAINT [FK_ItemTags_ItemInfo] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemInfo] ([ItemId])
GO
ALTER TABLE [dbo].[ItemTags] CHECK CONSTRAINT [FK_ItemTags_ItemInfo]
GO
ALTER TABLE [dbo].[ItemTags]  WITH CHECK ADD  CONSTRAINT [FK_ItemTags_Tag] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tag] ([TagId])
GO
ALTER TABLE [dbo].[ItemTags] CHECK CONSTRAINT [FK_ItemTags_Tag]
GO
/****** Object:  StoredProcedure [dbo].[ArchiveItem]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ArchiveItem]
(
	@Index int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Archive Item Information
*/
begin try
	update ItemInfo 
	set Archived = 1
	where @index = ItemInfo.ItemId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[CancelItem]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[CancelItem]
(
	@Index int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Cancel Item Information
*/
begin try
	delete from ItemInfo
	where @index = ItemInfo.ItemId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[DeletePriority]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DeletePriority]
(
	@Index int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Delete Catalog Options
*/
begin try
	delete PriorityNames
	where @Index = PriorityNames.PriorityId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStatus]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[DeleteStatus]
(
	@Index int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Delete Catalog Options
*/
begin try
	delete StatusNames
	where @Index = StatusNames.StatusId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[DeleteTag]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DeleteTag]
(
	@Index int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Delete Catalog Options
*/
begin try
	delete Tag
	where @Index = Tag.TagId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[GetError]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetError]
AS
-- Check the error code in a catch statement

    SELECT ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
GO
/****** Object:  StoredProcedure [dbo].[GetItemInfo]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetItemInfo]

as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Get Item Information
*/
begin try
	select *
	from ItemInfo
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[GetPriorities]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetPriorities]
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Get Catalog Options
*/
begin try
	select *
	from PriorityNames
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[GetStatus]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetStatus]
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Get Catalog Options
*/
begin try
	select *
	from StatusNames
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[GetTags]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetTags]
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Get Catalog Options
*/
begin try
	select *
	from tag
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[InsertItemInfo]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[InsertItemInfo]
(
	@Title varchar(50),
	@Description varchar(150),
	@statusId int,
	@PriorityId int,
	@DueDate date
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Insert Item Information
*/
begin try
	insert into ItemInfo(Title, Description, statusId, PriorityId, Archived, CreationDate, ModDate, DueDate)
	Values(	@Title ,@Description,@statusId ,@PriorityId ,0 ,CONVERT (date, GETDATE())  ,CONVERT (date, GETDATE())  ,@DueDate )
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[InsertPriority]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsertPriority]
(
	@Description varchar(50)
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Insert Catalog Options
*/
begin try
	insert into PriorityNames(Title)
	Values (@Description)
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[InsertStatus]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsertStatus]
(
	@Description varchar(50)
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Insert Catalog Options
*/
begin try
	insert into StatusNames(Title)
	Values (@Description)
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[InsertTag]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[InsertTag]
(
	@Description varchar(50)
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Insert Catalog Options
*/
begin try
	insert into Tag(Title)
	Values (@Description)
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[SearchByDateRange]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SearchByDateRange]
(
	@StartDate date,
	@EndDate date,
	@Archived int --1 = yes / 0 = no

)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Search by Range Of Dates Item Information
*/
begin try
	select ii.Title, ii.Description, ii.DueDate
	from ItemInfo ii
	where ii.DueDate > @StartDate and ii.DueDate < @EndDate and ii.Archived = @Archived
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[SearchByItemTitle]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SearchByItemTitle]
(
	@Title varchar(50),
	@Archived int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Search Item Information by Related Tags
*/
begin try
	select *
	from ItemInfo ii
	where ii.Title = @Title and ii.Archived = @Archived
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[SearchByStatus]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SearchByStatus]
(
	@StatusIndex int,
	@archived int --1 = yes / 0 = no
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Search by Status Item Information
*/
begin try
	select ii.Title, ii.Description, sn.Title 
	from ItemInfo ii
	inner join StatusNames sn on sn.StatusId = ii.statusId
	where ii.statusId = @StatusIndex and ii.Archived = @archived
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[SearchByTags]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SearchByTags]
(
	@TagId int,
	@Archived int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Search Item Information by Related Tags
*/
begin try
	Select ii.Title as Title, tag.Title as Tag
	from ItemInfo ii
	inner join ItemTags IT on it.ItemId = ii.ItemId
	inner join Tag on tag.TagId = it.TagId
	where tag.TagId = @TagId and ii.Archived = @Archived
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[SearchByTitle]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SearchByTitle]
(
	@title varchar(50),
	@Archived int
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Search Item Information by title
*/
begin try
	Select *
	from ItemInfo ii
	where ii.Title = @Title and ii.Archived = @Archived
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[UpdateItemInfo]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateItemInfo]
(
	@Index int,
	@Title varchar(50),
	@Description varchar(150),
	@statusId int,
	@PriorityId int,
	@DueDate date
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Update Item Information
*/
begin try
	update ItemInfo 
	set Title = @Title, Description = @Description, statusId = @statusId, PriorityId = @PriorityId, ModDate = CONVERT (date, GETDATE()) , DueDate = @DueDate
	where @index = ItemInfo.ItemId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePriority]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdatePriority]
(
	@Index int,
	@Description varchar(50)
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Delete Catalog Options
*/
begin try
	update PriorityNames
	set Title = @Description
	where @Index = PriorityNames.PriorityId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatus]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateStatus]
(
	@Index int,
	@Description varchar(50)
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Delete Catalog Options
*/
begin try
	update StatusNames
	set Title = @Description
	where @Index = StatusNames.StatusId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTag]    Script Date: 2/20/2018 7:21:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UpdateTag]
(
	@Index int,
	@Description varchar(50)
)
as
begin transaction
/*
* 1/30/2018
* Ivan Alexis Garza Tapia
* Softtek dotnet Academy - Module 3 Final Test
* Delete Catalog Options
*/
begin try
	update Tag
	set Title = @Description
	where @Index = Tag.TagId
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ItemInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ItemTags"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PriorityNames"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StatusNames"
            Begin Extent = 
               Top = 102
               Left = 454
               Bottom = 198
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tag"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 216
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ItemView'
GO
USE [master]
GO
ALTER DATABASE [ToDoList_<IAGT>] SET  READ_WRITE 
GO
