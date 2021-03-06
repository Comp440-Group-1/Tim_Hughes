USE [s16guest16]
GO
/****** Object:  Table [dbo].[VersionFeatures]    Script Date: 5/5/2016 10:59:03 PM ******/
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
