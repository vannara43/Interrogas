USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Delete]
@Id int


as

/* ---Test Code ----

Declare @Id int = 4

Select * 
from dbo.Users
where Id = @Id

Execute dbo.Users_Delete @Id

Select * 
from dbo.Users
where Id = @Id


*/


Begin


DELETE FROM [dbo].[Users]
where Id = @Id;


End
GO
