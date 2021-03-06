USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Update]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[People_Update]

@PersonName nvarchar(50),
@Age int,
@IsASmoker bit,
@UserId nvarchar(128),
@Id int OUTPUT

as



/*
Declare @Id int = 0;


Declare @PersonName nvarchar(50) = 'Fred',
@Age int = 25,
@IsASmoker bit = 0,
@UserId nvarchar(128) ='3333333333'

 Select *
 From dbo.People
 Where Id = @Id

Execute dbo.People_Insert
			@PersonName,
			@Age,
			@IsASmoker,
			@UserId,
			@Id OUTPUT

Select *
From dbo.People
Where Id = @Id

*/


BEGIN

Declare @datNow datetime2 = getutcdate();

UPDATE [dbo].[People]
   SET [Name] = @PersonName
      ,[Age] = @Age
      ,[isSmoker] = @IsASmoker
      ,[DateModified] = @datNow
      ,[UserId] = @UserId
 WHERE Id = @Id


END
GO
