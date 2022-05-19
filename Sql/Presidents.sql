USE [C114_vannarathong_gmail]
GO

/****** Object:  Table [dbo].[Presidents]    Script Date: 5/19/2022 4:46:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Presidents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[InaugurationDate] [nvarchar](50) NULL,
	[FirstYearInOffice] [nvarchar](50) NULL,
	[LastYearInOffice] [nvarchar](50) NULL,
	[PartyAffiliation] [nvarchar](50) NULL,
	[DateAdded] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Presidents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Presidents] ADD  CONSTRAINT [DF_Presidents_DateAdded]  DEFAULT (getutcdate()) FOR [DateAdded]
GO

ALTER TABLE [dbo].[Presidents] ADD  CONSTRAINT [DF_Presidents_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO

