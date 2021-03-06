USE [s16guest16]
GO
/****** Object:  StoredProcedure [dbo].[InsertFeature]    Script Date: 5/5/2016 10:59:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hughes
-- Create date: 5/1/16
-- Description:	Inserts a new feature into the dbo.Features table. The procedure checks to see if the
-- feature that the user is attempting to insert is already in the features table. If it is it outputs
-- a message and the featureID for that feature.
-- =============================================
CREATE PROCEDURE [dbo].[InsertFeature] 
	-- Add the parameters for the stored procedure here
	@featureDesc varchar(255)  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT featureDescription from dbo.Features WHERE featureDescription = @featureDesc)
	BEGIN
		-- Insert statements for procedure here
		INSERT INTO Features(featureDescription)
		Values (@featureDesc)
	END
	ELSE
	BEGIN
		PRINT 'The Feature Already Exists'
		SELECT featureID from dbo.Features WHERE featureDescription = @featureDesc
	END
END

GO
