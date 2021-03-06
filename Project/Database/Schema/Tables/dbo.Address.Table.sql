USE [s16guest16]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/5/2016 10:59:03 PM ******/
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
	[stateID] [int] NULL,
	[zipCode] [numeric](5, 0) NULL,
	[countryID] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities] FOREIGN KEY([cityID])
REFERENCES [dbo].[Cities] ([cityID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Cities]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([countryID])
REFERENCES [dbo].[Country] ([countryID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Country]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_States] FOREIGN KEY([stateID])
REFERENCES [dbo].[States] ([stateID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_States]
GO
