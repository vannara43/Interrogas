USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_Pagination]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_Search_Pagination]    
                                @PageIndex int 
                                ,@PageSize int
                                ,@Query nvarchar(50)
/*
        
        Declare @PageIndex int = 0
                ,@PageSize int = 50
                ,@Query nvarchar(50) = 'Cats'
        Execute dbo.Friends_Search_Pagination @PageIndex
                                            ,@PageSize
                                            ,@Query
            select*
            from dbo.Friends
*/
 
AS
BEGIN
Declare @offset int = @PageIndex * @PageSize
		SELECT [Id]
			,[Bio]
			,[Summary]
			,[Title]
			,[Headline]
			,[Slug]
			,[StatusId]
			,[PrimaryImageUrl]
			,TotalCount = COUNT(1) OVER()
		FROM [dbo].[Friends]
	WHERE (Bio LIKE '%' + @Query + '%' OR 
	[Summary] LIKE '%' + @Query + '%' OR
	[Title] LIKE '%' + @Query + '%'
	)
	ORDER BY Id
        
OFFSET @offSet Rows
Fetch Next @PageSize Rows ONLY
    
END
GO
