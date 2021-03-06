USE [s16guest16]
GO
/****** Object:  StoredProcedure [dbo].[ReportDownloadsPerMonth]    Script Date: 5/5/2016 10:59:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tim Hughes	
-- Create date: 4/1/2016
-- Description:	Creates a new table that contains: productName, versionNumber, custReleaseVersion, month, year and # of download
-- =============================================
CREATE PROCEDURE [dbo].[ReportDownloadsPerMonth]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
Select Product.productName, Version.versionNumber, CustRelease.custReleaseVersion, CustomerDownload.downloadMonthID, DownloadYear.yearEntry, COUNT(*) AS downloads 
	FROM Product
		INNER JOIN Version ON Product.productID = Version.productID
		INNER JOIN CustRelease ON Version.versionID = CustRelease.versionID
		INNER JOIN CustomerDownload ON CustRelease.custReleaseID = CustomerDownload.custReleaseID
		INNER JOIN DownloadYear ON CustomerDownload.downloadYearID = DownloadYear.downloadYearID
	GROUP BY Product.productName, Version.versionNumber, CustRelease.custReleaseVersion, CustomerDownload.downloadMonthID, CustomerDownload.downloadYearID, DownloadYear.yearEntry
END

GO
