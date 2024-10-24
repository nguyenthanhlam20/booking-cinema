USE master
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name='CinemaDB') --EXISTS (nếu có rồi thì)
DROP DATABASE CinemaDB
GO
CREATE DATABASE CinemaDB
GO
USE CinemaDB
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReleaseDate] [date] NULL,
	[Duration] [int] NULL,
	[Genre] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[img] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[UserId] [int] NULL,
	[RatingValue] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[RatingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatBookings]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatBookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[ShowtimeId] [int] NULL,
	[SeatId] [int] NULL,
	[UserId] [int] NULL,
	[BookingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[SeatId] [int] IDENTITY(1,1) NOT NULL,
	[TheaterId] [int] NULL,
	[nRow] [nvarchar](5) NULL,
	[nColumn] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[IsBooked] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showtimes]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showtimes](
	[ShowtimeId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[TheaterId] [int] NULL,
	[ShowDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShowtimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theaters]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theaters](
	[TheaterId] [int] IDENTITY(1,1) NOT NULL,
	[TheaterName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TheaterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/23/2024 11:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Role] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Duration], [Genre], [Age], [img]) VALUES (1, N'Kungfu Panda', N'Po và đồng đội của mình tiếp tục phiêu lưu trên con đường trở thành những chiến binh kung fu hàng đầu, đối mặt với các thách thức mới và phải đối đầu với kẻ thù mạnh mẽ.', CAST(N'2024-10-23' AS Date), 90, N'Animation, Action, Adventure', 6, N'https://www.dreamworks.com/storage/cms-uploads/kung-fu-panda-4-he-poster.jpg')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Duration], [Genre], [Age], [img]) VALUES (2, N'Mai', N'Mai là một câu chuyện tình yêu về sự hy sinh, cống hiến và lòng trung thành của một người phụ nữ với gia đình và người thân.', CAST(N'2024-12-20' AS Date), 120, N'Drama, Romance', 16, N'https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2024/2/7/poster-tet-phim-mai-17073235206831334429347.jpg')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Duration], [Genre], [Age], [img]) VALUES (3, N'Dune 2', N'Tiếp tục cuộc phiêu lưu của Paul Atreides trên hành tinh Arrakis, nơi anh phải đối mặt với sự phản đối và những cuộc xung đột mới giữa các gia tộc.', CAST(N'2026-09-15' AS Date), 150, N'Adventure, Drama, Sci-Fi', 14, N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/p/o/poster_dune_2_bb_3_no_qr_1_.jpg')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Duration], [Genre], [Age], [img]) VALUES (6, N'Atlas', N'Atlas is a 2024 American science fiction action film starring Jennifer Lopez as a skilled counterterrorism analyst, who harbors a profound skepticism towards artificial intelligence, and who comes to realize that it may be her sole recourse following the failure of a mission aimed at apprehending a rogue robot.', CAST(N'2024-11-28' AS Date), 120, N'Action', 18, N'https://movie-reviews.com.au/sites/default/files/ReviewImages/atlas.jpg')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Duration], [Genre], [Age], [img]) VALUES (7, N'Godzilla x Kong', N'Godzilla x Kong: Đế chế mới là một bộ phim điện ảnh Mỹ thuộc thể loại quái vật ra mắt năm 2024 được đạo diễn bởi Adam Wingard. Phim do hãng Legendary Pictures và Warner Bros.', CAST(N'2024-10-23' AS Date), 120, N'Action', 18, N'https://upload.wikimedia.org/wikipedia/vi/4/41/Godzilla_x_Kong%2C_%C4%91%E1%BA%BF_ch%E1%BA%BF_m%E1%BB%9Bi.jpg')
INSERT [dbo].[Movies] ([MovieId], [Title], [Description], [ReleaseDate], [Duration], [Genre], [Age], [img]) VALUES (8, N'Rebel Moon – Part Two: The Scargiver', N'Rebel Moon – Part Two: The Scargiver is a 2024 American epic space opera film directed by Zack Snyder from a screenplay he co-wrote with Kurt Johnstad and Shay Hatten.', CAST(N'2024-10-23' AS Date), 160, N'Action', 18, N'https://m.media-amazon.com/images/M/MV5BOGYzMDQ1ZWItNjMyYi00ZjM4LWE5YTctYTJhNTYxZDI4OTU0XkEyXkFqcGc@._V1_.jpg')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [MovieId], [UserId], [RatingValue], [Comment], [RatingDate]) VALUES (1, 1, 2, 5, N'Great movie!', CAST(N'2024-03-14T10:00:00.000' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [MovieId], [UserId], [RatingValue], [Comment], [RatingDate]) VALUES (2, 2, 3, 4, N'Classic!', CAST(N'2024-03-14T11:00:00.000' AS DateTime))
INSERT [dbo].[Rating] ([RatingId], [MovieId], [UserId], [RatingValue], [Comment], [RatingDate]) VALUES (3, 3, 1, 5, N'Best superhero movie!', CAST(N'2024-03-14T12:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[SeatBookings] ON 

INSERT [dbo].[SeatBookings] ([BookingId], [ShowtimeId], [SeatId], [UserId], [BookingDate]) VALUES (25, 1, 14, 4, CAST(N'2024-03-19T00:43:24.150' AS DateTime))
SET IDENTITY_INSERT [dbo].[SeatBookings] OFF
GO
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (2, 1, N'A', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (3, 1, N'A', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (4, 1, N'A', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (5, 1, N'A', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (6, 1, N'A', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (7, 1, N'A', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (8, 1, N'A', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (9, 1, N'A', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (10, 1, N'A', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (11, 1, N'A', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (12, 1, N'A', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (13, 1, N'A', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (14, 1, N'A', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (15, 1, N'A', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (16, 1, N'A', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (17, 1, N'A', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (18, 1, N'A', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (19, 1, N'B', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (20, 1, N'B', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (21, 1, N'B', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (22, 1, N'B', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (23, 1, N'B', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (24, 1, N'B', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (25, 1, N'B', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (26, 1, N'B', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (27, 1, N'B', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (28, 1, N'B', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (29, 1, N'B', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (30, 1, N'B', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (31, 1, N'B', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (32, 1, N'B', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (33, 1, N'B', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (34, 1, N'B', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (35, 1, N'B', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (36, 1, N'B', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (37, 1, N'C', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (38, 1, N'C', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (39, 1, N'C', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (40, 1, N'C', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (41, 1, N'C', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (42, 1, N'C', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (43, 1, N'C', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (44, 1, N'C', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (45, 1, N'C', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (46, 1, N'C', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (47, 1, N'C', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (48, 1, N'C', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (49, 1, N'C', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (50, 1, N'C', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (51, 1, N'C', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (52, 1, N'C', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (53, 1, N'C', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (54, 1, N'C', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (55, 1, N'D', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (56, 1, N'D', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (57, 1, N'D', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (58, 1, N'D', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (59, 1, N'D', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (60, 1, N'D', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (61, 1, N'D', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (62, 1, N'D', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (63, 1, N'D', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (64, 1, N'D', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (65, 1, N'D', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (66, 1, N'D', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (67, 1, N'D', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (68, 1, N'D', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (69, 1, N'D', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (70, 1, N'D', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (71, 1, N'D', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (72, 1, N'D', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (73, 1, N'E', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (74, 1, N'E', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (75, 1, N'E', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (76, 1, N'E', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (77, 1, N'E', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (78, 1, N'E', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (79, 1, N'E', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (80, 1, N'E', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (81, 1, N'E', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (82, 1, N'E', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (83, 1, N'E', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (84, 1, N'E', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (85, 1, N'E', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (86, 1, N'E', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (87, 1, N'E', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (88, 1, N'E', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (89, 1, N'E', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (90, 1, N'E', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (91, 1, N'F', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (92, 1, N'F', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (93, 1, N'F', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (94, 1, N'F', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (95, 1, N'F', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (96, 1, N'F', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (97, 1, N'F', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (98, 1, N'F', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (99, 1, N'F', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (100, 1, N'F', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (101, 1, N'F', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (102, 1, N'F', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (103, 1, N'F', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (104, 1, N'F', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (105, 1, N'F', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (106, 1, N'F', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (107, 1, N'F', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (108, 1, N'F', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (109, 1, N'G', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (110, 1, N'G', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (111, 1, N'G', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (112, 1, N'G', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (113, 1, N'G', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (114, 1, N'G', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (115, 1, N'G', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (116, 1, N'G', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (117, 1, N'G', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (118, 1, N'G', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (119, 1, N'G', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (120, 1, N'G', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (121, 1, N'G', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (122, 1, N'G', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (123, 1, N'G', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (124, 1, N'G', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (125, 1, N'G', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (126, 1, N'G', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (127, 1, N'H', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (128, 1, N'H', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (129, 1, N'H', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (130, 1, N'H', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (131, 1, N'H', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (132, 1, N'H', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (133, 1, N'H', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (134, 1, N'H', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (135, 1, N'H', 9, CAST(50000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (136, 1, N'H', 10, CAST(50000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (137, 1, N'H', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (138, 1, N'H', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (139, 1, N'H', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (140, 1, N'H', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (141, 1, N'H', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (142, 1, N'H', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (143, 1, N'H', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (144, 1, N'H', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (145, 1, N'I', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (146, 1, N'I', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (147, 1, N'I', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (148, 1, N'I', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (149, 1, N'I', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (150, 1, N'I', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (151, 1, N'I', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (152, 1, N'I', 8, CAST(50000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (153, 1, N'I', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (154, 1, N'I', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (155, 1, N'I', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (156, 1, N'I', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (157, 1, N'I', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (158, 1, N'I', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (159, 1, N'I', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (160, 1, N'I', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (161, 1, N'I', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (162, 1, N'I', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (163, 1, N'J', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (164, 1, N'J', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (165, 1, N'J', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (166, 1, N'J', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (167, 1, N'J', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (168, 1, N'J', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (169, 1, N'J', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (170, 1, N'J', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (171, 1, N'J', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (172, 1, N'J', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (173, 1, N'J', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (174, 1, N'J', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (175, 1, N'J', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (176, 1, N'J', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (177, 1, N'J', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (178, 1, N'J', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (179, 1, N'J', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (180, 1, N'J', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (181, 1, N'K', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (182, 1, N'K', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (183, 1, N'K', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (184, 1, N'K', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (185, 1, N'K', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (186, 1, N'K', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (187, 1, N'K', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (188, 1, N'K', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (189, 1, N'K', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (190, 1, N'K', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (191, 1, N'K', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (192, 1, N'K', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (193, 1, N'K', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (194, 1, N'K', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (195, 1, N'K', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (196, 1, N'K', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (197, 1, N'K', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (198, 1, N'K', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (199, 1, N'L', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (200, 1, N'L', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (201, 1, N'L', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (202, 1, N'L', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (203, 1, N'L', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (204, 1, N'L', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (205, 1, N'L', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (206, 1, N'L', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (207, 1, N'L', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (208, 1, N'L', 10, CAST(50000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (209, 1, N'L', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (210, 1, N'L', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (211, 1, N'L', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (212, 1, N'L', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (213, 1, N'L', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (214, 1, N'L', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (215, 1, N'L', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (216, 1, N'L', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (217, 1, N'M', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (218, 1, N'M', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (219, 1, N'M', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (220, 1, N'M', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (221, 1, N'M', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (222, 1, N'M', 6, CAST(50000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (223, 1, N'M', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (224, 1, N'M', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (225, 1, N'M', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (226, 1, N'M', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (227, 1, N'M', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (228, 1, N'M', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (229, 1, N'M', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (230, 1, N'M', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (231, 1, N'M', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (232, 1, N'M', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (233, 1, N'M', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (234, 1, N'M', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (235, 1, N'N', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (236, 1, N'N', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (237, 1, N'N', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (238, 1, N'N', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (239, 1, N'N', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (240, 1, N'N', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (241, 1, N'N', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (242, 1, N'N', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (243, 1, N'N', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (244, 1, N'N', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (245, 1, N'N', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (246, 1, N'N', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (247, 1, N'N', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (248, 1, N'N', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (249, 1, N'N', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (250, 1, N'N', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (251, 1, N'N', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (252, 1, N'N', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (253, 1, N'O', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (254, 1, N'O', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (255, 1, N'O', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (256, 1, N'O', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (257, 1, N'O', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (258, 1, N'O', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (259, 1, N'O', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (260, 1, N'O', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (261, 1, N'O', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (262, 1, N'O', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (263, 1, N'O', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (264, 1, N'O', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (265, 1, N'O', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (266, 1, N'O', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (267, 1, N'O', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (268, 1, N'O', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (269, 1, N'O', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (270, 1, N'O', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (271, 1, N'P', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (272, 1, N'P', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (273, 1, N'P', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (274, 1, N'P', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (275, 1, N'P', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (276, 1, N'P', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (277, 1, N'P', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (278, 1, N'P', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (279, 1, N'P', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (280, 1, N'P', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (281, 1, N'P', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (282, 1, N'P', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (283, 1, N'P', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (284, 1, N'P', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (285, 1, N'P', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (286, 1, N'P', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (287, 1, N'P', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (288, 1, N'P', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (289, 1, N'Q', 1, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (290, 1, N'Q', 2, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (291, 1, N'Q', 3, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (292, 1, N'Q', 4, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (293, 1, N'Q', 5, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (294, 1, N'Q', 6, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (295, 1, N'Q', 7, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (296, 1, N'Q', 8, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (297, 1, N'Q', 9, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (298, 1, N'Q', 10, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (299, 1, N'Q', 11, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (300, 1, N'Q', 12, CAST(50000.00 AS Decimal(10, 2)), 0)
GO
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (301, 1, N'Q', 13, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (302, 1, N'Q', 14, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (303, 1, N'Q', 15, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (304, 1, N'Q', 16, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (305, 1, N'Q', 17, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (306, 1, N'Q', 18, CAST(50000.00 AS Decimal(10, 2)), 0)
INSERT [dbo].[Seats] ([SeatId], [TheaterId], [nRow], [nColumn], [Price], [IsBooked]) VALUES (307, 3, N'32', 3, CAST(3232.00 AS Decimal(10, 2)), 0)
SET IDENTITY_INSERT [dbo].[Seats] OFF
GO
SET IDENTITY_INSERT [dbo].[Showtimes] ON 

INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [TheaterId], [ShowDateTime]) VALUES (1, 1, 1, CAST(N'2024-03-15T19:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [TheaterId], [ShowDateTime]) VALUES (2, 2, 2, CAST(N'2024-03-15T20:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [TheaterId], [ShowDateTime]) VALUES (3, 3, 3, CAST(N'2024-03-16T21:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([ShowtimeId], [MovieId], [TheaterId], [ShowDateTime]) VALUES (4, 1, 1, CAST(N'2024-10-19T22:38:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Showtimes] OFF
GO
SET IDENTITY_INSERT [dbo].[Theaters] ON 

INSERT [dbo].[Theaters] ([TheaterId], [TheaterName]) VALUES (1, N'Theater A')
INSERT [dbo].[Theaters] ([TheaterId], [TheaterName]) VALUES (2, N'Theater B')
INSERT [dbo].[Theaters] ([TheaterId], [TheaterName]) VALUES (3, N'Theater C')
SET IDENTITY_INSERT [dbo].[Theaters] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [FullName], [Role]) VALUES (1, N'admin', N'123456', N'admin@gmail.com', N'Admin User', N'Admin')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [FullName], [Role]) VALUES (2, N'triều', N'123456', N'caotrieu@gmail.com', N'Triều(Khách)', N'Customer')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [FullName], [Role]) VALUES (3, N'yến', N'123456', N'yen@gmail.com', N'Hải Yến', N'khách')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [FullName], [Role]) VALUES (4, N'trí', N'123456', N'tri@gmail.com', N'Minh trí', N'khách')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [FullName], [Role]) VALUES (5, N'triều 3', N'123456', N'caotrieu0708@gmail.com', N'Cao Triều', N'Admin')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [Email], [FullName], [Role]) VALUES (6, N'trường', N'123456', N'truong@gmail.com', N'Nhật Trường', N'khách')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Seats] ADD  DEFAULT ((0)) FOR [IsBooked]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[SeatBookings]  WITH CHECK ADD FOREIGN KEY([SeatId])
REFERENCES [dbo].[Seats] ([SeatId])
GO
ALTER TABLE [dbo].[SeatBookings]  WITH CHECK ADD FOREIGN KEY([ShowtimeId])
REFERENCES [dbo].[Showtimes] ([ShowtimeId])
GO
ALTER TABLE [dbo].[SeatBookings]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD FOREIGN KEY([TheaterId])
REFERENCES [dbo].[Theaters] ([TheaterId])
GO
ALTER TABLE [dbo].[Showtimes]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[Showtimes]  WITH CHECK ADD FOREIGN KEY([TheaterId])
REFERENCES [dbo].[Theaters] ([TheaterId])
GO
