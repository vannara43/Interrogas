USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[People_Insert]

@PersonName nvarchar(50),
@Age int,
@IsASmoker bit,
@UserId nvarchar(128),
@Id int OUTPUT

/* -----Test Code-----

Declare @Id int = 0;


Declare @PersonName nvarchar(50) = 'Fred',
@Age int = 25,
@IsASmoker bit = 0,
@UserId nvarchar(128) ='3333333333'


Execute dbo.People_Insert
			@PersonName,
			@Age,
			@IsASmoker,
			@UserId,
			@Id OUTPUT

			Select @Id

Select * from dbo.People
			Where Id = @Id


*/


as

BEGIN

/*
Declare @Id int = 0;
Declare @PersonName nvarchar(50) = 'Peter',
		@Age int = 19,
		@IsASmoker bit = 0,
		@UserId nvarchar(128) = '1221442141342'
		*/

INSERT INTO [dbo].[People]
           ([Name]
           ,[Age]
           ,[isSmoker]
           ,[UserId])
     VALUES
           (@PersonName,
			@Age,
			@IsASmoker,
			@UserId)

			SET @Id = SCOPE_IDENTITY()

			


	END
GO
