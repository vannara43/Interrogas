USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Delete]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_Delete]
@Id int


as

/* ---Test Code ----

Declare @Id int = 1

Select * 
from dbo.Friends
where Id = @Id

Execute dbo.Friends_Delete @Id

Select * 
from dbo.Friends
where Id = @Id


*/


Begin


DELETE FROM [dbo].[Friends]
where Id = @Id;


End



GO
