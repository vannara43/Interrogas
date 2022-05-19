USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[FriendSkills_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[FriendSkills_Insert] 
@FriendId int
,@SkillId int
,@Id int OUTPUT

as

/* ----Code Test -----

Declare @Id int = 0;
Declare @FriendId int = 5
		,@SkillId int = 5

Execute [dbo].[FriendSkills_Insert]
@FriendId
,@SkillId
,@Id OUTPUT 	 


Select * from dbo.FriendSkills

*/

Begin

INSERT INTO [dbo].[FriendSkills]
           ([SkillId],[FriendId])
     VALUES
           (@SkillId,@FriendId)

SET @Id = SCOPE_IDENTITY()

Select * from dbo.FriendSkills

End



GO
