USE [Interrogas]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Unsubscribe_V2]    Script Date: 5/19/2022 5:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Bryce White
-- Create date: 4/15/2022
-- Description: Select By Created By Procedure
-- Code Reviewer:

-- =============================================


CREATE PROC [dbo].[NewsletterSubscriptions_Unsubscribe_V2]
								@Email nvarchar(255)
								
AS

/*

	DECLARE @Email nvarchar(255) = ' '

	EXECUTE dbo.NewsletterSubscriptions_Unsubscribe_V2
	@Email

	SELECT * From dbo.NewsletterSubscriptions

*/

BEGIN 

	UPDATE [dbo].[NewsletterSubscriptions]
	   SET [Email] = @Email
		,[IsSubscribed] = 0
	 WHERE  Email = @Email
 
END
GO
