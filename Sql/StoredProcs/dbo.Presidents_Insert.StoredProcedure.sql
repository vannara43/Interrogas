USE [C114_vannarathong_gmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_Insert]    Script Date: 5/19/2022 5:04:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Presidents_Insert]
@FirstName nvarchar(50)
,@LastName nvarchar(50)
,@InaugurationDate nvarchar(50)
,@FirstYearInOffice nvarchar(50)
,@LastYearInOffice nvarchar(50)
,@PartyAffiliation nvarchar(50)
,@Id int OUTPUT

as

/* ----Code Test-----

Declare @Id int = 10

Declare @FirstName nvarchar(50) = 'Test1'
,@LastName nvarchar(50) = 'Test1'
,@InaugurationDate nvarchar(50) = 'Test1'
,@FirstYearInOffice nvarchar(50) = 'Test1'
,@LastYearInOffice nvarchar(50) = 'Test1'
,@PartyAffiliation nvarchar(50) = 'Democrats'

Execute dbo.Presidents_Insert @FirstName 
,@LastName 
,@InaugurationDate 
,@FirstYearInOffice 
,@LastYearInOffice 
,@PartyAffiliation 
,@Id OUTPUT

Select @Id

select * from dbo.Presidents
where Id = @Id


*/

BEGIN

INSERT INTO [dbo].[Presidents]
           ([FirstName]
           ,[LastName]
           ,[InaugurationDate]
           ,[FirstYearInOffice]
           ,[LastYearInOffice]
           ,[PartyAffiliation])
     VALUES
           (@FirstName
           ,@LastName
           ,@InaugurationDate
           ,@FirstYearInOffice
           ,@LastYearInOffice
           ,@PartyAffiliation)

		   Set @Id = SCOPE_IDENTITY();



END


/*
[Id]
[FirstName]
[LastName]
[InaugurationDate]
[FirstYearInOffice]
[LastYearInOffice]
[PartyAffiliation]
[DateAdded]
[DateModified]


@Id 
,@FirstName 
,@LastName 
,@InaugurationDate 
,@FirstYearInOffice 
,@LastYearInOffice 
,@PartyAffiliation 
,@DateAdded 
,@DateModified 
  */






GO
