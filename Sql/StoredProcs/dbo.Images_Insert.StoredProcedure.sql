USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Images_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Images_Insert] 
@TypeId int
,@Url nvarchar(50)
,@Id Int OUTPUT

as

/* ----Code Test -----

Declare @Id int = 0;
Declare 
		@TypeId int = '5'	  	 
		,@Url nvarchar(50) = 'https://i.playboard.app/p/AATXAJzVN-9sZTGpZfsD6gKX0j_2nHv7UkCGTfDx-tXG/default.jpg'

Execute [dbo].[Images_Insert]
 @TypeId  	 
,@Url 	 
,@Id OUTPUT


Select * from dbo.Images

*/

Begin

INSERT INTO [dbo].[Images]
([TypeId]
,[Url])

VALUES

(@TypeId
,@Url)

SET @Id = SCOPE_IDENTITY();

Select *
from dbo.Images
where Id = @Id

End



GO
