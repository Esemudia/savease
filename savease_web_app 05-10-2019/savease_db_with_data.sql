USE [master]
GO
/****** Object:  Database [DB_A35056_savease]    Script Date: 12/14/2018 1:16:58 AM ******/
CREATE DATABASE [DB_A35056_savease]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'savease', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\\DB_A35056_savease_DATA.mdf' , SIZE = 4480KB , MAXSIZE = 1024000KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'savease_log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\\DB_A35056_savease_log.ldf' , SIZE = 768KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_A35056_savease] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A35056_savease].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A35056_savease] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A35056_savease] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A35056_savease] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_A35056_savease] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A35056_savease] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A35056_savease] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A35056_savease] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A35056_savease] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A35056_savease] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A35056_savease] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DB_A35056_savease]
GO
/****** Object:  Schema [db_a35056_savease]    Script Date: 12/14/2018 1:17:05 AM ******/
CREATE SCHEMA [db_a35056_savease]
GO
/****** Object:  Table [dbo].[Bankdeposit]    Script Date: 12/14/2018 1:17:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bankdeposit](
	[depID] [int] IDENTITY(1,1) NOT NULL,
	[tranRef] [varchar](20) NOT NULL,
	[acctNo] [varchar](50) NOT NULL,
	[cardpin] [varchar](50) NOT NULL,
	[cardsn] [varchar](50) NOT NULL,
	[bankName] [varchar](50) NOT NULL,
	[amount] [float] NOT NULL,
	[acctName] [varchar](50) NOT NULL,
	[depositor] [varchar](50) NOT NULL,
	[transactionDate] [datetime] NOT NULL,
	[computerName] [varchar](50) NULL,
	[ipaddress] [varchar](50) NULL,
 CONSTRAINT [PK_Bankdeposit] PRIMARY KEY CLUSTERED 
(
	[depID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 12/14/2018 1:17:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[BankName] [varchar](50) NOT NULL,
	[BankRef] [varchar](10) NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[BankName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[beneficiaryBank]    Script Date: 12/14/2018 1:17:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[beneficiaryBank](
	[benID] [int] IDENTITY(1,1) NOT NULL,
	[acctNo] [varchar](10) NOT NULL,
	[acctOwner] [varchar](50) NOT NULL,
	[bankName] [varchar](50) NOT NULL,
	[sender] [varchar](50) NOT NULL,
	[pinID] [nvarchar](50) NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
	[emailID] [varchar](50) NULL,
 CONSTRAINT [PK_beneficiaryBank] PRIMARY KEY CLUSTERED 
(
	[benID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blockPinReq]    Script Date: 12/14/2018 1:17:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blockPinReq](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blockBy] [varchar](50) NOT NULL,
	[orderNumber] [varchar](50) NOT NULL,
	[uniqueID] [varchar](50) NOT NULL,
	[reqDate] [datetime] NOT NULL,
	[reqStatus] [varchar](50) NOT NULL,
	[reqBy] [varchar](50) NOT NULL,
	[actionedBy] [varchar](50) NULL,
	[actionedStatus] [varchar](50) NULL,
	[actionedDate] [datetime] NULL,
 CONSTRAINT [PK_blockPinReq] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[card_image]    Script Date: 12/14/2018 1:17:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[card_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_card_image] PRIMARY KEY CLUSTERED 
(
	[imageName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complain]    Script Date: 12/14/2018 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complain](
	[Name] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[ComplainType] [varchar](50) NULL,
	[Complain] [varchar](max) NULL,
	[TransImage] [image] NULL,
	[RefernceNo] [nvarchar](50) NULL,
	[status] [int] NULL,
	[Date_Time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[complaintbl]    Script Date: 12/14/2018 1:17:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[complaintbl](
	[complainID] [int] NOT NULL,
	[saveaseID] [int] NOT NULL,
	[complainType] [varchar](1) NOT NULL,
	[complians] [text] NOT NULL,
	[dateofcomplain] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contents]    Script Date: 12/14/2018 1:17:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[header] [varchar](50) NULL,
	[contents] [text] NULL,
	[section] [char](3) NULL,
	[page] [varchar](50) NULL,
	[enabled] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 12/14/2018 1:17:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(61,1) NOT NULL,
	[nsssID] [varchar](20) NOT NULL,
	[first_name] [varchar](25) NOT NULL,
	[mid_name] [varchar](50) NULL,
	[last_name] [varchar](30) NOT NULL,
	[DOB] [date] NOT NULL,
	[gender] [varchar](13) NOT NULL,
	[photoFront] [varbinary](max) NULL,
	[photoFrontPath] [varchar](50) NULL,
	[photoLeft] [varbinary](max) NULL,
	[photoLeftPath] [varchar](50) NULL,
	[photoRight] [varbinary](max) NULL,
	[photoRightPath] [varchar](50) NULL,
	[street_address] [varchar](105) NOT NULL,
	[lga_of_residence] [varchar](100) NOT NULL,
	[town_city] [varchar](100) NOT NULL,
	[state_of_residence] [varchar](50) NOT NULL,
	[state_of_origin] [varchar](20) NOT NULL,
	[lga_of_origin] [varchar](20) NOT NULL,
	[city_of_birth] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[phone] [varchar](20) NOT NULL,
	[emailID] [varchar](100) NULL,
	[employment_status] [varchar](20) NOT NULL,
	[occupation] [varchar](30) NULL,
	[employer_id] [varchar](13) NULL,
	[highest_qualification] [varchar](50) NULL,
	[marital_status] [varchar](20) NOT NULL,
	[disabilities] [varchar](10) NULL,
	[orphan] [varchar](10) NULL,
	[status] [int] NULL,
	[dateCreated] [datetime] NULL,
	[createdby] [varchar](20) NULL,
	[taxTypeId] [int] NULL,
	[yearlyIncome] [float] NULL,
	[tin] [varchar](20) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 12/14/2018 1:17:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location] [int] NULL,
	[districtName] [varchar](50) NULL,
 CONSTRAINT [PK_district] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 12/14/2018 1:17:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[Username] [nvarchar](50) NULL,
	[referenceNumber] [nvarchar](50) NULL,
	[Description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leftnavigation]    Script Date: 12/14/2018 1:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leftnavigation](
	[id] [int] IDENTITY(12,1) NOT NULL,
	[text] [varchar](20) NULL,
	[link] [varchar](30) NULL,
	[accessControl] [int] NULL,
	[activate] [int] NOT NULL,
	[orderby] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mailbox]    Script Date: 12/14/2018 1:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mailbox](
	[notID] [int] IDENTITY(1,1) NOT NULL,
	[saveaseID] [varchar](50) NULL,
	[subject] [varchar](100) NULL,
	[contents] [text] NULL,
	[sendDate] [datetime] NULL,
	[readInboxStatus] [int] NULL,
	[readSentStatus] [int] NULL,
	[senderName] [varchar](50) NULL,
	[recerverID] [varchar](50) NULL,
	[recieverName] [varchar](50) NULL,
	[orderNumber] [varchar](50) NULL,
 CONSTRAINT [PK_mailbox] PRIMARY KEY CLUSTERED 
(
	[notID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Group]    Script Date: 12/14/2018 1:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Group](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[orderNumber] [varchar](8) NULL,
	[orderAmount] [float] NULL,
	[orderBy] [varchar](50) NULL,
	[orderStatus] [int] NULL,
	[computerName] [varchar](50) NULL,
	[ipaddress] [varchar](50) NULL,
	[orderDate] [datetime] NULL,
 CONSTRAINT [PK_Order_Group] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/14/2018 1:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[pinID] [int] IDENTITY(1,1) NOT NULL,
	[card_pin] [varchar](12) NULL,
	[cardpin_sn] [varchar](16) NULL,
	[orderNumber] [varchar](50) NULL,
	[cardType] [varchar](50) NULL,
	[cardAmount] [float] NULL,
	[chargeOnCard] [float] NULL,
	[orderby] [varchar](50) NULL,
	[computerName] [varchar](50) NULL,
	[ipaddress] [varchar](50) NULL,
	[orderStatus] [varchar](50) NULL,
	[oderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[pinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Queue]    Script Date: 12/14/2018 1:17:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Queue](
	[ID] [bigint] NOT NULL,
	[UserID] [int] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[SenderID] [varchar](15) NOT NULL,
	[Data1] [varchar](440) NOT NULL,
	[Data2] [varchar](440) NOT NULL,
	[Flash] [bit] NOT NULL,
	[SendDatetime] [datetime] NOT NULL,
	[Priority] [int] NOT NULL,
	[Retrycount] [int] NOT NULL,
	[CostCentre] [varchar](50) NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[Status] [varchar](4500) NOT NULL,
	[StatusID] [varchar](4500) NOT NULL,
	[NumTo] [varchar](4500) NOT NULL,
	[content] [varchar](3000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 12/14/2018 1:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[role_Name] [varchar](20) NOT NULL,
	[RoleDescription] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[savease_beneficiary]    Script Date: 12/14/2018 1:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[savease_beneficiary](
	[benID] [int] IDENTITY(1,1) NOT NULL,
	[saveaseID] [varchar](50) NOT NULL,
	[savedFor] [varchar](50) NOT NULL,
	[dateAdded] [datetime] NULL,
	[BankName] [varchar](50) NULL,
 CONSTRAINT [PK_savease_beneficiary] PRIMARY KEY CLUSTERED 
(
	[benID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[savease_web_menu]    Script Date: 12/14/2018 1:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[savease_web_menu](
	[ID] [int] IDENTITY(8,1) NOT NULL,
	[MENUID] [int] NOT NULL,
	[LINK] [varchar](50) NULL,
	[TITLE] [varchar](50) NULL,
	[PARENTID] [int] NULL,
	[INSTALLED] [char](1) NULL,
	[ENABLED] [char](1) NULL,
	[GROUPLVL] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seaudittrail]    Script Date: 12/14/2018 1:17:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seaudittrail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskName] [varchar](30) NOT NULL,
	[computerName] [varchar](30) NOT NULL,
	[ipaddress] [varchar](11) NULL,
	[AUDITDATETIME] [datetime] NOT NULL,
	[ACTIONPERFORMED] [varchar](1) NULL,
	[taskid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seroleassignment]    Script Date: 12/14/2018 1:17:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seroleassignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuid] [int] NOT NULL,
	[roleid] [int] NULL,
	[read] [varchar](20) NULL,
	[write] [varchar](20) NULL,
	[enabled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state_lga]    Script Date: 12/14/2018 1:17:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state_lga](
	[LGA] [varchar](50) NOT NULL,
	[STATE] [varchar](25) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReset]    Script Date: 12/14/2018 1:17:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReset](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[cyears] [int] NOT NULL,
	[cmonth] [int] NOT NULL,
	[cdate] [int] NOT NULL,
	[chrs] [int] NOT NULL,
	[cmins] [int] NOT NULL,
	[eyears] [int] NOT NULL,
	[emonth] [int] NOT NULL,
	[edate] [int] NOT NULL,
	[ehrs] [int] NOT NULL,
	[emins] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransfer]    Script Date: 12/14/2018 1:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransfer](
	[tid] [int] IDENTITY(1,1) NOT NULL,
	[transferCode] [varchar](8) NOT NULL,
	[balB4Transfer] [float] NOT NULL,
	[amountTransfered] [float] NOT NULL,
	[balance] [float] NOT NULL,
	[beneficiaryAccount] [varchar](50) NOT NULL,
	[beneficaryName] [varchar](100) NOT NULL,
	[accountNo] [varchar](50) NOT NULL,
	[transferedBy] [varchar](50) NOT NULL,
	[computerName] [varchar](50) NOT NULL,
	[transferStatus] [varchar](50) NOT NULL,
	[transactionDate] [datetime] NULL,
 CONSTRAINT [PK_tblTransfer] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_pin]    Script Date: 12/14/2018 1:17:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_pin](
	[pinID] [int] IDENTITY(1,1) NOT NULL,
	[cardpin] [varchar](12) NOT NULL,
	[cardpin_sn] [varchar](16) NOT NULL,
	[groupid] [int] NOT NULL,
 CONSTRAINT [PK_Transaction_pin] PRIMARY KEY CLUSTERED 
(
	[pinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/14/2018 1:17:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[salutation] [varchar](50) NULL,
	[fName] [varchar](50) NULL,
	[mName] [varchar](50) NULL,
	[lName] [varchar](50) NULL,
	[dName] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[role_group_id] [int] NULL,
	[createdDate] [datetime] NULL,
	[createdBy] [varchar](50) NULL,
	[balance] [float] NULL,
	[saveaseID] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[token] [varchar](100) NULL,
	[status] [varchar](50) NULL,
	[Credits] [int] NULL,
	[Active] [bit] NULL,
	[SendStartHour] [int] NULL,
	[SendEndHour] [int] NULL,
	[GetRepliesInterval] [int] NULL,
	[GetDRInterval] [int] NULL,
	[GetSCInterval] [int] NULL,
	[ProcessQueueInterval] [int] NULL,
	[MaxRepliesID] [int] NULL,
	[userlevel] [int] NULL,
	[MaxDRID] [int] NULL,
	[MaxSCID] [int] NULL,
	[LastProcessReplies] [datetime] NULL,
	[LastProcessDR] [datetime] NULL,
	[LastProcessSC] [datetime] NULL,
	[LastProcessQueue] [datetime] NULL,
	[password2] [datetime] NULL,
	[companyName] [varchar](50) NULL,
	[CompanyAddress] [varchar](50) NULL,
	[bvn] [varchar](50) NULL,
	[cacRegNo] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users2]    Script Date: 12/14/2018 1:17:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users2](
	[UserID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Credits] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[SendStartHour] [int] NOT NULL,
	[SendEndHour] [int] NOT NULL,
	[GetRepliesInterval] [int] NOT NULL,
	[GetDRInterval] [int] NOT NULL,
	[GetSCInterval] [int] NOT NULL,
	[ProcessQueueInterval] [int] NOT NULL,
	[MaxRepliesID] [int] NOT NULL,
	[MaxDRID] [int] NOT NULL,
	[MaxSCID] [int] NOT NULL,
	[LastProcessReplies] [datetime] NULL,
	[LastProcessDR] [datetime] NULL,
	[LastProcessSC] [datetime] NULL,
	[LastProcessQueue] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendor]    Script Date: 12/14/2018 1:17:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendor](
	[vendor_ID] [int] IDENTITY(320,1) NOT NULL,
	[registration_number] [varchar](10) NULL,
	[vendors_name] [varchar](100) NULL,
	[contact_phone] [varchar](20) NULL,
	[contact_email] [varchar](50) NULL,
	[location] [varchar](70) NULL,
	[tin] [varchar](30) NULL,
	[districtID] [int] NULL,
	[website] [varchar](105) NULL,
	[status] [int] NULL,
	[state] [varchar](50) NULL,
	[lga] [varchar](50) NULL,
	[address] [varchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdby] [varchar](10) NULL,
	[Balance] [float] NULL,
 CONSTRAINT [PK_vendor] PRIMARY KEY CLUSTERED 
(
	[vendor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendorops]    Script Date: 12/14/2018 1:17:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorops](
	[id] [int] IDENTITY(320,1) NOT NULL,
	[contact_name] [varchar](50) NULL,
	[contact_phone] [varchar](20) NULL,
	[contact_email] [varchar](50) NULL,
	[location] [varchar](70) NULL,
	[registration_number] [varchar](10) NULL,
	[status] [int] NULL,
	[state] [varchar](50) NULL,
	[lga] [varchar](50) NULL,
	[city] [varchar](100) NULL,
	[address] [varchar](max) NULL,
	[createdDate] [datetime] NULL,
	[createdby] [varchar](10) NULL,
 CONSTRAINT [PK_vendorops] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwBeneficiary]    Script Date: 12/14/2018 1:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwBeneficiary]
AS
SELECT        dbo.savease_beneficiary.saveaseID, dbo.users.fName + '  ' + dbo.users.lName AS fullname, dbo.users.phone, dbo.users.email, dbo.savease_beneficiary.savedFor, dbo.savease_beneficiary.dateAdded, 
                         dbo.savease_beneficiary.BankName
FROM            dbo.savease_beneficiary INNER JOIN
                         dbo.users ON dbo.savease_beneficiary.saveaseID = dbo.users.saveaseID
WHERE        (dbo.users.status = '1')
GO
SET IDENTITY_INSERT [dbo].[Bankdeposit] ON 

INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (1, N'34138718', N'1234567', N'689880318889', N'6898809931888933', N'Savease', 50, N'Okpako mudia', N'sismolin', CAST(N'2018-11-28T23:46:08.360' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (2, N'52741380', N'1234567', N'476792720055', N'1019679497653597', N'Savease', 50, N'Okpako mudia', N'sismolin', CAST(N'2018-11-29T04:05:58.123' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (3, N'65663452', N'1234567', N'476792720055', N'1019679497653597', N'Savease', 50, N'Okpako mudia', N'sismolin', CAST(N'2018-11-29T04:11:23.170' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (4, N'66776859', N'2892892', N'779947127819', N'7799483312781987', N'Savease', 50, N'Francis ekendia', N'sismolin', CAST(N'2018-11-29T04:41:27.190' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (5, N'38549331', N'2892892', N'779947127819', N'7799483312781987', N'Savease', 50, N'Francis ekendia', N'sismolin', CAST(N'2018-11-29T04:43:13.733' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (6, N'86001301', N'2892892', N'789151520729', N'7891526752072993', N'Savease', 100, N'Francis ekendia', N'sismolin', CAST(N'2018-11-29T05:13:14.300' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (7, N'70229734', N'2892892', N'789151520729', N'', N'Savease', 100, N'Francis ekendia', N'sismolin', CAST(N'2018-11-29T05:14:41.740' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (8, N'83791914', N'2892892', N'789151520729', N'', N'Savease', 100, N'Francis ekendia', N'sismolin', CAST(N'2018-11-29T05:15:01.427' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (9, N'95976599', N'2892892', N'789151520729', N'', N'Savease', 100, N'Francis ekendia', N'sismolin', CAST(N'2018-11-29T05:15:13.473' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (10, N'82935830', N'1234567', N'212077245957', N'2120772124595802', N'Savease', 5000, N'Okpako mudia', N'sismolin', CAST(N'2018-11-29T10:05:03.247' AS DateTime), N'WIN-SD4VKI4AO4F', N'192.168.19.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (11, N'52401841', N'8232941634', N'936410159578', N'9364109315957859', N'Savease', 100, N'ese james', N'bloff', CAST(N'2018-12-01T16:17:26.020' AS DateTime), N'win7018', N'10.10.77.25')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (12, N'31042667', N'2742918113', N'674141349123', N'6741420034912391', N'Savease', 200, N'ese okpako', N'sismolin', CAST(N'2018-12-04T04:25:29.723' AS DateTime), N'PHC-DEVELOPER2', N'192.168.137.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (13, N'38283186', N'2742918113', N'261261306004', N'2612615230600444', N'Savease', 50, N'ese okpako', N'sismolin', CAST(N'2018-12-04T05:09:53.347' AS DateTime), N'PHC-DEVELOPER2', N'192.168.137.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (14, N'21679621', N'2892892', N'613485434350', N'6134864143435050', N'Savease', 100, N'Francis ekendia', N'bloff', CAST(N'2018-12-04T05:31:50.900' AS DateTime), N'PHC-DEVELOPER2', N'192.168.137.1')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (15, N'46948527', N'7450139399', N'650270154537', N'6502715115453787', N'Savease', 50, N'Ayomiposi Akinsiku', N'e.fieoku', CAST(N'2018-12-04T12:47:06.917' AS DateTime), N'win7018', N'10.10.77.25')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (16, N'67216735', N'7450139399', N'307463445352', N'7040065287462026', N'Savease', 100, N'Ayomiposi Akinsiku', N'e.fieoku', CAST(N'2018-12-04T12:49:04.333' AS DateTime), N'win7018', N'10.10.77.25')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (17, N'26878458', N'7450139399', N'308588127538', N'3085889312753880', N'Savease', 50, N'Ayomiposi Akinsiku', N'sismolin', CAST(N'2018-12-13T09:06:05.693' AS DateTime), N'win7018', N'10.10.77.25')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (18, N'90977762', N'2742918113', N'165600595750', N'1656007859575075', N'Savease', 500, N'ese okpako', N'bloff', CAST(N'2018-12-13T17:21:56.497' AS DateTime), N'HP', N'192.168.42.17')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (19, N'87731803', N'2742918113', N'291833466165', N'2918340946616570', N'Savease', 50, N'ese okpako', N'bloff', CAST(N'2018-12-13T23:59:47.547' AS DateTime), N'HP', N'192.168.43.212')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (20, N'26242035', N'2742918113', N'957538975719', N'9575398197572095', N'Savease', 200, N'ese okpako', N'bloff', CAST(N'2018-12-14T00:10:30.290' AS DateTime), N'HP', N'192.168.43.212')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (21, N'29963002', N'2892892', N'925244302092', N'9252455830209242', N'Savease', 50, N'Francis ekendia', N'e.fieoku', CAST(N'2018-12-14T00:51:11.717' AS DateTime), N'HP', N'192.168.43.212')
INSERT [dbo].[Bankdeposit] ([depID], [tranRef], [acctNo], [cardpin], [cardsn], [bankName], [amount], [acctName], [depositor], [transactionDate], [computerName], [ipaddress]) VALUES (22, N'25415152', N'2892892', N'743635299608', N'7436357629960863', N'Savease', 50, N'Francis ekendia', N'e.fieoku', CAST(N'2018-12-14T00:55:39.987' AS DateTime), N'HP', N'192.168.43.212')
SET IDENTITY_INSERT [dbo].[Bankdeposit] OFF
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'Diamond Bank', N'DB')
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'Eco Bank', N'EB')
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'First Bank', N'FBN')
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'GT Bank', N'GTB')
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'UBA', N'UBA')
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'Wema Bank', N'WB')
INSERT [dbo].[Banks] ([BankName], [BankRef]) VALUES (N'Zenith Bank', N'ZB')
SET IDENTITY_INSERT [dbo].[beneficiaryBank] ON 

INSERT [dbo].[beneficiaryBank] ([benID], [acctNo], [acctOwner], [bankName], [sender], [pinID], [phoneNumber], [emailID]) VALUES (1, N'1234567', N'jonathan ataisi', N'savease', N'admin', N'613485434350', N'08035529398', N'jo@yahoo.com')
SET IDENTITY_INSERT [dbo].[beneficiaryBank] OFF
SET IDENTITY_INSERT [dbo].[blockPinReq] ON 

INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (1, N'By Batch', N'59059731', N'6898809931888933', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (2, N'By Batch', N'59059731', N'2612615230600444', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (3, N'By Batch', N'59059731', N'1527853832476818', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (4, N'Card PIN', N'427314259184286', N'7799483312781987', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (5, N'By Batch', N'967789872018', N'2621538826159164', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (6, N'By Batch', N'967789872018', N'6134864143435050', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
INSERT [dbo].[blockPinReq] ([id], [blockBy], [orderNumber], [uniqueID], [reqDate], [reqStatus], [reqBy], [actionedBy], [actionedStatus], [actionedDate]) VALUES (7, N'By Batch', N'967789872018', N'7891526752072993', CAST(N'2018-10-11T00:00:00.000' AS DateTime), N'Block', N'admin', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[blockPinReq] OFF
SET IDENTITY_INSERT [dbo].[card_image] ON 

INSERT [dbo].[card_image] ([id], [imageName]) VALUES (1, N'card_back.png')
INSERT [dbo].[card_image] ([id], [imageName]) VALUES (2, N'card_back1.png')
INSERT [dbo].[card_image] ([id], [imageName]) VALUES (3, N'card_back2.png')
INSERT [dbo].[card_image] ([id], [imageName]) VALUES (4, N'card_back3.png')
SET IDENTITY_INSERT [dbo].[card_image] OFF
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [nsssID], [first_name], [mid_name], [last_name], [DOB], [gender], [photoFront], [photoFrontPath], [photoLeft], [photoLeftPath], [photoRight], [photoRightPath], [street_address], [lga_of_residence], [town_city], [state_of_residence], [state_of_origin], [lga_of_origin], [city_of_birth], [City], [phone], [emailID], [employment_status], [occupation], [employer_id], [highest_qualification], [marital_status], [disabilities], [orphan], [status], [dateCreated], [createdby], [taxTypeId], [yearlyIncome], [tin]) VALUES (61, N'2312443', N'Bola', NULL, N'Ajibade', CAST(N'1977-01-29' AS Date), N'Female', NULL, NULL, NULL, NULL, NULL, NULL, N'4 King Perekule Street', N'', N'ABAJI', N'ABUJA', N'JIGAWA', N'AUYO', NULL, NULL, N'123456780', NULL, N'Employed', NULL, NULL, N'Masters Degree', N'Married', NULL, N'No', 0, CAST(N'2017-08-18T16:04:07.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[customers] ([id], [nsssID], [first_name], [mid_name], [last_name], [DOB], [gender], [photoFront], [photoFrontPath], [photoLeft], [photoLeftPath], [photoRight], [photoRightPath], [street_address], [lga_of_residence], [town_city], [state_of_residence], [state_of_origin], [lga_of_origin], [city_of_birth], [City], [phone], [emailID], [employment_status], [occupation], [employer_id], [highest_qualification], [marital_status], [disabilities], [orphan], [status], [dateCreated], [createdby], [taxTypeId], [yearlyIncome], [tin]) VALUES (62, N'43216743', N'Piriye', NULL, N'Bob-Manuel', CAST(N'1968-08-17' AS Date), N'Male', NULL, NULL, NULL, NULL, NULL, NULL, N'plot 40, Odili Road', N'', N'ABOH MBAISE', N'IMO', N'IMO', N'', NULL, NULL, N'08035529854', NULL, N'Employed', N'Press Man', NULL, N'BSc. Mass Communication', N'Single', N'No', N'No', 0, CAST(N'2017-08-17T16:54:19.000' AS DateTime), N'admin', NULL, NULL, NULL)
INSERT [dbo].[customers] ([id], [nsssID], [first_name], [mid_name], [last_name], [DOB], [gender], [photoFront], [photoFrontPath], [photoLeft], [photoLeftPath], [photoRight], [photoRightPath], [street_address], [lga_of_residence], [town_city], [state_of_residence], [state_of_origin], [lga_of_origin], [city_of_birth], [City], [phone], [emailID], [employment_status], [occupation], [employer_id], [highest_qualification], [marital_status], [disabilities], [orphan], [status], [dateCreated], [createdby], [taxTypeId], [yearlyIncome], [tin]) VALUES (63, N'24929', N'Dafiri', NULL, N'Irimagha', CAST(N'1977-10-29' AS Date), N'Male', NULL, NULL, NULL, NULL, NULL, NULL, N'10 Tombia Street', N'', N'Port Harcourt', N'Rivers State', N'Rivers State', N'', NULL, NULL, N'', NULL, N'Self-employed', NULL, N'421232', N'University Degree', N'Married', N'No', N'No', 0, CAST(N'2017-07-15T02:44:54.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[customers] OFF
INSERT [dbo].[feedback] ([Username], [referenceNumber], [Description]) VALUES (N'okpako1', N'ref123547uf', N'thanks')
SET IDENTITY_INSERT [dbo].[leftnavigation] ON 

INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (12, N'Buy Voucher', N'buypin', 1, 1, 4)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (13, N'Register Bank', N'bankNew', 0, 0, 30)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (14, N'Make Deposit', N'Deposit', 1, 1, 1)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (15, N'Transactions', N'transactions', 1, 1, 18)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (16, N'Manage Vendors', N'manageVendor', 0, 1, 34)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (17, N'Sell To Vendor', N'sell2vendor', 0, 1, 11)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (18, N'Buy Savease PIN', N'vbuypin', 2, 1, 4)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (19, N'Register Bank', N'vbanknew', 2, 1, 30)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (20, N'Make Deposit', N'deposit', 2, 1, 1)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (21, N'Transactions', N'vtransactions', 2, 1, 18)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (22, N'Manage Users', N'adm_create_user', 0, 1, 12)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (26, N'Self Service', N'support', 0, 0, NULL)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (24, N'Withdrawal', N'withdraw', 3, 0, NULL)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (25, N'Withdrawal', N'withdraw', 3, 0, NULL)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (27, N'Self Service', N'support', 0, 0, NULL)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (28, N'My Profile', N'profile', 0, 1, 26)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (29, N'My Profile', N'profile', 1, 1, 26)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (30, N'My Profile', N'profile', 2, 1, 26)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1023, N'Transfer', N'transfer', 0, 1, 7)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1024, N'Transfer', N'transfer', 1, 1, 7)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1025, N'Transfer', N'transfer', 2, 1, 7)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1026, N'Beneficiary List', N'beneficiary', 0, 1, 15)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1027, N'Beneficiary List', N'beneficiary', 1, 1, 15)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1028, N'Beneficiary List', N'beneficiary', 2, 1, 15)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1029, N'Register Bank', N'registerbank', 0, 1, 30)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1030, N'Register Bank', N'registerbank', -1, 1, 30)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1031, N'Block Pin Request', N'blockpinreq', 1, 1, 11)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1032, N'Block Pin', N'blockpin', -1, 1, 11)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1037, N'Users Table', N'datatable', 0, 1, 13)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1038, N'Vendors Table', N'vendors', 0, 1, 14)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1041, N'Fund Account', N'#', 1, 1, 14)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1036, N'Register New Admin', N'registeradmin', -1, 1, 16)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1046, N'Inbox | Notification', N'MailBox', 2, 1, 22)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1050, N'Print Voucher', N'pin', 1, 1, 20)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1039, N'Users Table', N'datatable', -1, 1, 13)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1040, N'Vendors Table', N'vendors', -1, 1, 14)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1047, N'Inbox | Notification', N'MailBox', 1, 1, 22)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1048, N'Inbox | Notification', N'AdminMailBox', 0, 1, 22)
INSERT [dbo].[leftnavigation] ([id], [text], [link], [accessControl], [activate], [orderby]) VALUES (1049, N'Inbox | Notification', N'AdminMailBox', -1, 1, 22)
SET IDENTITY_INSERT [dbo].[leftnavigation] OFF
SET IDENTITY_INSERT [dbo].[mailbox] ON 

INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (1, N'1234567', N'test', N'<b>test content</b>', NULL, NULL, NULL, N'ekendia Francis', N'60139694953', N'Samuel Shalem', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (2, NULL, N'Test', N'This is a test tomake sure its working properly', CAST(N'2018-12-08T16:52:28.200' AS DateTime), 0, 0, N'bloff', N'4094640444', N'okpako ese', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (3, N'sismolin', N'test', N'                      
           asdfgujikzxcvbnmdftgyhujikdcfvgh         ', CAST(N'2018-12-09T20:39:11.990' AS DateTime), 0, 0, N'Francis  ekendia', N'2742918113', N'okpako ese', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (4, N'2892892', N'Test ', N'This is a test project 
', CAST(N'2018-12-09T20:58:55.713' AS DateTime), 0, 0, N'Francis  ekendia', N'2742918113', N'okpako ese', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (5, N'2892892', N'TEsted', N'This is the blinging                       
                    ', CAST(N'2018-12-09T21:15:19.400' AS DateTime), 1, 0, N'Francis  ekendia', N'2742918113', N'okpako ese', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (6, N'2892892', N'test', N'ssvsdvsdvdv    ', CAST(N'2018-12-09T21:17:29.387' AS DateTime), 0, 0, N'Francis  ekendia', N'2742918113', N'okpako ese', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (7, N'7450139399', N'Welcome to Savease', N'Dear Francis,
Kindly receive this mail as welcome message from all of us Savease.

We will help you with your finances

Kind regards,
Ayomiposi Akinsiku', CAST(N'2018-12-10T09:25:30.670' AS DateTime), 0, 0, N'Ayomiposi  Akinsiku', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (8, N'7450139399', N'Welcome to Savease', N'Dear Francis,
Kindly receive this mail as welcome message from all of us Savease.

We will help you with your finances

Kind regards,
Ayomiposi Akinsiku', CAST(N'2018-12-10T09:25:43.323' AS DateTime), 0, 0, N'Ayomiposi  Akinsiku', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (9, N'7450139399', N'Welcome to Savease', N'Dear Francis,
Kindly receive this mail as welcome message from all of us Savease.

We will help you with your finances

Kind regards,
Ayomiposi Akinsiku', CAST(N'2018-12-10T09:25:46.887' AS DateTime), 0, 0, N'Ayomiposi  Akinsiku', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (10, N'7450139399', N'Welcome to Savease', N'Dear Francis,
Kindly receive this mail as welcome message from all of us Savease.

We will help you with your finances

Kind regards,
Ayomiposi Akinsiku', CAST(N'2018-12-10T09:26:17.713' AS DateTime), 1, 0, N'Ayomiposi  Akinsiku', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (11, N'2892892', N'Test', N'Hi', CAST(N'2018-12-10T17:28:40.873' AS DateTime), 0, 0, N'Francis  ekendia', N'7450139399 ', N'Akinsiku Ayomiposi', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (12, N'2742918113', N'test', N'thsindkhdcmvnvs ', CAST(N'2018-12-10T22:04:34.740' AS DateTime), 0, 0, N'ese  okpako', N'2892892', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (13, N'2742918113', N'this is a new test', N'thsdijdsivsdvdkjsbv ubvsdjbvukdkjv jjbvsdbvdbv jgukjdbsvdkjvjbvjkdbvjdvbkvnmjgsdvjdbjvkbdvkbskvbvbdkjvdkvbdvk bvuvjd
vm vudv
sbvusd
', CAST(N'2018-12-11T02:28:47.507' AS DateTime), 0, 0, N'ese  okpako', N'2892892', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (14, N'2742918113', N'this is a new test', N'thsdijdsivsdvdkjsbv ubvsdjbvukdkjv jjbvsdbvdbv jgukjdbsvdkjvjbvjkdbvjdvbkvnmjgsdvjdbjvkbdvkbskvbvbdkjvdkvbdvk bvuvjd
vm vudv
sbvusd
', CAST(N'2018-12-11T02:29:47.660' AS DateTime), 0, 0, N'ese  okpako', N'2892892', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (15, N'7450139399', N'Test 14:24', N'Hi', CAST(N'2018-12-11T14:24:42.270' AS DateTime), 1, 0, N'Ayomiposi  Akinsiku', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (16, N'2892892', N'Credit Alert <Order>', N' Order Number: 12687512122018', CAST(N'2018-12-12T03:56:11.990' AS DateTime), 1, 0, N'Francis ekendia', N'2892892', N'Francis ekendia', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (17, N'2892892', N'Credit Alert <Order>', N' Order Number: 88532612122018', CAST(N'2018-12-12T04:03:44.927' AS DateTime), 1, 0, N'Francis ekendia', N'2892892', N'Francis ekendia', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (18, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:34.360' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (19, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:43.670' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (20, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:50.343' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (21, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:50.763' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (22, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:51.170' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (23, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:51.513' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (24, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:51.873' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (25, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:52.187' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (26, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:52.500' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (27, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:52.810' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (28, N'2742918113', N'Test', N'tesr', CAST(N'2018-12-12T07:04:53.140' AS DateTime), 0, 0, N'ese  okpako', N'2892892 ', N'ekendia Francis', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (29, N'2892892', N'Credit Alert <Order>', N' Order Number: 25222413122018', CAST(N'2018-12-13T07:13:08.053' AS DateTime), 1, 0, N'Francis ekendia', N'2892892', N'Francis ekendia', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (30, N'e.fieoku', N'Debit Alert <Transfer>', N'I e.fieoku, initiate the following transaction: amount 500is to be debited from account: 7450139399 on 12/12/2018 12:00:00 AM 54269789', CAST(N'2018-12-13T08:35:45.163' AS DateTime), 1, 0, N'e.fieoku', N'2892892', N'Francis ekendia', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (31, N'e.fieoku', N'Debit Alert <Transfer>', N'I e.fieoku, initiate the following transaction: amount 500is to be debited from account: 7450139399 on 12/12/2018 12:00:00 AM 86412088', CAST(N'2018-12-13T08:37:56.110' AS DateTime), 1, 0, N'e.fieoku', N'2892892', N'Francis ekendia', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (32, N'7450139399', N'Credit Alert <Order>', N' Order Number: 30858812122018', CAST(N'2018-12-13T08:41:28.300' AS DateTime), 1, 0, N'Ayomiposi Akinsiku', N'7450139399', N'Ayomiposi Akinsiku', NULL)
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (33, N'2742918113', N'Credit Alert <Order>', N' Order Number: 16560013122018', CAST(N'2018-12-13T11:44:49.897' AS DateTime), 1, 0, N'ese okpako', N'2742918113', N'ese okpako', N'16560013122018')
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (34, N'2742918113', N'Credit Alert <Order>', N' Order Number: 14754713122018', CAST(N'2018-12-13T17:19:54.503' AS DateTime), 1, 0, N'ese okpako', N'2742918113', N'ese okpako', N'14754713122018')
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (35, N'2742918113', N'Credit Alert <Order>', N' Order Number: 93571713122018', CAST(N'2018-12-13T17:19:59.783' AS DateTime), 1, 0, N'ese okpako', N'2742918113', N'ese okpako', N'93571713122018')
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (36, N'2742918113', N'Credit Alert <Order>', N' Order Number: 60613613122018', CAST(N'2018-12-13T17:22:46.997' AS DateTime), 1, 0, N'ese okpako', N'2742918113', N'ese okpako', N'60613613122018')
INSERT [dbo].[mailbox] ([notID], [saveaseID], [subject], [contents], [sendDate], [readInboxStatus], [readSentStatus], [senderName], [recerverID], [recieverName], [orderNumber]) VALUES (37, N'7450139399', N'Credit Alert <Order>', N' Order Number: 92524414122018', CAST(N'2018-12-14T00:46:32.933' AS DateTime), 1, 0, N'Ayomiposi Akinsiku', N'7450139399', N'Ayomiposi Akinsiku', N'92524414122018')
SET IDENTITY_INSERT [dbo].[mailbox] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (97, N'689880318889', N'6898809931888933', N'59059731', N'50', 50, 0, N'Admin', N'', N'', N'blocked', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (98, N'261261306004', N'2612615230600444', N'59059731', N'50', 50, 0, N'Admin', N'', N'', N'Completed', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (99, N'152785324767', N'1527853832476818', N'59059731', N'200', 200, 0, N'Admin', N'', N'', N'Completed', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (100, N'913484419154', N'9134849741915512', N'59059731', N'200', 200, 0, N'Admin', N'', N'', N'Pending', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (101, N'251425633907', N'2514257563390832', N'59059731', N'200', 200, 0, N'Admin', N'', N'', N'Used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (102, N'553197117241', N'5531982311724120', N'427314259184286', N'50', 50, 0, N'Admin', N'', N'', N'Pending', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (103, N'779947127819', N'7799483312781987', N'427314259184286', N'50', 50, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (104, N'779947127819', N'7799483312781987', N'427314259184286', N'200', 200, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (105, N'779947127819', N'7799483312781987', N'427314259184286', N'200', 200, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (106, N'378538839426', N'3785391283942738', N'427314259184286', N'200', 200, 0, N'Admin', N'', N'', N'Used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (107, N'476792720055', N'1019679497653597', N'8264752862018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (108, N'277634162915', N'2776342116291541', N'8264752862018', N'50', 50, 0, N'Admin', N'', N'', NULL, CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (109, N'277634162915', N'2776342116291541', N'8264752862018', N'200', 200, 0, N'Admin', N'', N'', N'Used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (110, N'628966335674', N'6289667433567427', N'8264752862018', N'200', 200, 0, N'Admin', N'', N'', NULL, CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (111, N'628966335674', N'6289667433567427', N'8264752862018', N'200', 200, 0, N'Admin', N'', N'', NULL, CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (112, N'390714740388', N'3907152474038963', N'967789872018', N'100', 100, 0, N'Admin', N'', N'', N'Completed', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (113, N'262153261591', N'2621538826159164', N'967789872018', N'100', 100, 0, N'Admin', N'', N'', N'Completed', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (114, N'613485434350', N'6134864143435050', N'967789872018', N'100', 100, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (115, N'936410159578', N'9364109315957859', N'967789872018', N'100', 100, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (116, N'789151520729', N'7891526752072993', N'967789872018', N'100', 100, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (117, N'212077245957', N'2120772124595802', N'967789872018', N'5000', 5000, 0, N'Admin', N'', N'', N'used', CAST(N'2018-07-20T07:17:26.627' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (118, N'316675445787', N'3166753344578796', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (119, N'348125649784', N'3481255764978493', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (120, N'103756736134', N'1037561973613524', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (121, N'612127283636', N'6121285428363689', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (122, N'612198532050', N'6121990053205091', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (123, N'669084775525', N'6690854677552646', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (124, N'217669819913', N'2176700481991439', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (125, N'293253223440', N'2932534022344062', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (126, N'563199673396', N'5631999267339693', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (127, N'635810568870', N'6358115156887098', N'31667529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (128, N'131347189573', N'1313476318957312', N'31667529112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (129, N'674141349123', N'6741420034912391', N'31667529112018', N'200', 200, 0, N'Admin', N'', N'', N'used', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (130, N'631015158160', N'6310160215816028', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (131, N'126552678861', N'1265521467886241', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (132, N'522087299564', N'5220882529956455', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (133, N'741957733886', N'7419581073388725', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (134, N'384752893437', N'3847524789343805', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (135, N'203213239368', N'2032131123936828', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (136, N'598748760069', N'5987492276007041', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (137, N'241543919620', N'2415436091962121', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (138, N'461413453943', N'4614134545394392', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (139, N'954130597860', N'9541311359786110', N'63101529112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (140, N'998333945803', N'9983347294580437', N'63101529112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (141, N'572355129670', N'5723555212967090', N'63101529112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (142, N'754971940719', N'7549724994072030', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (143, N'250508561421', N'2505086156142244', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (144, N'793302720972', N'7933029772097324', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (145, N'288838341675', N'2888390934167538', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (146, N'831632501225', N'8316334650122617', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (147, N'650093747155', N'6500941074715640', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (148, N'468554993085', N'4685547499308662', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (149, N'716831974939', N'7168325997494010', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (150, N'359626234490', N'3596269723449090', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (151, N'755162755192', N'7551630875519303', N'75497129112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (152, N'397957914742', N'3979574591474383', N'75497129112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (153, N'216417260673', N'2164180926067406', N'75497129112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (154, N'348958156089', N'3489583815608986', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (155, N'744493676791', N'7444944967679199', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (156, N'387288836341', N'3872888783634279', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (157, N'205749182272', N'2057495118227302', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (158, N'601285702974', N'6012856270297515', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (159, N'146898339310', N'1468984133931091', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (160, N'366767773632', N'3667682677363361', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (161, N'762303394335', N'7623043739433575', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (162, N'405098553886', N'4050987455388654', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (163, N'624968988208', N'6249685998820924', N'34895829112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (164, N'296170695290', N'2961709769529081', N'34895829112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (165, N'114631941220', N'1146316194122104', N'34895829112018', N'200', 200, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (166, N'234445517548', N'2344456151754873', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (167, N'825802970605', N'8258036697060606', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (168, N'592292949829', N'5922934694983014', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (169, N'819113308822', N'8191140030882283', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (170, N'816141800769', N'8161422380077064', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (171, N'383352656794', N'3833532465679522', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (172, N'126230599198', N'1262305259919923', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (173, N'700333465918', N'7003342146591896', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (174, N'590469947170', N'5904697494717162', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (175, N'587497539118', N'5874979753911944', N'89024929112018', N'50', 50, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (176, N'179654752263', N'2514497255364575', N'66161629112018', N'1000', 1000, 0, N'Admin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (177, N'539423360476', N'5394237636047675', N'62503229112018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (178, N'659127496905', N'6925928651803452', N'29059530112018', N'200', 200, 0, N'sismolin', N'', N'', N'Completed', NULL)
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (179, N'307463445352', N'7040065287462026', N'83868430112018', N'100', 100, 0, N'sismolin', N'', N'', N'used', CAST(N'2018-11-30T01:49:43.953' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (180, N'650270154537', N'6502715115453787', N'65027030112018', N'50', 50, 0, N'sismolin', N'', N'', N'used', CAST(N'2018-11-30T01:59:58.760' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (181, N'988337915973', N'9883382791597411', N'98833729112018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-11-30T08:23:11.990' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (182, N'988337915973', N'9883382791597411', N'98833729112018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-11-30T08:23:11.990' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (183, N'646313663211', N'6463141866321238', N'64631330112018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-11-30T21:20:49.433' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (184, N'555754747395', N'5557549674739581', N'5557544122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-04T12:53:22.463' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (185, N'878678472623', N'8786794847262391', N'5557544122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-04T12:53:22.463' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (186, N'716529885242', N'7165297288524295', N'7165294122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-04T15:33:15.877' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (187, N'459637527010', N'4596381852701100', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.827' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (188, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (189, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (190, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (191, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (192, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (193, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (194, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (195, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
GO
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (196, N'782561252238', N'7825627025223909', N'45963710122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.843' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (197, N'782561252238', N'7825627025223909', N'45963710122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (198, N'782561252238', N'7825627025223909', N'45963710122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (199, N'635303613389', N'6353044461339043', N'45963710122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (200, N'635303613389', N'6353044461339043', N'45963710122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (201, N'635303613389', N'6353044461339043', N'45963710122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (202, N'635303613389', N'6353044461339043', N'45963710122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (203, N'635303613389', N'6353044461339043', N'45963710122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:31:54.860' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (204, N'794498302092', N'7944994830209250', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (205, N'794498302092', N'7944994830209250', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (206, N'794498302092', N'7944994830209250', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (207, N'794498302092', N'7944994830209250', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (208, N'794498302092', N'7944994830209250', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (209, N'647240663243', N'6472412366324384', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (210, N'647240663243', N'6472412366324384', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (211, N'647240663243', N'6472412366324384', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (212, N'647240663243', N'6472412366324384', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (213, N'647240663243', N'6472412366324384', N'79449810122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (214, N'647240663243', N'6472412366324384', N'79449810122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (215, N'647240663243', N'6472412366324384', N'79449810122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (216, N'647240663243', N'6472412366324384', N'79449810122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.230' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (217, N'647240663243', N'6472412366324384', N'79449810122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.247' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (218, N'970164388471', N'9701657538847193', N'79449810122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.247' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (219, N'970164388471', N'9701657538847193', N'79449810122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.247' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (220, N'970164388471', N'9701657538847193', N'79449810122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-10T09:32:07.247' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (221, N'902111546275', N'9021119154627616', N'90211111122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-11T14:30:30.630' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (222, N'325036271504', N'3250364427150426', N'90211111122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-11T14:30:30.630' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (223, N'325036271504', N'3250364427150426', N'90211111122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-11T14:30:30.630' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (224, N'325036271504', N'3250364427150426', N'90211111122018', N'200', 200, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-11T14:30:30.630' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (225, N'126875183068', N'1268759118306854', N'12687512122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T03:56:10.193' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (226, N'271162313864', N'2711624031386502', N'12687512122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T03:56:10.490' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (227, N'415448444661', N'4154488844466150', N'12687512122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T03:56:10.773' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (228, N'236810850229', N'2368108485022988', N'12687512122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T03:56:11.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (229, N'958171355797', N'9581727935579827', N'12687512122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T03:56:11.350' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (230, N'885326222295', N'8853272022229568', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:32.617' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (231, N'628203164699', N'6282044816469969', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:32.897' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (232, N'772490295495', N'7724909629549617', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:33.193' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (233, N'593852701063', N'5938529270106455', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:33.570' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (234, N'835320455075', N'8353209845507609', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:33.867' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (235, N'656682860643', N'6566829486064447', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:34.147' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (236, N'478044366212', N'4780449036621287', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:34.427' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (237, N'622330497008', N'6223313849700935', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:34.723' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (238, N'443692902576', N'4436933490257773', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:35.070' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (239, N'186570844980', N'1865706284498174', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:35.350' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (240, N'330856975777', N'3308571097577822', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:35.647' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (241, N'152219481346', N'1522190648134661', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:35.927' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (242, N'873580886914', N'8735810188691499', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:36.210' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (243, N'117867117711', N'1178675011771149', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:36.567' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (244, N'760744960114', N'7607447796011548', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:36.850' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (245, N'905030190911', N'9050312519091197', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:37.147' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (246, N'149317321708', N'1493177432170845', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:37.427' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (247, N'870678727276', N'8706796972727684', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:37.787' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (248, N'613556669680', N'6135569766968084', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:38.067' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (249, N'757842800476', N'7578434580047732', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:38.363' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (250, N'902129931272', N'9021299393127380', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:38.660' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (251, N'723491436841', N'7234918943684220', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:38.943' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (252, N'867777567638', N'8677783756763868', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:39.240' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (253, N'689139973206', N'6891403397320706', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:39.567' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (254, N'109093290382', N'1090930929038298', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:39.850' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (255, N'253379421179', N'2533795742117946', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:40.130' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (256, N'974740826747', N'9747415282674785', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:40.427' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (257, N'796102332315', N'7961034833231624', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:40.707' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (258, N'940389463112', N'9403899646311272', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:41.067' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (259, N'683266405516', N'6832672440551673', N'88532612122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:41.350' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (260, N'504628811084', N'5046292081108511', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:41.630' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (261, N'796173580729', N'7961739358073026', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:41.910' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (262, N'470277447449', N'4702776444744999', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:42.207' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (263, N'937487303474', N'9374886430347456', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:42.567' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (264, N'680365245878', N'6803659224587857', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:42.863' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (265, N'501727651446', N'5017278865144695', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:43.143' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (266, N'323089157015', N'3230898415701535', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:43.427' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (267, N'144451562583', N'1444518056258373', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:43.723' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (268, N'288738693379', N'2887382869338021', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:44.067' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (269, N'931614635783', N'9316155463578422', N'88532612122018', N'100', 100, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-12T04:03:44.347' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (270, N'252224277746', N'2522248027774674', N'25222413122018', N'50', 50, 0, N'sismolin', N'', N'', N'Completed', CAST(N'2018-12-13T07:13:07.147' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (271, N'308588127538', N'3085889312753880', N'30858812122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'used', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (272, N'161330488689', N'1613306748869013', N'30858812122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (273, N'161330488689', N'1613306748869013', N'30858812122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (274, N'161330488689', N'1613306748869013', N'30858812122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (275, N'161330488689', N'1613306748869013', N'30858812122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (276, N'161330488689', N'1613306748869013', N'30858812122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (277, N'161330488689', N'1613306748869013', N'30858812122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (278, N'161330488689', N'1613306748869013', N'30858812122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (279, N'161330488689', N'1613306748869013', N'30858812122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (280, N'161330488689', N'1613306748869013', N'30858812122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (281, N'161330488689', N'1613306748869013', N'30858812122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T08:41:28.300' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (282, N'165600595750', N'1656007859575075', N'16560013122018', N'500', 500, 0, N'bloff', N'', N'', N'used', CAST(N'2018-12-13T11:44:48.757' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (283, N'309887726546', N'3098872772654723', N'16560013122018', N'500', 500, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T11:44:49.067' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (284, N'352288680432', N'3522888668043321', N'35228813122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:11:50.920' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (285, N'352288680432', N'3522888668043321', N'35228813122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:11:50.933' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (286, N'675212405660', N'6752133840566130', N'35228813122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:11:50.933' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (287, N'675212405660', N'6752133840566130', N'35228813122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:11:50.933' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (288, N'675212405660', N'6752133840566130', N'35228813122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:11:50.933' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (289, N'873881561452', N'8738824456145267', N'87388113122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:13:43.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (290, N'873881561452', N'8738824456145267', N'87388113122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:13:43.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (291, N'873881561452', N'8738824456145267', N'87388113122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:13:43.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (292, N'296806286680', N'2968069728668077', N'87388113122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:13:43.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (293, N'296806286680', N'2968069728668077', N'87388113122018', N'500', 500, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-13T17:13:43.030' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (294, N'363664799513', N'3636646779951459', N'36366413122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:17:38.560' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (295, N'363664799513', N'3636646779951459', N'36366413122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:17:38.560' AS DateTime))
GO
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (296, N'363664799513', N'3636646779951459', N'36366413122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:17:38.573' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (297, N'363664799513', N'3636646779951459', N'36366413122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:17:38.573' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (298, N'363664799513', N'3636646779951459', N'36366413122018', N'200', 200, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:17:38.573' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (299, N'147547335368', N'1475476133536922', N'14754713122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:52.393' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (300, N'291833466165', N'2918340946616570', N'14754713122018', N'50', 50, 0, N'bloff', N'', N'', N'used', CAST(N'2018-12-13T17:19:52.690' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (301, N'436120596961', N'4361205759696218', N'14754713122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:53.003' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (302, N'580406727757', N'5804070572775866', N'14754713122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:53.283' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (303, N'724692858554', N'7246935385855514', N'14754713122018', N'200', 200, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:53.580' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (304, N'935717317135', N'9357185131713533', N'93571713122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:57.473' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (305, N'180004447931', N'1800050044793181', N'93571713122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:57.830' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (306, N'675623751486', N'6756240175148715', N'93571713122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:58.190' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (307, N'741425419118', N'7414258041911925', N'93571713122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:58.503' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (308, N'738453911066', N'7384540391106707', N'93571713122018', N'200', 200, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:19:58.800' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (309, N'606136554547', N'6061368355454807', N'60613613122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:22:44.747' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (310, N'173347410572', N'1733478441057265', N'60613613122018', N'50', 50, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:22:45.043' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (311, N'317634541368', N'3176343254136913', N'60613613122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:22:45.400' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (312, N'813252844923', N'8132533384492447', N'60613613122018', N'100', 100, 0, N'bloff', N'', N'', N'Completed', CAST(N'2018-12-13T17:22:45.700' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (313, N'957538975719', N'9575398197572095', N'60613613122018', N'200', 200, 0, N'bloff', N'', N'', N'used', CAST(N'2018-12-13T17:22:45.997' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (314, N'925244302092', N'9252455830209242', N'92524414122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'used', CAST(N'2018-12-14T00:46:28.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (315, N'922272794039', N'9222738079404023', N'92524414122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:28.530' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (316, N'743635299608', N'7436357629960863', N'92524414122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'used', CAST(N'2018-12-14T00:46:28.840' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (317, N'310846155633', N'3108467815563320', N'92524414122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:29.137' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (318, N'307874647580', N'3078750064758102', N'92524414122018', N'50', 50, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:29.450' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (319, N'775085503605', N'7750860050360559', N'92524414122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:29.810' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (320, N'517962446009', N'5179632844600960', N'92524414122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:30.107' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (321, N'837915663184', N'8379160266318551', N'92524414122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:30.420' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (322, N'982201793981', N'9822025079398199', N'92524414122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:30.730' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (323, N'979229385929', N'9792307338592981', N'92524414122018', N'100', 100, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:31.030' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (324, N'223517516725', N'2235172251672629', N'92524414122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:31.340' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (325, N'367803647522', N'3678037064752277', N'92524414122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:31.653' AS DateTime))
INSERT [dbo].[OrderDetails] ([pinID], [card_pin], [cardpin_sn], [orderNumber], [cardType], [cardAmount], [chargeOnCard], [orderby], [computerName], [ipaddress], [orderStatus], [oderDate]) VALUES (326, N'687755864697', N'6877564586469868', N'92524414122018', N'200', 200, 0, N'e.fieoku', N'', N'', N'Completed', CAST(N'2018-12-14T00:46:31.950' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
INSERT [dbo].[Queue] ([ID], [UserID], [Type], [SenderID], [Data1], [Data2], [Flash], [SendDatetime], [Priority], [Retrycount], [CostCentre], [CustomerID], [Status], [StatusID], [NumTo], [content]) VALUES (3, 6584123, N'1', N'6584123', N'0', N'0', 0, CAST(N'2018-04-25T13:15:04.000' AS DateTime), 1, 1, N'1', N'6584123', N'COMPLETED', N'2', N'08056191069', N'Debit Alert')
SET IDENTITY_INSERT [dbo].[savease_beneficiary] ON 

INSERT [dbo].[savease_beneficiary] ([benID], [saveaseID], [savedFor], [dateAdded], [BankName]) VALUES (28, N'1234567', N'admin', CAST(N'2018-11-17T09:18:02.103' AS DateTime), NULL)
INSERT [dbo].[savease_beneficiary] ([benID], [saveaseID], [savedFor], [dateAdded], [BankName]) VALUES (29, N'60139694953', N'admin', CAST(N'2018-11-17T09:47:49.233' AS DateTime), NULL)
INSERT [dbo].[savease_beneficiary] ([benID], [saveaseID], [savedFor], [dateAdded], [BankName]) VALUES (38, N'1234567', N'sismolin', CAST(N'2018-11-28T21:00:38.607' AS DateTime), N'Savease')
SET IDENTITY_INSERT [dbo].[savease_beneficiary] OFF
SET IDENTITY_INSERT [dbo].[savease_web_menu] ON 

INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (8, 1, N'indext.aspx', N'Home', -1, N'1', N'1', N'4')
INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (9, 5, N'about.aspx', N'About Us', -1, N'1', N'1', N'0')
INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (10, 10, N'services.aspx', N'Services', -1, N'1', N'1', N'0')
INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (11, 15, N'customer.aspx', N'Customer', -1, N'1', N'1', NULL)
INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (12, 20, N'vendor.aspx', N'Vendor', -1, N'1', N'1', NULL)
INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (13, 25, N'admin.aspx', N'Administration', -1, N'1', N'1', NULL)
INSERT [dbo].[savease_web_menu] ([ID], [MENUID], [LINK], [TITLE], [PARENTID], [INSTALLED], [ENABLED], [GROUPLVL]) VALUES (14, 101, N'rechargeCard.aspx', N'PIN Savings', 10, N'1', N'1', N'0')
SET IDENTITY_INSERT [dbo].[savease_web_menu] OFF
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABA NORTH', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABA SOUTH', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABADAH', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABAJI', N'ABUJA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABAK', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABAKILIKI', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABEOKUTA NORTH', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABEOKUTA SOUTH', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABI', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABOH MBAISE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABONEMA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABUA/ODIAL', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ABUJA MUNICIPAL', N'ABUJA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ADAVI', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ADO', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ADO-ODO/OTTA', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ADOR', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AFIKPO NORTH', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AFIKPO SOUTH', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AFUO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AGAIE', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AGATU', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AGEGE', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AGUATA', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AGWARA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AHAODA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AHAODA WEST', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AHIAZU MBAISE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AIYERIRE', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AJAOKUTA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AJEROMI/IFELODUN', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AJINGI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKAMKPA', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKDO-KOLO', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKINYELE', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKKO', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKOKO EDO', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKOKO NORTH-EAST', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKOKO NORTH-WEST', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKOKO SOUTH', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKOKO SOUTH-EAST', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKPABUYO', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKUKU TORU', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKURE', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKURE NORTH', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AKWANGA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ALBASU', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ALIERO', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ALIMOSHO', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ALKALERI', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AMUVO-ODOFIN', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANAMBRA', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANAMBRA WEST', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANAOCHA NORTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANAOCHA SOUTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANDONI', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANINRI', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANIOCHA', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANKA', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ANKPA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'APA', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'APAPA', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AREWA DANDI', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ARGUNGU', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AROCHUKWU', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ASA', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ASARI/TORU', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ASKIRA/UBA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ATAKU MOSA EAST', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ATAKU MOSA WEST', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ATIBA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ATIGBO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AUGIE', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AUYO', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AWE', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AWGU', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AWKA NORTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AWKA SOUTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AYAMELUM', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AYEDA ADE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'AYEDIRE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BABURA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BADAGARY', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAGUDO', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAGWAI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAKASSI', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAKORI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAKURA', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BALANGA', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BALI', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAMA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BARIKIN LADI', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BARUTEN', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BASSA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BASSA.', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BATAGRAWA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BATSARI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAUCHI', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAURE', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BAYO', N'BORNO')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BEBEJI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BEKWARA', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BENDE', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIASE', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BICHI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIDA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BILLIRI', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BINDAWA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BINJI', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIRININ GWARI', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIRNIN KEBBI', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIRNIN-KUDU', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIRNIN-MAGAJI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIRNIWA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BIU', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BODINGA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BOGORO', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BOKI', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BOKKOS', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BOLUWADURO', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BOMADI', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BONNY', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BORGU', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BORIPE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BORSARI', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BOSSO', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BRASS', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BUJI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BUKKUYUM', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BUNGUDU', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BUNKURE', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BUNZA', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BURUKU', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BURUTU', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'BWARI', N'ABUJA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CALABAR', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CALABAR SOUTH', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CHAFE', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CHANCHANGA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CHARANCHI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CHIBOK', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'CHUKUN', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DALA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAMATURU', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAMBAM', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAMBATA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAMBOA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAN MUSA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DANDI', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DANDUME', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DANGE/SHUNT', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DANJA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DANKO', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DARAZO', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DASS', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAURA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAWAKIN TOFA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DAWAKIN-KUDU', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DEGEMA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DEKINA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DEMBAN', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DEMSA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DIKWA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DOGUWA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DOMA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DONGA', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DUKKU', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DUNUKOFIA', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DUTSE', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DUTSI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'DUTSIN-MA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EAST YAGBA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EASTERN OBOLO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EBONYI', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EDATI', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EDE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EDE NORTH', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EDU', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EFFON-ALAIYE', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EGBADO NORTH', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EGBADO SOUTH', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EGBEDA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EGBEDORE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EGOR', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EHIME MBAISE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EJIGBO', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKEREMOR', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKET', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKITI', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKITI EAST', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKITI SOUTH-WEST', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKITI WEST', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EKWUSIGO', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ELEME', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EMOHUA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EMURE/ISE/ORUN', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ENUGU EAST', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ENUGU NORTH', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ENUGU SOUTH', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EPE', N'LAGOS')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EPE-ATAI', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ESAN CENTRAL', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ESAN NORTH-EAST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ESAN SOUTH-EAST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ESAN WEST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ESE-ODO', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ESSIEN-UDIM', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETCHE', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETHIOPE EAST', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETHIOPE WEST', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETI-OSA', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETIM-EKPO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETINAM', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETSAKO CENTRAL', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETSAKO EAST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETSAKO WEST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ETUNG', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EWEKORO', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EZEAGU', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EZINIHITE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EZZA NORTH', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'EZZA SOUTH', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FAGGE', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FAKAI', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FASKARI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FIKA', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FUFORE', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FUFU', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FUNAKAYE', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FUNE', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'FUNTUA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GABASAWA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GADA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GAGARAWA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GAMAWA', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GANJUWA', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GANYE', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GARKI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GARKO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GARUN MALLAM', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GASHAKA', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GASSOL', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GAYA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GBAKO', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GBOKO', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GEIDAM', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GEZAWA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GIADE', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GIREI', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GIWA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GOGARAM', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GOKANA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GOMBE', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GOMBI', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GORONYO', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUBIO', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUDU', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUJBA', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GULANI', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUMA', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUMEL', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUMMI', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GURARA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GURI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUSAU', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUYUK', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GUZAMALO', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWADA-BAWA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWAGWALADA', N'ABUJA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWALE', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWANDU', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWARAM', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWARZO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWER EAST', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWIWA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'GWOZA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'HADEJIA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'HAWUL', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'HONG', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'I/OLORUNSONGO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBADAN CENTRAL', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBADAN NORTH-EAST', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBADAN NORTH-WEST', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBADAN SOUTH-EAST', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBADAN SOUTH-WEST', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBAJI', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBARAPA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBARAPA NORTH', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBEJU LEKKI', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBENO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBESIKPO-ASUAN', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBI', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IBIONO-IBOM', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDAH', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDANRE', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDARAPO', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDEATO NORTH', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDEATO SOUTH', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDEMILI', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDEMILI SOUTH', N'ANAMBRA')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IDO/OSI', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFAKO/IJAYE', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFE CENTRAL', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFE EAST', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFE NORTH', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFE SOUTH', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFEDAPO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFEDAYO', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFEDORE', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFELODUN', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFELODUN (OSUN)', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFELOJU', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IFO', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IGABI', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IGALAMELA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IGBEBEN', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IGBO-ETITI', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IGBO-EZE NORTH', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IGBO-EZE SOUTH', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IHIALA', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IHITTE UBOMA', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IJEBU EAST', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IJEBU NORTH', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IJEBU-ODE', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IJERO', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IJUMU', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKA', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKA NORTH-EAST', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKA SOUTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKARA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKEDURU', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKEJA', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKENNE', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKERE', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKOLE', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKOM', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKONO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKORODU', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKOT-ABASI', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKOT-EKPENE', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKPOBA CENTRAL', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKPOBA OKHA', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKWERE', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKWO', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IKWUANO', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILA-ORANGUN', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILAJE', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILE OLUJI/OKE-IGBO', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILEJEMEJE', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILESHA EAST', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILESHA WEST', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILIELA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILORIN EAST', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILORIN SOUTH', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILORIN WEST', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ILUGUNALARO', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IMEKO- AFON', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'INGAWA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'INI', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IPOKIA', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IRELE', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IREPO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IREPODUN', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IREPODUN (EKITI)', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IREPODUN (OSUN)', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IREWOLE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISE/ORUN', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISEYIN', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISHIELU', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISI-UZO', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISIALA', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISIALA-NGWA NORTH', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISIALA-NGWA SOUTH', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISIUKWUTO', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISOKAN', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISOKO NORTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISOKO SOUTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ISU', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ITAS-GADAU', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ITESIWAJU', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ITU', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IVO', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IWAJOWA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IWO', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'IZZI', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JABA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JADA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JAHUN', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JAKUSKO', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JALINGO', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JAMA\ARE', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JEGA', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JEMAA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JERE', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JIBYA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JIMETA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JOS EAST', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JOS NORTH', N'PLATEAU')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'JOS SOUTH', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'K/LAMIDO', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KABBA/BUNU', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KABO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KACHIA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KADUNA NORTH', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KADUNA SOUTH', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAFIN-HAUSA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAFUR', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAGA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAGARKO', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAIAMA', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAITA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAJOLA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAJURU', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KALA/BALGE', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KALGO', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KALTUNGO', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAMBA', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KANAM', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KANKARA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KANKE', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KANKIYA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KANO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KARASUWA', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KARAYE', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KARU', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KATAGUM', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KATCHIA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KATSINA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KATSINA-ALA', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAUGAMA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAURA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAURA NAMODA', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAURU', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KAZAURE', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KEANA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KEBBE', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KEFFI', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KHANA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KIBIYA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KIRFI', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KIRIKISAMA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KIRU', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KIYAWA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KIYAWA (ZAMFARA)', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOGI', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOKO-BESSE', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOKONA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOLOKUMA/OPOKUN', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KONDUGA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KONSHISHA-TSE', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOSOFE', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOTANGORA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KOTON-KARFE', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUBA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUDAN', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUJE', N'ABUJA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUKAWA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUMBOTSO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUNCHI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KURA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KURFI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KURMI', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KUSADA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KWALI', N'ABUJA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KWAMI', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KWANDE', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KWARE', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'KWAYA-KUSAR', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAFIA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAGELU', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAGOS ISLAND', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAMURIDE', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LANTANG NORTH', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LANTANG SOUTH', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAPAI', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAU', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LAVUN', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LERE', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LESSEL', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LISSAM', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LOGO', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'LOKOJA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MACHINA', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MADAGA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAFA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAGAMA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAGUMERI', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAI ADUWA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAIDOBI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAIDUGURI', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAIGATARI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAIHA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAIN LAND', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAIYAMA', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAKARFI', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAKODA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAKURDI', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MALAMA DURI', N'JIGAWA')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MALUMFASHI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MANGERE', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MANGU', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MANI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MARADUN', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MARIGA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MARTE', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MARU', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MASHI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MATAZU', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MAYO-BALE', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MBAITOLU', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MBO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MGBBAR', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MICHIKA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MIGA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MIKANG', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MINJIBIR', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MISAU', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MKPAT-ENIN', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MOBA', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MOKWA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MONGUNO', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MOPA-MURO', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MORO', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MOSHEGU', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MUBI', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MUBI SOUTH', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MUSAWA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MUSHIN', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'MUYA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NAFADA', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NARAWA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NASARAWA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NASS/EGGON', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NASSARAWA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NDOKWA EAST', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NDOKWA WEST', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NEMBE', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NGALA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NGANZAI', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NGASKI', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NGOR OKPALA', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NGURU', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NINGI', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NJABA', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NJIKOKA', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NKANU EAST', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NKANU WEST', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NKWERE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NNEWI NORTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NNEWI SOUTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NOMBA', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NORTHERN IJAW', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NSIT-IBOM', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NSIT-UBUM', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NSUKKA', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NUMAN', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'NWANGELE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBAFEMI OWODE', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBANUKU', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBEDA', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBI', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBI.', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBIO AKPOR', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBIOMA-NGWA', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBOKUN', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBOT AKARA', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBOWO', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBUBRA', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OBUDU', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ODIGBO', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ODO-OTIN', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ODOGBOLU', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ODUKPANI', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OFFA', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OFU', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGBA/NDONI/EGBEMA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGBADIBO', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGBARU', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGBIA', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGBOMOSHO NORTH', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGBOMOSHO SOUTH', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGO-OLUWA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGOJA', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGORI-MAGONGO', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGU/BOLO', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGUN WATER SIDE', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OGUTA', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OHAFIA', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OHAJI EGBEMA', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OHAOZARA', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OHAUKWU', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OHIMINI', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OJI RIVER', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OJO', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OJU', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKE-ERO', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKEHI', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKENE', N'KOGI')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKIGWE', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKIRIKA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKITIPUPA', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKOBO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKPE', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OKPOKWU', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OLA OLUWA', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OLAMABORO', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OLARUNDA', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OLGA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OLUYOLE', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OMALA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OMUMA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONA-ARA', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONDO', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONDO EAST', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONELGA', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONICHA', N'EBONYI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONITSHA NORTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONITSHA SOUTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONNA', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ONUIMO', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OPOBO/NKORO', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORE-LOPE', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OREDO', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORHONMWON', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORIADE', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORIKANAM', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORIRE', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORLU', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OROLU', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORON', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORS/OSU', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORU', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORU WEST', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORUMBA NORTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ORUMBA SOUTH', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OSHIMILI', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OSHIMILI NORTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OSHODI-ISOLO', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OSHOGBO', N'OSUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OSIN', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OSISIOMA', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OTURKPO', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OVIA NORTH-EAST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OVIA SOUTH-WEST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OWAN EAST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OWAN WEST', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OWERRI', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OWERRI EAST', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OWERRI NORTH', N'IMO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OWO', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYE (EKITI)', N'EKITI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYE (ONDO)', N'ONDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYI (ANAMBRA)', N'ANAMBRA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYI (KOGI)', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYIGBO', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYO', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYO WEST', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'OYUN', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'PAIKORO', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'PANKSHIN', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'PATANI', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'PATIGI', N'KWARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'PORT HARCOURT', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'POTISKUM', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'QUANPANG', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RABAH', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RAFI', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RANO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RIJAU', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RIMI', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RIMIN GADO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RINGIM', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RIYOM', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ROGO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'RONI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SABON GARI', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SABON-BIRNI', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SABUWA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SAFANA', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SAGAMU', N'OGUN')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SAGBAMA', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SAKABA', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SAKI EAST', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SANDAMU', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SANGA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SAPELE', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SARDAUNA', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHAGARI', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHANGA', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHANI', N'BORNO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHANONO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHELLENG', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHENDOM', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHINKAFI', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHIRA', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHIRORO', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHOMGOM', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SHOMOLU', N'LAGOS')
GO
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SILAME', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SOBA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SOKOTO', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SOKOTO SOUTH', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SONG', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SOUTHERN IJAW', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SULE TANKARKAR', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SULEJA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SUMAILA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SURU', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SURULERE', N'LAGOS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'SURULERE (OYO)', N'OYO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAFAWA BALEWA', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAI/ELEME', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAKAI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAKUM', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TALATAMAFARA', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAMBUWAL', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TANGAZA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TARAUNI', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TARKA', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAURA', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TAWA', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TOFA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TORO', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TOTO', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TOUNGO', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TSANYAWA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TUDUN WADA', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'TURETA', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UDENU', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UDI', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UDU', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UDUNGU UKO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UGEP NORTH', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UGHELLI NORTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UGHELLI SOUTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UGUO IBENG', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UGWUNAGBO', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UHUNWONDE', N'EDO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UKANAFUN', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UKUM', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UKWA EAST', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UKWA WEST', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UKWUANI', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UMUAHIA NORTH', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UMUAHIA SOUTH', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UMUNEOCHI', N'ABIA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UNGOGO', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'URUAN', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'URUE Q/ORUKO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'USHONGO', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'USSA', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UVIWE', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UYO', N'AKWA IBOM')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'UZO UWANI', N'ENUGU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'VANDEIKYA', N'BENUE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WAKIRIKE', N'RIVERS')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WAMAKKO', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WAMBA', N'NASARAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WARJI', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WARRI CENTRAL', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WARRI NORTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WARRI SOUTH', N'DELTA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WASE', N'PLATEAU')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WASUGU', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WEST YAGBA', N'KOGI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WUDIL', N'KANO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WUKARI', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WURNO', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'WUSHISHI', N'NIGER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YABO', N'SOKOTO')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YALA', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YAMAL TUDEBA', N'GOMBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YANKWASI', N'JIGAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YARKURR', N'CROSS RIVER')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YARRO', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YAURI', N'KEBBI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YENOGOA', N'BAYELSA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YOLA', N'ADAMAWA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YUNUSARI', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'YUSUFARI', N'YOBE')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZAKI', N'BAUCHI')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZANGO', N'KATSINA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZANGON KATAF', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZARIA', N'KADUNA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZING', N'TARABA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZURMI', N'ZAMFARA')
INSERT [dbo].[state_lga] ([LGA], [STATE]) VALUES (N'ZURU', N'KEBBI')
SET IDENTITY_INSERT [dbo].[tblTransfer] ON 

INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (3, N'58802600', 15000, 2000, 13000, N'1234567', N'Okpako mudia', N'2892892', N'sismolin', N'WIN-SD4VKI4AO4F', N'0', NULL)
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (4, N'79187508', 13000, 500, 12500, N'12410499', N'test1 test1', N'2892892', N'sismolin', N'WIN-SD4VKI4AO4F', N'0', CAST(N'2018-11-27T14:54:39.360' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (5, N'14642299', 17500, 3000, 14500, N'73638295799', N'jonathan ataisi', N'2892892', N'sismolin', N'WIN-SD4VKI4AO4F', N'0', CAST(N'2018-11-28T09:23:09.860' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (6, N'43303164', 14450, 4000, 10450, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-04T04:13:34.243' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (7, N'37994962', 10600, 1000, 9600, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-04T13:08:26.897' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (8, N'11718975', 9600, 1000, 8600, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-04T13:10:02.007' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (9, N'31515283', 8600, 200, 8400, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-05T02:26:51.300' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (10, N'20504227', 8400, 200, 8200, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-05T02:29:06.997' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (11, N'26749790', 8200, 200, 8000, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-05T02:46:28.930' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (12, N'99889533', 8000, 100, 7900, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-05T03:21:30.477' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (13, N'19113025', 8000, 200, 7800, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-05T03:51:36.570' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (14, N'37376261', 7800, 200, 7600, N'2742918113', N'ese okpako', N'2892892', N'sismolin', N'PHC-DEVELOPER2', N'1', CAST(N'2018-12-05T03:58:03.807' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (15, N'74822949', 7600, 1000, 6600, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-05T08:36:54.207' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (16, N'91025193', 1000, 500, 500, N'2892892', N'Francis ekendia', N'7450139399', N'e.fieoku', N'win7018', N'1', CAST(N'2018-12-05T08:39:37.647' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (17, N'74742231', 10900, 4000, 6900, N'2892892', N'Francis ekendia', N'2742918113', N'bloff', N'okpako', N'1', CAST(N'2018-12-05T12:12:45.767' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (18, N'40249834', 11100, 3000, 8100, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-10T09:22:39.097' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (19, N'93457958', 7700, 700, 7000, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-11T14:39:33.200' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (20, N'16828482', 7000, 700, 6300, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-11T14:39:42.777' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (21, N'87901265', 7000, 700, 6300, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'win7018', N'1', CAST(N'2018-12-11T14:43:59.137' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (22, N'17417308', 5600, 1000, 4600, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'HP', N'1', CAST(N'2018-12-11T17:36:00.890' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (23, N'57315152', 4600, 600, 4000, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'HP', N'1', CAST(N'2018-12-11T17:38:07.340' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (24, N'92607589', 4000, 100, 3900, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'HP', N'1', CAST(N'2018-12-11T17:42:37.077' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (25, N'67085766', 3900, 200, 3700, N'7450139399', N'Ayomiposi Akinsiku', N'2742918113', N'bloff', N'HP', N'1', CAST(N'2018-12-11T20:54:39.037' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (26, N'58693231', 3900, 200, 3700, N'7450139399', N'Ayomiposi Akinsiku', N'2742918113', N'bloff', N'HP', N'1', CAST(N'2018-12-11T21:03:06.410' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (27, N'94344060', 3900, 100, 3800, N'7450139399', N'Ayomiposi Akinsiku', N'2892892', N'sismolin', N'HP', N'1', CAST(N'2018-12-11T21:37:22.317' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (28, N'54269789', 8000, 500, 7500, N'2892892', N'Francis ekendia', N'7450139399', N'e.fieoku', N'win7018', N'1', CAST(N'2018-12-13T08:35:45.150' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (29, N'86412088', 7500, 500, 7000, N'2892892', N'Francis ekendia', N'7450139399', N'e.fieoku', N'win7018', N'1', CAST(N'2018-12-13T08:37:56.110' AS DateTime))
INSERT [dbo].[tblTransfer] ([tid], [transferCode], [balB4Transfer], [amountTransfered], [balance], [beneficiaryAccount], [beneficaryName], [accountNo], [transferedBy], [computerName], [transferStatus], [transactionDate]) VALUES (30, N'38817773', 10000, 5000, 5000, N'7450139399', N'Ayomiposi Akinsiku', N'2468101214', N'admin', N'win7018', N'1', CAST(N'2018-12-13T15:30:57.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblTransfer] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (1, NULL, N'jon', NULL, N'jon', N'jon jon', N'jonathan.ataisi@gmail.com', N'jon', N'682481201752296225210218310311418913294182896823713050', NULL, NULL, N'Guest', 0, N'1122334455', N'08035529398', N'682481201752296225210218310311418913294182896823713050', N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (2, NULL, N'jon2', NULL, N'jon2', N'jon2 jon2', N'jonathan.ataisi@gmail.com', N'jon2', N'208512264222772174181102151942', NULL, NULL, N'Guest', 0, NULL, N'08035529398', N'15612815913758141147354176176204721881731711383017696', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (3, NULL, N'Peter', NULL, N'Emmanuel ', N'Peter Emmanuel ', N'pete@gmail.com', N'Peter', N'-4851-3042-2972-82-7510215-622010-2053-1231277-87-105', NULL, NULL, NULL, 0, NULL, N'090651324578', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (5, NULL, N'Delight', NULL, N'Aaron', N'Aaron Delight', N'iamdelightaaron@gmail.com', N'delt30', N'1125347656302187924319534974240104186112195179139', NULL, NULL, N'Guest', 0, NULL, N'07032599897', N'209120137532195351575018012089253592184969350', N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (6, NULL, N'Delight', NULL, N'Emmanuel', N'Emmanuel Delight', N'iamdelightemmanuel@yahoo.com', N'iamdelighte', N'1513422192592531352391082194512515587932111422532228', NULL, NULL, N'Guest', 0, NULL, N'08056191069', N'125235177123396150205217891591501661284816210213182', N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (7, N'Mr', N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'admin', N'208512264222772174181102151942010236531331277169151', NULL, NULL, N'Guest', 5000, N'2468101214', N'08035529398', N'208512264222772174181102151942010236531331277169151', N'Pending', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (8, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'customer', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, NULL, N'08035529398', N'179159014249142253431851362153616197182281059103127', N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (9, NULL, N'dele', NULL, N'akeem', N'akeem dele', N'iamdelightaaron@gmail.com', N'del2', N'208512264222772174181102151942010236531331277169151', NULL, NULL, N'Guest', 0, NULL, N'08056191069', N'155230521824622756911812919719022149812820321254127', N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (12, NULL, N'Okpako', NULL, N'mudia', N'mudia Okpako', N'mudiakevweokpako@yahoo.com', N'ese1', N'124741419202559817597229149321486119410014824814827', NULL, NULL, N'Guest', 0, NULL, N'08162663152', N'2549513715123964101721796750618117013581123', N'Pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (14, NULL, N'Joe', NULL, N'Ataisi', N'Ataisi Joe', N'jonathan.ataisi@gmail.com', N'jamese', N'124741419202559817597229149321486119410014824814827', NULL, NULL, N'Guest', 0, NULL, N'08162663152', N'132412186162412272911411038207177130166224173199184161', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (23, NULL, N'Francis', NULL, N'ekendia', N'ekendia Francis', N'francis4ekendia@gmail.com', N'sismolin', N'124741419202559817597229149321486119410014824814827', NULL, NULL, N'Guest', 4200, N'2892892', N'08037286489', N'632010216020016622919048823825017324783110190187801', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (24, NULL, N'Shalem', NULL, N'Peter', N'Shalem Peter', N'sp@gmail.com', N'Sp', N'-58-4786909652109-3136-6411260-443103-49-581252222', NULL, NULL, NULL, 0, NULL, N'0807002002', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (26, NULL, N'Okpako', NULL, N'mudia', N'mudia Okpako', N'mudiakevweokpako@yahoo.com', N'cust1', N'124741419202559817597229149321486119410014824814827', NULL, NULL, N'Guest', 0, NULL, N'08162663152', N'2314214319037748239106242124237167215172361279521837', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (30, NULL, N'Shalem', NULL, N'isaac', N'isaac Shalem', N'shaltedd@gmail.com', N'shaltedd', N'176255512321532820445179150155250153112104157201371812', NULL, NULL, N'Guest', 0, NULL, N'08076541569', N'2314214319037748239106242124237167215172361279521837', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (31, NULL, N'Aaron', NULL, N'Delight', N'Delight Aaron', N'iamdelightaaron@gmail.com', N'iamdelighta', N'59176191103232491468822717520811619338241951536214137', NULL, NULL, N'Guest', 0, NULL, N'07032599897', N'2314214319037748239106242124237167215172361279521837', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (32, NULL, N'williams', NULL, N'abule', N'abule williams', N'iamdelightaaron@gmail.com', N'williams', N'1914110323112193102292537239166344322318521120923175', NULL, NULL, N'Guest', 0, NULL, N'07032599897', N'7667579283381701973253611315471597223216416469', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (33, NULL, N'Shalem', NULL, N'Samuel', N'Samuel Shalem', N'shaltedd@gmail.com', N'shaltedd1', N'641890219989519581101501581612559294203219190239', NULL, NULL, N'Guest', 0, N'60139694953', N'08076541569', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (34, NULL, N'tunde', NULL, N'aranseola', N'aranseola tunde', N'ogechi.ataisi@gmail.com', N'tunde2', N'218571632389410775135085191239149962414417521679', NULL, NULL, N'guest', 0, N'48219127700', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Savease solution', N'portharcout', NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (35, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathanataisi@ngdelta.com', N'ttx', N'218571632389410775135085191239149962414417521679', NULL, NULL, N'guest', 0, N'22029806936', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'xlsols', N'plot 8 friday street', NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (36, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathanataisi@ngdelta.com', N'ttx2', N'218571632389410775135085191239149962414417521679', NULL, NULL, N'guest', 0, N'78612766470', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'xlsols', N'plot 8 friday street', NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (37, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathanataisi@ngdelta.com', N'ttx28', N'218571632389410775135085191239149962414417521679', NULL, NULL, N'guest', 0, N'43458284480', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'xlsols', N'plot 8 friday street', NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (38, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathanataisi@ngdelta.com', N'ttx288', N'218571632389410775135085191239149962414417521679', NULL, NULL, N'guest', 0, N'63813406751', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'xlsols', N'plot 8 friday street', NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (40, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'kkt', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'16586844097', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (41, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathanataisi@ngdelta.com', N'tat', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'14702426723', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (42, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'pat', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'98384007086', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (43, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'hactch', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'20134626805', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (44, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'pp', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'73638295799', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (46, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'oo', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'77219863426', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (47, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'jj', N'21875146551862042052411567962021831741961685314416176', NULL, NULL, N'Guest', 0, N'86574898862', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (48, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'fd', N'741025331428425258272322951529175157152240245', NULL, NULL, N'Guest', 0, N'52337594557', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (49, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'ss', N'27100831373611516410320811511421294176901883249100122', NULL, NULL, N'Guest', 0, N'80205892090', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (55, NULL, N'Emmanuel', NULL, N'Agbagli', N'Agbagli Emmanuel', N'iamdelightemmanuel@gmail.com', N'emma30', N'5641152341661242012111325433178229145918732235148', NULL, NULL, N'Guest', 0, N'57187253779', N'07032599897', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (58, NULL, N'Emmanuel', NULL, N'Agbagli', N'Agbagli Emmanuel', N'iamdelightemmanuel@gmail.com', N'emman30', N'5641152341661242012111325433178229145918732235148', NULL, NULL, N'Guest', 0, N'65471383247', N'07032599897', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (60, NULL, N'Emmanuel', NULL, N'Aaron', N'Aaron Emmanuel', N'iamdelightemmanuel@gmail.com', N'emmanuel30', N'1513422192592531352391082194512515587932111422532228', NULL, NULL, N'Guest', 0, N'81047771205', N'07032599897', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (76, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'esemudia@mail.com', N'ese419', N'218571632389410775135085191239149962414417521679', NULL, CAST(N'2018-11-24T05:18:52.413' AS DateTime), N'guest', 0, N'SV39044953', N'08035529398', N'218571632389410775135085191239149962414417521679', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'xlsols', N'plot 8 friday street', NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (81, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'jon23', N'641890219989519581101501581612559294203219190239', NULL, NULL, N'Guest', 0, N'90285878840', N'8035529398', N'15612815913758141147354176176204721881731711383017696', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (82, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'esemudia@gmail.com', N'Eokpako2', N'98222481679521318761953418224914914022222263192134194', NULL, NULL, N'Guest', 0, N'39651156662', N'8035529398', N'15612815913758141147354176176204721881731711383017696', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (83, NULL, N'jonathan', NULL, N'ataisi', N'ataisi jonathan', N'jonathan.ataisi@gmail.com', N'jon4', N'17252120214154601292509823015925415022907894106196', NULL, NULL, N'Guest', 0, N'89749147433', N'8035529398', N'15612815913758141147354176176204721881731711383017696', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (98, NULL, N'Aaron', NULL, N'Emmanuel ', N'Emmanuel  Aaron', N'iamaaronemmauel@mail.com', N'Emmanuel ', N'6511114311016831122311852082531524965240119752119248', NULL, CAST(N'2018-12-02T09:49:30.193' AS DateTime), N'Guest', 0, N'4090174136', N'1243334333', N'23010816873447212822283881211663658230142171692249', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (99, NULL, N'mudia', NULL, N'okpako', N'okpako mudia', N'mudiakevweokpako@gmail.com', N'ese123', N'6511114311016831122311852082531524965240119752119248', NULL, CAST(N'2018-12-03T14:04:08.863' AS DateTime), N'Guest', 0, N'4780350379', N'08162663152', N'11634572542916910779217762322020915722221768246126140', N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (101, NULL, N'Emmanuel', NULL, N'Delight', N'Delight Emmanuel', N'iamemmanueldelight@mail.com', N'iamemmanueldelight', N'124741419202559817597229149321486119410014824814827', NULL, CAST(N'2018-12-03T15:32:33.410' AS DateTime), N'Guest', 0, N'6188815324', N'07032599897', N'55914562201642405386221371017314222436254100108227', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (103, NULL, N'Emmanuel', NULL, N'Delight', N'Delight Emmanuel', N'support@savease.ng', N'123456789', N'124741419202559817597229149321486119410014824814827', NULL, CAST(N'2018-12-03T15:57:44.980' AS DateTime), N'Guest', 0, N'2192225203', N'07032599897', N'55914562201642405386221371017314222436254100108227', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (104, NULL, N'ese', NULL, N'okpako', N'okpako ese', N'admin@savease.ng', N'mark01', N'124741419202559817597229149321486119410014824814827', NULL, CAST(N'2018-12-03T16:06:22.210' AS DateTime), N'Guest', 0, N'4094640444', N'08162663152', N'6313024621920111982192065220052180631621137171192169', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (105, NULL, N'Wande', NULL, N'Tanimonure', N'Tanimonure Wande', N'onrasetng@gmail.com', N'onraset', N'452243018014327532301895373240119615712489222118124', NULL, CAST(N'2018-12-03T16:17:08.227' AS DateTime), N'Guest', 0, N'5384696146', N'07032599897', N'562551841542235620016295184351236510015242233234149142', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (106, NULL, N'Ayomiposi', NULL, N'Akinsiku', N'Akinsiku Ayomiposi', N'delightagbagli@yahoo.com', N'e.fieoku', N'452243018014327532301895373240119615712489222118124', NULL, CAST(N'2018-12-04T00:20:39.777' AS DateTime), N'Guest', 4150, N'7450139399', N'08068621716', N'195225106206100118416019424123456100784617241258319', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[users] ([id], [salutation], [fName], [mName], [lName], [dName], [email], [username], [password], [role_group_id], [createdDate], [createdBy], [balance], [saveaseID], [phone], [token], [status], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [userlevel], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue], [password2], [companyName], [CompanyAddress], [bvn], [cacRegNo]) VALUES (107, NULL, N'ese', NULL, N'okpako', N'okpako ese', N'mudiaese@yahoo.com', N'bloff', N'1181341365010082115110172895154231672461731905719958', NULL, CAST(N'2018-12-04T04:11:16.360' AS DateTime), N'Guest', 1250, N'2742918113', N'08162663152', N'591702022131102351592282817417859186614110212911241178', N'1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
INSERT [dbo].[Users2] ([UserID], [Username], [Password], [Credits], [Active], [SendStartHour], [SendEndHour], [GetRepliesInterval], [GetDRInterval], [GetSCInterval], [ProcessQueueInterval], [MaxRepliesID], [MaxDRID], [MaxSCID], [LastProcessReplies], [LastProcessDR], [LastProcessSC], [LastProcessQueue]) VALUES (1, N'jonathan', N'jonathan', 50, 1, 0, 23, 0, 0, 0, 30, 0, 0, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[vendor] ON 

INSERT [dbo].[vendor] ([vendor_ID], [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [tin], [districtID], [website], [status], [state], [lga], [address], [createdDate], [createdby], [Balance]) VALUES (320, N'tes145', N'Construction Kaiser', N'84236161', N'NIL', NULL, NULL, NULL, NULL, 1, N'RIVERS', N'OBIAKPO ', N'52, Emekuku Street, D Line, Port Harcourt', CAST(N'2017-10-01T08:53:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[vendor] ([vendor_ID], [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [tin], [districtID], [website], [status], [state], [lga], [address], [createdDate], [createdby], [Balance]) VALUES (321, N'tes146', N'SAIPEM CONTRACTING/DRILLING', N'84234786', N'NIL', NULL, NULL, NULL, NULL, 1, N'RIVERS', N'OBIAKPO ', N'Rumuolumeni- PMB 6145- PH', CAST(N'2017-10-01T08:53:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[vendor] ([vendor_ID], [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [tin], [districtID], [website], [status], [state], [lga], [address], [createdDate], [createdby], [Balance]) VALUES (322, N'tes147', N'Lubrik Construction Company Limited', N'8036777777', N'NIL', NULL, NULL, NULL, NULL, 1, N'RIVERS', N'OBIAKPO ', N' Plot 75B, Ordinance Road, Trans-Amadi Ind. Layout PH', CAST(N'2017-10-01T08:53:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[vendor] ([vendor_ID], [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [tin], [districtID], [website], [status], [state], [lga], [address], [createdDate], [createdby], [Balance]) VALUES (323, N'tes148', N'Andremovich Logistics', N'8037825582', N'NIL', NULL, NULL, NULL, NULL, 1, N'RIVERS', N'OBIAKPO ', N'25, Chinda Street Off Stadium Road, G.R.A Extension 4 PH', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[vendor] OFF
SET IDENTITY_INSERT [dbo].[vendorops] ON 

INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (320, NULL, N'84236161', N'NIL', NULL, N'tes145', 1, N'RIVERS', N'OBIAKPO ', NULL, N'52, Emekuku Street, D Line, Port Harcourt', CAST(N'2017-10-01T08:53:40.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (321, NULL, N'8036777777', N'NIL', NULL, N'tes147', 1, N'RIVERS', N'OBIAKPO ', NULL, N' Plot 75B, Ordinance Road, Trans-Amadi Ind. Layout PH', CAST(N'2017-10-01T08:53:40.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (322, NULL, N'8037825582', N'NIL', NULL, N'tes148', 1, N'RIVERS', N'OBIAKPO ', NULL, N'25, Chinda Street Off Stadium Road, G.R.A Extension 4 PH', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (323, NULL, N'8034933088', N'NIL', NULL, N'tes149', 1, N'RIVERS', N'PORT HARCOURT', NULL, N'Km 14, Phc-Aba Expressway, Rumoukwurusi PH', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (324, NULL, N'8033403556', N'NIL', NULL, N'tes150', 1, N'RIVERS', N'PORT HARCOURT', NULL, N'17 Trans-Amadi Ind. Layout PH', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (325, NULL, N'84797749', N'NIL', NULL, N'tes151', 1, N'RIVERS', N'PORT HARCOURT', NULL, N'Km 17, PH/Aba Expressway, Port Harcourt', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (326, NULL, N'8037111737', N'arrow@arrow.com', NULL, N'tes152', 2, N'ABIA', N'ABA NORTH', NULL, N'25A, Trans Amadi Road, Port Harcourt,', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (327, NULL, N'8182449043', N'NIL', NULL, N'tes153', 1, N'RIVERS', N'PORT HARCOURT', NULL, N'51, Elele Awoda Road, Port Harcourt,', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (328, NULL, N'84237117', N'NIL', NULL, N'tes154', 1, N'RIVERS', N'PORT HARCOURT', NULL, N'KM 16 PH Expressway.', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (329, NULL, N'7034111903', N'NIL', NULL, N'tes155', 1, N'RIVERS', N'PORT HARCOURT', NULL, N'Plot 270, Trans Amadi, Port Harcourt, Rivers', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (330, NULL, N'84231356', N'NIL', NULL, N'tes156', 1, N'RIVERS', N'ELEME', NULL, N'KM 14 PH/Aba expressway, Eleme Junction', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (331, NULL, N'84896777', N'NIL', NULL, N'tes158', 1, N'RIVERS', N'ELEME', NULL, N'11 Onne Road, GRA 2', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (332, NULL, N'84612378', N'NIL', NULL, N'tes159', 1, N'RIVERS', N'ELEME', NULL, N'KM 14 PH/Aba expressway, PMB 5218 River State', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (333, N'jason', N'8033032963', N'NIL', NULL, N'tes160', 2, N'ABIA', N'ABA NORTH', NULL, N'110 Estate Road Woji, PH', CAST(N'2017-10-01T08:53:41.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (334, NULL, N'1333267', N'NIL', NULL, N'tes161', 1, N'RIVERS', N'AHODA', NULL, N'Plot 474 Transamadi Ind. Layout PH', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (335, NULL, N'84462873', N'NIL', NULL, N'tes162', 1, N'RIVERS', N'AHODA', NULL, N'Plot 96, Rumuogba behind Shell Recruitment Center PH', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (336, NULL, N'7065313226', N'NIL', NULL, N'tes166', 0, N'RIVERS', N'ETCHE', NULL, N'56/58 Cement Street, off Govt Road, PH', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (337, NULL, N'8028573832', N'NIL', NULL, N'tes167', 0, N'RIVERS', N'ETCHE', NULL, N'Plot 184A, Trans-Amadi industrial Layout, PH', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (338, NULL, N'8060748889', N'NIL', NULL, N'tes168', 0, N'RIVERS', N'ETCHE', NULL, N'57, Emekuku Strt, D Line, PH', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (339, NULL, N'8033129003', N'NIL', NULL, N'tes169', 0, N'RIVERS', N'ETCHE', NULL, N'6, Chukwudike Street, Rumigbo PH', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
INSERT [dbo].[vendorops] ([id], [contact_name], [contact_phone], [contact_email], [location], [registration_number], [status], [state], [lga], [city], [address], [createdDate], [createdby]) VALUES (340, NULL, N'84785612', N'NIL', NULL, N'tes171', 0, N'RIVERS', N'ETCHE', NULL, N' Km 5, East-West Road, Port Harcourt', CAST(N'2017-10-01T08:53:42.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[vendorops] OFF
ALTER TABLE [dbo].[leftnavigation] ADD  CONSTRAINT [DF_leftnavigation_activate]  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[Order_Group] ADD  CONSTRAINT [DF_Order_Group_orderStatus]  DEFAULT ((0)) FOR [orderStatus]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_balance]  DEFAULT ((0)) FOR [balance]
GO
/****** Object:  StoredProcedure [dbo].[accessControl]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[accessControl]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT  users.userlevel AS accessControl, users.fName, users.lName,users.email, users.phone
      FROM users
      WHERE users.username = @in_uname

   END
GO
/****** Object:  StoredProcedure [dbo].[AdminaccessControl]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AdminaccessControl]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT  users.userlevel AS accessControl, users.fName, users.lName,users.email, users.phone
      FROM users
      WHERE users.username = @in_uname 

   END
GO
/****** Object:  StoredProcedure [dbo].[AdminblockPin]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdminblockPin]  
   @in_pinType   nvarchar(12), 
   @in_value   nvarchar(30)
AS 
   BEGIN
	  if (@in_pinType = 'sn')
	  begin
      update dbo.OrderDetails set 
         orderStatus='blocked'
      where cardpin_sn=@in_value
	  end
	  else if(@in_pinType='cn')
	  begin
      update dbo.OrderDetails set 
         orderStatus='blocked'
      where card_pin=@in_value
	  end
	  else if (@in_pinType = 'bn')
	  begin
      update dbo.OrderDetails set 
         dbo.OrderDetails.orderStatus='blocked'
      where orderNumber=@in_value
	  end
	END

GO
/****** Object:  StoredProcedure [dbo].[Adminexistuserpwd]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Adminexistuserpwd]  
   @in_uname nvarchar(11),
   @in_pwd nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.username = @in_uname AND users.password = @in_pwd

   END
GO
/****** Object:  StoredProcedure [dbo].[AdmingetBlockpinreq]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[AdmingetBlockpinreq]


AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
          ID as SN,blockBy as BlockBy,OrderNumber,uniqueId as UniqueID,
		 reqby as RequestBy,reqDate as RequestDate
      FROM blockPinReq

   END
GO
/****** Object:  StoredProcedure [dbo].[Admingetcomplain]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[Admingetcomplain]


AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
          complainID ,saveaseID as SaveaseId,complainType as ComplainType,complians as Complain,
		 dateofcomplain as DateofComplain
      FROM complaintbl

   END
GO
/****** Object:  StoredProcedure [dbo].[blockPin]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[blockPin]  
   @in_pinType   nvarchar(12), 
   @in_value   nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	  if @in_pinType = 'sn'
	  begin
      update dbo.OrderDetails set 
         dbo.OrderDetails.orderStatus='blocked'
      where cardpin_sn=@in_value
	  end
	  else if @in_pinType='cn'
	  begin
      update dbo.OrderDetails set 
         dbo.OrderDetails.orderStatus='blocked'
      where cardpin_sn=@in_value
	  end
	  else
	  begin
      update dbo.OrderDetails set 
         dbo.OrderDetails.orderStatus='blocked'
      where cardpin_sn=@in_value
	  end
   END
GO
/****** Object:  StoredProcedure [dbo].[changepass]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[changepass]
   @in_username nvarchar(15),
   @in_newpwd   nvarchar(15)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.users set 
         dbo.users.password=@in_newpwd
      where users.username= @in_username
   END
GO
/****** Object:  StoredProcedure [dbo].[CtrMailboxByUser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CtrMailboxByUser]
@in_saveaseID nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	  SELECT distinct ( select count_big(*) from mailbox WHERE recerverID=@in_saveaseID) AS countInbox,
(select count_big(*) from mailbox where readInboxStatus='0' and recerverID=@in_saveaseID ) as countUnRead,
(select count_big(*) from mailbox where readInboxStatus='1' and recerverID=@in_saveaseID ) as countRead,
(select count_big(*) from mailbox where  saveaseID=@in_saveaseID ) as countSent
			 FROM mailbox
			 WHERE saveaseID=@in_saveaseID

   END
GO
/****** Object:  StoredProcedure [dbo].[exisBatch]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[exisBatch]  
  @in_batch nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM OrderDetails
      WHERE OrderDetails.orderNumber = @in_batch

   END
GO
/****** Object:  StoredProcedure [dbo].[exisBeneficiary]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[exisBeneficiary]  
   @in_acctNo nvarchar(50),
   @in_acctOwner nvarchar(50),
   @in_bankName nvarchar(50),
   @in_sender nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM beneficiaryBank
      WHERE acctNo = @in_acctNo and acctOwner=@in_acctOwner and bankName=@in_bankName and sender=@in_sender

   END
GO
/****** Object:  StoredProcedure [dbo].[existAccountNo]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[existAccountNo] 
   @in_accountNo nvarchar(20), 
   @in_uname nvarchar(16)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM savease_beneficiary
      WHERE saveaseID = @in_accountNo
	  and savedFor=@in_uname

   END
GO
/****** Object:  StoredProcedure [dbo].[existAccountNo2]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[existAccountNo2] 
   @in_accountNo nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE saveaseID = @in_accountNo
	  and status<>0

   END
GO
/****** Object:  StoredProcedure [dbo].[existAdmin]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[existAdmin]  
 @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.username =@in_uname and userlevel <1

   END
GO
/****** Object:  StoredProcedure [dbo].[existBank]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[existBank]  
   @in_bankName nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM Banks
      WHERE Banks.BankName = @in_bankName

   END
GO
/****** Object:  StoredProcedure [dbo].[existBenificiary]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[existBenificiary]  
   @in_saveaseID nvarchar(16),
   @in_savedFor nvarchar(15)

AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM [DB_A35056_savease].[dbo].[savease_beneficiary]
      WHERE savease_beneficiary.saveaseID  = @in_saveaseID 
	  and  savease_beneficiary.savedFor  = @in_savedFor

   END
GO
/****** Object:  StoredProcedure [dbo].[existEmail]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[existEmail]  
   @in_email nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.email = @in_email

   END
GO
/****** Object:  StoredProcedure [dbo].[exisToken]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[exisToken]  
   @in_token nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.token = @in_token and status='0'

   END
GO
/****** Object:  StoredProcedure [dbo].[existSaveaseId]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[existSaveaseId]  
   @in_uname nvarchar(16)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.saveaseID = @in_uname
	  and status='1' 
	  and saveaseID  is not null

   END
GO
/****** Object:  StoredProcedure [dbo].[existuser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[existuser]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.username = @in_uname

   END
GO
/****** Object:  StoredProcedure [dbo].[existuserpwd]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[existuserpwd]  
   @in_uname nvarchar(11),
   @in_pwd nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT count_big(*) AS counts
      FROM users
      WHERE users.username = @in_uname AND users.password = @in_pwd

   END
GO
/****** Object:  StoredProcedure [dbo].[getAcct]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAcct]
@in_uname nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
          Row_Number() OVER(order by dateAdded desc) as ID,*
      FROM vwBeneficiary
	  WHERE savedFor=@in_uname 

   END
GO
/****** Object:  StoredProcedure [dbo].[getAcct2]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAcct2]
@in_saveaseID nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           saveaseID,CONCAT(fName, ' ', lName) as names,balance
      FROM users
	  WHERE saveaseID=@in_saveaseID 

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllActiveCustomers]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllActiveCustomers]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         *
      FROM customers where status=1

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllActiveVendors]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllActiveVendors]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         *
      FROM vendor
	  WHERE status=1

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllBanks]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllBanks]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         *
      FROM banks order by BankName

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllOrderByAdmin]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllOrderByAdmin]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         cardType,Card_pin,cardpin_sn,OderDate,orderby
      FROM OrderDetails order by cardamount,orderStatus

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllOrderByUser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllOrderByUser]
@in_uname nvarchar(11),
@in_orderstatus nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         Row_Number() OVER(order by pinID desc) as ID,*
      FROM OrderDetails
	  WHERE orderby=@in_uname
	  AND orderStatus=@in_orderstatus
	  order by pinid desc

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllOrderByUser1]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllOrderByUser1]
@in_uname nvarchar(11),
@in_orderstatus nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         Row_Number() OVER(order by pinID desc) as ID,Card_pin as CardPin, 
		 OrderNumber,
		 cardType
      FROM OrderDetails
	  WHERE orderby=@in_uname
	  AND orderStatus=@in_orderstatus
	  order by pinid desc

   END
GO
/****** Object:  StoredProcedure [dbo].[getAllUser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllUser]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         users.id, 
         users.salutation, 
         users.fName, 
         users.mName, 
         users.lName, 
         users.dName, 
         users.email, 
         users.username, 
         users.password, 
         users.role_group_id, 
         users.createdDate, 
         users.createdBy, 
         users.userlevel
      FROM users

   END
GO
/****** Object:  StoredProcedure [dbo].[getBalance]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBalance]
@in_uname nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           saveaseID, fname, lname, balance,email,phone
      FROM users
	  WHERE username=@in_uname or email=@in_uname or saveaseID=@in_uname

   END
GO
/****** Object:  StoredProcedure [dbo].[getBalance2]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getBalance2]
@in_account nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           saveaseID, fname, lname, balance,email, phone
      FROM users
	  WHERE saveaseID=@in_account

   END
GO
/****** Object:  StoredProcedure [dbo].[getBankDeposit]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBankDeposit]
@in_bankname nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
          Row_Number() OVER(order by depID desc) as ID, tranRef as DepositId,AcctNo as AccountNumber,BankName,Amount,AcctName as AccountName,TransactionDate
      FROM BankDeposit
	  WHERE depositor=@in_bankname  order by depid desc

   END
GO
/****** Object:  StoredProcedure [dbo].[getBankDeposit4user]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBankDeposit4user]
@in_bankname nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
          Row_Number() OVER(order by depID desc) as SN, acctNo,cardpin,cardsn,bankName,amount,acctName,depositor,transactionDate
      FROM BankDeposit
	  WHERE depositor=@in_bankname  order by depid desc

   END
GO
/****** Object:  StoredProcedure [dbo].[getBankDepositSelf]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBankDepositSelf]
@in_depositor nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           Row_Number() OVER(order by depID desc) as SN,DepID,AcctNo,CardPin,BankName,Amount,AcctName,Depositor,TransactionDate
      FROM BankDeposit
	  WHERE depositor=@in_depositor order by depid desc

   END
   
  
GO
/****** Object:  StoredProcedure [dbo].[getBenByAcctNo]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBenByAcctNo]
@in_acctNo nvarchar(50),
@in_sender nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        Row_Number() over(order by acctno) as ID,*
      FROM beneficiaryBank
	  where acctNo=@in_acctNo and sender=@in_sender

   END
GO
/****** Object:  StoredProcedure [dbo].[getBenByAcctNo1]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getBenByAcctNo1]
@in_acctNo nvarchar(50),
@in_sender nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
       Row_Number() OVER(order by benID desc) as ID,*
      FROM savease_beneficiary
	  where saveaseid=@in_acctNo and savedFor=@in_sender

   END
GO
/****** Object:  StoredProcedure [dbo].[getbeneficiary]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getbeneficiary]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        Row_Number() OVER(order by fullname ) as ID,*
      FROM vwbeneficiary
      WHERE savedfor = @in_uname

   END

GO
/****** Object:  StoredProcedure [dbo].[getbeneficiary2]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getbeneficiary2]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        Row_Number() OVER(order by benID desc) as ID,*
      FROM beneficiaryBank
      WHERE sender = @in_uname order by acctOwner

   END

GO
/****** Object:  StoredProcedure [dbo].[getbeneficiary3]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getbeneficiary3]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	       SELECT 
         Row_Number() OVER(order by dateadded desc) as ID,savease_beneficiary.saveaseid, users.fname+' '+users.lname as fullname 
      FROM savease_beneficiary,users
      WHERE savease_beneficiary.saveaseid=users.saveaseid and 
	  savease_beneficiary.savedFor = @in_uname order by savease_beneficiary.dateadded
   END

GO
/****** Object:  StoredProcedure [dbo].[getbeneficiary4]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getbeneficiary4]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	   SELECT 
        Row_Number() OVER(order by dateadded desc) as ID, savease_beneficiary.saveaseid, users.fname+' '+users.lname as fullname,savedfor,
		 (select users.saveaseID from users where username=@in_uname ) as saveforid
      FROM savease_beneficiary,users
      WHERE savease_beneficiary.saveaseid=users.saveaseid and 
	  savease_beneficiary.savedFor = @in_uname  order by savease_beneficiary.dateadded
   END

GO
/****** Object:  StoredProcedure [dbo].[getbeneficiarybank]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getbeneficiarybank]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        DISTINCT SaveaseID,DateAdded,bankName
      FROM savease_beneficiary
      WHERE savedFor = @in_uname order by dateadded

   END

GO
/****** Object:  StoredProcedure [dbo].[getCardImage]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getCardImage]
AS 
   BEGIN
      SET  XACT_ABORT  ON
      SET  NOCOUNT  ON
	 select  * from card_image where imagename in 
(select top 10 percent imagename from card_image order by newid())
   END

GO
/****** Object:  StoredProcedure [dbo].[getCardSerial]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getCardSerial]
@in_cardpin nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
       cardpin_sn
      FROM OrderDetails
	  where card_pin=@in_cardpin and orderStatus='Completed'

   END
GO
/****** Object:  StoredProcedure [dbo].[getComplains]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[getComplains]  

   @in_name nvarchar(50),
   @in_username nvarchar(30),
   @in_comtype nvarchar(50),
   @in_complain nvarchar(50),
   @in_image image,
   @in_refnum nvarchar(30),
   @in_status int,
   @in_date date  
   AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT Complain( Name, Username, ComplainType, Complain,
	   TransImage, RefernceNo, status, Date_Time ) values
	  (
		   @in_name,
		   @in_username,
		   @in_comtype,
		   @in_complain,
		   @in_image,		  
		   @in_refnum ,
		   @in_status,
		   @in_date    
	  )
	  End
GO
/****** Object:  StoredProcedure [dbo].[getEmail]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getEmail]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         users.id,  
         users.email
      FROM users
      WHERE users.username = @in_uname

   END
GO
/****** Object:  StoredProcedure [dbo].[getFeedback]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[getFeedback]  

   @in_username nvarchar(30),
   @in_refnum nvarchar(30),
   @in_descrip text  
   AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT feedback( Username, referenceNumber, Description) values
	  (
		@in_username,
		@in_refnum,
		@in_descrip  
	  )
	  End
GO
/****** Object:  StoredProcedure [dbo].[getLeftNavigation]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLeftNavigation]  
   @in_accessControl int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT leftnavigation.id, leftnavigation.text, leftnavigation.link, leftnavigation.accessControl
      FROM leftnavigation
      WHERE leftnavigation.accessControl = @in_accessControl
	  order by orderby

   END
GO
/****** Object:  StoredProcedure [dbo].[getMailBoxInbox]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMailBoxInbox]
@in_saveaseID nvarchar(30),
@in_statusType   char(1)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	  if (@in_statusType = 'r')
		begin
			SELECT 
			 Row_Number() OVER(order by notid desc) as SN,*,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE recerverID=@in_saveaseID
			 order by notID desc
	  end
	  else
		  begin 
			SELECT 
			 Row_Number() OVER(order by notid desc) as SN,*,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE saveaseID=@in_saveaseID
			 order by notID desc
		  end

   END
GO
/****** Object:  StoredProcedure [dbo].[getMailBoxsent]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[getMailBoxsent]
@in_saveaseID nvarchar(30),
@in_statusType   char(1)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	  if (@in_statusType = 's')
		begin
			SELECT 
			 Row_Number() OVER(order by notid desc) as SN,*,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE saveaseID='2892892'
			 order by notID desc
	  end
	  else
		  begin 
			SELECT 
			 Row_Number() OVER(order by notid desc) as SN,*,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE saveaseID='2892892'
			 order by notID desc
		  end

   END
GO
/****** Object:  StoredProcedure [dbo].[getMailByID4user]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getMailByID4user]
@in_notid nvarchar(6),
@in_saveaseID nvarchar(30),
@in_statusType   char(1)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	  if (@in_statusType = 'r')
		begin
			SELECT *,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE recerverID=@in_saveaseID and notID=@in_notid
			 order by notID desc
	  end
	  else
		  begin 
			SELECT 
			 *,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE saveaseID=@in_saveaseID and notID=@in_notid
			 order by notID desc
		  end

   END
GO
/****** Object:  StoredProcedure [dbo].[getMenuDetails]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuDetails]  
   @in_parentid nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         savease_web_menu.ID, 
         savease_web_menu.MENUID, 
         savease_web_menu.LINK, 
         savease_web_menu.TITLE, 
         savease_web_menu.PARENTID, 
         savease_web_menu.INSTALLED, 
         savease_web_menu.ENABLED, 
         savease_web_menu.GROUPLVL
      FROM savease_web_menu
      WHERE savease_web_menu.PARENTID = CAST(@in_parentid AS float(53))

   END
GO
/****** Object:  StoredProcedure [dbo].[getMenuGroup]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getMenuGroup]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      /*
      *   SSMA informational messages:
      *   M2SS0052: string literal was converted to NUMERIC literal
      */

      SELECT 
         savease_web_menu.ID, 
         savease_web_menu.MENUID, 
         savease_web_menu.LINK, 
         savease_web_menu.TITLE, 
         savease_web_menu.PARENTID, 
         savease_web_menu.INSTALLED, 
         savease_web_menu.ENABLED, 
         savease_web_menu.GROUPLVL
      FROM savease_web_menu
      WHERE savease_web_menu.PARENTID = -1
         ORDER BY savease_web_menu.MENUID

   END
GO
/****** Object:  StoredProcedure [dbo].[getName_By_SaveaseID]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[getName_By_SaveaseID]
@in_saveaseID nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
          dname
      FROM users
	  WHERE saveaseid=@in_saveaseID

   END
GO
/****** Object:  StoredProcedure [dbo].[getPinDetails]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPinDetails]
@in_pin nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           *
      FROM OrderDetails
	  WHERE card_pin=@in_pin
	  AND orderStatus='Completed'

   END
GO
/****** Object:  StoredProcedure [dbo].[getPinDetails_blocking]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getPinDetails_blocking]
@in_user nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           *
      FROM OrderDetails
	  WHERE orderby=@in_user
	  AND orderStatus='Completed'

   END
GO
/****** Object:  StoredProcedure [dbo].[getPinwithAmount]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPinwithAmount]
@in_uname nvarchar(15),
@in_pin nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	   if @in_pin = ''
	  begin
      select  Row_Number() OVER(order by orderNumber ) as SN,orderNumber as BatchNo,cardpin_sn as SerialNumber,  card_pin as CardPin, cardAmount as Amount from 
	  orderdetails where orderby=@in_uname
	  and orderStatus='completed' order by orderNumber
		end
		else
		begin
      select Row_Number() OVER(order by orderNumber ) as SN,orderNumber as BatchNo,cardpin_sn as SerialNumber,  card_pin as CardPin, cardAmount as Amount from 
	  orderdetails where orderby=@in_uname
	  and orderNumber=@in_pin and
	    orderStatus='completed' order by orderNumber
		end

   END
GO
/****** Object:  StoredProcedure [dbo].[getReadMailBox]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getReadMailBox]
@in_saveaseID nvarchar(30),
@in_statusType   char(1)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON
	  if (@in_statusType = 'r')
		begin
			SELECT 
			 Row_Number() OVER(order by notid desc) as SN,*,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE recerverID=@in_saveaseID and readInboxStatus ='1'
			 order by notID desc
	  end
   END
/*	  else
		  begin 
			SELECT 
			 Row_Number() OVER(order by notid desc) as SN,*,case 
    when datalength(contents)>=50
    then SUBSTRING(contents, 0, 50)+ '...' 
    else contents end shortContent
			 FROM mailbox
			 WHERE saveaseID=@in_saveaseID
			 order by notID desc
		  end*/

GO
/****** Object:  StoredProcedure [dbo].[getSaveaseID_By_Name]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getSaveaseID_By_Name]
@in_username nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           saveaseID,username
      FROM users
	  WHERE username=@in_username

   END
GO
/****** Object:  StoredProcedure [dbo].[getSelfDeposit]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSelfDeposit]  
   @in_uname nvarchar(11), 
   @in_acctNo nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         Row_Number() OVER(order by transactionDate desc) as SN,*
      FROM Bankdeposit
      WHERE depositor = @in_uname and acctNo=@in_acctNo order by transactionDate desc

   END
GO
/****** Object:  StoredProcedure [dbo].[gettMailunread]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gettMailunread]  
   @in_SaveaseID nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

     select COUNT_BIG(*) AS counts ,
	 readInboxStatus='0', recerverID=@in_SaveaseID
	 from mailbox

   END
GO
/****** Object:  StoredProcedure [dbo].[getTransferByUser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTransferByUser]
@in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         Row_Number() OVER(order by transactiondate desc) as ID,TransferCode as TransferId,AmountTransfered,BeneficaryName as BeneficiaryName,
		 beneficiaryAccount as AccountNumber,TransactionDate
      FROM tblTransfer
	  WHERE transferedBy=@in_uname
	  order by tid desc

   END
GO
/****** Object:  StoredProcedure [dbo].[gettuser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[gettuser]  
   @in_uname nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         users.id, 
         users.salutation, 
         users.fName, 
         users.mName, 
         users.lName, 
         users.dName, 
         users.email, 
         users.username, 
		 users.saveaseID,
		 users.phone,
         users.password, 
         users.role_group_id, 
         users.createdDate, 
         users.createdBy, 
         users.userlevel
      FROM users
      WHERE users.username = @in_uname

   END
GO
/****** Object:  StoredProcedure [dbo].[gettuserAdmin]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[gettuserAdmin]  
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        *
      FROM users
      WHERE users.userlevel >0

   END
GO
/****** Object:  StoredProcedure [dbo].[gettuserSuperAdmin]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[gettuserSuperAdmin]  
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        *
      FROM users
      WHERE users.userlevel <>-1

   END
GO
/****** Object:  StoredProcedure [dbo].[getUserByToken]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[getUserByToken]
 @in_token nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        *
      FROM users
	  where users.token = @in_token

   END
GO
/****** Object:  StoredProcedure [dbo].[getUserByUID]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getUserByUID]
@in_saveaseID nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
        *
      FROM users
	  where saveaseID=@in_saveaseID 

   END
GO
/****** Object:  StoredProcedure [dbo].[getUserName]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getUserName]
@in_saveaseID nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           saveaseID,username
      FROM users
	  WHERE saveaseID=@in_saveaseID 

   END
GO
/****** Object:  StoredProcedure [dbo].[insertBank]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[insertBank]  
   @in_bankName nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.Bank( 
         bankName)
         VALUES (
		   @in_bankName
		   )

   END
GO
/****** Object:  StoredProcedure [dbo].[insertBankBeneficiary]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertBankBeneficiary]  
   @in_acctNo   nvarchar(20),
   @in_acctName nvarchar(20),
   @in_bankName nvarchar(20),
   @in_depositor nvarchar(20),
   @in_cardpin nvarchar(20),
   @in_phoneNumber nvarchar(20),
   @in_emailID nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.beneficiaryBank(
         acctNo, 
         acctOwner, 
         bankName, 
         sender, 
         pinID,
         phoneNumber, 
         emailID)
         VALUES (
           @in_acctNo,
		   @in_acctName,
		   @in_bankName,
		   @in_depositor,
		   @in_cardpin,
		   @in_phoneNumber,
		   @in_emailID
		   )

   END
GO
/****** Object:  StoredProcedure [dbo].[insertBlockPinReq]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertBlockPinReq]  
   @in_blockBy   nvarchar(20),
   @in_uniqueID nvarchar(20),
   @in_reqBy nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.BlockPinReq(
         blockBy, 
         uniqueID, 
         reqDate, 
         reqStatus, 
         reqBy)
         VALUES (
           @in_blockBy,
		   @in_uniqueID,
		    dateadd(HOUR, 9, CURRENT_TIMESTAMP) ,
		   'Pending',
		   @in_reqBy)

   END
GO
/****** Object:  StoredProcedure [dbo].[insertComplains]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create PROCEDURE [dbo].[insertComplains]  

   @in_name nvarchar(50),
   @in_username nvarchar(30),
   @in_comtype nvarchar(50),
   @in_complain nvarchar(50),
   @in_image image,
   @in_refnum nvarchar(30),
   @in_status int,
   @in_date date  
   AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT Complain( Name, Username, ComplainType, Complain,
	   TransImage, RefernceNo, status, Date_Time ) values
	  (
		   @in_name,
		   @in_username,
		   @in_comtype,
		   @in_complain,
		   @in_image,		  
		   @in_refnum ,
		   @in_status,
		   @in_date    
	  )
	  End
GO
/****** Object:  StoredProcedure [dbo].[insertDeposit]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertDeposit]  
   @in_tranRef nvarchar(20),
   @in_acctNo   nvarchar(20),
   @in_cardpin nvarchar(20),
   @in_cardsn nvarchar(20),
   @in_bankName nvarchar(20),
   @in_acctName nvarchar(20),
   @in_amount float,
   @in_depositor nvarchar(20),
   @in_computerName nvarchar(50),
   @in_ipaddress nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.Bankdeposit(
		 tranRef,
         acctNo, 
         cardpin, 
         cardsn, 
         bankName, 
         acctName,
         amount, 
         depositor, 
         computerName, 
         ipaddress,
		  
         transactionDate)
         VALUES (
		   @in_tranRef,
           @in_acctNo,
		   @in_cardpin,
		   @in_cardsn,
		   @in_bankName,
		   @in_acctName,
		   @in_amount,
		   @in_depositor,
		   @in_computerName,
		   @in_ipaddress,
			dateadd(HOUR, 9, CURRENT_TIMESTAMP))

   END
GO
/****** Object:  StoredProcedure [dbo].[insertDistrict]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertDistrict]  
   @in_location int,
   @in_DistrictName nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT district(district.location, district.districtName)
         VALUES (@in_location, @in_DistrictName)

   END
GO
/****** Object:  StoredProcedure [dbo].[insertMailbox]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[insertMailbox]  
  @in_senderID nvarchar(12),
   @in_subject nvarchar(100),
   @in_content text,
   @in_senderName nvarchar(30),
   @in_reciverId nvarchar(30),
   @in_reciverName nvarchar(30),
   @in_orderNumber nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.mailbox(
		dbo.saveaseid,
         dbo.mailbox.subject, 
         dbo.mailbox.contents, 
         dbo.mailbox.readInboxStatus, 
         dbo.mailbox.readSentStatus,
		 dbo.mailbox.senderName,
		 dbo.mailbox.recerverID,
		 dbo.mailbox.recieverName, 
		 dbo.mailbox.orderNumber, 
         dbo.mailbox.sendDate)
         VALUES (
   @in_senderID,
   @in_subject,
   @in_content,
   0,
   0,
   @in_senderName,
   @in_reciverId,
   @in_reciverName ,
   @in_orderNumber ,
  dateadd(HOUR, 9, CURRENT_TIMESTAMP))

   END
GO
/****** Object:  StoredProcedure [dbo].[insertOrderDetails]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertOrderDetails]  
   @in_card_pin   nvarchar(12),
   @in_cardpin_sn nvarchar(16),
   @in_orderNumber nvarchar(15),
   @in_cardType nvarchar(8),
   @in_cardAmount float,
   @in_chargeOnCard float,
   @in_orderby nvarchar(20),
   @in_computerName nvarchar(50),
   @in_ipaddress nvarchar(50),
   @in_orderStatus nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.OrderDetails(
         dbo.OrderDetails.card_pin, 
         dbo.OrderDetails.cardpin_sn, 
         dbo.OrderDetails.orderNumber, 
         dbo.OrderDetails.cardType, 
         dbo.OrderDetails.cardAmount,
         dbo.OrderDetails.chargeOnCard, 
         dbo.OrderDetails.orderby, 
         dbo.OrderDetails.computerName, 
         dbo.OrderDetails.ipaddress, 
         dbo.OrderDetails.orderstatus, 
         dbo.OrderDetails.oderDate)
         VALUES (
            @in_card_pin, 
            @in_cardpin_sn, 
            @in_orderNumber, 
            @in_cardType, 
            @in_cardAmount,
            @in_chargeOnCard, 
            @in_orderby, 
            @in_computerName, 
            @in_ipaddress, 
            @in_orderStatus,
			dateadd(HOUR, 9, CURRENT_TIMESTAMP))

   END
GO
/****** Object:  StoredProcedure [dbo].[insertSaveaseBeneficiary]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertSaveaseBeneficiary]  
   @in_saveaseID   nvarchar(12),
   @savedFor nvarchar(50),
   @bankName nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.savease_beneficiary(
         dbo.savease_beneficiary.saveaseID, 
         dbo.savease_beneficiary.savedFor,
		 dbo.savease_beneficiary.BankName,
		 dbo.savease_beneficiary.dateAdded
		 )
         VALUES (
            @in_saveaseID, 
            @savedFor,
			@bankName,
			dateadd(HOUR, 9, CURRENT_TIMESTAMP))
   END
GO
/****** Object:  StoredProcedure [dbo].[insertSaveaseBeneficiary2]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertSaveaseBeneficiary2]  
   @in_uname   nvarchar(15),
   @savedFor nvarchar(50),
   @bankName nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.savease_beneficiary(
         dbo.savease_beneficiary.saveaseID, 
         dbo.savease_beneficiary.savedFor,
		 dbo.savease_beneficiary.BankName,
		 dbo.savease_beneficiary.dateAdded)
         VALUES (
            @in_uname, 
            @savedFor,
			@bankName,
			dateadd(HOUR, 9, CURRENT_TIMESTAMP))
   END
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 12/14/2018 1:17:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertUser]  
   @in_username nvarchar(11),
   @in_password nvarchar(30),
   @in_email nvarchar(50),
   @in_createdBy nvarchar(11),
   @in_userlvl int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT db_a35056_savease.users(
         db_a35056_savease.users.username, 
         db_a35056_savease.users.password, 
         db_a35056_savease.users.email, 
         db_a35056_savease.users.createdBy, 
         db_a35056_savease.users.userlevel)
         VALUES (
            @in_username, 
            @in_password, 
            @in_email, 
            @in_createdBy, 
            @in_userlvl)

   END
GO
/****** Object:  StoredProcedure [dbo].[RegisterAdmin]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterAdmin]  

   @in_fname nvarchar(30),
   @in_lname nvarchar(30),
   @in_dname nvarchar(60),
   @in_phone nvarchar(50),
   @in_username nvarchar(11),
   @in_password nvarchar(100),
   @in_email nvarchar(50),
   @in_createdBy nvarchar(11),
   @in_userlvl int,
   @in_status nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT users(
         fname, lname, dname, phone, username, password, email, createdBy, userlevel, status)
         VALUES (
            @in_fname, 
            @in_lname, 
            @in_dname, 
            @in_phone, 
            @in_username,
            @in_password, 
            @in_email, 
            @in_createdBy, 
            @in_userlvl, 
            @in_status)
   END
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterUser]  

   @in_fname nvarchar(30),
   @in_lname nvarchar(30),
   @in_dname nvarchar(60),
   @in_phone nvarchar(50),
   @in_username nvarchar(20),
   @in_password nvarchar(100),
   @in_email nvarchar(50),
   @in_saveaseid nvarchar(11),
   @in_createdBy nvarchar(11),
   @in_userlvl int,
   @in_token nvarchar(100),
   @in_status nvarchar(11)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT users(
         fname, lname, dname, phone, username, password, email, saveaseID, createdBy,createdDate, userlevel, token, status)
         VALUES (
            @in_fname, 
            @in_lname, 
            @in_dname, 
            @in_phone, 
            @in_username,
            @in_password, 
            @in_email,
			@in_saveaseid, 
            @in_createdBy,
			dateadd(HOUR, 9, CURRENT_TIMESTAMP), 
            @in_userlvl, 
            @in_token, 
            @in_status
			)
   END
GO
/****** Object:  StoredProcedure [dbo].[RegisterVendor]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterVendor]  

   @in_fname nvarchar(30),
   @in_lname nvarchar(30),
   @in_dname nvarchar(60),
   @in_phone nvarchar(50),
   @in_username nvarchar(11),
   @in_password nvarchar(100),
   @in_email nvarchar(50),
   @in_saveaseid nvarchar(11),
   @in_createdBy nvarchar(11),
   @in_userlvl int,
   @in_token nvarchar(100),
   @in_status nvarchar(11),
   @in_identificationType nvarchar(50),
   @in_passport nvarchar(50),
   @in_cacDoc nvarchar(50),
   @in_allCAC nvarchar(50),
   @in_VATReg nvarchar(50),
   @in_taxCert nvarchar(50),
   @in_company nvarchar(50),
   @in_CompanyAddress nvarchar(50)

AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT users(
          fname, lname, dname, phone, username, password, email, saveaseID, createdBy, userlevel, token,
		  status,identificationType,passport,cacDoc,allCAC,VATReg,taxCert,companyName,CompanyAddress,createddate)
         VALUES (
            @in_fname, 
            @in_lname, 
            @in_dname, 
            @in_phone, 
            @in_username,
            @in_password, 
            @in_email,
			@in_saveaseid, 
            @in_createdBy, 
            @in_userlvl, 
            @in_token, 
            @in_status,
            @in_identificationType,
            @in_passport,
            @in_cacDoc,
            @in_allCAC,
            @in_VATReg,
            @in_taxCert,
			@in_company,
            @in_CompanyAddress,
			GETDATE()
			)
   END
GO
/****** Object:  StoredProcedure [dbo].[RegisterVendor2]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterVendor2]  

   @in_fname nvarchar(30),
   @in_lname nvarchar(30),
   @in_dname nvarchar(60),
   @in_phone nvarchar(50),
   @in_username nvarchar(11),
   @in_password nvarchar(100),
   @in_email nvarchar(50),
   @in_saveaseid nvarchar(11),
   @in_createdBy nvarchar(11),
   @in_userlvl int,
   @in_token nvarchar(100),
   @in_status nvarchar(11),
   @in_identificationType varchar(50),
   @in_identificationTypeB Binary,
   @in_company varchar(50),
   @in_CompanyAddress varchar(50)

AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT users(
         fname, lname, dname, phone, username, password, email, saveaseID, createdBy, userlevel, token,
		  status,identificationType,identificationTypeB,companyName,CompanyAddress)
         VALUES (
            @in_fname, 
            @in_lname, 
            @in_dname, 
            @in_phone, 
            @in_username,
            @in_password, 
            @in_email,
			@in_saveaseid, 
            @in_createdBy, 
            @in_userlvl, 
            @in_token, 
            @in_status,
            @in_identificationType,
            @in_identificationTypeB,
			@in_company,
            @in_CompanyAddress
			)
   END
GO
/****** Object:  StoredProcedure [dbo].[RegisterVendor3]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterVendor3]  

   @in_fname nvarchar(30),
   @in_lname nvarchar(30),
   @in_dname nvarchar(60),
   @in_phone nvarchar(50),
   @in_username nvarchar(11),
   @in_password nvarchar(100),
   @in_email nvarchar(50),
   @in_saveaseid nvarchar(11),
   @in_createdBy nvarchar(11),
   @in_userlvl int,
   @in_token nvarchar(100),
   @in_status nvarchar(11),
   @in_company nvarchar(50),
   @in_CompanyAddress nvarchar(50),
   @in_bvn nvarchar(50),
   @in_cacRegNo nvarchar(50)

AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT users(
          fname, 
		  lname, 
		  dname, 
		  phone, 
		  username, 
		  password, 
		  email, 
		  saveaseID, 
		  createdBy, 
		  userlevel, 
		  token,
		  status,
		  companyName,
		  CompanyAddress,
		  createddate,
		  bvn,
		  cacRegNo)
         VALUES (
            @in_fname, 
            @in_lname, 
            @in_dname, 
            @in_phone, 
            @in_username,
            @in_password, 
            @in_email,
			@in_saveaseid, 
            @in_createdBy, 
            @in_userlvl, 
            @in_token, 
            @in_status,
			@in_company,
            @in_CompanyAddress,
			GETDATE(),
			@in_bvn,
			@in_cacRegNo
			)
   END
GO
/****** Object:  StoredProcedure [dbo].[transferFund]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[transferFund]  
   @in_transferCode   nvarchar(12),
   @in_balB4Transfer float,
   @amountTransfered float,
   @balance float,
   @beneficiaryAccount nvarchar(50),
   @beneficaryName nvarchar(50),
   @accountNo nvarchar(20),
   @transferedBy nvarchar(20),
   @in_computerName nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      INSERT dbo.tblTransfer(
         dbo.tblTransfer.transferCode, 
         dbo.tblTransfer.balB4Transfer, 
         dbo.tblTransfer.amountTransfered, 
         dbo.tblTransfer.balance, 
         dbo.tblTransfer.beneficiaryAccount,
         dbo.tblTransfer.beneficaryName, 
         dbo.tblTransfer.accountNo, 
         dbo.tblTransfer.transferedBy, 
         dbo.tblTransfer.computerName,  
         dbo.tblTransfer.transferStatus,
		 dbo.tblTransfer.transactionDate)
         VALUES (
            @in_transferCode, 
            @in_balB4Transfer, 
            @amountTransfered, 
            @balance, 
            @beneficiaryAccount,
            @beneficaryName, 
            @accountNo, 
            @transferedBy, 
            @in_computerName, 
            '1',
			dateadd(HOUR, 9, CURRENT_TIMESTAMP)
			)

   END
GO
/****** Object:  StoredProcedure [dbo].[updateBalance]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateBalance]  
   @in_user   nvarchar(12), 
   @in_bal   float
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.users set 
         dbo.users.balance=@in_bal
      where username=@in_user
   END
GO
/****** Object:  StoredProcedure [dbo].[updateCardpinstatus]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updateCardpinstatus]  
   @in_cardpin   nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.orderdetails set 
         dbo.orderdetails.orderstatus='used'
      where card_pin=@in_cardpin
   END
   
GO
/****** Object:  StoredProcedure [dbo].[updatePassword]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updatePassword]  
   @in_uname   nvarchar(50),
   @in_password nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.users set 
         dbo.users.password= @in_password
      where username=@in_uname
   END
GO
/****** Object:  StoredProcedure [dbo].[updateStatus]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateStatus]  
   @in_token   nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.users set 
         dbo.users.status='1'
      where token=@in_token
   END
GO
/****** Object:  StoredProcedure [dbo].[updBlockPinInOrderDetails]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updBlockPinInOrderDetails]  
   @in_uniqueID nvarchar(20),
   @in_actionedBy nvarchar(20),
   @in_actionedStatus nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.OrderDetails set 
         dbo.OrderDetails.orderstatus=@in_actionedStatus
      where card_pin=@in_uniqueID
   END
GO
/****** Object:  StoredProcedure [dbo].[updBlockPinReq]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updBlockPinReq]  
   @in_uniqueID nvarchar(20),
   @in_actionedBy nvarchar(20),
   @in_actionedStatus nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      update dbo.BlockPinReq set 
         dbo.BlockPinReq.actionedBy=@in_actionedBy,
         dbo.BlockPinReq.actionedStatus=@in_actionedStatus,
         dbo.BlockPinReq.actionedDate= dateadd(HOUR, 9, CURRENT_TIMESTAMP)
      where uniqueID=@in_uniqueID
   END
GO
/****** Object:  StoredProcedure [dbo].[updMailbox]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updMailbox]  
   @in_statusType   char(1), 
   @in_SaveaseID   nvarchar(30)
AS 
   BEGIN
	  if (@in_statusType = 'r')
	  begin
      update dbo.mailbox set 
        readInboxStatus=1
      where recerverID=@in_SaveaseID
	  end
	  else if(@in_statusType='s')
	  begin
      update dbo.mailbox set 
        readSentStatus=1
      where SaveaseID=@in_SaveaseID
	  end
	END
	  

GO
/****** Object:  StoredProcedure [dbo].[updMailbox2]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[updMailbox2]  
   @in_statusType   char(1), 
   @in_notID   nvarchar(30)
AS 
   BEGIN
	  if (@in_statusType = 'r')
	  begin
      update dbo.mailbox set 
        readInboxStatus=1
      where notID=@in_notID
	  end
	  else if(@in_statusType='s')
	  begin
      update dbo.mailbox set 
        readSentStatus=1
      where notID=@in_notID
	  end
	END
	  

GO
/****** Object:  StoredProcedure [dbo].[UsedPin]    Script Date: 12/14/2018 1:17:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsedPin]
@in_pin nvarchar(50)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
           count_big(*) AS counts
      FROM Bankdeposit
	  WHERE cardpin=@in_pin
	  

   END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Pending; 1=Completed; 2=cancel;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order_Group', @level2type=N'COLUMN',@level2name=N'orderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[61] 4[4] 2[16] 3) )"
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
         Begin Table = "savease_beneficiary"
            Begin Extent = 
               Top = 26
               Left = 184
               Bottom = 156
               Right = 354
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "users"
            Begin Extent = 
               Top = 0
               Left = 577
               Bottom = 303
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwBeneficiary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwBeneficiary'
GO
USE [master]
GO
ALTER DATABASE [DB_A35056_savease] SET  READ_WRITE 
GO
