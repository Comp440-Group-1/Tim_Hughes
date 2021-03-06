USE [s16guest16]
GO
/****** Object:  Table [dbo].[SourceControlRoot]    Script Date: 5/5/2016 10:59:03 PM ******/
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
