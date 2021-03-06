USE [master]
GO
/****** Object:  Database [BIBLIOTECA]    Script Date: 7/25/2021 9:46:06 PM ******/
CREATE DATABASE [BIBLIOTECA]
GO
ALTER DATABASE [BIBLIOTECA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BIBLIOTECA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BIBLIOTECA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BIBLIOTECA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BIBLIOTECA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BIBLIOTECA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BIBLIOTECA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BIBLIOTECA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BIBLIOTECA] SET  MULTI_USER 
GO
ALTER DATABASE [BIBLIOTECA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BIBLIOTECA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BIBLIOTECA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BIBLIOTECA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BIBLIOTECA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BIBLIOTECA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BIBLIOTECA] SET QUERY_STORE = OFF
GO
USE [BIBLIOTECA]
GO
/****** Object:  Table [dbo].[Administradores]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administradores](
	[ID_ADMIN] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME_ADMIN] [varchar](40) NULL,
	[PASSWORD_ADMIN] [varchar](40) NULL,
	[ID_TIPO] [int] NULL,
 CONSTRAINT [PK__Administ__4BE949DF7DE02CE3] PRIMARY KEY CLUSTERED 
(
	[ID_ADMIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[ID_AUTOR] [int] NOT NULL,
	[NOMBRES_AUTOR] [varchar](30) NULL,
	[APELLIDOS_AUTOR] [varchar](30) NULL,
	[NACIONALIDAD_AUTOR] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID_CATEGORIA] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_CATEGORIA] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CATEGORIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[ID_EDITORIAL] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_EDITORIAL] [varchar](25) NULL,
	[PAIS_LUGAR] [varchar](25) NULL,
 CONSTRAINT [PK__Editoria__EA05B1D74E3458E6] PRIMARY KEY CLUSTERED 
(
	[ID_EDITORIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[ID_LIBRO] [varchar](50) NOT NULL,
	[TITULO_DEL_LIBRO] [varchar](40) NULL,
	[EDICION_DEL_LIBRO] [varchar](10) NULL,
	[NUMERO_DE_PAGINAS] [int] NULL,
	[ID_EDITORIAL] [int] NOT NULL,
	[ID_CATEGORIA] [int] NOT NULL,
	[ID_AUTOR] [int] NOT NULL,
 CONSTRAINT [PK__Libros__1] PRIMARY KEY CLUSTERED 
(
	[ID_LIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[ID_PRESTAMO] [int] IDENTITY(1,1) NOT NULL,
	[DNI_USUARIO] [varchar](14) NOT NULL,
	[FECHA_PRESTAMO] [date] NULL,
	[FECHA_DEVOLUCION] [date] NULL,
	[ID_LIBRO] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Prestamo__3D5A1E6CE606D679] PRIMARY KEY CLUSTERED 
(
	[ID_PRESTAMO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Usuario]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_de_Usuario](
	[ID_TIPO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_TIPO] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_TIPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Lector]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Lector](
	[DNI_USUARIO] [varchar](14) NOT NULL,
	[NOMBRE] [varchar](50) NULL,
	[TELEFONO] [int] NULL,
	[DIRECCION] [varchar](30) NULL,
	[FECHA_NACIMIENTO] [date] NULL,
 CONSTRAINT [PK__Usuario___91136B9021225B34] PRIMARY KEY CLUSTERED 
(
	[DNI_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 7/25/2021 9:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[USERNAME_USUARIO] [varchar](40) NULL,
	[PASSWORD_USUARIO] [varchar](40) NULL,
	[ID_TIPO] [int] NOT NULL,
 CONSTRAINT [PK__Usuarios__91136B906805910C] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administradores] ON 

INSERT [dbo].[Administradores] ([ID_ADMIN], [USERNAME_ADMIN], [PASSWORD_ADMIN], [ID_TIPO]) VALUES (5, N'andrea2002', N'123456', 1)
INSERT [dbo].[Administradores] ([ID_ADMIN], [USERNAME_ADMIN], [PASSWORD_ADMIN], [ID_TIPO]) VALUES (6, N'carlopineda2001', N'abc123def', 1)
SET IDENTITY_INSERT [dbo].[Administradores] OFF
GO
INSERT [dbo].[Autores] ([ID_AUTOR], [NOMBRES_AUTOR], [APELLIDOS_AUTOR], [NACIONALIDAD_AUTOR]) VALUES (110, N'Sarah Janet', N'Maas', N'Estadounidense')
INSERT [dbo].[Autores] ([ID_AUTOR], [NOMBRES_AUTOR], [APELLIDOS_AUTOR], [NACIONALIDAD_AUTOR]) VALUES (122, N'Lucila', N'Gamero', N'Hondureña')
INSERT [dbo].[Autores] ([ID_AUTOR], [NOMBRES_AUTOR], [APELLIDOS_AUTOR], [NACIONALIDAD_AUTOR]) VALUES (220, N'Oscar Fingal', N'Wills Wilde', N'Irlandés')
INSERT [dbo].[Autores] ([ID_AUTOR], [NOMBRES_AUTOR], [APELLIDOS_AUTOR], [NACIONALIDAD_AUTOR]) VALUES (315, N'Paulo', N'Coelho', N'Brasileño')
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([ID_CATEGORIA], [NOMBRE_CATEGORIA]) VALUES (4, N'Misterio')
INSERT [dbo].[Categoria] ([ID_CATEGORIA], [NOMBRE_CATEGORIA]) VALUES (5, N'Romance')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([ID_EDITORIAL], [NOMBRE_EDITORIAL], [PAIS_LUGAR]) VALUES (2, N'Ampersand', N'Argentina')
INSERT [dbo].[Editorial] ([ID_EDITORIAL], [NOMBRE_EDITORIAL], [PAIS_LUGAR]) VALUES (3, N'Alba', N'España')
INSERT [dbo].[Editorial] ([ID_EDITORIAL], [NOMBRE_EDITORIAL], [PAIS_LUGAR]) VALUES (4, N'Guaymura', N'Honduras')
INSERT [dbo].[Editorial] ([ID_EDITORIAL], [NOMBRE_EDITORIAL], [PAIS_LUGAR]) VALUES (5, N'Sol', N'Mexico')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
GO
INSERT [dbo].[Libros] ([ID_LIBRO], [TITULO_DEL_LIBRO], [EDICION_DEL_LIBRO], [NUMERO_DE_PAGINAS], [ID_EDITORIAL], [ID_CATEGORIA], [ID_AUTOR]) VALUES (N'1', N'El retrato de Dorian Gray', N'2da', 277, 2, 4, 102)
INSERT [dbo].[Libros] ([ID_LIBRO], [TITULO_DEL_LIBRO], [EDICION_DEL_LIBRO], [NUMERO_DE_PAGINAS], [ID_EDITORIAL], [ID_CATEGORIA], [ID_AUTOR]) VALUES (N'2', N'Blanca Olmedo', N'1era', 368, 4, 5, 122)
INSERT [dbo].[Libros] ([ID_LIBRO], [TITULO_DEL_LIBRO], [EDICION_DEL_LIBRO], [NUMERO_DE_PAGINAS], [ID_EDITORIAL], [ID_CATEGORIA], [ID_AUTOR]) VALUES (N'3', N'El fantasma de Canterville', N'2da', 128, 2, 4, 220)
GO
SET IDENTITY_INSERT [dbo].[Prestamo] ON 

INSERT [dbo].[Prestamo] ([ID_PRESTAMO], [DNI_USUARIO], [FECHA_PRESTAMO], [FECHA_DEVOLUCION], [ID_LIBRO]) VALUES (3, N'1416200100102', CAST(N'2021-07-11' AS Date), NULL, N'1')
INSERT [dbo].[Prestamo] ([ID_PRESTAMO], [DNI_USUARIO], [FECHA_PRESTAMO], [FECHA_DEVOLUCION], [ID_LIBRO]) VALUES (5, N'0801200210874', CAST(N'2021-07-20' AS Date), CAST(N'2021-07-22' AS Date), N'2')
INSERT [dbo].[Prestamo] ([ID_PRESTAMO], [DNI_USUARIO], [FECHA_PRESTAMO], [FECHA_DEVOLUCION], [ID_LIBRO]) VALUES (7, N'0801200210874', CAST(N'2021-07-05' AS Date), CAST(N'2021-07-13' AS Date), N'2')
SET IDENTITY_INSERT [dbo].[Prestamo] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_de_Usuario] ON 

INSERT [dbo].[Tipo_de_Usuario] ([ID_TIPO], [NOMBRE_TIPO]) VALUES (1, N'Administrador')
INSERT [dbo].[Tipo_de_Usuario] ([ID_TIPO], [NOMBRE_TIPO]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[Tipo_de_Usuario] OFF
GO
INSERT [dbo].[Usuario_Lector] ([DNI_USUARIO], [NOMBRE], [TELEFONO], [DIRECCION], [FECHA_NACIMIENTO]) VALUES (N'0801200210874', N'Andrea Valdez', 98764633, N'Tegucigalpa', CAST(N'1900-06-09' AS Date))
INSERT [dbo].[Usuario_Lector] ([DNI_USUARIO], [NOMBRE], [TELEFONO], [DIRECCION], [FECHA_NACIMIENTO]) VALUES (N'1416200100102', N'Carlos Pineda', 98123123, N'Ocotepeque', CAST(N'2001-06-05' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([ID_USUARIO], [USERNAME_USUARIO], [PASSWORD_USUARIO], [ID_TIPO]) VALUES (1, N'mariafernanda', N'123unicah123', 2)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  Index [IX_Autores]    Script Date: 7/25/2021 9:46:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Autores] ON [dbo].[Autores]
(
	[ID_AUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Libros]    Script Date: 7/25/2021 9:46:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_Libros] ON [dbo].[Libros]
(
	[ID_AUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administradores]  WITH CHECK ADD  CONSTRAINT [FK_Administradores_Tipo_de_Usuario] FOREIGN KEY([ID_TIPO])
REFERENCES [dbo].[Tipo_de_Usuario] ([ID_TIPO])
GO
ALTER TABLE [dbo].[Administradores] CHECK CONSTRAINT [FK_Administradores_Tipo_de_Usuario]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [fk_Categoria] FOREIGN KEY([ID_CATEGORIA])
REFERENCES [dbo].[Categoria] ([ID_CATEGORIA])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [fk_Categoria]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [fk_Editorial] FOREIGN KEY([ID_EDITORIAL])
REFERENCES [dbo].[Editorial] ([ID_EDITORIAL])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [fk_Editorial]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Libros] FOREIGN KEY([ID_LIBRO])
REFERENCES [dbo].[Libros] ([ID_LIBRO])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Libros]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [fk_ID_LIBRO] FOREIGN KEY([ID_LIBRO])
REFERENCES [dbo].[Libros] ([ID_LIBRO])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [fk_ID_LIBRO]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_Usuario_Lector] FOREIGN KEY([DNI_USUARIO])
REFERENCES [dbo].[Usuario_Lector] ([DNI_USUARIO])
GO
ALTER TABLE [dbo].[Prestamo] CHECK CONSTRAINT [FK_Prestamo_Usuario_Lector]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_de_Usuario] FOREIGN KEY([ID_TIPO])
REFERENCES [dbo].[Tipo_de_Usuario] ([ID_TIPO])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_de_Usuario]
GO
USE [master]
GO
ALTER DATABASE [BIBLIOTECA] SET  READ_WRITE 
GO
