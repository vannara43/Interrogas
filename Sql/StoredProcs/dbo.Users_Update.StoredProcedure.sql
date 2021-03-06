USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Update]

@Id int OUTPUT
,@FirstName nvarchar(50)
,@LastName nvarchar(50)
,@Email nvarchar(50)
,@AvatarUrl nvarchar(50)
,@TenantId nvarchar(50)
,@Password nvarchar(50)
,@PasswordConfirm nvarchar(50)


as

/*

Declare @Id int = 3;

Declare @FirstName nvarchar(50) = 'UpdateTest'
		,@LastName nvarchar(50) = 'UpdateTest'
		,@Email nvarchar(50) = 'UpdateTest'
		,@AvatarUrl nvarchar(50) = 'UpdateTest'
		,@TenantId nvarchar(50) = 'UpdateTest'
		,@Password nvarchar(50) = 'UpdateTest'
		,@PasswordConfirm nvarchar(50) = 'UpdateTest'

Execute dbo.Users_Update 
@Id Output
,@Firstname
,@LastName
,@Email
,@AvatarUrl
,@TenantId
,@Password
,@PasswordConfirm


select * from dbo.Users




*/


BEGIN
UPDATE [dbo].[Users]
   SET [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[Email] = @Email
      ,[AvatarUrl] = @AvatarUrl
      ,[TenantId] = @TenantId
      ,[Password] = @Password
      ,[PasswordConfirm] = @PasswordConfirm
 WHERE Id = @Id


 END
GO
