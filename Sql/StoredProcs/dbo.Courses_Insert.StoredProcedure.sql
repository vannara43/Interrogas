USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[Courses_Insert] 
@CourseId int
,@Name nvarchar(50)
,@Description nvarchar(50)
,@SeasonTermId Int
,@TeacherId Int
,@Id Int OUTPUT
as

/* ----Code Test -----

Declare @Id int = 0;
Declare 
		@CourseId int = 5	  	 
		,@Name nvarchar(50) = 'Math505' 	 
		,@Description nvarchar(50) = 'This is Algebra'	  	 
		,@SeasonTermId int = 5	 
		,@TeacherId int = 5

Execute [dbo].[Courses_Insert]
@CourseId
,@Name
,@Description
,@SeasonTermId
,@TeacherId
,@Id OUTPUT


Select *
from dbo.Course



*/

Begin

INSERT INTO [dbo].[Course]
           ([CourseId]
           ,[Name]
           ,[Description]
           ,[SeasonTermId]
           ,[TeacherId])
     VALUES
           (@CourseId
           ,@Name
           ,@Description
           ,@SeasonTermId
           ,@TeacherId)

SET @Id = SCOPE_IDENTITY();

Select *
from dbo.Course
where Id = @Id

End
GO
