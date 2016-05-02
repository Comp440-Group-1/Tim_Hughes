USE [s16guest16]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[streetAddress] [varchar](25) NOT NULL,
	[cityID] [int] NOT NULL,
	[stateID] [int] NOT NULL,
	[zipCode] [numeric](5, 0) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[companyID] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [varchar](25) NOT NULL,
	[addressID] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](20) NOT NULL,
	[lastName] [varchar](20) NOT NULL,
	[email] [varchar](25) NOT NULL,
	[phoneID] [int] NOT NULL,
	[companyID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerDownload]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDownload](
	[custReleaseID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[downloadDateID] [int] NOT NULL,
	[downloadTime] [time](7) NOT NULL,
 CONSTRAINT [PK_CustomerDownload] PRIMARY KEY CLUSTERED 
(
	[custReleaseID] ASC,
	[customerID] ASC,
	[downloadDateID] ASC,
	[downloadTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustRelease]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustRelease](
	[custReleaseID] [int] IDENTITY(1,1) NOT NULL,
	[versionID] [int] NOT NULL,
	[custReleaseVersion] [numeric](6, 3) NOT NULL,
	[downloadURL] [varchar](max) NOT NULL,
	[releaseDate] [date] NOT NULL,
	[depreciated] [bit] NULL,
 CONSTRAINT [PK_CustRelease] PRIMARY KEY CLUSTERED 
(
	[custReleaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustReleaseFeatures]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustReleaseFeatures](
	[custReleaseID] [int] NOT NULL,
	[featureID] [int] NOT NULL,
	[newFeature] [bit] NULL,
	[depreciated] [bit] NULL,
 CONSTRAINT [PK_CustReleaseFeatures] PRIMARY KEY CLUSTERED 
(
	[custReleaseID] ASC,
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevRelease]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevRelease](
	[devReleaseID] [int] IDENTITY(1,1) NOT NULL,
	[devReleaseVersion] [numeric](6, 3) NOT NULL,
	[versionID] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
 CONSTRAINT [PK_DevRelease] PRIMARY KEY CLUSTERED 
(
	[devReleaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevReleaseFeatures]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevReleaseFeatures](
	[devReleaseID] [int] NOT NULL,
	[featureID] [int] NOT NULL,
	[newFeature] [bit] NULL,
	[depreciated] [bit] NULL,
 CONSTRAINT [PK_DevReleaseFeatures_1] PRIMARY KEY CLUSTERED 
(
	[devReleaseID] ASC,
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DownloadDate]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DownloadDate](
	[downloadDateID] [int] IDENTITY(1,1) NOT NULL,
	[downloadYearID] [int] NOT NULL,
	[downloadMonthID] [int] NOT NULL,
	[downloadDayID] [int] NOT NULL,
 CONSTRAINT [PK_DownloadDate] PRIMARY KEY CLUSTERED 
(
	[downloadDateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DownloadDay]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DownloadDay](
	[downloadDayID] [int] IDENTITY(1,1) NOT NULL,
	[dayEntry] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_DownloadDay] PRIMARY KEY CLUSTERED 
(
	[downloadDayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DownloadMonth]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DownloadMonth](
	[downloadMonthID] [int] IDENTITY(1,1) NOT NULL,
	[monthEntry] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_DownloadMonth] PRIMARY KEY CLUSTERED 
(
	[downloadMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DownloadYear]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DownloadYear](
	[downloadYearID] [int] IDENTITY(1,1) NOT NULL,
	[yearEntry] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_DownloadYear] PRIMARY KEY CLUSTERED 
(
	[downloadYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Features]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Features](
	[featureID] [int] IDENTITY(1,1) NOT NULL,
	[featureDescription] [varchar](max) NULL,
 CONSTRAINT [FK_Features] PRIMARY KEY CLUSTERED 
(
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[phoneID] [int] IDENTITY(1,1) NOT NULL,
	[phoneTypeID] [int] NOT NULL,
	[phoneNumber] [numeric](11, 0) NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[phoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneType]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhoneType](
	[phoneTypeID] [int] IDENTITY(1,1) NOT NULL,
	[phoneType] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[phoneTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Platform]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Platform](
	[platformID] [int] IDENTITY(1,1) NOT NULL,
	[platformName] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Platform] PRIMARY KEY CLUSTERED 
(
	[platformID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](25) NOT NULL,
	[productDescription] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SourceControlBranch]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceControlBranch](
	[branchID] [int] IDENTITY(1,1) NOT NULL,
	[custReleaseID] [int] NOT NULL,
 CONSTRAINT [PK_SourceControlBranch] PRIMARY KEY CLUSTERED 
(
	[branchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SourceControlRoot]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceControlRoot](
	[rootID] [int] IDENTITY(1,1) NOT NULL,
	[versionID] [int] NOT NULL,
	[devReleaseID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[States]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[States](
	[stateID] [int] IDENTITY(1,1) NOT NULL,
	[stateName] [varchar](2) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[stateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Version]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[versionID] [int] IDENTITY(1,1) NOT NULL,
	[versionNumber] [numeric](6, 3) NOT NULL,
	[productID] [int] NOT NULL,
	[platformID] [int] NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[versionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VersionFeatures]    Script Date: 5/2/2016 12:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionFeatures](
	[versionID] [int] NOT NULL,
	[featureID] [int] NOT NULL,
 CONSTRAINT [PK_VersionFeatures] PRIMARY KEY CLUSTERED 
(
	[versionID] ASC,
	[featureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities] FOREIGN KEY([cityID])
REFERENCES [dbo].[Cities] ([cityID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Cities]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_States] FOREIGN KEY([stateID])
REFERENCES [dbo].[States] ([stateID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_States]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Address] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Address]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([companyID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Company]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Phone] FOREIGN KEY([phoneID])
REFERENCES [dbo].[Phone] ([phoneID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Phone]
GO
ALTER TABLE [dbo].[CustomerDownload]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDownload_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[CustomerDownload] CHECK CONSTRAINT [FK_CustomerDownload_Customer]
GO
ALTER TABLE [dbo].[CustomerDownload]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDownload_CustRelease] FOREIGN KEY([custReleaseID])
REFERENCES [dbo].[CustRelease] ([custReleaseID])
GO
ALTER TABLE [dbo].[CustomerDownload] CHECK CONSTRAINT [FK_CustomerDownload_CustRelease]
GO
ALTER TABLE [dbo].[CustomerDownload]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDownload_DownloadDate] FOREIGN KEY([downloadDateID])
REFERENCES [dbo].[DownloadDate] ([downloadDateID])
GO
ALTER TABLE [dbo].[CustomerDownload] CHECK CONSTRAINT [FK_CustomerDownload_DownloadDate]
GO
ALTER TABLE [dbo].[CustRelease]  WITH CHECK ADD  CONSTRAINT [FK_CustRelease_Version] FOREIGN KEY([versionID])
REFERENCES [dbo].[Version] ([versionID])
GO
ALTER TABLE [dbo].[CustRelease] CHECK CONSTRAINT [FK_CustRelease_Version]
GO
ALTER TABLE [dbo].[CustReleaseFeatures]  WITH CHECK ADD  CONSTRAINT [FK_CustReleaseFeatures_CustRelease] FOREIGN KEY([custReleaseID])
REFERENCES [dbo].[CustRelease] ([custReleaseID])
GO
ALTER TABLE [dbo].[CustReleaseFeatures] CHECK CONSTRAINT [FK_CustReleaseFeatures_CustRelease]
GO
ALTER TABLE [dbo].[CustReleaseFeatures]  WITH CHECK ADD  CONSTRAINT [FK_CustReleaseFeatures_Features] FOREIGN KEY([featureID])
REFERENCES [dbo].[Features] ([featureID])
GO
ALTER TABLE [dbo].[CustReleaseFeatures] CHECK CONSTRAINT [FK_CustReleaseFeatures_Features]
GO
ALTER TABLE [dbo].[DevRelease]  WITH CHECK ADD  CONSTRAINT [FK_DevRelease_Version] FOREIGN KEY([versionID])
REFERENCES [dbo].[Version] ([versionID])
GO
ALTER TABLE [dbo].[DevRelease] CHECK CONSTRAINT [FK_DevRelease_Version]
GO
ALTER TABLE [dbo].[DevReleaseFeatures]  WITH CHECK ADD  CONSTRAINT [FK_DevReleaseFeatures_DevRelease1] FOREIGN KEY([devReleaseID])
REFERENCES [dbo].[DevRelease] ([devReleaseID])
GO
ALTER TABLE [dbo].[DevReleaseFeatures] CHECK CONSTRAINT [FK_DevReleaseFeatures_DevRelease1]
GO
ALTER TABLE [dbo].[DevReleaseFeatures]  WITH CHECK ADD  CONSTRAINT [FK_devReleaseFeatures_Features] FOREIGN KEY([featureID])
REFERENCES [dbo].[Features] ([featureID])
GO
ALTER TABLE [dbo].[DevReleaseFeatures] CHECK CONSTRAINT [FK_devReleaseFeatures_Features]
GO
ALTER TABLE [dbo].[DownloadDate]  WITH CHECK ADD  CONSTRAINT [FK_DownloadDate_DownloadDay] FOREIGN KEY([downloadDayID])
REFERENCES [dbo].[DownloadDay] ([downloadDayID])
GO
ALTER TABLE [dbo].[DownloadDate] CHECK CONSTRAINT [FK_DownloadDate_DownloadDay]
GO
ALTER TABLE [dbo].[DownloadDate]  WITH CHECK ADD  CONSTRAINT [FK_DownloadDate_DownloadMonth] FOREIGN KEY([downloadMonthID])
REFERENCES [dbo].[DownloadMonth] ([downloadMonthID])
GO
ALTER TABLE [dbo].[DownloadDate] CHECK CONSTRAINT [FK_DownloadDate_DownloadMonth]
GO
ALTER TABLE [dbo].[DownloadDate]  WITH CHECK ADD  CONSTRAINT [FK_DownloadDate_DownloadYear] FOREIGN KEY([downloadYearID])
REFERENCES [dbo].[DownloadYear] ([downloadYearID])
GO
ALTER TABLE [dbo].[DownloadDate] CHECK CONSTRAINT [FK_DownloadDate_DownloadYear]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_PhoneType] FOREIGN KEY([phoneTypeID])
REFERENCES [dbo].[PhoneType] ([phoneTypeID])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_PhoneType]
GO
ALTER TABLE [dbo].[SourceControlBranch]  WITH CHECK ADD  CONSTRAINT [FK_SourceControlBranch_CustRelease] FOREIGN KEY([custReleaseID])
REFERENCES [dbo].[CustRelease] ([custReleaseID])
GO
ALTER TABLE [dbo].[SourceControlBranch] CHECK CONSTRAINT [FK_SourceControlBranch_CustRelease]
GO
ALTER TABLE [dbo].[SourceControlRoot]  WITH CHECK ADD  CONSTRAINT [FK_SourceControlRoot_DevRelease] FOREIGN KEY([devReleaseID])
REFERENCES [dbo].[DevRelease] ([devReleaseID])
GO
ALTER TABLE [dbo].[SourceControlRoot] CHECK CONSTRAINT [FK_SourceControlRoot_DevRelease]
GO
ALTER TABLE [dbo].[SourceControlRoot]  WITH CHECK ADD  CONSTRAINT [FK_SourceControlRoot_Version] FOREIGN KEY([versionID])
REFERENCES [dbo].[Version] ([versionID])
GO
ALTER TABLE [dbo].[SourceControlRoot] CHECK CONSTRAINT [FK_SourceControlRoot_Version]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Platform] FOREIGN KEY([platformID])
REFERENCES [dbo].[Platform] ([platformID])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Platform]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Product]
GO
ALTER TABLE [dbo].[VersionFeatures]  WITH CHECK ADD  CONSTRAINT [FK_VersionFeatures_Features] FOREIGN KEY([featureID])
REFERENCES [dbo].[Features] ([featureID])
GO
ALTER TABLE [dbo].[VersionFeatures] CHECK CONSTRAINT [FK_VersionFeatures_Features]
GO
ALTER TABLE [dbo].[VersionFeatures]  WITH CHECK ADD  CONSTRAINT [FK_VersionFeatures_Version] FOREIGN KEY([versionID])
REFERENCES [dbo].[Version] ([versionID])
GO
ALTER TABLE [dbo].[VersionFeatures] CHECK CONSTRAINT [FK_VersionFeatures_Version]
GO
