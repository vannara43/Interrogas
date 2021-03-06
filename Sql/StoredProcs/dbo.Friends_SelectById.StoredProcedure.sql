USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectById]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Friends_SelectById]
@Id Int

as

/* ----Code Test -----

Declare @Id Int

Execute dbo.Friends_SelectById @Id

Select * from dbo.Friends
where Id = @Id

*/

Begin

SELECT [Id]
,[Bio]
,[Summary]
,[Title]
,[Headline]
,[Slug]
,[StatusId]
,[PrimaryImageUrl]

From dbo.Friends
where Id = @Id

End
GO
