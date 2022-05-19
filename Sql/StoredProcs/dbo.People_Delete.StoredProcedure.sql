USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Delete]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[People_Delete]
@Id int


as

/* ---Test Code ----

Declare @Id int = 9

Select * 
from dbo.People
where Id = @Id

Execute dbo.People_Delete @Id

Select * 
from dbo.People
where Id = @Id


*/


Begin


Delete from [dbo].[People]
where Id = @Id;


End
GO
