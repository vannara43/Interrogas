USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Pagination]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Pagination] 
 @Index int = 0
 ,@PageSize int = 5


as

/*


select Id from dbo.Users

Execute dbo.Users_Pagination

*/


BEGIN --Begin---------------


Declare @offset int = @Index * @PageSize

SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[AvatarUrl]
      ,[TenantId]
      ,[Password]
      ,[PasswordConfirm]
      ,[DateCreated]
      ,[DateModified]
--,TotalCount = COUNT(1) OVER() -- this the quick way of doing the count. (see below)
  FROM [dbo].[Users]
ORDER BY Id

OFFSET @offSet Rows
Fetch Next @pageSize Rows ONLY
 END
GO
