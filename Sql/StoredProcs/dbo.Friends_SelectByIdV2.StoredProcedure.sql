USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV2]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_SelectByIdV2]
@Id Int

as

/* ----Code Test -----

Declare @Id Int = 2

Execute dbo.Friends_SelectByIdV2 @Id

Select * from dbo.Skills
where Id = @Id

*/

Begin

SELECT s.Id
,s.Name
		,FriendSkills = (

SELECT fs.FriendId as Friend_Id
		,fs.SkillId as skill_Id

From dbo.Skills as s inner join dbo.FriendSkills as fs
on  fs.FriendId = s.Id
where fs.SkillId = s.Id
		for JSON AUTO
		)
		From dbo.Skills as s
order by s.Id

End
GO
