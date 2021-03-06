USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_SelectByParty]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Presidents_SelectByParty]
@PartyAffiliation nvarchar(50)

as

/* ---Test Code ----

Declare @PartyAffiliation nvarchar(50) = 'Republican'

Execute dbo.Presidents_SelectByParty @PartyAffiliation

SELECT [FirstName]
      ,[LastName]
  FROM [dbo].[Presidents]
  where ([PartyAffiliation] = @PartyAffiliation)
  OR
  (@PartyAffiliation IS NULL and [PartyAffiliation] is NULL)

*/

BEGIN

SELECT [FirstName]
      ,[LastName]
  FROM [dbo].[Presidents]
  where ([PartyAffiliation] = @PartyAffiliation)
  OR
  (@PartyAffiliation IS NULL and [PartyAffiliation] is NULL)


END

GO
