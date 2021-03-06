USE [s16guest16]
GO
/****** Object:  Table [dbo].[SourceControlBranch]    Script Date: 5/5/2016 10:59:03 PM ******/
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
ALTER TABLE [dbo].[SourceControlBranch]  WITH CHECK ADD  CONSTRAINT [FK_SourceControlBranch_CustRelease] FOREIGN KEY([custReleaseID])
REFERENCES [dbo].[CustRelease] ([custReleaseID])
GO
ALTER TABLE [dbo].[SourceControlBranch] CHECK CONSTRAINT [FK_SourceControlBranch_CustRelease]
GO
