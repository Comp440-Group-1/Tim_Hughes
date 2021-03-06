USE [s16guest16]
GO
/****** Object:  Table [dbo].[CustomerDownload]    Script Date: 5/5/2016 10:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDownload](
	[custReleaseID] [int] NOT NULL,
	[customerID] [int] NOT NULL,
	[downloadDayID] [int] NOT NULL,
	[downloadMonthID] [int] NOT NULL,
	[downloadYearID] [numeric](4, 0) NOT NULL,
	[downloadTime] [time](7) NOT NULL,
 CONSTRAINT [PK_CustomerDownload_1] PRIMARY KEY CLUSTERED 
(
	[custReleaseID] ASC,
	[customerID] ASC,
	[downloadDayID] ASC,
	[downloadMonthID] ASC,
	[downloadYearID] ASC,
	[downloadTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
ALTER TABLE [dbo].[CustomerDownload]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDownload_DownloadDay] FOREIGN KEY([downloadDayID])
REFERENCES [dbo].[DownloadDay] ([downloadDayID])
GO
ALTER TABLE [dbo].[CustomerDownload] CHECK CONSTRAINT [FK_CustomerDownload_DownloadDay]
GO
ALTER TABLE [dbo].[CustomerDownload]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDownload_DownloadMonth] FOREIGN KEY([downloadMonthID])
REFERENCES [dbo].[DownloadMonth] ([downloadMonthID])
GO
ALTER TABLE [dbo].[CustomerDownload] CHECK CONSTRAINT [FK_CustomerDownload_DownloadMonth]
GO
ALTER TABLE [dbo].[CustomerDownload]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDownload_DownloadYear] FOREIGN KEY([downloadYearID])
REFERENCES [dbo].[DownloadYear] ([downloadYearID])
GO
ALTER TABLE [dbo].[CustomerDownload] CHECK CONSTRAINT [FK_CustomerDownload_DownloadYear]
GO
