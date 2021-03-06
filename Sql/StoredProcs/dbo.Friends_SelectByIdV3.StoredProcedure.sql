USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV3]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_SelectByIdV3]
@Id Int

as

/* ----Code Test -----

Declare @Id Int = 2

Execute dbo.Friends_SelectByIdV3 @Id

*/

Begin

SELECT f.Id
,Bio
,Summary
,Title
,Headline
,Slug
,PrimaryImageId
		,Skills = (

SELECT s.id,s.Name
from dbo.FriendSkills as fs inner join dbo.Skills as s
on fs.SkillId = s.Id
where fs.FriendId = f.id
For JSON AUTO)
,TotalCount = COUNT(1) Over()

From dbo.Friends as f inner join dbo.Images as i
on  f.PrimaryImageId = i.Id
where f.Id = @Id
order by f.Id
End

GO
