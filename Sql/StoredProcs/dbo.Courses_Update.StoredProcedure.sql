USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Update]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Courses_Update]
@CourseId int, 
@Name nvarchar(50), 
@Description nvarchar(50), 
@SeasonTermId int, 
@TeacherId int,
@Id int output

as

/*
Declare @Id int = 1;
Declare 
		@CourseId int = 1
		,@Name nvarchar(50) = 'Updated Math101'
		,@Description nvarchar(50) = 'This is Updated Algebra'
		,@SeasonTermId int = 1
		,@TeacherId int = 1

Select * from dbo.Course
 Where Id = @Id

Execute dbo.Courses_Update 
		@CourseId
		,@Name
		,@Description
		,@SeasonTermId
		,@TeacherId
		,@Id OUTPUT

Select * from dbo.Course
 Where Id = @Id
*/
BEGIN 
UPDATE [dbo].[Course]
   SET [CourseId] = @CourseId
      ,[Name] = @Name
      ,[Description] = @Description
      ,[SeasonTermId] = @SeasonTermId
      ,[TeacherId] = @TeacherId

 WHERE Id = @Id
 END
GO
