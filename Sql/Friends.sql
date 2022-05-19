USE [C114_vannarathong_gmail]
GO

/****** Object:  Table [dbo].[Friends]    Script Date: 5/19/2022 4:45:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bio] [nvarchar](50) NULL,
	[Summary] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Headline] [nvarchar](50) NULL,
	[Slug] [nvarchar](50) NULL,
	[PrimaryImageId] [int] NULL,
	[StatusId] [int] NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](128) NULL,
 CONSTRAINT [PK_Friends Tables] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_PrimaryImageId]  DEFAULT ((0)) FOR [PrimaryImageId]
GO

ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_StatusId]  DEFAULT ((0)) FOR [StatusId]
GO

ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends Tables_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO

ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends Tables_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO

ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Images1] FOREIGN KEY([PrimaryImageId])
REFERENCES [dbo].[Images] ([Id])
GO

ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Images1]
GO

