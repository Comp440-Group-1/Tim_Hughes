USE [s16guest16]
GO
/****** Object:  StoredProcedure [dbo].[InsertFeature]    Script Date: 5/2/2016 12:19:31 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NewFeatureCount]    Script Date: 5/2/2016 12:19:32 PM ******/
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

	IF NOT EXISTS(SELECT custReleaseID FROM dbo.CustomerDownload WHERE custReleaseID = @custReleaseID)
	BEGIN 
		PRINT 'Invalid CustReleaseID'
	END
	ELSE
	BEGIN
		DECLARE @featureCount int
		SELECT @featureCount = COUNT(*) FROM CustReleaseFeatures WHERE CustReleaseFeatures.custReleaseID = @custReleaseID AND CustReleaseFeatures.newFeature = 1
		IF @featureCount > 0
			PRINT CONVERT(varchar(4),@featureCount) + 'new features are in the ' + CONVERT(varchar(4),@custReleaseID) + ' release.'
		ELSE
			PRINT 'This is a bug-fix release. There are no new features.'
	END 
END


GO
/****** Object:  StoredProcedure [dbo].[ReportDownloadsPerMonth]    Script Date: 5/2/2016 12:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hughes	
-- Create date: 4/1/2016
-- Description:	Creates a new table that contains: productName, versionNumber, custReleaseVersion, month, year and # of download
--													INCOMPLETE
-- =============================================
CREATE PROCEDURE [dbo].[ReportDownloadsPerMonth]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	CREATE TABLE #downloadReport(productName varchar(25), versionNumber int, custReleaseVersion numeric(6,3), monthEntry varchar(9), yearEntry numeric(4,0), downloadCount int)

	--INSERT INTO #downloadReport(productName, versionNumber, custReleaseVersion, monthEntry , yearEntry, downloadCount)
--Not sure how to get a distinct count from and build a table with all the enteries
	DROP TABLE #downloadReport
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateProductVersion]    Script Date: 5/2/2016 12:19:32 PM ******/
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
