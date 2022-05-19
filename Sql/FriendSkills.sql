USE [C114_vannarathong_gmail]
GO

/****** Object:  Table [dbo].[FriendSkills]    Script Date: 5/19/2022 4:40:14 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FriendSkills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FriendId] [int] NULL,
	[SkillId] [int] NULL,
 CONSTRAINT [PK_FriendSkills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FriendSkills]  WITH CHECK ADD  CONSTRAINT [FK_FriendSkills_Friends] FOREIGN KEY([FriendId])
REFERENCES [dbo].[Friends] ([Id])
GO

ALTER TABLE [dbo].[FriendSkills] CHECK CONSTRAINT [FK_FriendSkills_Friends]
GO

ALTER TABLE [dbo].[FriendSkills]  WITH CHECK ADD  CONSTRAINT [FK_FriendSkills_Skills1] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
GO

ALTER TABLE [dbo].[FriendSkills] CHECK CONSTRAINT [FK_FriendSkills_Skills1]
GO


