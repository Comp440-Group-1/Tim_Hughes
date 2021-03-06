USE [s16guest16]
GO
/****** Object:  Table [dbo].[CustRelease]    Script Date: 5/5/2016 10:59:03 PM ******/
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
ALTER TABLE [dbo].[CustRelease]  WITH CHECK ADD  CONSTRAINT [FK_CustRelease_Version] FOREIGN KEY([versionID])
REFERENCES [dbo].[Version] ([versionID])
GO
ALTER TABLE [dbo].[CustRelease] CHECK CONSTRAINT [FK_CustRelease_Version]
GO
