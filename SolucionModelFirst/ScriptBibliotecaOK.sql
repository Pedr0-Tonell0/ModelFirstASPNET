USE [master]
GO
/****** Object:  Database [BibliotecaOK]    Script Date: 01/10/2020 19:32:34 ******/
CREATE DATABASE [BibliotecaOK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BibliotecaOK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BibliotecaOK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BibliotecaOK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BibliotecaOK_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BibliotecaOK] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BibliotecaOK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BibliotecaOK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BibliotecaOK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BibliotecaOK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BibliotecaOK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BibliotecaOK] SET ARITHABORT OFF 
GO
ALTER DATABASE [BibliotecaOK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BibliotecaOK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BibliotecaOK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BibliotecaOK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BibliotecaOK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BibliotecaOK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BibliotecaOK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BibliotecaOK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BibliotecaOK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BibliotecaOK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BibliotecaOK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BibliotecaOK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BibliotecaOK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BibliotecaOK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BibliotecaOK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BibliotecaOK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BibliotecaOK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BibliotecaOK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BibliotecaOK] SET  MULTI_USER 
GO
ALTER DATABASE [BibliotecaOK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BibliotecaOK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BibliotecaOK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BibliotecaOK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BibliotecaOK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BibliotecaOK] SET QUERY_STORE = OFF
GO
USE [BibliotecaOK]
GO
/****** Object:  UserDefinedTableType [dbo].[T_LibrosAutores]    Script Date: 01/10/2020 19:32:34 ******/
CREATE TYPE [dbo].[T_LibrosAutores] AS TABLE(
	[ISBN] [varchar](17) NOT NULL,
	[IDAutor] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TAutores]    Script Date: 01/10/2020 19:32:34 ******/
CREATE TYPE [dbo].[TAutores] AS TABLE(
	[IDAutor] [int] NOT NULL
)
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NULL,
	[IdPais] [int] NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paises]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paises](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Paises] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VistaAutores]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaAutores]
as

select a.ID as Codigo,
	a.Apellido,
	a.Nombre,
	a.FechaNacimiento,
	a.IdPais,
	p.Nombre as Pais
from autores as a
inner join paises as p on p.ID=a.IdPais
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[ISBN] [varchar](17) NOT NULL,
	[Titulo] [varchar](50) NULL,
	[Edicion] [int] NULL,
	[IdGenero] [int] NULL,
	[IdEditorial] [int] NULL,
	[Paginas] [int] NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosAutores]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosAutores](
	[ISBN] [varchar](17) NOT NULL,
	[IdAutor] [int] NOT NULL,
 CONSTRAINT [PK_LibrosAutores] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC,
	[IdAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogAutores]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogAutores](
	[Usuario] [varchar](50) NULL,
	[Fecha] [datetime] NULL,
	[ApellidoAnterior] [varchar](50) NULL,
	[ApellidoActual] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202009182255551_InitialCreate', N'WebCurso.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E3F40FF83A0A7F620B57239BBD813D85BA44ED2137473C13ABBA76F0B5AA21D61254A15A93441D15FD687FEA4F317CE50374BBC4894ADD84EB1C0C22287DF0C874372381CE67F7FFE35FEE1290CAC479C503F2213FB6874685B98B891E793E5C44ED9E2FB77F60FEFBFF9C7F8C20B9FACCF25DD09A78396844EEC07C6E253C7A1EE030E111D85BE9B44345AB0911B850EF222E7F8F0F0DFCED1918301C2062CCB1A7F4C09F3439C7DC0E734222E8E598A82EBC8C3012DCAA16696A15A3728C434462E9ED8FFC5F3699AD0689493DAD659E02310638683856D21422286180879FA89E2194B22B29CC5508082FBE71803DD02051417C29FAEC84DFB7178CCFBE1AC1A96506E4A5914F6043C3A2914E388CDD752AF5D290E5477012A66CFBCD799FA26F69587B3A28F51000A10199E4E8384134FECEB8AC5198D6F301B950D4739E4650270BF45C9D7511DF1C0326E775019D2F1E890FF3BB0A669C0D2044F084E59828203EB2E9D07BEFB337EBE8FBE623239399A2F4EDEBD798BBC93B7FFC2276FEA3D85BE025DA3008AEE9228C609C8861755FF6DCB69B673C48655B35A9B5C2B604B30276CEB1A3D7DC064C91E60B61CBFB3AD4BFF097B6549615C9F880F53081AB12485CF9B3408D03CC055BDD3CA93FFDFC2F5F8CDDB41B8DEA0477F990DBDC01F264E02F3EA230EB25AFAE0C7F9F46A8CF79782EC328942FEDDB4AFBCF6CB2C4A13977726D292DCA364895953BAB1B3325E2393E650C39B7589BAFFA6CD2595CD5B49CA3BB4CE4C28596C7B3694F2BE2C5F638B3B8B6318BCCCB4B846DA0C4ED8A94642D303AB245819CD91A9D110E8CCDF790DBC08911F0CB0081A7001E763E12721AE7AF963042687486F99EF10A5B00678FF41F4A14574F83980E833ECA60998E68CA1307E716E770F11C1376938E716BF3D5E830DCDFD6FD1257259945C10DE6A63BC0F91FB354AD905F1CE11C39F985B02F2CF7B3F340718449C33D7C5945E8231636F1A816F5D025E117672DC1B8EAF4EBB7642A601F243B51722ACA35F4AD29527A2A690BC110D99CA236913F543B4F48999A825A95ED49CA253D482ACAFA81CCC4CD282522F6846D029674E35988F978DD0F04E5E06BBFF5EDE669BB76E2DA8A971062B24FE09139CC032E6DD21C67042562360B26EECC259C8868F337DF1BD29E3F41905E9D0ACD69A0DD92230FC6CC860F77F36646242F1A3EF71AFC4E0E8531203BC11BDFA54D53DE704C9B63D1D1ADDDC36F3EDAC01BAE9724669E4FAD92C5004BD8A9045537EF0E1ACEEF845DE1B3106021D0343F7F9960725D0375B34AA5B728E03CCB075E6E641C129A22EF264354287BC1E82953BAA42B0552CA429DC3F259E60E938E18D103F045198A93E61F2B4F089EBC728E8D492D0D2700BE37DAF788835E738C68433ECD484097375E8830B50F11106A54B4363A76671ED86A8F15A7563DEE5C2AEC65D8A486CC5263B7C678D5D16FEDB8B1866BBC6B6609CED2A3111401BC6DB85811667155303100F2EFB66A0C2894963A0854BB515036D6A6C0706DA54C9AB33D0FC886A3AFEC27975DFCCB37950DEFEB6DEAAAE1DD866431F7B669AB9EF096D18B4C0896C9EE7735E899F98E270067216E7335AB8BAA28970F01966CD90CDCADF55FAA14E3B8868446D802B43EB002D2E0025206942F510AE8CE5B54A5778113D60CBB85B2B6CB1F60BB0351B90B1EB17A13542FD75A9689C46A78FAA67953548466E7458A8E1280C425CBC9A1D37508A2E2E2B2BC6C417EEE30DD73A560C468B823A3C578D92CACE0CAEA5D234BBB5A472C8FAB8641B6949709F345A2A3B33B8960A1BED5692C229E8E1166CA4A2E6163ED0642B231DD56E53D58D9D3C39AA28183B9A2CAAF1358A639F2C6B5955458935CB53AAA6DFCFFAA71B853986E35245D651256DC58945095A62A1165883A4977E42D93962688E789C67EA851299726FD52CFF25CBFAF6290F62B90F94D4FC77DE42BCB66F6CB4B22752005C42F742EECE643174C5E0AB9B5B3CC50D05285184EDA751908644EF5DE95BE79777F5F679898C307604F925EF495295E4E336F56E342AF28C1862842ACF65FD51D243E8745DFA9D756DEB7C513D4A199AAAA3E8C2553B1B359D0B633E52A26BD87FA03A115E664615F9287580A2A827462DA54102ABD599A336B34EEA98CD1A734421B5A40E2954F590B29E40D210B25EB1169E46A36A0A730E72CA481D5DAE354756248FD4A115D56B602B6416EBCC5115F925756045B539F62AD9445C41F778CFD21E58D6DBB4F203ED66BB9606E36596C36136BDDABD7D1DA856DC13ABB89997C08AF2BD3425EDA96E3D53CA83189B99920643BFE634AEBB9B4B4EEB1DBD1EB37187DD58D6DBEEF0F578FD0CF645CD423AD1892415F7EA64279CE0C6C569AAFBB18C74BCCA496CAB54236CE9CF94E170C40946B35F8369E063BE809704D788F80B4C599EB7611F1F1E1D0B4F6EF6E7F98B43A917284EA3BA3730CD31DB420A16794489FB80123921628327222B5029D67C453CFC34B17FCF5A9D66610BFE2B2B3EB0AEE827E2FF9A42C57D9262EB0F39C17398947983471A95A07FBC8AD70FE62ABFFAE54BDEF4C0BA4D603A9D5A8782A2D719FEE69B885ED2E44D379066ED9712AF77B6351E23285185D9B2FEDB83B9CF067977504AF96D889EBEEB2B9AF26DC146888AF70343E10DA242DDFB8075B0B46F033CF864D9DB807E9D55BF15584734ED3B019FF407135F09982F4365CB1DEE438AD3D23696A44CCF9D59D61BA55CEE7A6F9292B1379AE872C2750FB84193AA3773515E59B2F2605BA722177930EC5DDAFD8B2720EF4BCEF1CA69DF6DAAF136B38B5BEE91FE5649C57B9006A748EBD97DEAF0B66D4D17FEDDF3FCCB7E09C27B666CC536BFFB34E06D1B9B2E40BCE7C6D62BD977CF6C6D57FBE78E2DCD780BDD79EAAE9C85A4B9C6514591BB5273F3903B1CFFE7111841EE51E62F2AD5B9606D79AC1D0C57247AA6FA243491B1347124BE12453BDB7E7D2D36FCD6CE1634ED6C35A99B6DBC8BF5BF957741D3CE5B9310B98BA462654AA22AD1BB631D6BCB9A7A4D49C48D9E74E4AC77F9ACAD77F2AF29677810A534668FE676F9F5A4080FA29221A74E8F9460F9A218F6CEDADF5E84FD9BFACB1504FF4B8C04BB8D5DB3A2B9228BA8DCBC05894A122142738D19F2604B3D4B98BF402E836A1E80CE9E8467413D7E0D32C7DE15B94D599C32E8320EE74123E0C59D8036FE59DE7353E6F16DCCBFE8105D00317D1EB8BF253FA67EE055725F2A62421A08EE5D14E15E3E968C877D97CF15D24D440C810AF5554ED13D0EE300C0E82D99A147BC8E6C607E1FF012B9CFAB08A00EA47B209A6A1F9FFB6899A0901618ABF6F00936EC854FEFFF0F3FD6C93882540000, N'6.2.0-61023')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Administradores')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Usuarios')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3', N'UsuariosVip')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cf5cd31a-0b00-41db-9d82-688a13e1b2c5', N'1')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18fbd0c5-cb44-4f1a-b5fc-802cf2f36b78', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ead909fc-6f07-4325-aca7-0e401553c1a2', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'18fbd0c5-cb44-4f1a-b5fc-802cf2f36b78', N'3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'18fbd0c5-cb44-4f1a-b5fc-802cf2f36b78', N'usuario3@gmail.com', 0, N'AOiE3hF7ZaMAC3go/GkIhpthIczCmVqZ++NAt1YcHs+pUp3J9yVcfPv2uda91VuvlQ==', N'8fbf1690-6f54-415d-aa28-1b8aea43b568', NULL, 0, 0, NULL, 1, 0, N'usuario3@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cf5cd31a-0b00-41db-9d82-688a13e1b2c5', N'usuario1@gmail.com', 0, N'AJgYQVB7PiaGbfOqvx+3tyR3SNT7g3DUffh8kb8ar0VAfUkGPjWyaH3Dpc2WOUG2yA==', N'd2720165-7ee8-4ff5-b2ea-17afb97db8d0', NULL, 0, 0, NULL, 1, 0, N'usuario1@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ead909fc-6f07-4325-aca7-0e401553c1a2', N'usuario2@gmail.com', 0, N'ACy/X30qUzbRroGn1S441CdeWULoWVFA6c3rXSQChX/8S4kT+Z6IcO4WI5SHad+hNA==', N'a02c61a2-250a-4e36-a90b-2467f8965bd2', NULL, 0, 0, NULL, 1, 0, N'usuario2@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (1, N'Borges', N'Jorge Luis', CAST(N'1899-08-08' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2, N'Sabato', N'Ernesto', CAST(N'1920-10-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (3, N'Cortazar', N'Julio', CAST(N'1943-12-20' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (4, N'Garcia Marquez', N'Gabriel', CAST(N'1917-12-20' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5, N'Bioy Casares', N'Adolfo', CAST(N'1927-12-20' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (6, N'Pigna', N'Felipe', CAST(N'1962-04-02' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (7, N'Galeano', N'Eduardo', CAST(N'1971-12-20' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (8, N'Neruda', N'Pablo', CAST(N'1918-12-20' AS Date), 5)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (9, N'Vargas Llosa', N'Mario', CAST(N'1940-05-01' AS Date), 7)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (10, N'Benedetti', N'Mario', CAST(N'1923-10-10' AS Date), 3)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (11, N'Paz', N'Octavio', CAST(N'1914-03-31' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (12, N'Mistral', N'Gabriela', CAST(N'1889-04-07' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (13, N'Allende', N'Isabel', CAST(N'1942-08-02' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (14, N'Hernandez', N'Jose', CAST(N'1834-11-10' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (15, N'Arlt', N'Roberto', CAST(N'1900-11-10' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (16, N'Coelho', N'Paulo', CAST(N'1947-11-10' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (17, N'Rulfo', N'Juan', CAST(N'1917-12-20' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (18, N'Mujica Lainez', N'Manuel', CAST(N'1920-12-26' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (19, N'Sarmiento', N'Domingo', CAST(N'1812-01-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (20, N'Tofler', N'Alvin', CAST(N'1939-12-26' AS Date), 3)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (23, N'Perez', N'Juan', CAST(N'1999-07-17' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (24, N'Gonzalez', N'Carlos', CAST(N'1989-02-02' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (25, N'Iglesias', N'Camila', CAST(N'1991-04-25' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (26, N'Velasquez', N'Julio', CAST(N'1991-10-24' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (27, N'Vazquez', N'Pablo', CAST(N'1990-04-04' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (28, N'Garcia', N'pepe', CAST(N'2018-07-01' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (30, N'Palacios', N'Ezequiel', CAST(N'1990-12-12' AS Date), 11)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (1032, N'Balmaceda', N'Daniel', CAST(N'1980-03-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2029, N'Garcia', N'Juan', CAST(N'1980-03-12' AS Date), 8)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2031, N'Clerc', N'Jose Luis', CAST(N'1970-01-01' AS Date), 8)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2032, N'Garcia', N'Juan Jose', CAST(N'1980-01-05' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2033, N'Bayones', N'Matias', CAST(N'1985-06-05' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (2034, N'Montenegro', N'Teresita', CAST(N'1980-01-01' AS Date), 4)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (4035, N'Gaitan', N'Sebastian', CAST(N'1985-01-01' AS Date), 2)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5035, N'Perez', N'Enzo', CAST(N'1990-02-12' AS Date), 1)
GO
INSERT [dbo].[Autores] ([ID], [Apellido], [Nombre], [FechaNacimiento], [IdPais]) VALUES (5036, N'Perez', N'Enzo', CAST(N'1990-02-12' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[Editoriales] ON 
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (1, N'Planeta')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (2, N'Sudamericana')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (3, N'Alfaguara')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (4, N'Kapeluz')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (5, N'Emece Editores')
GO
INSERT [dbo].[Editoriales] ([ID], [Descripcion]) VALUES (6, N'DeBolsillo')
GO
SET IDENTITY_INSERT [dbo].[Editoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (6, N'Ciencia Ficcion')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (3, N'Cuentos')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (7, N'Historia Argentina')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (8, N'Informatica')
GO
INSERT [dbo].[Generos] ([ID], [Descripcion]) VALUES (5, N'Novelas')
GO
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'950-49-1342-3', N'Los Mitos de la Argentina II', 2005, 7, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788420419862', N'La tía Julia y el escribidor', 1978, 5, 1, 340)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788420422671', N'La tregua', 2003, 5, 2, 200)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788423338115', N'La invención de Morel', 1950, 6, 2, 400)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788423342181', N'Ficciones', 1944, 3, 2, 210)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788432311451', N'Las Venas Abiertas De America Latina', 1971, 5, 2, 600)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788466318709', N'La fiesta del chivo', 2000, 3, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788466320917', N'La casa Verde', 1968, 5, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788483462034', N'La casa de los espiritus', 1993, 5, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788489163515', N'El gaucho Martin Fierro', 1872, 3, 2, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788490626702', N'Gracias Por El Fuego', 1966, 3, 5, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788492480180', N'El gallo de oro', 1980, 5, 2, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9788497592352', N'El coronel no tiene quien le escriba', 1999, 5, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789500726078', N'Crónica de una muerte anunciada', 1981, 5, 5, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789502317922', N'Facundo', 1845, 7, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789504916451', N'Bar del Infiermo', 2007, 5, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789504920458', N'Los Mitos de la Argentina', 2009, 7, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789504942405', N'La voz del gran jefe', 2014, 7, 3, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789685208055', N'Letras e imágenes', 1969, 5, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789871138135', N'El amor en los tiempos del cólera', 1985, 5, 3, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789871138142', N'100 años de soledad', 1967, 5, 6, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789875666481', N'El Aleph', 1972, 3, 5, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789875667181', N'Historia De La Eternidad', 1936, 5, 5, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789875801837', N'La borra del café', 1992, 5, 3, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789877381795', N'La Ciudad Y Los Perros', 1962, 3, 1, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789877382570', N'Rayuela', 1963, 5, 3, NULL)
GO
INSERT [dbo].[Libros] ([ISBN], [Titulo], [Edicion], [IdGenero], [IdEditorial], [Paginas]) VALUES (N'9789877382594', N'Bestiario', 1951, 5, 3, NULL)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'950-49-1342-3', 6)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'950-49-1342-3', 7)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788420419862', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788420419862', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788420422671', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423338115', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423338115', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423338115', 5)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423342181', 1)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423342181', 2)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788423342181', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788432311451', 7)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788466318709', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788466318709', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788466320917', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788483462034', 13)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788489163515', 14)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788490626702', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788492480180', 17)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9788497592352', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789500726078', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789500726078', 5)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789502317922', 19)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789504916451', 16)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789504920458', 6)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789504942405', 6)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789685208055', 17)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789685208055', 18)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789871138135', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789871138142', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789871138142', 4)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875666481', 1)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875667181', 1)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875667181', 2)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875801837', 10)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789875801837', 11)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789877381795', 9)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789877382570', 3)
GO
INSERT [dbo].[LibrosAutores] ([ISBN], [IdAutor]) VALUES (N'9789877382594', 3)
GO
INSERT [dbo].[LogAutores] ([Usuario], [Fecha], [ApellidoAnterior], [ApellidoActual]) VALUES (N'dbo', CAST(N'2019-09-09T21:06:58.193' AS DateTime), N'Chilavert', N'Clerc')
GO
INSERT [dbo].[LogAutores] ([Usuario], [Fecha], [ApellidoAnterior], [ApellidoActual]) VALUES (N'dbo', CAST(N'2019-09-09T21:09:42.290' AS DateTime), N'Canul', N'Palacios')
GO
INSERT [dbo].[LogAutores] ([Usuario], [Fecha], [ApellidoAnterior], [ApellidoActual]) VALUES (N'dbo', CAST(N'2020-05-27T10:18:19.947' AS DateTime), N'Fernandez', N'Garcia')
GO
INSERT [dbo].[LogAutores] ([Usuario], [Fecha], [ApellidoAnterior], [ApellidoActual]) VALUES (N'dbo', CAST(N'2020-05-27T10:19:39.313' AS DateTime), N'Garcia', N'Garcia')
GO
INSERT [dbo].[LogAutores] ([Usuario], [Fecha], [ApellidoAnterior], [ApellidoActual]) VALUES (N'dbo', CAST(N'2020-07-01T20:40:01.530' AS DateTime), N'Borges', N'Martinez')
GO
SET IDENTITY_INSERT [dbo].[Paises] ON 
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (2, N'Uruguay')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (3, N'Brasil')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (4, N'Colombia')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (5, N'Chile')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (7, N'Peru')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (8, N'Paraguay')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (9, N'Rusia')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (10, N'España')
GO
INSERT [dbo].[Paises] ([ID], [Nombre]) VALUES (11, N'Mexico')
GO
SET IDENTITY_INSERT [dbo].[Paises] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 01/10/2020 19:32:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 01/10/2020 19:32:34 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 01/10/2020 19:32:34 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 01/10/2020 19:32:34 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 01/10/2020 19:32:34 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 01/10/2020 19:32:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Generos]    Script Date: 01/10/2020 19:32:34 ******/
ALTER TABLE [dbo].[Generos] ADD  CONSTRAINT [IX_Generos] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Autores]  WITH CHECK ADD  CONSTRAINT [FK_Autores_Paises] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Paises] ([ID])
GO
ALTER TABLE [dbo].[Autores] CHECK CONSTRAINT [FK_Autores_Paises]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Editoriales] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editoriales] ([ID])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Editoriales]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([ID])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Generos]
GO
ALTER TABLE [dbo].[LibrosAutores]  WITH CHECK ADD  CONSTRAINT [FK_LibrosAutores_Autores] FOREIGN KEY([IdAutor])
REFERENCES [dbo].[Autores] ([ID])
GO
ALTER TABLE [dbo].[LibrosAutores] CHECK CONSTRAINT [FK_LibrosAutores_Autores]
GO
ALTER TABLE [dbo].[LibrosAutores]  WITH CHECK ADD  CONSTRAINT [FK_LibrosAutores_Libros] FOREIGN KEY([ISBN])
REFERENCES [dbo].[Libros] ([ISBN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LibrosAutores] CHECK CONSTRAINT [FK_LibrosAutores_Libros]
GO
/****** Object:  StoredProcedure [dbo].[proc_abm_param]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_abm_param]

/*********************************************************
ABM TABLAS CON ESQUEMA ID(IDENTIDAD) NOMBRE(VARCHAR)
**********************************************************/
/* parametros */
       @Accion VARCHAR(10),
       @Tabla VARCHAR(50),
       @ID int = NULL,
       @Nombre VARCHAR(100) = NULL
AS
/* cuerpo principal del s. procedure*/
BEGIN
	DECLARE @SENTENCIA VARCHAR(200)
    --SELECT
    IF @Accion = 'SELECT'
      BEGIN
          set @sentencia='select * from ' + @Tabla  
      END
    --INSERT
    IF @Accion= 'INSERT'
      BEGIN
           set @sentencia='Insert into '+ @Tabla + '(Nombre) Values ('''+@Nombre+''')' 
      END
    --UPDATE
    IF @Accion = 'UPDATE'
      BEGIN
            set @sentencia='Update '+ @Tabla + ' set Nombre='''+@Nombre+''' where id='+Convert(varchar(4),@id) 
      END
      --DELETE
    IF @Accion = 'DELETE'
      BEGIN
           set @sentencia='Delete '+ @Tabla + ' where id='+Convert(varchar(4),@id) 
      END
execute(@sentencia)

END
GO
/****** Object:  StoredProcedure [dbo].[proc_alta]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_alta]
(
	@Tabla nvarchar(50),
	@Descripcion nvarchar(50)
 
)
as
declare @sentencia nvarchar(200)
set @sentencia='Insert into '+ @Tabla + '(Descripcion) Values ('''+@Descripcion+''')' 
execute(@sentencia)






GO
/****** Object:  StoredProcedure [dbo].[proc_alta_libro]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_alta_libro]
(
	@ISBN varchar(50),
	@Titulo varchar(50),
	@Edicion int,
	@IdGenero int,
	@IdEditorial int,
	@Autores TAutores readOnly
)
as
/* cuerpo principal del proc. */
BEGIN TRY 
  BEGIN TRANSACTION
	/* comienzan las transacciones ( insert/update/delete) */
	insert Libros
		(ISBN,Titulo,Edicion,IdGenero,IdEditorial)
	values(@ISBN ,@Titulo , @Edicion , @IdGenero ,@IdEditorial )

	/* insert de librosAutores*/
	insert LibrosAutores 
	select @ISBN,* from @Autores

	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	RAISERROR('ERROR, NO SE PUDO DAR EL ALTA EL LIBRO ',16,1)
	ROLLBACK TRANSACTION
END CATCH




GO
/****** Object:  StoredProcedure [dbo].[proc_baja]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_baja]
(
	@Tabla nvarchar(50),
	@id int
 
)
as
declare @sentencia nvarchar(200)
set @sentencia='Delete '+ @Tabla + ' where id='+Convert(varchar(3),@id) 
execute(@sentencia)





GO
/****** Object:  StoredProcedure [dbo].[proc_edit_autor]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_edit_autor]
(
@ID int,
@Apellido varchar(50),
@Nombre varchar(50),
@FechaNac date,
@Nacionalidad int
)
as
/* cuerpo principal del proc. */
BEGIN TRY 
  BEGIN TRANSACTION

 /* apellido actual*/
  declare @Ape varchar(50)
  set @Ape=(select apellido from autores where id=@ID)

  /* comienzan las transacciones */
	update autores
	set Apellido=@Apellido,
		Nombre=@Nombre,
		FechaNacimiento=@FechaNac,
		Nacionalidad=@Nacionalidad
    where id=@ID
	/* insert de LogAutores*/
	insert LogAutores(USUARIO,FECHA,ApellidoAnterior,ApellidoActual)
	values(CURRENT_USER,GETDATE(),@Ape,@Apellido) 

COMMIT TRANSACTION
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
	RAISERROR('ERROR, NO SE PUDO MODIFICAR EL AUTOR ',16,1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[proc_modi_autor]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_modi_autor]
(
	@ID int,
	@Apellido varchar(50),
	@Nombre varchar(50),
	@FechaNacimiento date,
	@Nacionalidad int
	
)
as
begin
	begin try
	  begin transaction
		declare @ApellidoAnterior varchar(50)
		set @ApellidoAnterior=(select Apellido from autores where id=@id)
		 
		-- update autores
		update Autores 
		set Apellido=@Apellido,
		Nombre=@Nombre,
		FechaNacimiento=@FechaNacimiento,
		Nacionalidad=@Nacionalidad
		where ID=@ID
		
		if @Apellido<>@ApellidoAnterior
		   begin
			-- insert en LogAutores
			insert LogAutores
			values(current_user,getdate(),@ApellidoAnterior,@Apellido)
		   end
		-- confirmo la transaction
		commit transaction
	end try
	begin catch
		-- cancelo la transaccion
		rollback transaction
		-- genero excepcion
		raiserror('Error en modificacion de autor',16,1)

	end catch

end

GO
/****** Object:  StoredProcedure [dbo].[proc_modi_libro]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_modi_libro]
(
 @ISBN nvarchar(17),
 @Titulo nvarchar(50),
 @Edicion int,
 @IdGenero int,
 @IdEditorial int
 )
 as
 Update Libros
 set 
 Titulo=@Titulo ,
 Edicion= @Edicion,
 IdGenero=@IdGenero,
 IdEditorial=@IdEditorial
 where isbn=@ISBN






GO
/****** Object:  StoredProcedure [dbo].[proc_modifica]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_modifica]
(
	@Tabla nvarchar(50),
	@id int,
	@Descripcion nvarchar(50)
 
)
as
declare @sentencia nvarchar(200)
set @sentencia='Update '+ @Tabla + ' set descripcion='''+@Descripcion+''' where id='+Convert(varchar(3),@id) 
execute(@sentencia)





GO
/****** Object:  StoredProcedure [dbo].[proc_traer]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_traer]
( @Tabla nvarchar(20) )
as
declare @sentencia nvarchar(200)
set @sentencia='select * from ' + @Tabla 
execute (@sentencia)





GO
/****** Object:  StoredProcedure [dbo].[ProcAsignarRol]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcAsignarRol]
(
	@Usuario nvarchar(256),
	@idrol int
)
as
declare @id nvarchar(128)
select @id=id from 
AspNetUsers where UserName=@Usuario
 
INSERT INTO AspNetUserRoles
(UserId,RoleId)VALUES (@id ,@idrol)
GO
/****** Object:  StoredProcedure [dbo].[ProcAutoresPais]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProcAutoresPais]
(@IdPais int)
as
select * from autores
where Nacionalidad=@IdPais

GO
/****** Object:  StoredProcedure [dbo].[ProcAutoresxISBN]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcAutoresxISBN]
(@ISBN varchar(17))
as
select a.Apellido,a.Nombre
from LibrosAutores as la 
inner join Autores as a on la.IdAutor=a.ID
where ISBN=@ISBN

GO
/****** Object:  StoredProcedure [dbo].[ProcAutoresXPais]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProcAutoresXPais]
(@IdPais int)
as
select * from autores
where Nacionalidad=@IdPais

GO
/****** Object:  StoredProcedure [dbo].[ProcLibros]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcLibros]
( @idAutor int )
as
select 
	l.ISBN,
	l.Titulo,
	l.Edicion,
	g.Descripcion as Genero,
	e.Descripcion as Editorial 
from LibrosAutores as la
inner join libros as l on l.ISBN=la.ISBN
inner join generos as g on g.ID=l.IdGenero
inner join Editoriales as e on e.ID=l.IdEditorial
where la.IdAutor=@idAutor
GO
/****** Object:  StoredProcedure [dbo].[ProcModificaLibro]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcModificaLibro]
(
 @ISBN nvarchar(17),
 @Titulo nvarchar(50),
 @Edicion int,
 @IdGenero int,
 @IdEditorial int
 )
 as
 Update Libros
 set 
 Titulo=@Titulo ,
 Edicion= @Edicion,
 IdGenero=@IdGenero,
 IdEditorial=@IdEditorial
 where isbn=@ISBN






GO
/****** Object:  StoredProcedure [dbo].[ProcTraer]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProcTraer]
( @Tabla nvarchar(20) )
as
declare @sentencia nvarchar(200)
set @sentencia='select * from ' + @Tabla 
execute (@sentencia)




GO
/****** Object:  StoredProcedure [dbo].[ProcTraerLibroxISBN]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
creaTE procedure [dbo].[ProcTraerLibroxISBN]
(
	@ISBN varchar(17)
)
as
select * from Libros
where isbn=@ISBN;
GO
/****** Object:  StoredProcedure [dbo].[ProcTraerUnLibro]    Script Date: 01/10/2020 19:32:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ProcTraerUnLibro]
(
 @ISBN nvarchar(17)
 )
as
Select * from Libros where isbn=@ISBN






GO
USE [master]
GO
ALTER DATABASE [BibliotecaOK] SET  READ_WRITE 
GO
