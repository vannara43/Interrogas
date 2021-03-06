USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Update]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_Update]
@Id int output,
@Title nvarchar(50), 
@Bio nvarchar(50), 
@Summary nvarchar(50), 
@Headline nvarchar(50), 
@Slug nvarchar(50), 
@StatusId int,
@PrimaryImageUrl nvarchar(50)
as

/*
Declare @Id int = 15;
Declare 
		@Title nvarchar(50) = 'This is updated Title'
		,@Bio nvarchar(50) = 'This is updated bio'
		,@Summary nvarchar(50) = 'This is updated Summary'
		,@Headline nvarchar(50) = 'This is updated Headline'
		,@Slug nvarchar(50) = 'This is updated Slug'
		,@StatusId int = 0
		,@PrimaryImageUrl nvarchar(50) = 'This is updated PrimaryImageUrl'

Select * from dbo.Friends
 Where Id = @Id

Execute dbo.Friends_Update 
		@Title
		,@Bio
		,@Summary
		,@Headline
		,@Slug
		,@StatusId
		,@PrimaryImageUrl
		,@Id OUTPUT

Select * from dbo.Friends
 Where Id = @Id
*/
BEGIN 
UPDATE [dbo].[Friends]
   SET
[Title] = @Title
,[Bio] = @Bio
,[Summary] = @Summary
,[Headline] = @Headline
,[Slug] = @Slug
,[StatusId] = @StatusId
,[PrimaryImageUrl] = @PrimaryImageUrl

 WHERE Id = @Id
 END

GO
