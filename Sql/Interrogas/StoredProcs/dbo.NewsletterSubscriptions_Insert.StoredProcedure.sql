USE [Interrogas]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Insert]    Script Date: 5/19/2022 5:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Vannara Thong>
-- Create date: <4/5/2022>
-- Description:	<Insert for NewsletterSubscriptions table>
-- Code Reviewer: 


-- MODIFIED BY: author
-- MODIFIED DATE:12/1/2020
-- Code Reviewer: Rebecca Skeens
-- Note: Working as it should
-- =============================================

CREATE proc [dbo].[NewsletterSubscriptions_Insert]
									@Email nvarchar(255)
as

/* -----Test Code-----

Declare @Email nvarchar(255) = 'mighty_penguin2@email.com'
,@IsSubscribed bit = 1

execute dbo.NewsletterSubscriptions_Insert 
@Email
,@IsSubscribed

SELECT * From dbo.NewsletterSubscriptions

*/

BEGIN

	INSERT INTO [dbo].[NewsletterSubscriptions]
			   ([Email])
		 VALUES
			   (@Email)


END
GO
