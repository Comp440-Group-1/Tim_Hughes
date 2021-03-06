USE [s16guest16]
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductVersion]    Script Date: 5/5/2016 10:59:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hughes
-- Create date: 4/1/2016
-- Description:	Updates the Product Version. Takes productID, version num and platformtype previous version as parameters
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProductVersion]
	-- Add the parameters for the stored procedure here
	@productID int,
	@versionNumber int,
	@platformID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS(SELECT productID from dbo.Product WHERE productID = @productID)
	BEGIN 
		PRINT 'Invalid productID'
	END
	ELSE IF EXISTS(SELECT versionNumber from dbo.Version WHERE versionNumber = @versionNumber)
	BEGIN
		PRINT 'Version already Exists'
	END
	ELSE IF NOT EXISTS(SELECT platformID from dbo.Platform WHERE platformID = @platformID)
	BEGIN
		PRINT 'Invalid platformID'
	END
	ELSE
	INSERT INTO dbo.Version (versionNumber,productID,platformID)
		VALUES(@versionNumber, @productID, @platformID)
END

GO
