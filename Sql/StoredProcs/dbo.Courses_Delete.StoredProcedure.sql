USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Courses_Delete]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Courses_Delete]
@Id int


as

/* ---Test Code ----

Declare @Id int = 1

Select * 
from dbo.Course
where Id = @Id

Execute dbo.Courses_Delete @Id

Select * 
from dbo.Course
where Id = @Id


*/


Begin


DELETE FROM dbo.Course
where Id = @Id;


End



GO
