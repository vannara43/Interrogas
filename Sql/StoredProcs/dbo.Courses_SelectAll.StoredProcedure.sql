USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_SelectAll]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Courses_SelectAll] 

as

/* ---Test Code ----

Execute [dbo].[Courses_SelectAll]

*/


Begin
SELECT [Id]
      ,[CourseId]
      ,[Name]
      ,[Description]
      ,[SeasonTermId]
      ,[TeacherId]
  FROM [dbo].[Course]
End






GO
