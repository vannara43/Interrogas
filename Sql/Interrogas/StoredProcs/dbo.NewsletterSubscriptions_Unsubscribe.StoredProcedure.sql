USE [Interrogas]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_Unsubscribe]    Script Date: 5/19/2022 5:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Vannara Thong>
-- Create date: <4/5/2022>
-- Description:	<Insert for NewsletterSubscriptions table>
-- Code Reviewer: Rebecca Skeens


-- MODIFIED BY: Vannara Thong 
-- MODIFIED DATE:04/05/2022
-- Code Reviewer: Rebecca Skeens
-- Note: Working as it should and fix spacing
-- =============================================

CREATE proc [dbo].[NewsletterSubscriptions_Unsubscribe]
@Email nvarchar(255),
@IsSubscribed bit = 0
as

/*

DECLARE @Email nvarchar(255) = 'awesome_dragon@email.com'
,@IsSubscribed bit = 1

EXECUTE dbo.NewsletterSubscriptions_Unsubscribe
@Email,@IsSubscribed

SELECT * From dbo.NewsletterSubscriptions

*/

BEGIN UPDATE [dbo].[NewsletterSubscriptions]
   SET [Email] = @Email,[IsSubscribed] = @IsSubscribed
 WHERE  Email = @Email
 
 END


GO
