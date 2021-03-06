USE [Interrogas]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_SelectAll_SubscribedV2]    Script Date: 5/19/2022 5:16:11 AM ******/
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
-- Note: Working as it should and fixed name spacing
-- =============================================

CREATE proc [dbo].[NewsletterSubscriptions_SelectAll_SubscribedV2]

as

/*

EXECUTE dbo.NewsletterSubscriptions_SelectAll_SubscribedV2

SELECT * From dbo.NewsletterSubscriptions
where [IsSubscribed] LIKE '1'
*/

BEGIN
SELECT 
  [Email], 
  [IsSubscribed], 
  [DateCreated], 
  [DateModified]
FROM 
  [dbo].[NewsletterSubscriptions] 
WHERE 
  (
    [IsSubscribed] LIKE '1'
  ) 
ORDER BY Email

  END
GO
