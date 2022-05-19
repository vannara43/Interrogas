USE [C114_vannarathong_gmail]
GO

/****** Object:  Table [dbo].[SeasonTerms]    Script Date: 5/19/2022 4:44:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SeasonTerms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Season] [nvarchar](50) NULL,
 CONSTRAINT [PK_SeasonTerms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

