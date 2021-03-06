USE [s16guest16]
GO
/****** Object:  StoredProcedure [dbo].[NewFeatureCount]    Script Date: 5/5/2016 10:59:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hughes
-- Create date: 5/1/2016
-- Description:	Counts the total number of new features in a customerRelease outputs "x procedures are in y release"
-- or "Bug Fix Release. No new features" if there are no new features. It takes the custReleaseID as input.
-- =============================================
CREATE PROCEDURE [dbo].[NewFeatureCount]
	@custReleaseID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS(SELECT custReleaseID FROM dbo.CustReleaseFeatures WHERE custReleaseID = @custReleaseID)
	BEGIN 
		PRINT 'Invalid CustReleaseID'
	END
	ELSE
	BEGIN
		DECLARE @featureCount int
		SELECT @featureCount = COUNT(*) FROM CustReleaseFeatures WHERE custReleaseID = @custReleaseID AND newFeature = 1
		IF @featureCount > 0
			PRINT CONVERT(varchar(4),@featureCount) + ' new features are in the ' + CONVERT(varchar(4),@custReleaseID) + ' release.'
		ELSE
			PRINT 'This is a bug-fix release. There are no new features.'
	END 
END


GO
