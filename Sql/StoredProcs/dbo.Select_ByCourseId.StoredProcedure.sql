USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Select_ByCourseId]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Select_ByCourseId] 
@Id Int

as

/* ---Test Code ----

Declare @Id Int = 1
Execute [dbo].[Select_ByCourseId] @Id

*/


Begin

Select  c.Id
		,c.CourseId
		,c.Name
		,c.Description
		,st.Season
		,t.Name as TeacherId
		, Students = (
		select s.Id,s.Name 
		from dbo.Student
		where Id = @Id

		For JSON AUTO
		),TotalCount = COUNT(1) Over()

from dbo.StudentCourses as sc 
inner join dbo.Student as s
on s.Id = sc.StudentId
inner join dbo.Teacher as t
on sc.TeacherId = t.Id
inner join dbo.SeasonTerms as st
on sc.SeasonTermId = st.Id
inner join dbo.Course as c
on sc.CourseId = c.Id
where c.CourseId = @Id

End






GO
