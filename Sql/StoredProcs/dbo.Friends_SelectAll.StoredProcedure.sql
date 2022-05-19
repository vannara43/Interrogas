USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectAll]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_SelectAll] 

as

/* ---Test Code ----

Execute dbo.Friends_SelectAll

*/


Begin
SELECT [Id]
      ,[Bio]
      ,[Summary]
      ,[Title]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
      ,[PrimaryImageId]
  FROM [dbo].[Friends]
End






GO
