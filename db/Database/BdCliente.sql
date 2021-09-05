USE [ClienteDb]
GO
/****** Object:  Table [dbo].[Acesso]    Script Date: 05/09/2021 17:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acesso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[Hit] [int] NULL,
	[UltimoAcesso] [datetime] NOT NULL,
	[CriadoEm] [datetime] NOT NULL,
	[ModificadoEm] [datetime] NULL,
	[PerfilId] [int] NOT NULL,
 CONSTRAINT [PK_PK_Acesso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 05/09/2021 17:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NOT NULL,
	[EnderecoId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[CriadoEm] [datetime] NOT NULL,
	[ModificadoEm] [datetime] NULL,
 CONSTRAINT [PK_PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 05/09/2021 17:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CEP] [varchar](8) NOT NULL,
	[Logradouro] [varchar](200) NULL,
	[Complemento] [varchar](200) NULL,
	[Bairro] [varchar](200) NULL,
	[Localidade] [varchar](200) NULL,
	[UF] [varchar](2) NULL,
	[UsuarioId] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[CriadoEm] [datetime] NOT NULL,
	[ModificadoEm] [datetime] NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 05/09/2021 17:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](250) NOT NULL,
	[Ativo] [bit] NOT NULL,
	[CriadoEm] [datetime] NOT NULL,
	[ModificadoEm] [datetime] NULL,
 CONSTRAINT [PK_PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/09/2021 17:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](250) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[PessoaId] [int] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[CriadoEm] [datetime] NOT NULL,
	[ModificadoEm] [datetime] NULL,
 CONSTRAINT [PK_PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Acesso] ADD  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Acesso] ADD  DEFAULT (getdate()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Acesso] ADD  CONSTRAINT [DF_Acesso_PerfilId]  DEFAULT ((1)) FOR [PerfilId]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_PK_Cliente_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [DF_PK_Cliente_CriadoEm]  DEFAULT (getdate()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Perfil] ADD  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Perfil] ADD  DEFAULT (getdate()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Acesso]  WITH CHECK ADD  CONSTRAINT [FK_Acesso_Acesso] FOREIGN KEY([Id])
REFERENCES [dbo].[Acesso] ([Id])
GO
ALTER TABLE [dbo].[Acesso] CHECK CONSTRAINT [FK_Acesso_Acesso]
GO
ALTER TABLE [dbo].[Acesso]  WITH CHECK ADD  CONSTRAINT [FK_Acesso_Acesso1] FOREIGN KEY([Id])
REFERENCES [dbo].[Acesso] ([Id])
GO
ALTER TABLE [dbo].[Acesso] CHECK CONSTRAINT [FK_Acesso_Acesso1]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Usuario] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Usuario]
GO
