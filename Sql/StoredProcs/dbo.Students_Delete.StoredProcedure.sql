USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Students_Delete]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Students_Delete]
@Id int


as

/* ---Test Code ----

Declare @Id int = 1

Select * 
from dbo.Student
where Id = @Id

Execute dbo.Students_Delete @Id

Select * 
from dbo.Student
where Id = @Id


*/


Begin


DELETE FROM dbo.Student
where Id = @Id;


End



GO
