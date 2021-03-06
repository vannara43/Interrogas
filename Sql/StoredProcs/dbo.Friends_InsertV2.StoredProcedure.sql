USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_InsertV2]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Friends_InsertV2] 
@Bio nvarchar(50)
,@Summary nvarchar(50)
,@Title nvarchar(50)
,@Headline nvarchar(50)
,@Slug nvarchar(50)
,@StatusId Int
,@PrimaryImageId Int
,@Id Int OUTPUT
as

/* ----Code Test -----

Declare @Id int = 0;
Declare 
		@Bio nvarchar(50) = 'This is a bio'	  	 
		,@Summary nvarchar(50) = 'summary' 	 
		,@Title nvarchar(50) = 'This title'	  	 
		,@Headline nvarchar(50) = 'this headline'	 
		,@Slug nvarchar(50) = 'this is slug'	  	 
		,@StatusId int = 0
		,@PrimaryImageId int = 5

Execute [dbo].[Friends_Insert]
 @Bio	  	 
,@Summary 	 
,@Title	  	 
,@Headline	 
,@Slug	  	 
,@StatusId
,@PrimaryImageId
,@Id OUTPUT


Select *
from dbo.Friends



*/

Begin

INSERT INTO [dbo].[Friends]
([Bio]
,[Summary]
,[Title]
,[Headline]
,[Slug]
,[StatusId]
,[PrimaryImageId])

VALUES

(@Bio	  	 
,@Summary 	 
,@Title	  	 
,@Headline	 
,@Slug	  	 
,@StatusId
,@PrimaryImageId)

SET @Id = SCOPE_IDENTITY();

Select *
from dbo.Friends
where Id = @Id

End



GO
