USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Skills_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Skills_Insert] 
@Name nvarchar(50)
,@Id Int OUTPUT
as

/* ----Code Test -----

Declare @Id int = 0;
Declare @Name nvarchar(50) = 'Name5'

Execute [dbo].[Skills_Insert]
 @Name
,@Id


Select *
from dbo.Skills



*/

Begin

INSERT INTO [dbo].[Skills]
           ([Name])
     VALUES
           (@Name)

SET @Id = SCOPE_IDENTITY();

Select * from dbo.Skills
where Id = @Id

End



GO
