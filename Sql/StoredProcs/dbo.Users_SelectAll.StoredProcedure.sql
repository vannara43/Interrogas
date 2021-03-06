USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectAll] 
	
as

/* ---Test Code ----

Execute dbo.Users_SelectAll 

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
End

GO
