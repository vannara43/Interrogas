USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectAllById]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[People_SelectAllById]
	@Id int
as

/* ---Test Code ----

Declare @Id int = 2;
Execute dbo.People_SelectAllById @Id

*/


Begin
SELECT [Id]
      ,[Name]
      ,[Age]
      ,[isSmoker]
      ,[DateAdded]
      ,[DateModified]
      ,[UserId]
  FROM [dbo].[People]
  where Id = @Id
End
GO
