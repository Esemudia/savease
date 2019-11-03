USE [DB_A35056_savease]
GO
/****** Object:  Schema [db_a35056_savease]    Script Date: 12/14/2018 1:08:52 AM ******/
CREATE SCHEMA [db_a35056_savease]
GO
/****** Object:  Table [dbo].[Bankdeposit]    Script Date: 12/14/2018 1:08:52 AM ******/
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
/****** Object:  Table [dbo].[Banks]    Script Date: 12/14/2018 1:08:54 AM ******/
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
/****** Object:  Table [dbo].[beneficiaryBank]    Script Date: 12/14/2018 1:08:55 AM ******/
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
/****** Object:  Table [dbo].[blockPinReq]    Script Date: 12/14/2018 1:08:56 AM ******/
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
/****** Object:  Table [dbo].[card_image]    Script Date: 12/14/2018 1:08:56 AM ******/
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
/****** Object:  Table [dbo].[Complain]    Script Date: 12/14/2018 1:08:57 AM ******/
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
/****** Object:  Table [dbo].[complaintbl]    Script Date: 12/14/2018 1:08:58 AM ******/
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
/****** Object:  Table [dbo].[contents]    Script Date: 12/14/2018 1:08:58 AM ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 12/14/2018 1:08:59 AM ******/
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
/****** Object:  Table [dbo].[district]    Script Date: 12/14/2018 1:09:00 AM ******/
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
/****** Object:  Table [dbo].[feedback]    Script Date: 12/14/2018 1:09:00 AM ******/
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
/****** Object:  Table [dbo].[leftnavigation]    Script Date: 12/14/2018 1:09:01 AM ******/
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
/****** Object:  Table [dbo].[mailbox]    Script Date: 12/14/2018 1:09:02 AM ******/
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
/****** Object:  Table [dbo].[Order_Group]    Script Date: 12/14/2018 1:09:02 AM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/14/2018 1:09:03 AM ******/
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
/****** Object:  Table [dbo].[Queue]    Script Date: 12/14/2018 1:09:04 AM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 12/14/2018 1:09:04 AM ******/
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
/****** Object:  Table [dbo].[savease_beneficiary]    Script Date: 12/14/2018 1:09:05 AM ******/
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
/****** Object:  Table [dbo].[savease_web_menu]    Script Date: 12/14/2018 1:09:06 AM ******/
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
/****** Object:  Table [dbo].[seaudittrail]    Script Date: 12/14/2018 1:09:06 AM ******/
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
/****** Object:  Table [dbo].[seroleassignment]    Script Date: 12/14/2018 1:09:07 AM ******/
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
/****** Object:  Table [dbo].[state_lga]    Script Date: 12/14/2018 1:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state_lga](
	[LGA] [varchar](50) NOT NULL,
	[STATE] [varchar](25) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReset]    Script Date: 12/14/2018 1:09:08 AM ******/
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
/****** Object:  Table [dbo].[tblTransfer]    Script Date: 12/14/2018 1:09:09 AM ******/
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
/****** Object:  Table [dbo].[Transaction_pin]    Script Date: 12/14/2018 1:09:10 AM ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 12/14/2018 1:09:10 AM ******/
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
/****** Object:  Table [dbo].[Users2]    Script Date: 12/14/2018 1:09:11 AM ******/
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
/****** Object:  Table [dbo].[vendor]    Script Date: 12/14/2018 1:09:12 AM ******/
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
/****** Object:  Table [dbo].[vendorops]    Script Date: 12/14/2018 1:09:12 AM ******/
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
/****** Object:  View [dbo].[vwBeneficiary]    Script Date: 12/14/2018 1:09:13 AM ******/
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
ALTER TABLE [dbo].[leftnavigation] ADD  CONSTRAINT [DF_leftnavigation_activate]  DEFAULT ((1)) FOR [activate]
GO
ALTER TABLE [dbo].[Order_Group] ADD  CONSTRAINT [DF_Order_Group_orderStatus]  DEFAULT ((0)) FOR [orderStatus]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_balance]  DEFAULT ((0)) FOR [balance]
GO
/****** Object:  StoredProcedure [dbo].[accessControl]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AdminaccessControl]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AdminblockPin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Adminexistuserpwd]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AdmingetBlockpinreq]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Admingetcomplain]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[blockPin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[changepass]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CtrMailboxByUser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[exisBatch]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[exisBeneficiary]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existAccountNo]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existAccountNo2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existAdmin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existBank]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existBenificiary]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existEmail]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[exisToken]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existSaveaseId]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existuser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[existuserpwd]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAcct]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAcct2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllActiveCustomers]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllActiveVendors]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllBanks]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllOrderByAdmin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllOrderByUser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllOrderByUser1]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getAllUser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBalance]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBalance2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBankDeposit]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBankDeposit4user]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBankDepositSelf]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBenByAcctNo]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getBenByAcctNo1]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getbeneficiary]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getbeneficiary2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getbeneficiary3]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getbeneficiary4]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getbeneficiarybank]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getCardImage]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getCardSerial]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getComplains]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getEmail]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getFeedback]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getLeftNavigation]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getMailBoxInbox]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getMailBoxsent]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getMailByID4user]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getMenuDetails]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getMenuGroup]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getName_By_SaveaseID]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getPinDetails]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getPinDetails_blocking]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getPinwithAmount]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getReadMailBox]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getSaveaseID_By_Name]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getSelfDeposit]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[gettMailunread]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getTransferByUser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[gettuser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[gettuserAdmin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[gettuserSuperAdmin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getUserByToken]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getUserByUID]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getUserName]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertBank]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertBankBeneficiary]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertBlockPinReq]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertComplains]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertDeposit]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertDistrict]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertMailbox]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertOrderDetails]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertSaveaseBeneficiary]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertSaveaseBeneficiary2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterAdmin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterVendor]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterVendor2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterVendor3]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[transferFund]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updateBalance]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updateCardpinstatus]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updatePassword]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updateStatus]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updBlockPinInOrderDetails]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updBlockPinReq]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updMailbox]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updMailbox2]    Script Date: 12/14/2018 1:09:13 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UsedPin]    Script Date: 12/14/2018 1:09:13 AM ******/
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
