USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectAll]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[People_SelectAll]

as

/* ---Test Code ----

Execute dbo.People_SelectAll

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
End
GO
