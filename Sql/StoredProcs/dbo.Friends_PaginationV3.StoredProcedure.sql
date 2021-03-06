USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_PaginationV3]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Friends_PaginationV3] 
 @PageIndex int = 0
 ,@PageSize int = 5


as

/*

Execute dbo.Friends_PaginationV3

*/


BEGIN --Begin---------------


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
on   i.Id = f.PrimaryImageId
order by f.Id

OFFSET @offSet Rows
Fetch Next @pageSize Rows ONLY
 END
GO
