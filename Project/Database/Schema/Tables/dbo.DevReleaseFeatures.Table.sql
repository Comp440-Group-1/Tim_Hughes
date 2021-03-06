USE [s16guest16]
GO
/****** Object:  Table [dbo].[DevReleaseFeatures]    Script Date: 5/5/2016 10:59:03 PM ******/
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
