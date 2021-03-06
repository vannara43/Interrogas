USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectById]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectById]
	@Id int
as

/* ---Test Code ----

Declare @Id int = 3;
Execute dbo.Users_SelectById @Id

*/


Begin
SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[AvatarUrl]
      ,[TenantId]
      ,[Password]
      ,[PasswordConfirm]
      ,[DateCreated]
      ,[DateModified]
  FROM [dbo].[Users]
  where Id = @Id
End

GO
