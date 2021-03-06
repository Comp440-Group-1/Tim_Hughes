USE [s16guest16]
GO
/****** Object:  Table [dbo].[DevRelease]    Script Date: 5/5/2016 10:59:03 PM ******/
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
ALTER TABLE [dbo].[DevRelease]  WITH CHECK ADD  CONSTRAINT [FK_DevRelease_Version] FOREIGN KEY([versionID])
REFERENCES [dbo].[Version] ([versionID])
GO
ALTER TABLE [dbo].[DevRelease] CHECK CONSTRAINT [FK_DevRelease_Version]
GO
