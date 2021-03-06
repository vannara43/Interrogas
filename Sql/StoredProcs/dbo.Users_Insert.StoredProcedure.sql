USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Insert]

@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@AvatarUrl nvarchar(50),
@TenantId nvarchar(50),
@Password nvarchar(50),
@PasswordConfirm nvarchar(50),
@Id int OUTPUT

as

/*  ---Code Test---

Declare @Id int = 0;

Declare @FirstName nvarchar(50) = 'Test'
		,@LastName nvarchar(50) = 'Test'
		,@Email nvarchar(50) = 'Test'
		,@AvatarUrl nvarchar(50) = 'Test'
		,@TenantId nvarchar(50) = 'Test'
		,@Password nvarchar(50) = 'Test'
		,@PasswordConfirm nvarchar(50) = 'Test'

Execute dbo.Users_Insert
		@FirstName
		,@LastName
		,@Email
		,@AvatarUrl
		,@TenantId
		,@Password
		,@PasswordConfirm

		Select @Id

select * from dbo.Users
where Id = @Id

*/
BEGIN



INSERT INTO [dbo].[Users]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[AvatarUrl]
           ,[TenantId]
           ,[Password]
           ,[PasswordConfirm])
     VALUES
           (@FirstName
           ,@LastName
           ,@Email
           ,@AvatarUrl
           ,@TenantId
           ,@Password
           ,@PasswordConfirm)

		   Set @Id = SCOPE_IDENTITY();

		   select * from dbo.Users
		   where Id = @Id
END
GO
