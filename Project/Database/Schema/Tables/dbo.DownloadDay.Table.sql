USE [s16guest16]
GO
/****** Object:  Table [dbo].[DownloadDay]    Script Date: 5/5/2016 10:59:03 PM ******/
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
