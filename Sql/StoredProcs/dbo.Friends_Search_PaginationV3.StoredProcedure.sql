USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV3]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_Search_PaginationV3]    
                                @PageIndex int 
                                ,@PageSize int
                                ,@Query nvarchar(50)
/*
        
Declare @PageIndex int = 1
	,@PageSize int = 50
	,@Query nvarchar(50) = 'Cats'

Execute dbo.Friends_Search_PaginationV3 @PageIndex
	,@PageSize
	,@Query

select * from dbo.Friends
*/
 
AS
BEGIN
Declare @offset int = @PageIndex * @PageSize
		SELECT f.Id
      ,f.Bio
      ,f.Summary
      ,f.Title
      ,f.Headline
      ,f.Slug
      ,f.StatusId
      ,f.PrimaryImageId
	  ,i.Url
	  ,Skills = (

SELECT s.id,s.Name as SkillName
from dbo.FriendSkills as fs inner join dbo.Skills as s
on fs.SkillId = s.Id
where fs.FriendId = f.id
For JSON AUTO)
,TotalCount = COUNT(1) Over()

From dbo.Friends as f inner join dbo.Images as i
on  f.PrimaryImageId = i.Id

WHERE (Bio LIKE '%' + @Query + '%' OR 
[Summary] LIKE '%' + @Query + '%' OR
[Title] LIKE '%' + @Query + '%'
)
ORDER BY Id
        
OFFSET @offSet Rows
Fetch Next @PageSize Rows ONLY
    
END
GO
