USE TravelBlog
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170802180209_Initial', N'1.0.0-rtm-21431')
SET IDENTITY_INSERT [dbo].[Experiences] ON 

INSERT [dbo].[Experiences] ([ExperienceId], [Title], [Drink], [Eat], [See], [LocationId], [Image]) VALUES (2, N'Son Doong Cave', N'water', N'mushroom', N'cave', 2, N'http://www.sondoongcave.org/images/hang-son-doong-cave-vietnam2.jpg')
INSERT [dbo].[Experiences] ([ExperienceId], [Title], [Drink], [Eat], [See], [LocationId], [Image]) VALUES (3, N'Shopping', N'sewage water', N'hot dog', N'concrete', 1, N'https://www.kimptonhotels.com/blog/wp-content/uploads/2010/12/timessquare3.jpe')
INSERT [dbo].[Experiences] ([ExperienceId], [Title], [Drink], [Eat], [See], [LocationId], [Image]) VALUES (4, N'Swim', N'more water', N'fish', N'water', 2, N'http://www.vietnamtravelclub.com/wp-content/uploads/2016/08/CaveInsideRaw3_edited.jpg')
INSERT [dbo].[Experiences] ([ExperienceId], [Title], [Drink], [Eat], [See], [LocationId], [Image]) VALUES (5, N'Comedy', N'cocktails', N'bar food', N'people', 1, N'http://blogs.pechanga.com/newsroom/wp-content/uploads/2013/12/Pechanga-Comedy-Club_stage_sm.jpg')
SET IDENTITY_INSERT [dbo].[Experiences] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [Name], [Region], [FlavorText], [Currency], [Language], [Population], [Image]) VALUES (1, N'New York', N'North America', N'This is the new York town in America called New York', N'USD', N'English', N'8.1 million', N'https://www.gentlegiant.com/wp-content/uploads/2015/06/New-York.jpg')
INSERT [dbo].[Locations] ([LocationId], [Name], [Region], [FlavorText], [Currency], [Language], [Population], [Image]) VALUES (2, N'Quang Binh', N'Asia', N'This is where the movie King Kong was shot', N'VND', N'VIetnamese', N'863,000', N'http://www.quangbinhtourism.vn/Portals/0/Ditichlichsu/quang_binh_quan_500_01.jpg')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([PersonId], [Bio], [Name], [LocationId]) VALUES (1, N'asd', N'sad', 1)
SET IDENTITY_INSERT [dbo].[People] OFF
/****** Object:  Index [IX_Experiences_LocationId]    Script Date: 8/2/2017 4:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Experiences_LocationId] ON [dbo].[Experiences]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_People_LocationId]    Script Date: 8/2/2017 4:26:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_People_LocationId] ON [dbo].[People]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Experiences]  WITH CHECK ADD  CONSTRAINT [FK_Experiences_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Experiences] CHECK CONSTRAINT [FK_Experiences_Locations_LocationId]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Locations_LocationId]
GO
USE [master]
GO
ALTER DATABASE [TravelBlog] SET  READ_WRITE 
GO
