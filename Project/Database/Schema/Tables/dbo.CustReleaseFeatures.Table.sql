USE [s16guest16]
GO
/****** Object:  Table [dbo].[CustReleaseFeatures]    Script Date: 5/5/2016 10:59:03 PM ******/
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
