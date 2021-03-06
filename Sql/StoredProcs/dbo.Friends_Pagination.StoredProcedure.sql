USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Pagination]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_Pagination] 
 @PageIndex int = 0
 ,@PageSize int = 5


as

/*


select Id from dbo.Friends

Execute dbo.Friends_Pagination

*/


BEGIN --Begin---------------


Declare @offset int = @PageIndex * @PageSize

SELECT [Id]
      ,[Bio]
      ,[Summary]
      ,[Title]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
      ,[PrimaryImageUrl]
  FROM [dbo].[Friends]
ORDER BY Id

OFFSET @offSet Rows
Fetch Next @pageSize Rows ONLY
 END
GO
