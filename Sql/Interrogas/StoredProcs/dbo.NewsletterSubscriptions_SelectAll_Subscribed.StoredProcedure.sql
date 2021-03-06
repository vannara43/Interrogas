USE [Interrogas]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_SelectAll_Subscribed]    Script Date: 5/19/2022 5:16:11 AM ******/
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

CREATE proc [dbo].[NewsletterSubscriptions_SelectAll_Subscribed]
@pageIndex int
,@pageSize int
,@Query bit
as

/*

DECLARE @pageIndex int = 0
,@pageSize int = 5
,@Query bit = 1

EXECUTE dbo.NewsletterSubscriptions_SelectAll_Subscribed
@pageIndex
,@pageSize
,@Query

SELECT * From dbo.NewsletterSubscriptions
ORDER BY DateCreated

*/

BEGIN DECLARE @offset int = @pageIndex * @pageSize
SELECT 
  [Email], 
  [IsSubscribed], 
  [DateCreated], 
  [DateModified], 
  TotalCount = COUNT(1) OVER() 
FROM 
  [dbo].[NewsletterSubscriptions] 
WHERE 
  (
    [IsSubscribed] LIKE '1'
  ) 
ORDER BY DateCreated DESC
OFFSET @offset ROW
FETCH NEXT @PageSize ROWS ONLY


  END
GO
