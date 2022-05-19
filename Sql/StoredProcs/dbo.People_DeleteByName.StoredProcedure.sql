USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_DeleteByName]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[People_DeleteByName]
@name nvarchar(5)


as

/* ---Test Code ----

Declare @name nvarchar(5) = 'Fred'

Select * 
from dbo.People
WHERE Name = @name

Execute dbo.People_DeleteByName @name

Select * 
from dbo.People
WHERE Name = @name


*/


Begin


Delete from [dbo].[People]
where Name = @name


End
GO
