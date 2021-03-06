USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectAllBySmokerFlag]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[People_SelectAllBySmokerFlag]
	@SmokerFlag bit
as

/* ---Test Code ----

Declare @SmokerFlag bit = NULL
Execute [dbo].[People_SelectAllBySmokerFlag] @SmokerFlag

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
  where ([isSmoker] = @SmokerFlag)
  OR
  (@SmokerFlag IS NULL and [isSmoker] is NULL)
End
GO
