USE [Interrogas]
GO
/****** Object:  StoredProcedure [dbo].[NewsletterSubscriptions_SelectByRoleId]    Script Date: 5/19/2022 5:16:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Vannara Thong>
-- Create date: <4/5/2022>
-- Description:	<Insert for NewsletterSubscriptions table>
-- Code Reviewer: Rebecca Skeens


-- MODIFIED BY: Vannara Thong 
-- MODIFIED DATE:04/05/2022
-- Code Reviewer: Rebecca Skeens
-- Note: Working as it should and fixed name spacing
-- =============================================

CREATE proc [dbo].[NewsletterSubscriptions_SelectByRoleId]
@roleId int
,@pageIndex int
,@pageSize int
as

/* -------Code Test---------

DECLARE @roleId int = 1
,@pageIndex int = 0
,@pageSize int = 3

EXECUTE dbo.NewsletterSubscriptions_SelectByRoleId
@roleId
,@pageIndex
,@pageSize

SELECT 
  ns.Email, 
  ns.IsSubscribed,
  u.Id,
  u.FirstName,
  u.LastName,
  u.AvatarUrl,
  u.Password,
  u.IsConfirmed,
  u.StatusTypeId,
  ur.UserId,
  ur.RoleId,
  ns.DateCreated, 
  ns.DateModified,
  TotalCount = COUNT(1) OVER() 
From dbo.NewsletterSubscriptions as ns
  INNER JOIN dbo.Users as u
  on u.Email = ns.Email
  INNER JOIN dbo.UserRoles as ur
  on u.Id = ur.UserId

WHERE ur.RoleId = @RoleId AND u.IsConfirmed = ns.IsSubscribed
ORDER BY RoleId

*/

BEGIN 
DECLARE @offset int = @pageIndex
SELECT 
  ns.Email, 
  ns.IsSubscribed,
  u.Id,
  u.FirstName,
  u.LastName,
  u.AvatarUrl,
  u.Password,
  u.IsConfirmed,
  u.StatusTypeId,
  ur.UserId,
  ur.RoleId,
  ns.DateCreated, 
  ns.DateModified,
  TotalCount = COUNT(1) OVER() 
From dbo.NewsletterSubscriptions as ns
  INNER JOIN dbo.Users as u
  on u.Email = ns.Email
  INNER JOIN dbo.UserRoles as ur
  on u.Id = ur.UserId

WHERE ur.RoleId = @roleId AND u.IsConfirmed = ns.IsSubscribed
ORDER BY RoleId

OFFSET @pageIndex ROW
	FETCH NEXT @PageSize ROWS ONLY
END


GO
