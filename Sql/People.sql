USE [C114_vannarathong_gmail]
GO

/****** Object:  Table [dbo].[People]    Script Date: 5/19/2022 4:46:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[isSmoker] [bit] NULL,
	[DateAdded] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_People_Age]  DEFAULT ((0)) FOR [Age]
GO

ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_dbo.People_DateAdded]  DEFAULT (getutcdate()) FOR [DateAdded]
GO

ALTER TABLE [dbo].[People] ADD  CONSTRAINT [DF_dbo.People_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO

