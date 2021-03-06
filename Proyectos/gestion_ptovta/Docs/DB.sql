USE [data]
GO
/****** Objeto:  Table [dbo].[ncuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ncuerfac]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ncuerfac](
	[Id] [numeric](12, 0) NOT NULL,
	[Idmaopera] [numeric](12, 0) NOT NULL,
	[Idcabeza] [numeric](12, 0) NOT NULL,
	[Idarticulo] [int] NOT NULL,
	[Codigo] [char](8) NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Cantidad] [numeric](9, 2) NOT NULL,
	[Univenta] [numeric](1, 0) NOT NULL,
	[Unibulto] [int] NOT NULL,
	[Oricod] [char](1) NOT NULL,
	[Sdocant] [numeric](9, 2) NOT NULL,
	[Kilos] [numeric](9, 3) NOT NULL,
	[Volumen] [numeric](9, 3) NOT NULL,
	[Listaprecio] [numeric](1, 0) NOT NULL,
	[Precosto] [numeric](11, 3) NOT NULL,
	[Precostosiva] [numeric](11, 3) NOT NULL,
	[Preunita] [numeric](11, 3) NOT NULL,
	[Preunitasiva] [numeric](11, 3) NOT NULL,
	[Prearti] [numeric](11, 3) NOT NULL,
	[Preartisiva] [numeric](11, 3) NOT NULL,
	[Interno] [numeric](11, 3) NOT NULL,
	[Despor] [numeric](6, 3) NOT NULL,
	[Tasaiva] [numeric](6, 3) NOT NULL,
	[Switch] [char](5) NOT NULL,
	[Ivauni] [numeric](11, 3) NOT NULL,
	[Alcohol] [char](1) NOT NULL,
	[Perceibruto] [numeric](1, 0) NOT NULL,
	[Nofactura] [numeric](1, 0) NOT NULL,
	[Espromocion] [numeric](1, 0) NOT NULL,
	[Iddeposito] [int] NOT NULL,
	[Oferfecha] [datetime] NOT NULL,
	[Oferbonif] [numeric](11, 3) NOT NULL,
	[Oferbonifcant] [numeric](11, 3) NOT NULL,
	[Idfrio] [int] NOT NULL,
	[Pesable] [numeric](1, 0) NOT NULL,
	[Escambio] [numeric](1, 0) NOT NULL,
	[Cantorig] [numeric](9, 2) NOT NULL,
	[Comprome] [numeric](1, 0) NOT NULL,
	[Importado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_ncuerfac] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabeza]    Fecha de la secuencia de comandos: 12/18/2012 14:20:24 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncuerfac]') AND name = N'idcabeza')
CREATE NONCLUSTERED INDEX [idcabeza] ON [dbo].[ncuerfac] 
(
	[Idcabeza] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:24 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncuerfac]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[ncuerfac] 
(
	[Idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[subctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subctacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[subctacte](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[cnumero] [char](6) NOT NULL,
	[subnumero] [char](4) NOT NULL,
	[cnombre] [char](30) NULL,
	[cdireccion] [char](30) NULL,
	[ctelefono] [char](20) NULL,
	[clocalidad] [char](30) NULL,
 CONSTRAINT [PK_subctacte] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_subctact1] UNIQUE NONCLUSTERED 
(
	[cnumero] ASC,
	[subnumero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [cnombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[subctacte]') AND name = N'cnombre')
CREATE NONCLUSTERED INDEX [cnombre] ON [dbo].[subctacte] 
(
	[cnombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[PARACONTA]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARACONTA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARACONTA](
	[Id] [int] NOT NULL,
	[Numero] [numeric](4, 0) NOT NULL,
	[Cnombre] [char](40) NOT NULL,
	[Idcuenta] [int] NOT NULL,
	[Impuesto] [numeric](1, 0) NOT NULL,
	[Idejercicio] [int] NOT NULL,
	[switch] [char](10) NULL,
 CONSTRAINT [PK_paraconta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PARACONTA]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[PARACONTA] 
(
	[Numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipoiva]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipoiva]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipoiva](
	[id] [int] NOT NULL,
	[numero] [char](1) NOT NULL,
	[nombre] [char](20) NOT NULL,
	[tasa] [numeric](5, 2) NOT NULL,
	[recago] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_tipoiva] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_tipoiv1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tipoiva]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[tipoiva] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipoprod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipoprod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipoprod](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[switch] [char](20) NOT NULL,
 CONSTRAINT [PK_tipoprod] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_tipopro1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tipoprod]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[tipoprod] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipounid]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipounid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipounid](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_tipounid] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_tipouni1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tipounid]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[tipounid] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipovta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipovta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipovta](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_tipovta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_tipovt1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tipovta]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[tipovta] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ubicacion]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ubicacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ubicacion](
	[id] [int] NOT NULL,
	[numero] [char](4) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_ubicacion] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ubicacio1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ubicacion]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[ubicacion] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[caberuta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[caberuta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[caberuta](
	[id] [int] NOT NULL,
	[idrutavdor] [int] NOT NULL,
	[dia] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_caberuta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [IX_caberuta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[caberuta]') AND name = N'IX_caberuta')
CREATE NONCLUSTERED INDEX [IX_caberuta] ON [dbo].[caberuta] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuerord]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerord](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcabeza] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[codigo] [char](8) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[cantidad] [numeric](9, 2) NOT NULL,
	[univenta] [numeric](1, 0) NOT NULL,
	[unibulto] [int] NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[precosto] [numeric](11, 3) NOT NULL,
	[precostosiva] [numeric](11, 3) NOT NULL,
	[preunita] [numeric](11, 3) NOT NULL,
	[preunitasiva] [numeric](11, 3) NOT NULL,
	[prearti] [numeric](11, 3) NOT NULL,
	[preartisiva] [numeric](11, 3) NOT NULL,
	[interno] [numeric](11, 3) NOT NULL,
	[despor] [numeric](6, 3) NOT NULL,
	[tasaiva] [numeric](6, 3) NOT NULL,
	[hojaactual] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
	[pesable] [numeric](1, 0) NOT NULL,
	[idfrio] [int] NOT NULL,
 CONSTRAINT [PK_cuerord] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabeza]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerord]') AND name = N'idcabeza')
CREATE NONCLUSTERED INDEX [idcabeza] ON [dbo].[cuerord] 
(
	[idcabeza] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerord]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cuerord] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[bloqueoprod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bloqueoprod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bloqueoprod](
	[id] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idctacte] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[clasecomp]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clasecomp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[clasecomp](
	[id] [int] NOT NULL,
	[codigo] [char](1) NOT NULL,
	[cnombre] [char](25) NOT NULL,
	[afectado] [char](30) NOT NULL,
	[debehaber] [char](1) NOT NULL,
 CONSTRAINT [PK_clasecomp] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_clasecom1] UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[cuerruta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerruta](
	[id] [int] NOT NULL,
	[idcaberuta] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[turno] [numeric](1, 0) NOT NULL,
	[orden] [int] NOT NULL,
 CONSTRAINT [PK_cuerruta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[afectacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afectacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afectacte](
	[id] [numeric](12, 0) NOT NULL,
	[idmaoperad] [numeric](12, 0) NOT NULL,
	[iddebe] [numeric](12, 0) NOT NULL,
	[idmaoperah] [numeric](12, 0) NOT NULL,
	[idhaber] [numeric](12, 0) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
 CONSTRAINT [PK_afectacte] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [iddebe]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afectacte]') AND name = N'iddebe')
CREATE NONCLUSTERED INDEX [iddebe] ON [dbo].[afectacte] 
(
	[iddebe] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idhaber]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afectacte]') AND name = N'idhaber')
CREATE NONCLUSTERED INDEX [idhaber] ON [dbo].[afectacte] 
(
	[idhaber] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afectacte]') AND name = N'idmaoperad')
CREATE NONCLUSTERED INDEX [idmaoperad] ON [dbo].[afectacte] 
(
	[idmaoperad] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperah]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afectacte]') AND name = N'idmaoperah')
CREATE NONCLUSTERED INDEX [idmaoperah] ON [dbo].[afectacte] 
(
	[idmaoperah] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[prefijonro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prefijonro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prefijonro](
	[id] [int] NOT NULL,
	[prefijo] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[letra] [char](1) NOT NULL,
	[numero] [numeric](10, 0) NOT NULL,
	[idimpresora] [int] NOT NULL,
	[formulario] [int] NOT NULL,
	[copias] [numeric](2, 0) NOT NULL,
	[cantlinea] [numeric](3, 0) NOT NULL,
	[idnofiscal] [int] NOT NULL,
	[nroautoma] [numeric](1, 0) NOT NULL,
	[nronofiscal] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_prefijonro] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prefijonro]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[prefijonro] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[existenc]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[existenc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[existenc](
	[id] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[iddeposito] [int] NOT NULL,
	[fecvto] [datetime] NOT NULL,
	[existe] [numeric](10, 0) NOT NULL,
	[existeant] [numeric](10, 0) NOT NULL,
	[kilos] [numeric](13, 3) NOT NULL,
	[kilosant] [numeric](13, 3) NOT NULL,
	[volumen] [numeric](13, 3) NOT NULL,
	[volumenant] [numeric](14, 0) NOT NULL,
	[existedisp] [numeric](10, 0) NOT NULL,
	[kilosdisp] [numeric](13, 3) NOT NULL,
	[volumendisp] [numeric](13, 3) NOT NULL,
 CONSTRAINT [PK_existenc] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_existen1] UNIQUE NONCLUSTERED 
(
	[idarticulo] ASC,
	[idsubarti] ASC,
	[iddeposito] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[impresora]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[impresora]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[impresora](
	[id] [int] NOT NULL,
	[nombre] [char](40) NOT NULL,
	[tipo] [numeric](2, 0) NOT NULL,
	[modelofis] [numeric](2, 0) NOT NULL,
	[puerto] [int] NOT NULL,
	[direccionip] [char](20) NOT NULL,
	[idterminal] [int] NOT NULL,
	[portname] [char](40) NOT NULL,
 CONSTRAINT [PK_impresora] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_impresor1] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[cabeord]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabeord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabeord](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[total] [numeric](11, 2) NOT NULL,
	[switch] [char](5) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[idfletero] [int] NOT NULL,
	[iddepentra] [int] NOT NULL,
	[iddepsale] [int] NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
	[hojaactual] [int] NOT NULL,
	[hojatotal] [int] NOT NULL,
	[idlotemaopera] [numeric](12, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[idconcepto] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[prodctacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prodctacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prodctacon](
	[id] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idctavta] [int] NOT NULL,
	[idctacpra] [int] NOT NULL,
 CONSTRAINT [PK_prodctacon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prodctacon]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[prodctacon] 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctacpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prodctacon]') AND name = N'idctacpra')
CREATE NONCLUSTERED INDEX [idctacpra] ON [dbo].[prodctacon] 
(
	[idctacpra] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctavta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prodctacon]') AND name = N'idctavta')
CREATE NONCLUSTERED INDEX [idctavta] ON [dbo].[prodctacon] 
(
	[idctavta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prodctacon]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[prodctacon] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[keysid]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[keysid]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[keysid](
	[tabla] [char](20) NOT NULL,
	[nextid] [int] NOT NULL,
	[ctipocomp] [char](3) NOT NULL,
 CONSTRAINT [PK_keysid] PRIMARY KEY NONCLUSTERED 
(
	[tabla] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[formulario]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[formulario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[formulario](
	[id] [int] NOT NULL,
	[numero] [numeric](2, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[diseno] [char](1) NOT NULL,
 CONSTRAINT [PK_formulario] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[chofer]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[chofer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[chofer](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
	[cuit] [char](13) NOT NULL,
	[numdoc] [char](15) NOT NULL,
	[idctatransp] [int] NOT NULL,
	[idtipodoc] [int] NOT NULL,
 CONSTRAINT [PK_chofer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_chofe1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctatrans]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[chofer]') AND name = N'idctatrans')
CREATE NONCLUSTERED INDEX [idctatrans] ON [dbo].[chofer] 
(
	[idctatransp] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idtipodoc]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[chofer]') AND name = N'idtipodoc')
CREATE NONCLUSTERED INDEX [idtipodoc] ON [dbo].[chofer] 
(
	[idtipodoc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[chofer]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[chofer] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[fleteplanilla]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fleteplanilla]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fleteplanilla](
	[id] [int] NOT NULL,
	[idfletero] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[switch] [char](5) NOT NULL,
	[estado] [char](1) NOT NULL,
 CONSTRAINT [PK_fleteplanilla] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idfletero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fleteplanilla]') AND name = N'idfletero')
CREATE NONCLUSTERED INDEX [idfletero] ON [dbo].[fleteplanilla] 
(
	[idfletero] ASC,
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[prefitermi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prefitermi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prefitermi](
	[id] [int] NOT NULL,
	[idterminal] [int] NOT NULL,
	[idprefijonro] [int] NOT NULL,
	[idcomproba] [int] NOT NULL,
 CONSTRAINT [PK_prefitermi] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[ncabefac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ncabefac]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ncabefac](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[ctacte] [char](6) NOT NULL,
	[cnombre] [char](35) NOT NULL,
	[cdireccion] [char](25) NOT NULL,
	[ctelefono] [char](15) NOT NULL,
	[cpostal] [char](8) NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[idtipoiva] [int] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[idsubcta] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idplanpago] [int] NOT NULL,
	[total] [numeric](11, 2) NOT NULL,
	[bonif1] [numeric](6, 3) NOT NULL,
	[bonif2] [numeric](6, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
	[idfletero] [int] NOT NULL,
	[idfuerzavta] [int] NOT NULL,
	[idrutavdor] [int] NOT NULL,
	[ivari1] [numeric](11, 2) NOT NULL,
	[basegra1] [numeric](11, 2) NOT NULL,
	[tasa1] [numeric](5, 3) NOT NULL,
	[ivari2] [numeric](11, 2) NOT NULL,
	[basegra2] [numeric](11, 2) NOT NULL,
	[tasa2] [numeric](5, 3) NOT NULL,
	[ivari3] [numeric](11, 2) NOT NULL,
	[basegra3] [numeric](11, 2) NOT NULL,
	[tasa3] [numeric](5, 3) NOT NULL,
	[ivari4] [numeric](11, 2) NOT NULL,
	[basegra4] [numeric](11, 2) NOT NULL,
	[tasa4] [numeric](5, 3) NOT NULL,
	[ivari5] [numeric](11, 2) NOT NULL,
	[basegra5] [numeric](11, 2) NOT NULL,
	[tasa5] [numeric](6, 3) NOT NULL,
	[baseexe] [numeric](11, 2) NOT NULL,
	[nomrete1] [char](10) NOT NULL,
	[retencion1] [numeric](11, 2) NOT NULL,
	[baserete1] [numeric](11, 2) NOT NULL,
	[tasarete1] [numeric](6, 3) NOT NULL,
	[nomrete2] [char](10) NOT NULL,
	[retencion2] [numeric](11, 2) NOT NULL,
	[baserete2] [numeric](11, 2) NOT NULL,
	[tasarete2] [numeric](6, 3) NOT NULL,
	[nomrete3] [char](10) NOT NULL,
	[retencion3] [numeric](11, 2) NOT NULL,
	[baserete3] [numeric](11, 2) NOT NULL,
	[tasarete3] [numeric](6, 3) NOT NULL,
	[nomrete4] [char](10) NOT NULL,
	[retencion4] [numeric](11, 2) NOT NULL,
	[baserete4] [numeric](11, 2) NOT NULL,
	[tasarete4] [numeric](6, 3) NOT NULL,
	[nomrete5] [char](10) NOT NULL,
	[retencion5] [numeric](11, 2) NOT NULL,
	[baserete5] [numeric](11, 2) NOT NULL,
	[tasarete5] [numeric](6, 3) NOT NULL,
	[subnumero] [char](3) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[idfrio] [int] NOT NULL,
	[tasamuni] [numeric](1, 0) NOT NULL,
	[diferida] [numeric](1, 0) NOT NULL,
	[idtiponcredito] [int] NOT NULL,
	[iddeposito] [int] NOT NULL,
	[idareaneg] [int] NOT NULL,
 CONSTRAINT [PK_ncabefac] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncabefac]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[ncabefac] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncabefac]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[ncabefac] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncabefac]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[ncabefac] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cbantevdor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cbantevdor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cbantevdor](
	[id] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[idcomprobante] [int] NOT NULL,
 CONSTRAINT [PK_cbantevdor] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cbantevdor]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[cbantevdor] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Default [dbo].[UW_ZeroDefault]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UW_ZeroDefault]') AND OBJECTPROPERTY(id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT [dbo].[UW_ZeroDefault] AS 0'
GO
/****** Objeto:  Table [dbo].[detaconta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detaconta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detaconta](
	[id] [int] NOT NULL,
	[idempresa] [int] NOT NULL,
	[ejercicio] [numeric](3, 0) NOT NULL,
	[fecdesde] [datetime] NOT NULL,
	[fechasta] [datetime] NOT NULL,
	[nrocaja1] [numeric](8, 0) NOT NULL,
	[nrocaja2] [numeric](8, 0) NOT NULL,
	[switch] [char](10) NOT NULL,
 CONSTRAINT [PK_detaconta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_detaconta] UNIQUE NONCLUSTERED 
(
	[idempresa] ASC,
	[ejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[ncuervari]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ncuervari]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ncuervari](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idvariedad] [int] NOT NULL,
	[cantidad] [numeric](6, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[cantorig] [numeric](6, 2) NOT NULL,
	[comprome] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_ncuervari] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncuervari]') AND name = N'idcuerfac')
CREATE NONCLUSTERED INDEX [idcuerfac] ON [dbo].[ncuervari] 
(
	[idcuerfac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ncuervari]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[ncuervari] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[aferemito]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aferemito]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aferemito](
	[id] [numeric](12, 0) NOT NULL,
	[idmaoperao] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[idmaoperaa] [numeric](12, 0) NOT NULL,
	[idafecta] [numeric](12, 0) NOT NULL,
	[cantidad] [numeric](9, 2) NOT NULL,
 CONSTRAINT [PK_aferemito] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idafecta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aferemito]') AND name = N'idafecta')
CREATE NONCLUSTERED INDEX [idafecta] ON [dbo].[aferemito] 
(
	[idafecta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperaa]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aferemito]') AND name = N'idmaoperaa')
CREATE NONCLUSTERED INDEX [idmaoperaa] ON [dbo].[aferemito] 
(
	[idmaoperaa] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperao]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aferemito]') AND name = N'idmaoperao')
CREATE NONCLUSTERED INDEX [idmaoperao] ON [dbo].[aferemito] 
(
	[idmaoperao] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aferemito]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[aferemito] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabecpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabecpra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabecpra](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[ctacte] [char](6) NOT NULL,
	[cnombre] [char](35) NOT NULL,
	[cdireccion] [char](25) NOT NULL,
	[ctelefono] [char](15) NOT NULL,
	[cpostal] [char](8) NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[idtipoiva] [int] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idplanpago] [int] NOT NULL,
	[total] [numeric](11, 2) NOT NULL,
	[switch] [char](5) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[Recodevol] [numeric](11, 3) NOT NULL CONSTRAINT [DF__cabecpra__Recode__2BCA4AD3]  DEFAULT ((0.000)),
	[idzona] [int] NOT NULL,
	[iddeposito] [int] NOT NULL,
 CONSTRAINT [PK_cabecpra] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_cabecpr1] UNIQUE NONCLUSTERED 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[movbcocar]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movbcocar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movbcocar](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[origen] [char](3) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
	[idtipomov] [int] NOT NULL,
	[numero] [numeric](10, 0) NOT NULL,
	[idctabco] [int] NOT NULL,
	[banco] [varchar](25) NOT NULL,
	[localidad] [varchar](25) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fechavto] [datetime] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[titular] [varchar](25) NOT NULL,
	[recibido] [varchar](25) NOT NULL,
	[entregado] [varchar](25) NOT NULL,
	[detalle] [varchar](30) NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_movbcocar] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcocar]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[movbcocar] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [origen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcocar]') AND name = N'origen')
CREATE NONCLUSTERED INDEX [origen] ON [dbo].[movbcocar] 
(
	[origen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[afebcocar]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afebcocar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afebcocar](
	[id] [numeric](12, 0) NOT NULL,
	[idmaoperao] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[idmaoperaa] [numeric](12, 0) NOT NULL,
	[idafecta] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_afebcocar] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idafecta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afebcocar]') AND name = N'idafecta')
CREATE NONCLUSTERED INDEX [idafecta] ON [dbo].[afebcocar] 
(
	[idafecta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperaa]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afebcocar]') AND name = N'idmaoperaa')
CREATE NONCLUSTERED INDEX [idmaoperaa] ON [dbo].[afebcocar] 
(
	[idmaoperaa] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperao]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afebcocar]') AND name = N'idmaoperao')
CREATE NONCLUSTERED INDEX [idmaoperao] ON [dbo].[afebcocar] 
(
	[idmaoperao] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afebcocar]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[afebcocar] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipodoc]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipodoc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipodoc](
	[id] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[abrevia] [char](3) NOT NULL,
	[numero] [int] NOT NULL,
 CONSTRAINT [PK_tipodoc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[movtarjeta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movtarjeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movtarjeta](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[tarjeta] [char](20) NOT NULL,
	[numero] [char](15) NOT NULL,
	[cupon] [char](15) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[fechavto] [datetime] NOT NULL,
	[cuota] [numeric](2, 0) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
	[saldo] [numeric](11, 2) NOT NULL,
 CONSTRAINT [PK_movtarjeta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movtarjeta]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[movtarjeta] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[banco]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[banco]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[banco](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[direccion] [char](50) NOT NULL,
 CONSTRAINT [PK_banco] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_banc1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[afetarjeta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afetarjeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afetarjeta](
	[id] [numeric](12, 0) NOT NULL,
	[idmaoperao] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[idmaoperaa] [numeric](12, 0) NOT NULL,
	[idafecta] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_afetarjeta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idafecta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afetarjeta]') AND name = N'idafecta')
CREATE NONCLUSTERED INDEX [idafecta] ON [dbo].[afetarjeta] 
(
	[idafecta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperaa]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afetarjeta]') AND name = N'idmaoperaa')
CREATE NONCLUSTERED INDEX [idmaoperaa] ON [dbo].[afetarjeta] 
(
	[idmaoperaa] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperao]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afetarjeta]') AND name = N'idmaoperao')
CREATE NONCLUSTERED INDEX [idmaoperao] ON [dbo].[afetarjeta] 
(
	[idmaoperao] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afetarjeta]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[afetarjeta] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[nmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[nmaopera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[nmaopera](
	[id] [numeric](12, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idcomproba] [int] NOT NULL,
	[numcomp] [char](13) NOT NULL,
	[clasecomp] [char](1) NOT NULL,
	[idctacte] [int] NOT NULL,
	[importe] [numeric](10, 2) NOT NULL,
	[idprefijo] [int] NOT NULL,
	[copiatkt] [numeric](2, 0) NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[terminal] [numeric](3, 0) NOT NULL,
	[sector] [numeric](2, 0) NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[turno] [numeric](2, 0) NOT NULL,
	[puestocaja] [numeric](3, 0) NOT NULL,
	[idoperador] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[fechasis] [datetime] NOT NULL,
	[switch] [char](5) NOT NULL,
	[estado] [char](1) NOT NULL,
	[detalle] [varchar](40) NOT NULL,
	[fechaserver] [datetime] NOT NULL,
 CONSTRAINT [PK_nmaopera] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fechasis]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[nmaopera]') AND name = N'fechasis')
CREATE NONCLUSTERED INDEX [fechasis] ON [dbo].[nmaopera] 
(
	[fechasis] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[clasevalor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clasevalor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[clasevalor](
	[id] [int] NOT NULL,
	[numero] [char](1) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_clasevalor] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_clasevalo1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[clasevalor]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[clasevalor] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[movbcodeta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movbcodeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movbcodeta](
	[id] [numeric](12, 0) NOT NULL,
	[idmovbcocar] [numeric](12, 0) NOT NULL,
	[idbanco] [int] NOT NULL,
	[idctatitular] [int] NOT NULL,
	[idctaentrega] [int] NOT NULL,
	[idctarecibido] [int] NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[codbarra] [char](29) NOT NULL,
	[cuit] [char](11) NOT NULL,
 CONSTRAINT [PK_movbcodeta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_movbcodet1] UNIQUE NONCLUSTERED 
(
	[idmovbcocar] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idbanco]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcodeta]') AND name = N'idbanco')
CREATE NONCLUSTERED INDEX [idbanco] ON [dbo].[movbcodeta] 
(
	[idbanco] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctaentre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcodeta]') AND name = N'idctaentre')
CREATE NONCLUSTERED INDEX [idctaentre] ON [dbo].[movbcodeta] 
(
	[idctaentrega] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctarecib]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcodeta]') AND name = N'idctarecib')
CREATE NONCLUSTERED INDEX [idctarecib] ON [dbo].[movbcodeta] 
(
	[idctarecibido] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctatitul]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcodeta]') AND name = N'idctatitul')
CREATE NONCLUSTERED INDEX [idctatitul] ON [dbo].[movbcodeta] 
(
	[idctatitular] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idlocalida]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movbcodeta]') AND name = N'idlocalida')
CREATE NONCLUSTERED INDEX [idlocalida] ON [dbo].[movbcodeta] 
(
	[idlocalidad] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[fletecarga]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fletecarga]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fletecarga](
	[id] [int] NOT NULL,
	[idfleteplan] [int] NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_fletecarga] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idfletepla]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fletecarga]') AND name = N'idfletepla')
CREATE NONCLUSTERED INDEX [idfletepla] ON [dbo].[fletecarga] 
(
	[idfleteplan] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fletecarga]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[fletecarga] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[clasecta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[clasecta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[clasecta](
	[id] [int] NOT NULL,
	[cnumero] [char](2) NOT NULL,
	[cnombre] [char](30) NOT NULL,
	[provincia] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_clasecta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_clasect1] UNIQUE NONCLUSTERED 
(
	[cnumero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[afenpedido]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afenpedido]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afenpedido](
	[id] [numeric](12, 0) NOT NULL,
	[idmaoperan] [numeric](12, 0) NOT NULL,
	[idmaoperac] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_afenpedido] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaoperac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afenpedido]') AND name = N'idmaoperac')
CREATE NONCLUSTERED INDEX [idmaoperac] ON [dbo].[afenpedido] 
(
	[idmaoperac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperan]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afenpedido]') AND name = N'idmaoperan')
CREATE NONCLUSTERED INDEX [idmaoperan] ON [dbo].[afenpedido] 
(
	[idmaoperan] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tamano]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tamano]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tamano](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_tamano] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_taman1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tamano]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[tamano] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[detanrocaja]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[detanrocaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[detanrocaja](
	[id] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[nrocaja] [numeric](8, 0) NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[fecdesde] [datetime] NOT NULL,
	[fechasta] [datetime] NOT NULL,
	[debe] [numeric](13, 3) NOT NULL,
	[haber] [numeric](13, 3) NOT NULL,
	[saldo] [numeric](13, 3) NOT NULL,
	[switch] [char](10) NOT NULL,
 CONSTRAINT [PK_detanrocaja] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[detanrocaja]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[detanrocaja] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nrocaja]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[detanrocaja]') AND name = N'nrocaja')
CREATE NONCLUSTERED INDEX [nrocaja] ON [dbo].[detanrocaja] 
(
	[nrocaja] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[dcabefac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dcabefac]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dcabefac](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[ctacte] [char](6) NOT NULL,
	[cnombre] [char](35) NOT NULL,
	[cdireccion] [char](25) NOT NULL,
	[ctelefono] [char](15) NOT NULL,
	[cpostal] [char](8) NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[idtipoiva] [int] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[idsubcta] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idplanpago] [int] NOT NULL,
	[total] [numeric](11, 2) NOT NULL,
	[bonif1] [numeric](6, 3) NOT NULL,
	[bonif2] [numeric](6, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[idfletero] [int] NOT NULL,
	[idfuerzavta] [int] NOT NULL,
	[idrutavdor] [int] NOT NULL,
	[ivari1] [numeric](11, 2) NOT NULL,
	[basegra1] [numeric](11, 2) NOT NULL,
	[tasa1] [numeric](5, 3) NOT NULL,
	[ivari2] [numeric](11, 2) NOT NULL,
	[basegra2] [numeric](11, 2) NOT NULL,
	[tasa2] [numeric](5, 3) NOT NULL,
	[ivari3] [numeric](11, 2) NOT NULL,
	[basegra3] [numeric](11, 2) NOT NULL,
	[tasa3] [numeric](5, 3) NOT NULL,
	[ivari4] [numeric](11, 2) NOT NULL,
	[basegra4] [numeric](11, 2) NOT NULL,
	[tasa4] [numeric](5, 3) NOT NULL,
	[ivari5] [numeric](11, 2) NOT NULL,
	[basegra5] [numeric](11, 2) NOT NULL,
	[tasa5] [numeric](6, 3) NOT NULL,
	[baseexe] [numeric](11, 2) NOT NULL,
	[nomrete1] [char](10) NOT NULL,
	[retencion1] [numeric](11, 2) NOT NULL,
	[baserete1] [numeric](11, 2) NOT NULL,
	[tasarete1] [numeric](6, 3) NOT NULL,
	[nomrete2] [char](10) NOT NULL,
	[retencion2] [numeric](11, 2) NOT NULL,
	[baserete2] [numeric](11, 2) NOT NULL,
	[tasarete2] [numeric](6, 3) NOT NULL,
	[nomrete3] [char](10) NOT NULL,
	[retencion3] [numeric](11, 2) NOT NULL,
	[baserete3] [numeric](11, 2) NOT NULL,
	[tasarete3] [numeric](6, 3) NOT NULL,
	[nomrete4] [char](10) NOT NULL,
	[retencion4] [numeric](11, 2) NOT NULL,
	[baserete4] [numeric](11, 2) NOT NULL,
	[tasarete4] [numeric](6, 3) NOT NULL,
	[nomrete5] [char](10) NOT NULL,
	[retencion5] [numeric](11, 2) NOT NULL,
	[baserete5] [numeric](11, 2) NOT NULL,
	[tasarete5] [numeric](6, 3) NOT NULL,
	[subnumero] [char](3) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
 CONSTRAINT [UQ_dcabefa1] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dcabefac]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[dcabefac] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dcabefac]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[dcabefac] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[renctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[renctacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[renctacte](
	[id] [numeric](12, 0) NOT NULL,
	[idmovctacte] [numeric](12, 0) NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
	[idfletero] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_renctacte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [estado]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renctacte]') AND name = N'estado')
CREATE NONCLUSTERED INDEX [estado] ON [dbo].[renctacte] 
(
	[estado] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idfletero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renctacte]') AND name = N'idfletero')
CREATE NONCLUSTERED INDEX [idfletero] ON [dbo].[renctacte] 
(
	[idfletero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmovctact]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renctacte]') AND name = N'idmovctact')
CREATE NONCLUSTERED INDEX [idmovctact] ON [dbo].[renctacte] 
(
	[idmovctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renctacte]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[renctacte] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[dcuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dcuerfac]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dcuerfac](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcabeza] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[codigo] [char](8) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[cantidad] [numeric](9, 2) NOT NULL,
	[univenta] [numeric](1, 0) NOT NULL,
	[unibulto] [int] NOT NULL,
	[oricod] [char](1) NOT NULL,
	[sdocant] [numeric](9, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[precosto] [numeric](11, 3) NOT NULL,
	[precostosiva] [numeric](11, 3) NOT NULL,
	[preunita] [numeric](11, 3) NOT NULL,
	[preunitasiva] [numeric](11, 3) NOT NULL,
	[prearti] [numeric](11, 3) NOT NULL,
	[preartisiva] [numeric](11, 3) NOT NULL,
	[interno] [numeric](11, 3) NOT NULL,
	[despor] [numeric](6, 3) NOT NULL,
	[tasaiva] [numeric](6, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[ivauni] [numeric](11, 3) NOT NULL,
	[alcohol] [char](1) NOT NULL,
	[perceibruto] [numeric](1, 0) NOT NULL,
	[nofactura] [numeric](1, 0) NOT NULL,
	[espromocion] [numeric](1, 0) NOT NULL,
	[iddeposito] [int] NOT NULL,
	[unisiva] [numeric](11, 3) NOT NULL,
	[uniciva] [numeric](11, 3) NOT NULL,
	[pesable] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_dcuerfac] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dcuerfac]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[dcuerfac] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[dpagos]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dpagos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dpagos](
	[id] [int] NOT NULL,
	[numero] [numeric](3, 0) NOT NULL,
	[cnombre] [char](25) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[importe] [numeric](9, 2) NOT NULL,
	[idcuenta] [int] NOT NULL,
	[ctactebco] [char](6) NOT NULL,
	[titular] [char](30) NOT NULL,
	[banco] [char](30) NOT NULL,
	[localidad] [char](30) NOT NULL,
	[nrocheque] [numeric](12, 0) NOT NULL,
	[idtipobco] [int] NOT NULL,
	[fechavto] [datetime] NOT NULL,
	[entregado] [char](30) NOT NULL,
	[idvalor] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[tipocaja] [char](2) NOT NULL,
	[nrotarjeta] [char](15) NOT NULL,
	[cupon] [char](15) NOT NULL,
	[cuota] [numeric](2, 0) NOT NULL,
	[cuit] [char](13) NOT NULL,
	[idctabco] [int] NOT NULL,
	[esclase] [char](1) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_dpagos] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dpagos]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[dpagos] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[dmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dmaopera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dmaopera](
	[id] [numeric](12, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idcomproba] [int] NOT NULL,
	[numcomp] [char](13) NOT NULL,
	[clasecomp] [char](1) NOT NULL,
	[idctacte] [int] NOT NULL,
	[importe] [numeric](10, 2) NOT NULL,
	[idprefijo] [int] NOT NULL,
	[copiatkt] [numeric](2, 0) NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[terminal] [numeric](3, 0) NOT NULL,
	[sector] [numeric](2, 0) NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[turno] [numeric](2, 0) NOT NULL,
	[puestocaja] [numeric](3, 0) NOT NULL,
	[idoperador] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[fechasis] [datetime] NOT NULL,
	[switch] [char](5) NOT NULL,
	[estado] [char](1) NOT NULL,
	[detalle] [varchar](40) NOT NULL,
	[fechaserver] [datetime] NOT NULL,
	[idpuestospooler] [int] NOT NULL,
 CONSTRAINT [PK_dmaopera] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dmaopera]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[dmaopera] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[plancue]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[plancue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[plancue](
	[id] [int] NOT NULL,
	[cuenta] [numeric](4, 0) NOT NULL,
	[nombre] [char](40) NOT NULL,
	[imputable] [numeric](1, 0) NOT NULL,
	[idmadre] [int] NOT NULL,
	[madre] [int] NOT NULL,
	[orden] [int] NOT NULL,
	[idclase] [int] NOT NULL,
	[tipocuenta] [numeric](1, 0) NOT NULL,
	[codigo] [char](12) NOT NULL,
	[idejercicio] [int] NOT NULL,
	[idejeantes] [int] NOT NULL,
	[switch] [char](5) NULL,
 CONSTRAINT [PK_plancue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [cuenta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[plancue]') AND name = N'cuenta')
CREATE NONCLUSTERED INDEX [cuenta] ON [dbo].[plancue] 
(
	[cuenta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[plancue]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[plancue] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [orden]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[plancue]') AND name = N'orden')
CREATE NONCLUSTERED INDEX [orden] ON [dbo].[plancue] 
(
	[madre] ASC,
	[orden] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[marca]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[marca]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[marca](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[flete] [numeric](5, 3) NOT NULL,
	[flete2] [numeric](5, 3) NOT NULL,
	[idfuerzavta] [int] NOT NULL,
 CONSTRAINT [PK_marca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[marca]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[marca] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabeunifica]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabeunifica]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabeunifica](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_cabeunifica] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_cabeunific1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeunifica]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[cabeunifica] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[concepto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[concepto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[concepto](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[estadomerc] [numeric](1, 0) NOT NULL,
	[tipoajuste] [numeric](1, 0) NOT NULL,
	[notacred] [numeric](1, 0) NOT NULL,
	[iddeposito] [int] NOT NULL,
	[switch] [char](10) NOT NULL,
 CONSTRAINT [PK_concepto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [estadomerc]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[concepto]') AND name = N'estadomerc')
CREATE NONCLUSTERED INDEX [estadomerc] ON [dbo].[concepto] 
(
	[estadomerc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [iddeposito]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[concepto]') AND name = N'iddeposito')
CREATE NONCLUSTERED INDEX [iddeposito] ON [dbo].[concepto] 
(
	[iddeposito] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [notacred]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[concepto]') AND name = N'notacred')
CREATE NONCLUSTERED INDEX [notacred] ON [dbo].[concepto] 
(
	[notacred] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[concepto]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[concepto] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [tipoajuste]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[concepto]') AND name = N'tipoajuste')
CREATE NONCLUSTERED INDEX [tipoajuste] ON [dbo].[concepto] 
(
	[tipoajuste] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuerunifica]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerunifica]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerunifica](
	[id] [int] NOT NULL,
	[idcabeunifica] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
 CONSTRAINT [PK_cuerunifica] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabunifi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerunifica]') AND name = N'idcabunifi')
CREATE NONCLUSTERED INDEX [idcabunifi] ON [dbo].[cuerunifica] 
(
	[idcabeunifica] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabepromo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabepromo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabepromo](
	[id] [int] NOT NULL,
	[idprodgenera] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](35) NOT NULL,
	[idprodpromo] [int] NOT NULL,
	[idprodregalo] [int] NOT NULL,
	[cada] [int] NOT NULL,
	[entrega] [int] NOT NULL,
	[fechasta] [datetime] NULL,
 CONSTRAINT [PK_cabepromo] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idprodgene]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepromo]') AND name = N'idprodgene')
CREATE NONCLUSTERED INDEX [idprodgene] ON [dbo].[cabepromo] 
(
	[idprodgenera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idprodprom]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepromo]') AND name = N'idprodprom')
CREATE NONCLUSTERED INDEX [idprodprom] ON [dbo].[cabepromo] 
(
	[idprodpromo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepromo]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[cabepromo] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepromo]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[cabepromo] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuerpromo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerpromo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerpromo](
	[id] [int] NOT NULL,
	[idcabepromo] [int] NOT NULL,
	[candesde] [int] NOT NULL,
	[canhasta] [int] NOT NULL,
	[bonifica] [numeric](7, 3) NOT NULL,
	[fechasta] [datetime] NOT NULL,
 CONSTRAINT [PK_cuerpromo] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabeprom]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerpromo]') AND name = N'idcabeprom')
CREATE NONCLUSTERED INDEX [idcabeprom] ON [dbo].[cuerpromo] 
(
	[idcabepromo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[empresa]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[empresa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[empresa](
	[id] [int] NOT NULL,
	[nombre] [char](45) NOT NULL,
	[ramo] [char](45) NOT NULL,
	[direccion] [char](30) NOT NULL,
	[cpostal] [char](8) NOT NULL,
	[localidad] [char](30) NOT NULL,
	[provincia] [char](30) NOT NULL,
	[telefono] [char](15) NOT NULL,
	[email] [char](45) NOT NULL,
	[tipoiva] [int] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[ibruto] [char](15) NOT NULL,
	[cajapre] [char](15) NOT NULL,
	[impint] [char](15) NOT NULL,
	[agenteibb] [char](15) NOT NULL,
	[tag] [char](15) NOT NULL,
	[retenedora] [numeric](1, 0) NOT NULL,
	[reteiva] [numeric](1, 0) NOT NULL,
	[psw] [char](10) NOT NULL,
	[utilidad] [numeric](1, 0) NOT NULL,
	[utisobreflete] [numeric](1, 0) NOT NULL,
	[utisobreinterno] [numeric](1, 0) NOT NULL,
	[incluyeiva] [numeric](1, 0) NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[rubroctacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rubroctacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rubroctacon](
	[id] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[idrubro] [int] NOT NULL,
	[idctavta] [int] NOT NULL,
	[idctacpra] [int] NOT NULL,
 CONSTRAINT [PK_rubroctacon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[rubroctacon]') AND name = N'idctacpra')
CREATE NONCLUSTERED INDEX [idctacpra] ON [dbo].[rubroctacon] 
(
	[idctacpra] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctavta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[rubroctacon]') AND name = N'idctavta')
CREATE NONCLUSTERED INDEX [idctavta] ON [dbo].[rubroctacon] 
(
	[idctavta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[rubroctacon]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[rubroctacon] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idrubro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[rubroctacon]') AND name = N'idrubro')
CREATE NONCLUSTERED INDEX [idrubro] ON [dbo].[rubroctacon] 
(
	[idrubro] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[rubro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[rubro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[rubro](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[recargo] [numeric](5, 2) NOT NULL,
	[idtipovta] [int] NOT NULL,
	[idtipoprod] [int] NOT NULL,
	[perceibruto] [numeric](1, 0) NOT NULL,
	[idfuerzavta] [int] NOT NULL,
	[nolista] [numeric](1, 0) NOT NULL,
	[porcecomi] [numeric](5, 3) NOT NULL,
	[porcedev] [numeric](5, 3) NOT NULL,
	[porcesuge] [numeric](5, 3) NOT NULL,
	[tasavied] [numeric](5, 3) NOT NULL,
	[tasapata] [numeric](5, 3) NOT NULL,
 CONSTRAINT [PK_rubro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[rubro]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[rubro] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[bonictacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bonictacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bonictacte](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[bonifica] [numeric](6, 2) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_bonictacte] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[bonictacte]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[bonictacte] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idproducto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[bonictacte]') AND name = N'idproducto')
CREATE NONCLUSTERED INDEX [idproducto] ON [dbo].[bonictacte] 
(
	[idproducto] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[conexion]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[conexion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[conexion](
	[id] [int] NOT NULL,
	[aliasconexion] [char](30) NULL,
	[servername] [char](60) NOT NULL,
	[initcatalogo] [char](60) NOT NULL,
	[origendata] [char](10) NOT NULL,
	[sourcetype] [char](10) NOT NULL,
	[username] [char](20) NOT NULL,
	[pwdname] [char](20) NOT NULL,
	[webservice] [char](60) NOT NULL,
	[pathdatabase] [char](60) NOT NULL,
	[sucursal] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
	[pwdlen] [numeric](2, 0) NULL,
	[userlen] [numeric](2, 0) NULL,
 CONSTRAINT [PK_conexion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[paraconfig]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paraconfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paraconfig](
	[id] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[tipocaja] [char](1) NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[pidodolar] [char](20) NOT NULL,
	[pidocosto] [char](20) NOT NULL,
	[iddeposito] [int] NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[idcomproba1] [int] NOT NULL,
	[idcomproba2] [int] NOT NULL,
	[idcomproba3] [int] NOT NULL,
	[idcomproba4] [int] NOT NULL,
	[idcomproba5] [int] NOT NULL,
	[idcomproba6] [int] NOT NULL,
	[idcomproba7] [int] NOT NULL,
	[idcomproba8] [int] NOT NULL,
	[tasa1] [numeric](6, 2) NOT NULL,
	[sobtasa1] [numeric](6, 2) NOT NULL,
	[tasa2] [numeric](6, 2) NOT NULL,
	[sobtasa2] [numeric](6, 2) NOT NULL,
	[tasa3] [numeric](6, 2) NOT NULL,
	[sobtasa3] [numeric](6, 2) NOT NULL,
	[retencion1] [numeric](6, 2) NOT NULL,
	[minreten1] [numeric](11, 3) NOT NULL,
	[retencion2] [numeric](6, 2) NOT NULL,
	[minreten2] [numeric](11, 3) NOT NULL,
	[retencion3] [numeric](6, 2) NOT NULL,
	[minreten3] [numeric](11, 3) NOT NULL,
	[retencion4] [numeric](6, 2) NOT NULL,
	[minreten4] [numeric](11, 3) NOT NULL,
	[retencion5] [numeric](6, 2) NOT NULL,
	[minreten5] [numeric](11, 3) NOT NULL,
	[talonpc1] [numeric](4, 0) NOT NULL,
	[talonma1] [numeric](4, 0) NOT NULL,
	[talonpc2] [numeric](4, 0) NOT NULL,
	[talonma2] [numeric](4, 0) NOT NULL,
	[talonpc3] [numeric](4, 0) NOT NULL,
	[talonma3] [numeric](4, 0) NOT NULL,
	[talonpc4] [numeric](4, 0) NOT NULL,
	[talonma4] [numeric](4, 0) NOT NULL,
	[talonpc5] [numeric](4, 0) NOT NULL,
	[talonma5] [numeric](4, 0) NOT NULL,
	[listadefecto] [numeric](1, 0) NOT NULL,
	[idplanpago] [int] NOT NULL,
	[idcta01] [int] NOT NULL,
	[idcta02] [int] NOT NULL,
	[idcta03] [int] NOT NULL,
	[idcta04] [int] NOT NULL,
	[idcta05] [int] NOT NULL,
	[switch] [char](20) NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[fechaserver] [datetime] NOT NULL,
	[fechafac] [datetime] NOT NULL,
	[turno] [numeric](1, 0) NOT NULL,
	[iddetafac] [int] NOT NULL,
	[diasvto] [numeric](3, 0) NOT NULL,
 CONSTRAINT [PK_paraconfig] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[sistema]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sistema]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sistema](
	[id] [int] NOT NULL,
	[programa] [char](50) NOT NULL,
	[fecha] [char](8) NOT NULL,
	[hora] [char](8) NOT NULL,
	[prioridad] [numeric](2, 0) NOT NULL,
	[idprograma] [numeric](12, 0) NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[bonivdor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bonivdor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bonivdor](
	[id] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[bonifica] [numeric](6, 3) NOT NULL,
	[diasvisita] [char](7) NOT NULL,
	[diasfactura] [char](7) NOT NULL,
 CONSTRAINT [PK_bonivdor] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[bonivdor]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[bonivdor] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[afeasto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afeasto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afeasto](
	[id] [numeric](12, 0) NOT NULL,
	[idmaoperao] [numeric](12, 0) NOT NULL,
	[idmaoperaa] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_afeasto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaoperaa]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afeasto]') AND name = N'idmaoperaa')
CREATE NONCLUSTERED INDEX [idmaoperaa] ON [dbo].[afeasto] 
(
	[idmaoperaa] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaoperao]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afeasto]') AND name = N'idmaoperao')
CREATE NONCLUSTERED INDEX [idmaoperao] ON [dbo].[afeasto] 
(
	[idmaoperao] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[precioperiodo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[precioperiodo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[precioperiodo](
	[id] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[periodo] [char](6) NOT NULL,
	[costo] [numeric](11, 3) NOT NULL,
	[costorepo] [numeric](11, 3) NOT NULL,
	[precio1] [numeric](11, 3) NOT NULL,
	[precio2] [numeric](11, 3) NOT NULL,
	[precio3] [numeric](11, 3) NOT NULL,
	[precio4] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_precioperiodo] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[precioperiodo]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[precioperiodo] 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [periodo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[precioperiodo]') AND name = N'periodo')
CREATE NONCLUSTERED INDEX [periodo] ON [dbo].[precioperiodo] 
(
	[periodo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[variedad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[variedad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[variedad](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[tag] [char](10) NOT NULL,
 CONSTRAINT [PK_variedad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[variedad]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[variedad] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[provctacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[provctacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[provctacon](
	[id] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[idctaperce] [numeric](12, 0) NOT NULL,
	[idctarete] [numeric](12, 0) NOT NULL,
	[switch] [char](5) NOT NULL,
	[idejercicio] [int] NOT NULL,
 CONSTRAINT [PK_provctacon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctaperce]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provctacon]') AND name = N'idctaperce')
CREATE NONCLUSTERED INDEX [idctaperce] ON [dbo].[provctacon] 
(
	[idctaperce] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctarete]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provctacon]') AND name = N'idctarete')
CREATE NONCLUSTERED INDEX [idctarete] ON [dbo].[provctacon] 
(
	[idctarete] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provctacon]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[provctacon] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idprovinci]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provctacon]') AND name = N'idprovinci')
CREATE NONCLUSTERED INDEX [idprovinci] ON [dbo].[provctacon] 
(
	[idprovincia] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[vendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vendedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vendedor](
	[id] [int] NOT NULL,
	[numero] [numeric](5, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[clave] [char](10) NOT NULL,
	[idctaflete] [int] NOT NULL,
	[planilla] [int] NOT NULL,
	[comision] [numeric](6, 3) NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
	[idctacomision] [int] NOT NULL,
	[idctasueldo] [int] NOT NULL,
	[prevta] [numeric](1, 0) NOT NULL,
	[idgrupocomi] [int] NOT NULL,
	[lista] [numeric](1, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[acumulavale] [numeric](13, 2) NOT NULL,
 CONSTRAINT [PK_vendedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idgrupocom]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[vendedor]') AND name = N'idgrupocom')
CREATE NONCLUSTERED INDEX [idgrupocom] ON [dbo].[vendedor] 
(
	[idgrupocomi] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[vendedor]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[vendedor] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[catectactectacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[catectactectacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[catectactectacon](
	[id] [int] NOT NULL,
	[idcatectacte] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[idctavta] [int] NOT NULL,
	[idctacpra] [int] NOT NULL,
 CONSTRAINT [PK_catectactectacon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcatectac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectactectacon]') AND name = N'idcatectac')
CREATE NONCLUSTERED INDEX [idcatectac] ON [dbo].[catectactectacon] 
(
	[idcatectacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctacpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectactectacon]') AND name = N'idctacpra')
CREATE NONCLUSTERED INDEX [idctacpra] ON [dbo].[catectactectacon] 
(
	[idctacpra] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctavta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectactectacon]') AND name = N'idctavta')
CREATE NONCLUSTERED INDEX [idctavta] ON [dbo].[catectactectacon] 
(
	[idctavta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectactectacon]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[catectactectacon] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[subproducto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[subproducto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[subproducto](
	[id] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[subnumero] [int] NOT NULL,
	[nombre] [char](25) NOT NULL,
	[codigo] [char](13) NOT NULL,
	[troquel] [char](8) NOT NULL,
	[nofactura] [numeric](1, 0) NOT NULL,
	[idvariedad] [int] NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_subproducto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [estado]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[subproducto]') AND name = N'estado')
CREATE NONCLUSTERED INDEX [estado] ON [dbo].[subproducto] 
(
	[estado] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[subproducto]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[subproducto] 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[paradiario]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paradiario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paradiario](
	[id] [int] NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[fechaserver] [datetime] NOT NULL,
	[iddetafac] [int] NOT NULL,
	[fechafac] [datetime] NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[turno] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_paradiario] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[fuerzavta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fuerzavta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fuerzavta](
	[id] [int] NOT NULL,
	[numero] [numeric](5, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_fuerzavta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fuerzavta]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[fuerzavta] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[datapvta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[datapvta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[datapvta](
	[id] [numeric](10, 0) NOT NULL,
	[sec_codacce] [char](12) NOT NULL,
	[sec_descacce] [char](20) NOT NULL,
	[sec_nivelacce] [numeric](1, 0) NOT NULL,
	[sec_promptacc] [char](45) NOT NULL,
	[sec_tipoacce] [numeric](1, 0) NOT NULL,
	[sec_doacce] [char](100) NOT NULL,
	[sec_keyacce] [char](10) NOT NULL,
	[sec_condacce] [char](30) NOT NULL,
	[sec_fontstyle] [char](30) NOT NULL,
	[sec_picture] [char](50) NOT NULL,
	[switch] [char](5) NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[tablaint]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tablaint]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tablaint](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[tasad] [numeric](11, 3) NOT NULL,
	[tasaa] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_tablaint] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaint]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[tablaint] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaint]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[tablaint] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[deposito]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[deposito]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[deposito](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[llevastock] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_deposito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[deposito]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[deposito] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cotizadolar]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cotizadolar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cotizadolar](
	[id] [int] NOT NULL,
	[fechacoti] [datetime] NOT NULL,
	[preciocpra] [numeric](11, 3) NOT NULL,
	[preciovta] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_cotizadolar] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_cotizadola1] UNIQUE NONCLUSTERED 
(
	[fechacoti] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[datamenu]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[datamenu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[datamenu](
	[id] [numeric](10, 0) NOT NULL,
	[sec_codacce] [char](12) NOT NULL,
	[sec_descacce] [char](20) NOT NULL,
	[sec_nivelacce] [numeric](1, 0) NOT NULL,
	[sec_promptacc] [char](50) NOT NULL,
	[sec_tipoacce] [numeric](1, 0) NOT NULL,
	[sec_doacce] [char](100) NOT NULL,
	[sec_keyacce] [char](10) NOT NULL,
	[sec_condacce] [char](30) NOT NULL,
	[sec_fontstyle] [char](30) NOT NULL,
	[sec_picture] [char](50) NOT NULL,
	[switch] [char](5) NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[catectacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[catectacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[catectacte](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[tasa1] [numeric](3, 2) NOT NULL,
	[tasa2] [numeric](3, 2) NOT NULL,
	[tasa3] [numeric](3, 2) NOT NULL,
	[switch] [char](5) NOT NULL,
	[secreenergia] [numeric](1, 0) NOT NULL,
	[consumoint] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_catectacte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [consumoint]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectacte]') AND name = N'consumoint')
CREATE NONCLUSTERED INDEX [consumoint] ON [dbo].[catectacte] 
(
	[consumoint] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectacte]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[catectacte] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [secreenerg]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[catectacte]') AND name = N'secreenerg')
CREATE NONCLUSTERED INDEX [secreenerg] ON [dbo].[catectacte] 
(
	[secreenergia] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[centrocosto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[centrocosto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[centrocosto](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_centrocosto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[centrocosto]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[centrocosto] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[insumos]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insumos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[insumos](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_insumos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[barrio]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[barrio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[barrio](
	[id] [numeric](12, 0) NOT NULL,
	[nombre] [char](20) NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[numero] [int] NOT NULL,
 CONSTRAINT [PK_barrio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idlocalida]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[barrio]') AND name = N'idlocalida')
CREATE NONCLUSTERED INDEX [idlocalida] ON [dbo].[barrio] 
(
	[idlocalidad] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[insumosctacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insumosctacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[insumosctacon](
	[id] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[idinsumo] [int] NOT NULL,
	[idctacpra] [int] NOT NULL,
 CONSTRAINT [PK_insumosctacon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[insumosctacon]') AND name = N'idctacpra')
CREATE NONCLUSTERED INDEX [idctacpra] ON [dbo].[insumosctacon] 
(
	[idctacpra] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[insumosctacon]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[insumosctacon] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idinsumo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[insumosctacon]') AND name = N'idinsumo')
CREATE NONCLUSTERED INDEX [idinsumo] ON [dbo].[insumosctacon] 
(
	[idinsumo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[areaneg]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[areaneg]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[areaneg](
	[id] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
	[numero] [int] NOT NULL,
	[molino] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_areaneg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[areanegctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[areanegctacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[areanegctacte](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[idarea] [int] NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_areanegctacte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarea]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[areanegctacte]') AND name = N'idarea')
CREATE NONCLUSTERED INDEX [idarea] ON [dbo].[areanegctacte] 
(
	[idarea] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[areanegctacte]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[areanegctacte] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabedeta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabedeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabedeta](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[detalle] [char](40) NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_cabedeta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[areanegrubro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[areanegrubro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[areanegrubro](
	[id] [int] NOT NULL,
	[idrubro] [int] NOT NULL,
	[idarea] [int] NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_areanegrubro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [estado]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[areanegrubro]') AND name = N'estado')
CREATE NONCLUSTERED INDEX [estado] ON [dbo].[areanegrubro] 
(
	[estado] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idarea]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[areanegrubro]') AND name = N'idarea')
CREATE NONCLUSTERED INDEX [idarea] ON [dbo].[areanegrubro] 
(
	[idarea] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idrubro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[areanegrubro]') AND name = N'idrubro')
CREATE NONCLUSTERED INDEX [idrubro] ON [dbo].[areanegrubro] 
(
	[idrubro] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipocredito]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipocredito]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipocredito](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
 CONSTRAINT [PK_tipocredito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tipocredito]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[tipocredito] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[pedipad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedipad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pedipad](
	[id] [numeric](12, 0) NOT NULL,
	[idpedido] [char](10) NOT NULL,
	[idctacte] [int] NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_pedipad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[pedipad]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[pedipad] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[pedipad]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[pedipad] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idpedido]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[pedipad]') AND name = N'idpedido')
CREATE NONCLUSTERED INDEX [idpedido] ON [dbo].[pedipad] 
(
	[idpedido] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[visitas]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[visitas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[visitas](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcliente] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[idpedido] [numeric](12, 0) NOT NULL,
	[idmotivo] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_visitas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcliente]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[visitas]') AND name = N'idcliente')
CREATE NONCLUSTERED INDEX [idcliente] ON [dbo].[visitas] 
(
	[idcliente] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[visitas]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[visitas] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmotivo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[visitas]') AND name = N'idmotivo')
CREATE NONCLUSTERED INDEX [idmotivo] ON [dbo].[visitas] 
(
	[idmotivo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idpedido]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[visitas]') AND name = N'idpedido')
CREATE NONCLUSTERED INDEX [idpedido] ON [dbo].[visitas] 
(
	[idpedido] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[visitas]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[visitas] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[motivopad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[motivopad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[motivopad](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_motivopad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[motivopad]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[motivopad] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Ruta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ruta](
	[Id] [int] NOT NULL,
	[Numero] [numeric](4, 0) NOT NULL,
	[Nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_ruta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[Ruta] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ruta]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[Ruta] 
(
	[Numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuervaricpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuervaricpra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuervaricpra](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idvariedad] [int] NOT NULL,
	[cantidad] [numeric](6, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[bonisiva] [numeric](11, 3) NOT NULL,
	[boniciva] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_cuervaricpra] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuervaricpra]') AND name = N'idcuerfac')
CREATE NONCLUSTERED INDEX [idcuerfac] ON [dbo].[cuervaricpra] 
(
	[idcuerfac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuervaricpra]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cuervaricpra] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tipoingbrutos]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipoingbrutos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipoingbrutos](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](20) NOT NULL
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [id]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tipoingbrutos]') AND name = N'id')
CREATE NONCLUSTERED INDEX [id] ON [dbo].[tipoingbrutos] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[valorctacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[valorctacon](
	[id] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[idvalor] [int] NOT NULL,
	[idctaa] [int] NOT NULL,
	[idctab] [int] NOT NULL,
	[idctac] [int] NOT NULL,
	[idctad] [int] NOT NULL,
	[idctaf] [int] NOT NULL,
	[idctak] [int] NOT NULL,
 CONSTRAINT [PK_valorctacon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctaa]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idctaa')
CREATE NONCLUSTERED INDEX [idctaa] ON [dbo].[valorctacon] 
(
	[idctaa] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctab]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idctab')
CREATE NONCLUSTERED INDEX [idctab] ON [dbo].[valorctacon] 
(
	[idctab] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idctac')
CREATE NONCLUSTERED INDEX [idctac] ON [dbo].[valorctacon] 
(
	[idctac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idctad')
CREATE NONCLUSTERED INDEX [idctad] ON [dbo].[valorctacon] 
(
	[idctad] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctaf]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idctaf')
CREATE NONCLUSTERED INDEX [idctaf] ON [dbo].[valorctacon] 
(
	[idctaf] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctak]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idctak')
CREATE NONCLUSTERED INDEX [idctak] ON [dbo].[valorctacon] 
(
	[idctak] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[valorctacon] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idvalor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valorctacon]') AND name = N'idvalor')
CREATE NONCLUSTERED INDEX [idvalor] ON [dbo].[valorctacon] 
(
	[idvalor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Rutavdor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rutavdor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rutavdor](
	[Id] [int] NOT NULL,
	[Idruta] [int] NOT NULL,
	[Idvendedor] [int] NOT NULL,
	[Switch] [char](5) NOT NULL,
	[Idfuerzavta] [int] NOT NULL,
 CONSTRAINT [PK_rutavdor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idruta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Rutavdor]') AND name = N'idruta')
CREATE NONCLUSTERED INDEX [idruta] ON [dbo].[Rutavdor] 
(
	[Idruta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Rutavdor]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[Rutavdor] 
(
	[Idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[canalvta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[canalvta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[canalvta](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[limitecred] [numeric](11, 2) NOT NULL,
	[minimofac] [numeric](11, 2) NOT NULL,
	[plazo] [numeric](3, 0) NOT NULL,
	[descuento] [numeric](6, 3) NOT NULL,
	[lista] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_canalvta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_canalvt1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[canalvta]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[canalvta] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuercpra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuercpra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuercpra](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcabeza] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[codigo] [char](8) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[cantidad] [numeric](9, 2) NOT NULL,
	[univenta] [numeric](1, 0) NOT NULL,
	[unibulto] [int] NOT NULL,
	[oricod] [char](1) NOT NULL,
	[sdocant] [numeric](9, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[precosto] [numeric](11, 3) NOT NULL,
	[precostosiva] [numeric](11, 3) NOT NULL,
	[preunita] [numeric](11, 3) NOT NULL,
	[preunitasiva] [numeric](11, 3) NOT NULL,
	[interno] [numeric](11, 3) NOT NULL,
	[tasaiva] [numeric](6, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[iddeposito] [int] NOT NULL,
	[pesable] [numeric](1, 0) NOT NULL,
	[idfrio] [int] NOT NULL,
	[bonif1] [numeric](11, 3) NOT NULL,
	[bonif2] [numeric](11, 3) NOT NULL,
	[bonif3] [numeric](11, 3) NOT NULL,
	[bonif4] [numeric](11, 3) NOT NULL,
	[importado] [numeric](1, 0) NOT NULL,
	[totalciva] [numeric](11, 3) NOT NULL,
	[totalsiva] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_cuercpra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabeza]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuercpra]') AND name = N'idcabeza')
CREATE NONCLUSTERED INDEX [idcabeza] ON [dbo].[cuercpra] 
(
	[idcabeza] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuercpra]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cuercpra] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[motanula]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[motanula]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[motanula](
	[id] [int] NOT NULL,
	[numero] [numeric](3, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_motanula] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_motanul1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[motanula]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[motanula] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuermod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuermod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuermod](
	[id] [int] NOT NULL,
	[idcabemod] [int] NOT NULL,
	[idcuenta] [int] NOT NULL,
	[cuenta] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[debehaber] [char](8) NOT NULL,
	[idclase] [int] NOT NULL,
	[nomclase] [char](30) NOT NULL,
	[tasa] [numeric](10, 3) NOT NULL,
 CONSTRAINT [PK_cuermod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [cuenta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuermod]') AND name = N'cuenta')
CREATE NONCLUSTERED INDEX [cuenta] ON [dbo].[cuermod] 
(
	[cuenta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idcabemod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuermod]') AND name = N'idcabemod')
CREATE NONCLUSTERED INDEX [idcabemod] ON [dbo].[cuermod] 
(
	[idcabemod] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idclase]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuermod]') AND name = N'idclase')
CREATE NONCLUSTERED INDEX [idclase] ON [dbo].[cuermod] 
(
	[idclase] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idcuenta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuermod]') AND name = N'idcuenta')
CREATE NONCLUSTERED INDEX [idcuenta] ON [dbo].[cuermod] 
(
	[idcuenta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Zona]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Zona](
	[Id] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Nombre] [char](30) NOT NULL,
	[Porflete] [numeric](6, 3) NOT NULL,
	[Abrevia] [char](3) NOT NULL,
 CONSTRAINT [PK_zona] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zona]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[Zona] 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zona]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[Zona] 
(
	[Numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[citicomp]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[citicomp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[citicomp](
	[id] [int] NOT NULL,
	[idcomprobante] [int] NOT NULL,
	[letra] [char](1) NOT NULL,
	[nrociti] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_citicomp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcomproba]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[citicomp]') AND name = N'idcomproba')
CREATE NONCLUSTERED INDEX [idcomproba] ON [dbo].[citicomp] 
(
	[idcomprobante] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [letra]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[citicomp]') AND name = N'letra')
CREATE NONCLUSTERED INDEX [letra] ON [dbo].[citicomp] 
(
	[letra] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabepvta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabepvta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabepvta](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcabefac] [numeric](12, 0) NOT NULL,
	[orden] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_cabepvta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabefac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepvta]') AND name = N'idcabefac')
CREATE NONCLUSTERED INDEX [idcabefac] ON [dbo].[cabepvta] 
(
	[idcabefac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepvta]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cabepvta] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [orden]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabepvta]') AND name = N'orden')
CREATE NONCLUSTERED INDEX [orden] ON [dbo].[cabepvta] 
(
	[orden] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[Zonaruta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zonaruta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Zonaruta](
	[Id] [int] NOT NULL,
	[Idzona] [int] NOT NULL,
	[Idruta] [int] NOT NULL,
	[Switch] [char](5) NOT NULL,
 CONSTRAINT [PK_zonaruta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idruta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zonaruta]') AND name = N'idruta')
CREATE NONCLUSTERED INDEX [idruta] ON [dbo].[Zonaruta] 
(
	[Idruta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idzona]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Zonaruta]') AND name = N'idzona')
CREATE NONCLUSTERED INDEX [idzona] ON [dbo].[Zonaruta] 
(
	[Idzona] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[gestion]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gestion](
	[id] [int] NOT NULL,
	[programa] [image] NOT NULL,
	[nombrezip] [char](50) NOT NULL,
	[fecha] [char](8) NOT NULL,
	[hora] [char](8) NOT NULL,
	[idprograma] [numeric](12, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[cabemod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabemod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabemod](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[idejercicio] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_cabemod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabemod]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[cabemod] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabemod]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[cabemod] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cateibrn]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cateibrn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cateibrn](
	[cuit] [char](13) NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[porperce] [numeric](6, 3) NOT NULL,
	[porrete] [numeric](6, 3) NOT NULL
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cateibrn]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[cateibrn] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[centrocostos]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[centrocostos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[centrocostos](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_centrocostos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[centrocostos]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[centrocostos] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[movctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movctacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movctacte](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[ctacte] [char](6) NOT NULL,
	[idctacte] [int] NOT NULL,
	[subnumero] [char](3) NOT NULL,
	[idsubcta] [int] NOT NULL,
	[cuota] [numeric](2, 0) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
	[saldo] [numeric](11, 2) NOT NULL,
	[entrega] [numeric](11, 2) NOT NULL,
	[vencimien] [datetime] NOT NULL,
	[total] [numeric](11, 2) NOT NULL,
	[detalle] [varchar](30) NOT NULL,
	[pefiscal] [char](6) NOT NULL,
	[switch] [char](5) NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
	[totalcuota] [int] NOT NULL,
	[diasprom] [int] NOT NULL,
	[infocbu] [numeric](1, 0) NULL,
 CONSTRAINT [PK_movctacte] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movctacte]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[movctacte] 
(
	[idctacte] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movctacte]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[movctacte] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[actividad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[actividad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[actividad](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
	[idareaneg] [int] NOT NULL,
	[libro] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_actividad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idareaneg]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[actividad]') AND name = N'idareaneg')
CREATE NONCLUSTERED INDEX [idareaneg] ON [dbo].[actividad] 
(
	[idareaneg] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[valor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[valor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[valor](
	[id] [int] NOT NULL,
	[numero] [numeric](3, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[regisa] [numeric](1, 0) NOT NULL,
	[regisb] [numeric](1, 0) NOT NULL,
	[regisd] [numeric](1, 0) NOT NULL,
	[regisf] [numeric](1, 0) NOT NULL,
	[regisc] [numeric](1, 0) NOT NULL,
	[regisk] [numeric](1, 0) NOT NULL,
	[idctaa] [int] NOT NULL,
	[idctab] [int] NOT NULL,
	[idctad] [int] NOT NULL,
	[idctaf] [int] NOT NULL,
	[idctac] [int] NOT NULL,
	[idclase] [int] NOT NULL,
	[idctabco] [int] NOT NULL,
	[idctak] [int] NOT NULL,
 CONSTRAINT [PK_valor] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_valo1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[valor]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[valor] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[camion]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[camion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[camion](
	[id] [int] NOT NULL,
	[numero] [numeric](3, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[switch] [char](5) NOT NULL,
	[patente] [char](8) NOT NULL,
	[marca] [char](20) NOT NULL,
	[color] [char](20) NOT NULL,
	[idctatransp] [int] NOT NULL,
	[tara] [numeric](4, 0) NOT NULL,
	[idchofer] [int] NOT NULL,
 CONSTRAINT [PK_camion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_camio1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idchofer]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[camion]') AND name = N'idchofer')
CREATE NONCLUSTERED INDEX [idchofer] ON [dbo].[camion] 
(
	[idchofer] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctatrans]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[camion]') AND name = N'idctatrans')
CREATE NONCLUSTERED INDEX [idctatrans] ON [dbo].[camion] 
(
	[idctatransp] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[camion]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[camion] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [patente]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[camion]') AND name = N'patente')
CREATE NONCLUSTERED INDEX [patente] ON [dbo].[camion] 
(
	[patente] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuerdeta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerdeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerdeta](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idvariedad] [int] NOT NULL,
	[detalle] [varchar](40) NOT NULL,
 CONSTRAINT [PK_cuerdeta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_cuerdet1] UNIQUE NONCLUSTERED 
(
	[idcuerfac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerdeta]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cuerdeta] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cateibba]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cateibba]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cateibba](
	[cuit] [char](13) NOT NULL,
	[porperce] [numeric](7, 3) NOT NULL,
	[porrete] [numeric](7, 3) NOT NULL,
 CONSTRAINT [PK_cateibba] PRIMARY KEY NONCLUSTERED 
(
	[cuit] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[cabecontrato]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabecontrato]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabecontrato](
	[id] [int] NOT NULL,
	[numero] [char](20) NOT NULL,
	[idctacorredor] [int] NOT NULL,
	[idctavdor] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[importe] [numeric](10, 2) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_cabecontrato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacorre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabecontrato]') AND name = N'idctacorre')
CREATE NONCLUSTERED INDEX [idctacorre] ON [dbo].[cabecontrato] 
(
	[idctacorredor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctavdor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabecontrato]') AND name = N'idctavdor')
CREATE NONCLUSTERED INDEX [idctavdor] ON [dbo].[cabecontrato] 
(
	[idctavdor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[prefijobco]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prefijobco]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[prefijobco](
	[id] [int] NOT NULL,
	[idctabco] [int] NOT NULL,
	[idcomproba] [int] NOT NULL,
	[letra] [char](1) NOT NULL,
	[idimpresora] [int] NOT NULL,
	[formulario] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nrodesde] [int] NOT NULL,
	[nrohasta] [int] NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_prefijobco] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcomproba]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prefijobco]') AND name = N'idcomproba')
CREATE NONCLUSTERED INDEX [idcomproba] ON [dbo].[prefijobco] 
(
	[idcomproba] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctabco]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[prefijobco]') AND name = N'idctabco')
CREATE NONCLUSTERED INDEX [idctabco] ON [dbo].[prefijobco] 
(
	[idctabco] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[paravario]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paravario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paravario](
	[id] [int] NOT NULL,
	[idorigen] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[importe] [numeric](13, 2) NOT NULL,
	[porce] [numeric](7, 3) NOT NULL,
	[detalle] [char](30) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[estado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_paravario] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_paravari1] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[fletero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fletero]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fletero](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[direccion] [char](25) NOT NULL,
	[telefono] [char](20) NOT NULL,
	[tipoflete] [numeric](1, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_fletero] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_fleter1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fletero]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[fletero] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fletero]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[fletero] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[comivende]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comivende]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comivende](
	[id] [int] NOT NULL,
	[idgrupo] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[porcentaje] [numeric](6, 2) NOT NULL,
	[origen] [char](1) NOT NULL,
	[objetivo1] [numeric](5, 0) NOT NULL,
	[comision1] [numeric](5, 2) NOT NULL,
	[objetivo2] [numeric](5, 0) NOT NULL,
	[comision2] [numeric](5, 2) NOT NULL,
	[objetivo3] [numeric](5, 0) NOT NULL,
	[comision3] [numeric](5, 2) NOT NULL,
 CONSTRAINT [UQ_comivend1] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comivende]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[comivende] 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idgrupo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comivende]') AND name = N'idgrupo')
CREATE NONCLUSTERED INDEX [idgrupo] ON [dbo].[comivende] 
(
	[idgrupo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[gruposcomi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gruposcomi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gruposcomi](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](40) NOT NULL,
 CONSTRAINT [UQ_gruposcom1] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[gruposcomi]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[gruposcomi] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[dcabedeta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dcabedeta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dcabedeta](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[detalle] [char](40) NOT NULL,
 CONSTRAINT [PK_dcabedeta] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_dcabedet1] UNIQUE NONCLUSTERED 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[cabefac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabefac]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabefac](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[ctacte] [char](6) NOT NULL,
	[cnombre] [char](35) NOT NULL,
	[cdireccion] [char](30) NOT NULL,
	[ctelefono] [char](15) NOT NULL,
	[cpostal] [char](8) NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[idtipoiva] [int] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[idsubcta] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idplanpago] [int] NOT NULL,
	[total] [numeric](11, 2) NOT NULL,
	[bonif1] [numeric](6, 3) NOT NULL,
	[bonif2] [numeric](6, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[idfletero] [int] NOT NULL,
	[idfuerzavta] [int] NOT NULL,
	[idrutavdor] [int] NOT NULL,
	[idcategoria] [int] NOT NULL,
	[hojaactual] [int] NOT NULL,
	[hojatotal] [int] NOT NULL,
	[idlotemaopera] [numeric](12, 0) NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
	[idfrio] [int] NOT NULL,
	[tasamuni] [numeric](1, 0) NOT NULL,
	[diferida] [numeric](1, 0) NOT NULL,
	[idtiponcredito] [int] NOT NULL,
	[rendida] [numeric](1, 0) NOT NULL,
	[iddeposito] [int] NOT NULL,
 CONSTRAINT [PK_cabefac] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_cabefa1] UNIQUE NONCLUSTERED 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabefac]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[cabefac] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabefac]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[cabefac] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idfletero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabefac]') AND name = N'idfletero')
CREATE NONCLUSTERED INDEX [idfletero] ON [dbo].[cabefac] 
(
	[idfletero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idlotemaop]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabefac]') AND name = N'idlotemaop')
CREATE NONCLUSTERED INDEX [idlotemaop] ON [dbo].[cabefac] 
(
	[idlotemaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idrutavdor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabefac]') AND name = N'idrutavdor')
CREATE NONCLUSTERED INDEX [idrutavdor] ON [dbo].[cabefac] 
(
	[idrutavdor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[moneda]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[moneda]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[moneda](
	[id] [int] NOT NULL,
	[numero] [numeric](5, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[llevadenominaciones] [numeric](1, 0) NOT NULL,
	[llevacentavos] [numeric](1, 0) NOT NULL
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [id]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[moneda]') AND name = N'id')
CREATE NONCLUSTERED INDEX [id] ON [dbo].[moneda] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[moneda]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[moneda] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[moneda]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[moneda] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[denominacion]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[denominacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[denominacion](
	[id] [int] NOT NULL,
	[idmoneda] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[orden] [int] NOT NULL,
	[valor] [numeric](9, 2) NOT NULL,
 CONSTRAINT [PK_denominacion] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmoneda]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[denominacion]') AND name = N'idmoneda')
CREATE NONCLUSTERED INDEX [idmoneda] ON [dbo].[denominacion] 
(
	[idmoneda] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[denominacion]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[denominacion] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  StoredProcedure [dbo].[Devolverid]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Devolverid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Devolverid]
@Lcalias varchar(20),
@RetValor int OUTPUT
AS
  SET NOCOUNT ON 
 SELECT @Retvalor=SCOPE_IDENTITY() FROM dbo.producto
return
' 
END
GO
/****** Objeto:  Table [dbo].[arqueo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[arqueo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[arqueo](
	[id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idfletero] [int] NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[arqueo]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[arqueo] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [id]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[arqueo]') AND name = N'id')
CREATE NONCLUSTERED INDEX [id] ON [dbo].[arqueo] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idfletero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[arqueo]') AND name = N'idfletero')
CREATE NONCLUSTERED INDEX [idfletero] ON [dbo].[arqueo] 
(
	[idfletero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[arqueo]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[arqueo] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  StoredProcedure [dbo].[NuevoIdsql]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NuevoIdsql]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[NuevoIdsql]
@Lcalias varchar(20),
@RetValor int OUTPUT,
@Valsuma int output  
AS
  SET NOCOUNT ON  
 set @retvalor=0 
 SELECT Name FROM SysObjects WHERE Name=''KEYSID'' AND Type=''U'' 
    IF @@ROWCOUNT < 1
       CREATE TABLE Keysid ( Tabla Char(20), RetValor Integer, ctipocomp char(3) )    
    SELECT Nextid FROM Keysid WHERE Tabla=@Lcalias    
 IF @@ROWCOUNT < 1    
    INSERT INTO Keysid VALUES (@Lcalias, 0, '''' )            
   UPDATE Keysid          
          SET @RetValor = Nextid = NextId + @ValSuma WHERE Tabla=@Lcalias         
 RETURN
' 
END
GO
/****** Objeto:  Table [dbo].[cbu]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cbu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cbu](
	[id] [int] NOT NULL,
	[cuit] [char](11) NOT NULL,
	[nombre] [char](40) NOT NULL,
	[tipocli] [char](20) NOT NULL,
	[estado] [char](20) NOT NULL,
	[cbu] [char](22) NOT NULL,
	[digitado] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_cbu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [cbu]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cbu]') AND name = N'cbu')
CREATE NONCLUSTERED INDEX [cbu] ON [dbo].[cbu] 
(
	[cbu] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [cuit]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cbu]') AND name = N'cuit')
CREATE NONCLUSTERED INDEX [cuit] ON [dbo].[cbu] 
(
	[cuit] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuerarqueo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerarqueo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerarqueo](
	[id] [int] NOT NULL,
	[idarqueo] [int] NOT NULL,
	[iddenominacion] [int] NOT NULL,
	[cantidad] [numeric](9, 2) NOT NULL,
	[importe] [numeric](9, 2) NOT NULL,
	[detalle] [char](30) NOT NULL,
 CONSTRAINT [PK_cuerarqueo] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarqueo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerarqueo]') AND name = N'idarqueo')
CREATE NONCLUSTERED INDEX [idarqueo] ON [dbo].[cuerarqueo] 
(
	[idarqueo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [iddenomina]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerarqueo]') AND name = N'iddenomina')
CREATE NONCLUSTERED INDEX [iddenomina] ON [dbo].[cuerarqueo] 
(
	[iddenominacion] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[afeconcilia]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afeconcilia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afeconcilia](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idmovbcocar] [numeric](12, 0) NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_afeconcilia] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afeconcilia]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[afeconcilia] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmovbcoca]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afeconcilia]') AND name = N'idmovbcoca')
CREATE NONCLUSTERED INDEX [idmovbcoca] ON [dbo].[afeconcilia] 
(
	[idmovbcocar] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[categoiva]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[categoiva]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[categoiva](
	[id] [int] NOT NULL,
	[numero] [numeric](2, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[letravta] [char](5) NOT NULL,
	[letracpra] [char](5) NOT NULL,
	[letrad] [char](1) NOT NULL,
	[letrah] [char](1) NOT NULL,
	[ivavtari] [char](1) NOT NULL,
	[ivavtarni] [char](1) NOT NULL,
	[ivavtape] [char](1) NOT NULL,
	[ivacpra] [char](1) NOT NULL,
	[abrevia] [char](3) NOT NULL,
	[fiscal] [char](1) NOT NULL,
	[tasa1] [numeric](6, 2) NOT NULL,
	[tasa2] [numeric](6, 2) NOT NULL,
 CONSTRAINT [PK_categoiva] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_categoiv1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[categoiva]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[categoiva] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[saldoresbco]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[saldoresbco]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[saldoresbco](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[saldoresumen] [numeric](15, 2) NOT NULL,
 CONSTRAINT [PK_saldoresbco] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_saldoresbc1] UNIQUE NONCLUSTERED 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[tipofrio]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipofrio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tipofrio](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[comprobante]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comprobante]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comprobante](
	[id] [int] NOT NULL,
	[numero] [numeric](3, 0) NOT NULL,
	[cnombre] [char](25) NOT NULL,
	[cabrevia] [char](6) NOT NULL,
	[clase] [char](1) NOT NULL,
	[signocta] [numeric](1, 0) NOT NULL,
	[signostock] [numeric](1, 0) NOT NULL,
	[regisa] [numeric](1, 0) NOT NULL,
	[regisb] [numeric](1, 0) NOT NULL,
	[regisd] [numeric](1, 0) NOT NULL,
	[regisf] [numeric](1, 0) NOT NULL,
	[regiss] [numeric](1, 0) NOT NULL,
	[regisc] [numeric](1, 0) NOT NULL,
	[regisk] [numeric](1, 0) NOT NULL,
	[regish] [numeric](1, 0) NOT NULL,
	[afectado] [char](30) NOT NULL,
	[libroiva] [numeric](1, 0) NOT NULL,
	[idmodelo] [numeric](10, 0) NOT NULL,
	[nroautoma] [numeric](1, 0) NOT NULL,
	[pidevalor] [numeric](1, 0) NOT NULL,
	[nrociti] [numeric](4, 0) NOT NULL,
	[switch] [char](5) NOT NULL,
	[nrosicore] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_comprobante] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_comprobant1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [cnombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comprobante]') AND name = N'cnombre')
CREATE NONCLUSTERED INDEX [cnombre] ON [dbo].[comprobante] 
(
	[cnombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nrociti]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comprobante]') AND name = N'nrociti')
CREATE NONCLUSTERED INDEX [nrociti] ON [dbo].[comprobante] 
(
	[nrociti] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nrosicore]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comprobante]') AND name = N'nrosicore')
CREATE NONCLUSTERED INDEX [nrosicore] ON [dbo].[comprobante] 
(
	[nrosicore] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[comicbro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comicbro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comicbro](
	[id] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[desde1] [numeric](10, 0) NOT NULL,
	[hasta1] [numeric](10, 0) NOT NULL,
	[porce1] [numeric](9, 2) NOT NULL,
	[desde2] [numeric](10, 0) NOT NULL,
	[hasta2] [numeric](10, 0) NOT NULL,
	[porce2] [numeric](9, 2) NOT NULL,
	[desde3] [numeric](10, 0) NOT NULL,
	[hasta3] [numeric](10, 0) NOT NULL,
	[porce3] [numeric](9, 2) NOT NULL,
	[desde4] [numeric](10, 0) NOT NULL,
	[hasta4] [numeric](10, 0) NOT NULL,
	[porce4] [numeric](9, 2) NOT NULL,
	[desde5] [numeric](10, 0) NOT NULL,
	[hasta5] [numeric](10, 0) NOT NULL,
	[porce5] [numeric](9, 2) NOT NULL,
 CONSTRAINT [PK_comicbro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comicbro]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[comicbro] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tiponcredito]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tiponcredito]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tiponcredito](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[comivta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comivta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comivta](
	[id] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[porceconta] [numeric](10, 3) NOT NULL,
	[porcecta] [numeric](10, 3) NOT NULL,
	[baseconta] [char](1) NOT NULL,
	[basecta] [char](1) NOT NULL,
	[desde1] [numeric](10, 0) NOT NULL,
	[hasta1] [numeric](10, 0) NOT NULL,
	[porce1] [numeric](9, 2) NOT NULL,
	[desde2] [numeric](10, 0) NOT NULL,
	[hasta2] [numeric](10, 0) NOT NULL,
	[porce2] [numeric](9, 2) NOT NULL,
	[desde3] [numeric](10, 0) NOT NULL,
	[hasta3] [numeric](10, 0) NOT NULL,
	[porce3] [numeric](9, 2) NOT NULL,
	[desde4] [numeric](10, 0) NOT NULL,
	[hasta4] [numeric](10, 0) NOT NULL,
	[porce4] [numeric](9, 2) NOT NULL,
	[desde5] [numeric](10, 0) NOT NULL,
	[hasta5] [numeric](10, 0) NOT NULL,
	[porce5] [numeric](9, 2) NOT NULL,
 CONSTRAINT [PK_comivta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:26 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[comivta]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[comivta] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[gamabase]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[gamabase]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[gamabase](
	[id] [int] NOT NULL,
	[idcatectacte] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
	[idsubproducto] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[localidad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[localidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[localidad](
	[id] [int] NOT NULL,
	[cpostal] [char](10) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[idprovincia] [int] NOT NULL,
 CONSTRAINT [PK_localidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [cnombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[localidad]') AND name = N'cnombre')
CREATE NONCLUSTERED INDEX [cnombre] ON [dbo].[localidad] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [cpostal]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[localidad]') AND name = N'cpostal')
CREATE NONCLUSTERED INDEX [cpostal] ON [dbo].[localidad] 
(
	[cpostal] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[emaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emaopera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emaopera](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idareaneg] [int] NOT NULL,
	[oblealp] [char](14) NOT NULL,
	[idactividad] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
 CONSTRAINT [PK_extmaopera] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_extmaopera] UNIQUE NONCLUSTERED 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idareaneg]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[emaopera]') AND name = N'idareaneg')
CREATE NONCLUSTERED INDEX [idareaneg] ON [dbo].[emaopera] 
(
	[idareaneg] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[seguridad]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[seguridad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[seguridad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idperfil] [numeric](10, 0) NOT NULL,
	[idmenu] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_seguridad] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmenu]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[seguridad]') AND name = N'idmenu')
CREATE NONCLUSTERED INDEX [idmenu] ON [dbo].[seguridad] 
(
	[idmenu] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idperfil]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[seguridad]') AND name = N'idperfil')
CREATE NONCLUSTERED INDEX [idperfil] ON [dbo].[seguridad] 
(
	[idperfil] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[alertas]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[alertas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[alertas](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[leido] [numeric](1, 0) NOT NULL,
	[detalle] [text] NOT NULL,
	[switch] [char](5) NULL,
 CONSTRAINT [PK_alertas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[alertas]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[alertas] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[alertas]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[alertas] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [leido]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[alertas]') AND name = N'leido')
CREATE NONCLUSTERED INDEX [leido] ON [dbo].[alertas] 
(
	[leido] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabetransp]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabetransp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabetransp](
	[id] [int] NOT NULL,
	[idcabefac] [numeric](12, 0) NOT NULL,
	[idctatransp] [int] NOT NULL,
	[idcamion] [int] NOT NULL,
	[idchofer] [int] NOT NULL,
	[nombre] [char](50) NOT NULL,
	[nomchofer] [char](50) NOT NULL,
	[nomcamion] [char](50) NOT NULL,
 CONSTRAINT [PK_cabetransp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabefac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabetransp]') AND name = N'idcabefac')
CREATE NONCLUSTERED INDEX [idcabefac] ON [dbo].[cabetransp] 
(
	[idcabefac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idcamion]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabetransp]') AND name = N'idcamion')
CREATE NONCLUSTERED INDEX [idcamion] ON [dbo].[cabetransp] 
(
	[idcamion] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idchofer]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabetransp]') AND name = N'idchofer')
CREATE NONCLUSTERED INDEX [idchofer] ON [dbo].[cabetransp] 
(
	[idchofer] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idctatrans]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabetransp]') AND name = N'idctatrans')
CREATE NONCLUSTERED INDEX [idctatrans] ON [dbo].[cabetransp] 
(
	[idctatransp] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[movcaja]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movcaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movcaja](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[tablaori] [char](4) NOT NULL,
	[clase] [char](1) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
	[detalle] [varchar](30) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idvalor] [int] NOT NULL,
 CONSTRAINT [PK_movcaja] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movcaja]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[movcaja] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movcaja]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[movcaja] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cateprod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cateprod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cateprod](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_cateprod] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_catepro1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cateprod]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[cateprod] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ctactectacon]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ctactectacon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ctactectacon](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[idctavta] [int] NOT NULL,
	[idctacpra] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
 CONSTRAINT [PK_ctactectacon] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[estprodu]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[estprodu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[estprodu](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_estprodu] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_estprod1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[estprodu]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[estprodu] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabeinteres]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabeinteres]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabeinteres](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idctacte] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_cabeinteres] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeinteres]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[cabeinteres] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeinteres]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cabeinteres] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ctactemod]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ctactemod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ctactemod](
	[id] [int] NOT NULL,
	[idctacte] [int] NOT NULL,
	[idmodelo] [int] NOT NULL,
	[idejercicio] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_ctactemod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctactemod]') AND name = N'idctacte')
CREATE NONCLUSTERED INDEX [idctacte] ON [dbo].[ctactemod] 
(
	[idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctactemod]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[ctactemod] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmodelo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctactemod]') AND name = N'idmodelo')
CREATE NONCLUSTERED INDEX [idmodelo] ON [dbo].[ctactemod] 
(
	[idmodelo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[dcuervari]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dcuervari]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dcuervari](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idvariedad] [int] NOT NULL,
	[cantidad] [numeric](6, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [id]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dcuervari]') AND name = N'id')
CREATE NONCLUSTERED INDEX [id] ON [dbo].[dcuervari] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idcuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dcuervari]') AND name = N'idcuerfac')
CREATE NONCLUSTERED INDEX [idcuerfac] ON [dbo].[dcuervari] 
(
	[idcuerfac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[dcuervari]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[dcuervari] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabecartel]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabecartel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabecartel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[detalle] [text] NOT NULL,
 CONSTRAINT [PK_cabecartel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[percerubro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[percerubro]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[percerubro](
	[id] [int] NOT NULL,
	[idrubro] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_percerubro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idprovinci]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[percerubro]') AND name = N'idprovinci')
CREATE NONCLUSTERED INDEX [idprovinci] ON [dbo].[percerubro] 
(
	[idprovincia] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idrubro]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[percerubro]') AND name = N'idrubro')
CREATE NONCLUSTERED INDEX [idrubro] ON [dbo].[percerubro] 
(
	[idrubro] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[planpago]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[planpago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[planpago](
	[id] [int] NOT NULL,
	[numero] [char](3) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[idvalor] [int] NOT NULL,
	[dias] [char](19) NOT NULL,
	[tasa] [numeric](6, 3) NOT NULL,
	[codigo] [int] NOT NULL,
 CONSTRAINT [PK_planpago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_planpag1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[planpago]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[planpago] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[perceproducto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perceproducto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perceproducto](
	[id] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_perceproducto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[perceproducto]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[perceproducto] 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idprovinci]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[perceproducto]') AND name = N'idprovinci')
CREATE NONCLUSTERED INDEX [idprovinci] ON [dbo].[perceproducto] 
(
	[idprovincia] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[seteotermi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[seteotermi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[seteotermi](
	[id] [int] NOT NULL,
	[numero] [numeric](3, 0) NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[sector] [numeric](2, 0) NOT NULL,
	[puestocaja] [numeric](3, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[modpvta] [numeric](1, 0) NOT NULL,
	[grapmod] [numeric](1, 0) NOT NULL,
	[facsstock] [numeric](1, 0) NOT NULL,
	[facsdto] [numeric](1, 0) NOT NULL,
	[fecharec] [numeric](1, 0) NOT NULL,
	[anugentil] [numeric](1, 0) NOT NULL,
	[termiactiva] [numeric](1, 0) NOT NULL,
	[puestoactivo] [numeric](1, 0) NOT NULL,
	[puestospooler] [numeric](1, 0) NOT NULL,
	[serialdisk] [nchar](15) NULL,
 CONSTRAINT [PK_seteotermi] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_seteoterm1] UNIQUE NONCLUSTERED 
(
	[sucursal] ASC,
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[seteotermi]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[seteotermi] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[anmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[anmaopera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[anmaopera](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idafecta] [numeric](12, 0) NOT NULL,
	[detalle] [char](40) NOT NULL,
	[idmotanula] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_anmaopera] PRIMARY KEY NONCLUSTERED 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_anmaoper1] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idafecta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[anmaopera]') AND name = N'idafecta')
CREATE NONCLUSTERED INDEX [idafecta] ON [dbo].[anmaopera] 
(
	[idafecta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmotanula]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[anmaopera]') AND name = N'idmotanula')
CREATE NONCLUSTERED INDEX [idmotanula] ON [dbo].[anmaopera] 
(
	[idmotanula] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[usuarios]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[usuarios](
	[id] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
	[password] [char](10) NOT NULL,
	[idperfil] [numeric](10, 0) NOT NULL,
	[switch] [char](5) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idperfil]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[usuarios]') AND name = N'idperfil')
CREATE NONCLUSTERED INDEX [idperfil] ON [dbo].[usuarios] 
(
	[idperfil] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[usuarios]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[usuarios] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[idasociado]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[idasociado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[idasociado](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idpadre] [numeric](12, 0) NOT NULL,
	[idhijo] [numeric](12, 0) NOT NULL,
	[origen] [char](4) NOT NULL,
 CONSTRAINT [PK_idasociado] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_idasociad1] UNIQUE NONCLUSTERED 
(
	[idhijo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[idasociado]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[idasociado] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idpadre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[idasociado]') AND name = N'idpadre')
CREATE NONCLUSTERED INDEX [idpadre] ON [dbo].[idasociado] 
(
	[idpadre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[ctacte]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ctacte](
	[id] [int] NOT NULL,
	[cnumero] [char](6) NOT NULL,
	[cnombre] [char](40) NOT NULL,
	[cdireccion] [char](30) NOT NULL,
	[cpostal] [char](8) NOT NULL,
	[idlocalidad] [int] NOT NULL,
	[idprovincia] [int] NOT NULL,
	[ctelefono2] [char](20) NOT NULL,
	[ctelefono] [char](20) NOT NULL,
	[email] [char](40) NOT NULL,
	[tipoiva] [int] NOT NULL,
	[cuit] [char](13) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[ctadeudor] [numeric](1, 0) NOT NULL,
	[ctaacreedor] [numeric](1, 0) NOT NULL,
	[ctalogistica] [numeric](1, 0) NOT NULL,
	[ctabanco] [numeric](1, 0) NOT NULL,
	[ctaotro] [numeric](1, 0) NOT NULL,
	[ctaorden] [numeric](1, 0) NOT NULL,
	[idplanpago] [int] NOT NULL,
	[idcanalvta] [int] NOT NULL,
	[fechalta] [datetime] NOT NULL,
	[observa] [text] NOT NULL,
	[saldo] [numeric](8, 2) NOT NULL,
	[saldoant] [numeric](8, 2) NOT NULL,
	[estadocta] [numeric](1, 0) NOT NULL,
	[bonif1] [numeric](5, 3) NOT NULL,
	[bonif2] [numeric](5, 3) NOT NULL,
	[copiatkt] [numeric](2, 0) NOT NULL,
	[inscri01] [char](15) NOT NULL,
	[fecins01] [datetime] NOT NULL,
	[inscri02] [char](15) NOT NULL,
	[inscri03] [char](15) NOT NULL,
	[convenio] [numeric](6, 3) NOT NULL,
	[saldoauto] [numeric](8, 2) NOT NULL,
	[idbarrio] [int] NOT NULL,
	[lista] [int] NOT NULL,
	[idcateibrng] [int] NOT NULL,
	[ingbrutos] [char](13) NOT NULL,
	[comision] [numeric](6, 3) NOT NULL,
	[fecultcompra] [datetime] NOT NULL,
	[fecultpago] [datetime] NOT NULL,
	[numdoc] [char](15) NOT NULL,
	[idtipodoc] [int] NOT NULL,
	[existeibto] [numeric](1, 0) NOT NULL,
	[existegan] [numeric](1, 0) NOT NULL,
	[diasvto] [numeric](3, 0) NOT NULL,
	[idtablaint] [int] NOT NULL,
	[esrecodevol] [numeric](1, 0) NOT NULL,
	[totalizabonif] [numeric](1, 0) NOT NULL,
	[imporflete] [numeric](5, 2) NULL,
	[internobonif] [numeric](1, 0) NULL,
	[infocbu] [numeric](1, 0) NULL,
 CONSTRAINT [PK_ctacte] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

/****** Objeto:  Index [cnombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'cnombre')
CREATE NONCLUSTERED INDEX [cnombre] ON [dbo].[ctacte] 
(
	[cnombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [cnumero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'cnumero')
CREATE NONCLUSTERED INDEX [cnumero] ON [dbo].[ctacte] 
(
	[cnumero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [ctaacreedo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'ctaacreedo')
CREATE NONCLUSTERED INDEX [ctaacreedo] ON [dbo].[ctacte] 
(
	[ctaacreedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [ctabanco]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'ctabanco')
CREATE NONCLUSTERED INDEX [ctabanco] ON [dbo].[ctacte] 
(
	[ctabanco] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [ctadeudor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'ctadeudor')
CREATE NONCLUSTERED INDEX [ctadeudor] ON [dbo].[ctacte] 
(
	[ctadeudor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [ctalogisti]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'ctalogisti')
CREATE NONCLUSTERED INDEX [ctalogisti] ON [dbo].[ctacte] 
(
	[ctalogistica] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [ctaorden]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'ctaorden')
CREATE NONCLUSTERED INDEX [ctaorden] ON [dbo].[ctacte] 
(
	[ctaorden] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [esrecodevo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'esrecodevo')
CREATE NONCLUSTERED INDEX [esrecodevo] ON [dbo].[ctacte] 
(
	[esrecodevol] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [estadocta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'estadocta')
CREATE NONCLUSTERED INDEX [estadocta] ON [dbo].[ctacte] 
(
	[estadocta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idtipodoc]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'idtipodoc')
CREATE NONCLUSTERED INDEX [idtipodoc] ON [dbo].[ctacte] 
(
	[idtipodoc] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [totalizabo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ctacte]') AND name = N'totalizabo')
CREATE NONCLUSTERED INDEX [totalizabo] ON [dbo].[ctacte] 
(
	[totalizabonif] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[afecontrato]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[afecontrato]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[afecontrato](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcabecontrato] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
	[importe] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_afecontrato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabecont]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afecontrato]') AND name = N'idcabecont')
CREATE NONCLUSTERED INDEX [idcabecont] ON [dbo].[afecontrato] 
(
	[idcabecontrato] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[afecontrato]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[afecontrato] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[fleteren]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fleteren]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[fleteren](
	[id] [int] NOT NULL,
	[idfletero] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_fleteren] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idfletero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fleteren]') AND name = N'idfletero')
CREATE NONCLUSTERED INDEX [idfletero] ON [dbo].[fleteren] 
(
	[idfletero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[fleteren]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[fleteren] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[renmaope]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[renmaope]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[renmaope](
	[id] [numeric](12, 0) NOT NULL,
	[idfleteren] [int] NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_renmaope] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idfleteren]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renmaope]') AND name = N'idfleteren')
CREATE NONCLUSTERED INDEX [idfleteren] ON [dbo].[renmaope] 
(
	[idfleteren] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renmaope]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[renmaope] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[seteoparam]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[seteoparam]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[seteoparam](
	[id] [int] NOT NULL,
	[nombre] [char](30) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[cvalor] [char](20) NOT NULL,
	[descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_seteoparam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[renflete]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[renflete]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[renflete](
	[id] [int] NOT NULL,
	[idfleteren] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[clase] [char](4) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
 CONSTRAINT [PK_renflete] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idfleteren]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[renflete]') AND name = N'idfleteren')
CREATE NONCLUSTERED INDEX [idfleteren] ON [dbo].[renflete] 
(
	[idfleteren] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[maopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maopera]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[maopera](
	[id] [numeric](12, 0) NOT NULL,
	[origen] [char](3) NOT NULL,
	[programa] [char](15) NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[terminal] [numeric](3, 0) NOT NULL,
	[sector] [numeric](2, 0) NOT NULL,
	[fechasis] [datetime] NOT NULL,
	[idoperador] [int] NOT NULL,
	[idvendedor] [int] NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[idcomproba] [int] NOT NULL,
	[numcomp] [char](13) NOT NULL,
	[clasecomp] [char](1) NOT NULL,
	[turno] [numeric](2, 0) NOT NULL,
	[puestocaja] [numeric](3, 0) NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[switch] [char](5) NOT NULL,
	[estado] [char](1) NOT NULL,
	[detalle] [varchar](40) NOT NULL,
	[fechaserver] [datetime] NOT NULL,
 CONSTRAINT [PK_maopera] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fechasis]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[maopera]') AND name = N'fechasis')
CREATE NONCLUSTERED INDEX [fechasis] ON [dbo].[maopera] 
(
	[fechasis] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idvendedor]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[maopera]') AND name = N'idvendedor')
CREATE NONCLUSTERED INDEX [idvendedor] ON [dbo].[maopera] 
(
	[idvendedor] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [origen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[maopera]') AND name = N'origen')
CREATE NONCLUSTERED INDEX [origen] ON [dbo].[maopera] 
(
	[origen] ASC,
	[clasecomp] ASC,
	[estado] ASC,
	[numcomp] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[perfiles]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[perfiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[perfiles](
	[id] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
	[switch] [char](10) NULL
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [id]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[perfiles]') AND name = N'id')
CREATE NONCLUSTERED INDEX [id] ON [dbo].[perfiles] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuerfac]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuerfac](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcabeza] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[codigo] [char](8) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[cantidad] [numeric](9, 3) NOT NULL,
	[univenta] [numeric](1, 0) NOT NULL,
	[unibulto] [int] NOT NULL,
	[oricod] [char](1) NOT NULL,
	[sdocant] [numeric](9, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[listaprecio] [numeric](1, 0) NOT NULL,
	[precosto] [numeric](11, 3) NOT NULL,
	[precostosiva] [numeric](11, 3) NOT NULL,
	[preunita] [numeric](11, 3) NOT NULL,
	[preunitasiva] [numeric](11, 3) NOT NULL,
	[prearti] [numeric](11, 3) NOT NULL,
	[preartisiva] [numeric](11, 3) NOT NULL,
	[interno] [numeric](11, 3) NOT NULL,
	[despor] [numeric](6, 3) NOT NULL,
	[tasaiva] [numeric](6, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[iddeposito] [int] NOT NULL,
	[espromocion] [numeric](1, 0) NOT NULL,
	[perceibruto] [numeric](1, 0) NOT NULL,
	[escambio] [numeric](1, 0) NOT NULL,
	[oferfecha] [datetime] NOT NULL,
	[oferbonif] [numeric](6, 3) NOT NULL,
	[oferbonifcant] [numeric](11, 3) NOT NULL,
	[idfrio] [int] NOT NULL,
	[pesable] [numeric](1, 0) NOT NULL,
	[importado] [numeric](1, 0) NOT NULL,
	[boniciva] [numeric](14, 8) NOT NULL,
	[bonisiva] [numeric](14, 8) NOT NULL,
	[totalciva] [numeric](11, 3) NOT NULL,
	[totalsiva] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_cuerfac] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcabeza]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerfac]') AND name = N'idcabeza')
CREATE NONCLUSTERED INDEX [idcabeza] ON [dbo].[cuerfac] 
(
	[idcabeza] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuerfac]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cuerfac] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tablaasi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tablaasi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tablaasi](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[tablaori] [char](4) NOT NULL,
	[idcuenta] [int] NOT NULL,
	[tipoconce] [char](2) NOT NULL,
	[debehaber] [char](1) NOT NULL,
	[importe] [numeric](11, 2) NOT NULL,
	[detalle] [varchar](40) NOT NULL,
 CONSTRAINT [PK_tablaasi] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaasi]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[tablaasi] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaasi]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[tablaasi] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[movpub]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movpub]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movpub](
	[id] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[origen] [char](4) NOT NULL,
	[fechasis] [datetime] NOT NULL,
	[programa] [char](15) NOT NULL,
	[terminal] [numeric](3, 0) NOT NULL,
	[idoperador] [int] NOT NULL,
	[iddetanrocaja] [int] NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[idcotizadolar] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[neto] [numeric](11, 2) NOT NULL,
	[debe] [numeric](11, 2) NOT NULL,
	[haber] [numeric](11, 2) NOT NULL,
	[gastos] [numeric](11, 2) NOT NULL,
	[impuestos] [numeric](11, 2) NOT NULL,
	[sueldos] [numeric](11, 2) NOT NULL,
	[comisiones] [numeric](11, 2) NOT NULL,
	[concepto] [char](4) NOT NULL,
	[detalle] [varchar](30) NOT NULL,
	[periodo] [char](6) NOT NULL,
	[switch] [char](5) NOT NULL,
 CONSTRAINT [PK_movpub] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movpub]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[movpub] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[tablaimp]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tablaimp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tablaimp](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[tablaori] [char](4) NOT NULL,
	[idasiento] [numeric](12, 0) NOT NULL,
	[idcuenta] [int] NOT NULL,
	[tipoconce] [char](2) NOT NULL,
	[importe] [numeric](11, 3) NOT NULL,
	[tasa] [numeric](9, 6) NOT NULL,
	[baseimp] [numeric](11, 3) NOT NULL,
	[nombre] [char](10) NOT NULL,
	[detalle] [varchar](30) NOT NULL,
	[idprovincia] [int] NOT NULL,
 CONSTRAINT [PK_tablaimp] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idasiento]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaimp]') AND name = N'idasiento')
CREATE NONCLUSTERED INDEX [idasiento] ON [dbo].[tablaimp] 
(
	[idasiento] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaimp]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[tablaimp] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tablaimp]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[tablaimp] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cabeasi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cabeasi](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idejercicio] [int] NOT NULL,
	[numero] [numeric](12, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tipoasi] [char](1) NOT NULL,
	[detalle] [char](40) NOT NULL,
	[fechacarga] [datetime] NOT NULL,
	[estado] [numeric](1, 0) NULL,
	[switch] [char](5) NULL,
 CONSTRAINT [PK_cabeasi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[cabeasi] 
(
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [fechacarga]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND name = N'fechacarga')
CREATE NONCLUSTERED INDEX [fechacarga] ON [dbo].[cabeasi] 
(
	[fechacarga] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idejercici]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND name = N'idejercici')
CREATE NONCLUSTERED INDEX [idejercici] ON [dbo].[cabeasi] 
(
	[idejercicio] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cabeasi] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [numero]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND name = N'numero')
CREATE NONCLUSTERED INDEX [numero] ON [dbo].[cabeasi] 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [tipoasi]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cabeasi]') AND name = N'tipoasi')
CREATE NONCLUSTERED INDEX [tipoasi] ON [dbo].[cabeasi] 
(
	[tipoasi] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Trigger [dbo].[tr_verificar_renumeracion_asientos]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_verificar_renumeracion_asientos]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Gabriel Guerrero>
-- Create date: <22-03-2010>
-- Description:	<Verifica si hay que renumerar asientos y marca el flag correspondiente>
-- Modificado : <30-04-2010 Marcos V. Sacamos el id del NuevoidSql>
-- =============================================
CREATE TRIGGER [dbo].[tr_verificar_renumeracion_asientos] ON [dbo].[cabeasi] 
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @Pestado int
	Declare @id int
	select @Pestado = p.estado from paravario p where nombre=''RENUASI''
	IF @@ROWCOUNT < 1   
	Begin		
		--select @ID = isnull(max(p.id),0) from paravario p 
		--insert into paravario (id,nombre,estado,idorigen,importe,porce,detalle,fecha) 
		--values (@id+1,''RENUASI'',0,0,0,0,''FLAG ASIENTOS BALANCEADOS'',getdate())
		DECLARE @Tabla varchar(50);
		DECLARE @Incremento int;
		SET @Tabla = ''PARAVARIO''
		SET @Incremento = 1
		SET @Id = 0
		EXECUTE NuevoIdSQL @Tabla,  @Id output ,@Incremento
		insert into paravario (id,nombre,estado,idorigen,importe,porce,detalle,fecha) 
		values (@id,''RENUASI'',0,0,0,0,''FLAG ASIENTOS BALANCEADOS'',getdate())
		set @Pestado=0
	End
	if @Pestado=0
	Begin
		Declare CursorAsientos Cursor For
		select i.fecha from inserted i 
		Open CursorAsientos
		-- DECLARAR VARIABLES
		
		Declare @fecha datetime
		Declare @hay int

		-- RECORRER EL CURSOR
		Fetch Next From CursorAsientos
		Into @fecha
		-- Miramos que la instrucción FETCH se ejecutó correctamente.

		while @@FETCH_STATUS = 0
		Begin		
			-- Verificar si hay una fecha superior		
			select @hay = count(c.id) from cabeasi C where c.fecha>@fecha
			if @hay <>0
			begin           
				UPDATE paravario set estado=1 where nombre=''RENUASI''
			end

			-- Recuperamos la siguiente fila
			Fetch Next From CursorAsientos
			Into @fecha
					
		End 

		-- Cerramos el cursor
		Close CursorAsientos

		-- Quita la referencia al cursor y el SQL Server libera la
		-- estructura de datos ocupada por el cursor.
		Deallocate CursorAsientos

	End
    

END


' 
GO
/****** Objeto:  Table [dbo].[cuervari]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuervari]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuervari](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idvariedad] [int] NOT NULL,
	[cantidad] [numeric](9, 3) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[escambio] [numeric](1, 0) NOT NULL,
	[bonisiva] [numeric](11, 3) NOT NULL,
	[boniciva] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_cuervari] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuervari]') AND name = N'idcuerfac')
CREATE NONCLUSTERED INDEX [idcuerfac] ON [dbo].[cuervari] 
(
	[idcuerfac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuervari]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[cuervari] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cateibrng]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cateibrng]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cateibrng](
	[id] [int] NOT NULL,
	[nombre] [char](20) NOT NULL,
	[numero] [int] NOT NULL,
	[porperce] [numeric](6, 3) NOT NULL,
	[porrete] [numeric](6, 3) NOT NULL,
 CONSTRAINT [PK_cateibrng] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[movstock]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[movstock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[movstock](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[codigo] [char](8) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[iddeposito] [int] NOT NULL,
	[cantidad] [numeric](9, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
	[importe] [numeric](11, 3) NOT NULL,
	[switch] [char](5) NOT NULL,
	[signo] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK_movstock] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movstock]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[movstock] 
(
	[idarticulo] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idmaopera]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movstock]') AND name = N'idmaopera')
CREATE NONCLUSTERED INDEX [idmaopera] ON [dbo].[movstock] 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idorigen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[movstock]') AND name = N'idorigen')
CREATE NONCLUSTERED INDEX [idorigen] ON [dbo].[movstock] 
(
	[idorigen] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[cuervariord]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cuervariord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cuervariord](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
	[idarticulo] [int] NOT NULL,
	[idsubarti] [int] NOT NULL,
	[idvariedad] [int] NOT NULL,
	[cantidad] [numeric](6, 2) NOT NULL,
	[kilos] [numeric](9, 3) NOT NULL,
	[volumen] [numeric](9, 3) NOT NULL,
 CONSTRAINT [PK_cuervariord] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [idcuerfac]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cuervariord]') AND name = N'idcuerfac')
CREATE NONCLUSTERED INDEX [idcuerfac] ON [dbo].[cuervariord] 
(
	[idcuerfac] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[forma]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[forma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[forma](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_forma] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_form1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[forma]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[forma] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[CTACTEFLETE]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTACTEFLETE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CTACTEFLETE](
	[Id] [int] NOT NULL,
	[Idctacte] [int] NOT NULL,
	[Importe] [numeric](11, 3) NOT NULL,
 CONSTRAINT [PK_ctacteflete] PRIMARY KEY CLUSTERED 
(
	[Idctacte] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ctacteflet1] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Objeto:  Table [dbo].[origen]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[origen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[origen](
	[id] [int] NOT NULL,
	[numero] [numeric](4, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
 CONSTRAINT [PK_origen] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_orige1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[origen]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[origen] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  Table [dbo].[maopecomp]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maopecomp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[maopecomp](
	[id] [numeric](12, 0) NOT NULL,
	[idmaopera] [numeric](12, 0) NOT NULL,
	[switch] [char](20) NOT NULL,
 CONSTRAINT [PK_maopecomp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_maopecom1] UNIQUE NONCLUSTERED 
(
	[idmaopera] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [switch]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[maopecomp]') AND name = N'switch')
CREATE NONCLUSTERED INDEX [switch] ON [dbo].[maopecomp] 
(
	[switch] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** Objeto:  StoredProcedure [dbo].[Renumerasto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Renumerasto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'






CREATE PROCEDURE [dbo].[Renumerasto]
@lnidejercicio int
AS
  SET NOCOUNT ON  
  
--  declare @id numeric(12)
--  declare @lnnumero int
--  declare @inc int
--  Declare @linea VarChar(1000)
--	declare CsrCabeAsi scroll Cursor 
--	For select id,numero from cabeasi where idejercicio=@lnidejercicio order by fecha,tipoasi,id

	--buscamos el ultimo id de la consulta
--	open CsrCabeasi
--	set @inc=0
--	fetch next from Csrcabeasi into @id,@lnnumero
--	while @@FETCH_STATUS = 0
--	begin	
--		select @inc=@inc+1	
--		set @linea=cast(@inc as varchar(100))
--		RAISERROR (''Lineas %s '',10,1,@linea) with nowait
--		update cabeasi set numero=@inc where id=@id 
--		fetch next from Csrcabeasi into @id,@lnnumero
--	end
--	close CsrCabeasi
--	DEALLOCATE CsrCabeasi

--declare @lnnumero int
--set @lnnumero=0
--update cabeasi set numero = 0
--update cabeasi set @lnnumero = numero = numero + 1 + @lnnumero from (select top(1000000) * from cabeasi where idejercicio=@lnidejercicio order by fecha,tipoasi,id) cabeasi



WITH Ca AS
(
SELECT *, ROW_NUMBER() OVER(ORDER BY fecha,tipoasi,id) AS RowNum FROM cabeasi where idejercicio=@lnidejercicio
)

update ca set numero =  Rownum 
UPDATE paravario set estado=0 where nombre=''RENUASI''
' 
END
GO
/****** Objeto:  StoredProcedure [dbo].[ActualizarID]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActualizarID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Marcos Villarreal
-- Create date: 15/10/2009
-- Description:	Actualiza la tabla keysid desdes de alguna importacion
-- Modified date: 05/01/2011
-- Modified Descp.: Agregamos a la consulta [*]	 que obtiene el id maximo
--    el caso que el id no tiene sucursal tiene que ser menor al sucursal+id
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarID]
@lnSucursal int	

AS
BEGIN
	SET NOCOUNT ON;
	declare @id numeric (12,0),@tabla varchar(20),@campo varchar(20),@tablaseek varchar(20),
	 @message varchar(80), @lcid varchar(15), @idmin numeric(12,0),@nlenid int;
	
	print(''Sucursal Numero'')
	print @lnSucursal

	declare CsrKeysid  cursor for
	SELECT table_name,column_name FROM information_schema.columns WHERE column_default IS NULL
	AND table_name <> ''sysdiagrams''
	and column_name=''id'' order by table_name
	OPEN CsrKeysid

	fetch next from CsrKeysid into @tablaseek,@campo
	SELECT Name FROM SysObjects WHERE Name=''KEYSID'' AND Type=''U'' 
	IF @@ROWCOUNT < 1
		CREATE TABLE Keysid ( Tabla Char(20), Nextid Integer, ctipocomp char(3) )    
	delete from Keysid
	--print @tablaseek
	--print  @id
	while @@FETCH_STATUS=0
		begin 
			print @tablaseek
			--Recuperamos el max id de la tabla que buscamos
			DECLARE @IntVariable numeric(12);
			DECLARE @SQLString nvarchar(500);
			DECLARE @ParmDefinition nvarchar(500);
			DECLARE @max_title varchar(30);
			DECLARE @IntVariableMin numeric(12);
			declare @Tama int;
			declare @SucursalMin numeric (12);
			declare @SucursalMax numeric (12);
			set @SucursalMin = 0
			set @SucursalMax = 0

			SET @SQLString = N''SELECT @length = length FROM SYSCOLUMNS WHERE ID =OBJECT_ID(''''''+@tablaseek+'''''') AND NAME=''''ID''''''
			SET @ParmDefinition =  N'' @length int OUTPUT''
			EXECUTE 	SP_EXECUTESQL @SQLString, @ParmDefinition, @length = @Tama OUTPUT;
			
			--Mascaras con la sucursal incrustada segun el tamaño numerico
			if @Tama = 4
				begin
				set @Tama = 10
				SET @SucursalMin =  (@lnsucursal+10)*100000000
				SET @SucursalMax = ( (@lnsucursal+10+1)*100000000)-1
				end
			else
				begin
				set @Tama = 12
				SET @SucursalMin = (@lnsucursal+10)*10000000000
				SET @SucursalMax = ((@lnsucursal+1+10)*10000000000)-1
				end
			
			--[*]	
			SET @SQLString = N''SELECT @max_id = max(id), @min_id =min(id)
			FROM ''+@tablaseek+'' WHERE (id>='' +convert(varchar(12),@SucursalMin)+'' and id<=''+convert(varchar(12),@SucursalMax)+'' )''
			+'' or ( id < ''+convert(varchar(12),@SucursalMin)+'') '';
			SET @ParmDefinition = N'' @max_id numeric(12,0) OUTPUT, @min_id numeric(12,0) OUTPUT'';
			print @SQLString
			print @ParmDefinition 
			EXECUTE sp_executesql @SQLString, @ParmDefinition, @max_id = @IntVariable OUTPUT,	@min_id =@IntVariableMin OUTPUT;
					

			set @id = @IntVariable 
			set @idmin = @IntVariableMin
			
			set @id =  isnull(@id,0000000000000)
			set @idmin = isnull(@idmin,00000000000)
			set @lcid = convert(varchar(15),@id)
			--Si el tamaño de int =4 maximo de cadena es 10	sino 12
			if @Tama = 10
				begin
				set @lcid = convert(varchar(10),@id)
				end
			else
				begin
				set @lcid = convert(varchar(12),@id)
				end
		--Extramemos del id la sucursal o no
			set @nlenid= len(ltrim(rtrim(@lcid )))
		
			if @nlenid = @Tama
			--Si el tamaño del campo es igual al maximo permitido entonces tiene la sucursal
			--Ejemplo 11XXXXXXXX
				set @lcid = substring(@lcid,3,len(@lcid))
			else
			--El campo no esta completo, eso quiere decir q NO tiene sucursal
				set @lcid = @lcid
			--end
			if ltrim(@lcid)=''''
				set @id = 1
			else
				set @id = convert(numeric(12,0) ,@lcid)
		
		    --Insertamos en la tabla keysid el nuevo registro actualizado		
			INSERT INTO Keysid VALUES (@tablaseek, @id+1 , '''' )         
   
			-- ''Actualizo''
			fetch CsrKeysid into @tablaseek,@campo
		end
	close CsrKeysid
	deallocate CsrKeysid
END




' 
END
GO
/****** Objeto:  Table [dbo].[provincia]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[provincia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[provincia](
	[id] [int] NOT NULL,
	[numero] [numeric](2, 0) NOT NULL,
	[nombre] [char](30) NOT NULL,
	[letracpostal] [char](1) NULL,
	[alicuota1] [numeric](6, 2) NOT NULL,
	[minimo1] [numeric](11, 3) NOT NULL,
	[fecdesde1] [datetime] NOT NULL,
	[alicuota2] [numeric](6, 2) NOT NULL,
	[minimo2] [numeric](11, 3) NOT NULL,
	[fecdesde2] [datetime] NOT NULL,
	[alicuota3] [numeric](6, 2) NOT NULL,
	[minimo3] [numeric](11, 3) NOT NULL,
	[fecdesde3] [datetime] NOT NULL,
	[alicuota4] [numeric](6, 2) NOT NULL,
	[alicuota5] [numeric](6, 2) NOT NULL,
	[coeficiente] [numeric](9, 3) NOT NULL,
	[adicional] [numeric](6, 2) NOT NULL,
	[abrevia] [char](1) NOT NULL,
	[convenio] [numeric](9, 2) NOT NULL,
	[idcuenta] [int] NOT NULL,
	[jurisdiccion] [numeric](4, 0) NOT NULL,
	[recinspe] [char](8) NOT NULL,
	[impabre] [char](4) NOT NULL,
 CONSTRAINT [PK_provincia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_provinci1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [abrevia]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provincia]') AND name = N'abrevia')
CREATE NONCLUSTERED INDEX [abrevia] ON [dbo].[provincia] 
(
	[abrevia] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [cnombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provincia]') AND name = N'cnombre')
CREATE NONCLUSTERED INDEX [cnombre] ON [dbo].[provincia] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idcuenta]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[provincia]') AND name = N'idcuenta')
CREATE NONCLUSTERED INDEX [idcuenta] ON [dbo].[provincia] 
(
	[idcuenta] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[UW_ZeroDefault]', @objname=N'[dbo].[provincia].[jurisdiccion]' , @futureonly='futureonly'
GO
/****** Objeto:  Table [dbo].[producto]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[producto](
	[id] [int] NOT NULL,
	[numero] [int] NOT NULL,
	[nombre] [char](40) NOT NULL,
	[nombulto] [varchar](45) NOT NULL,
	[codalfa] [char](8) NULL,
	[idctacte] [int] NOT NULL,
	[idmarca] [int] NOT NULL,
	[idctavta] [int] NOT NULL,
	[idctacpra] [int] NOT NULL,
	[idforma] [int] NOT NULL,
	[idunidad] [int] NOT NULL,
	[idtprod] [int] NOT NULL,
	[idtipovta] [int] NOT NULL,
	[idtamano] [int] NOT NULL,
	[idcatego] [int] NOT NULL,
	[idrubro] [int] NOT NULL,
	[idestado] [int] NOT NULL,
	[idubicacio] [int] NOT NULL,
	[idorigen] [int] NOT NULL,
	[nomodifica] [numeric](1, 0) NOT NULL,
	[incluirped] [numeric](1, 0) NOT NULL,
	[idiva] [int] NOT NULL,
	[idmoneda] [int] NOT NULL,
	[costo] [numeric](11, 3) NOT NULL,
	[flete] [numeric](11, 3) NOT NULL,
	[segflete] [numeric](11, 3) NOT NULL,
	[interno] [numeric](11, 3) NOT NULL,
	[bonif1] [numeric](6, 3) NOT NULL,
	[bonif2] [numeric](6, 3) NOT NULL,
	[bonif3] [numeric](6, 3) NOT NULL,
	[bonif4] [numeric](6, 3) NOT NULL,
	[costobon] [numeric](11, 3) NOT NULL,
	[costorepo] [numeric](11, 3) NOT NULL,
	[costoulcpra] [numeric](11, 3) NOT NULL,
	[feculcpra] [datetime] NOT NULL,
	[margen1] [numeric](6, 3) NOT NULL,
	[prevta1] [numeric](11, 3) NOT NULL,
	[prevtaf1] [numeric](11, 3) NOT NULL,
	[margen2] [numeric](6, 3) NOT NULL,
	[prevta2] [numeric](11, 3) NOT NULL,
	[prevtaf2] [numeric](11, 3) NOT NULL,
	[margen3] [numeric](6, 3) NOT NULL,
	[prevta3] [numeric](11, 3) NOT NULL,
	[prevtaf3] [numeric](11, 3) NOT NULL,
	[margen4] [numeric](6, 3) NOT NULL,
	[prevta4] [numeric](11, 3) NOT NULL,
	[prevtaf4] [numeric](11, 3) NOT NULL,
	[feculvta] [datetime] NOT NULL,
	[fecalta] [datetime] NOT NULL,
	[fecmodi] [datetime] NOT NULL,
	[unibulto] [numeric](4, 0) NOT NULL,
	[nofactura] [numeric](1, 0) NOT NULL,
	[nolista] [numeric](1, 0) NOT NULL,
	[espromocion] [numeric](1, 0) NOT NULL,
	[minimofac] [numeric](10, 0) NOT NULL,
	[peso] [numeric](7, 3) NOT NULL,
	[volumen] [numeric](7, 3) NOT NULL,
	[fracciona] [numeric](1, 0) NOT NULL,
	[puntope] [numeric](8, 0) NOT NULL,
	[switch] [char](10) NOT NULL,
	[idenvase] [int] NOT NULL,
	[sugerido] [numeric](11, 3) NOT NULL,
	[idfrio] [int] NOT NULL,
	[divisible] [numeric](1, 0) NOT NULL,
	[desc1] [numeric](6, 3) NOT NULL,
	[desc2] [numeric](6, 3) NOT NULL,
	[desc3] [numeric](6, 3) NOT NULL,
	[min1] [numeric](10, 0) NOT NULL,
	[min2] [numeric](10, 0) NOT NULL,
	[min3] [numeric](10, 0) NOT NULL,
	[codartprod] [char](8) NOT NULL,
	[vtakilos] [numeric](1, 0) NOT NULL,
	[fecoferta] [datetime] NOT NULL,
	[internoporce] [numeric](9, 5) NOT NULL,
	[controlador] [char](19) NOT NULL,
	[nommayorista] [char](38) NOT NULL,
	[ppt] [numeric](7, 6) NOT NULL,
	[itc] [numeric](1, 0) NOT NULL,
	[subsidiado] [numeric](1, 0) NOT NULL,
	[ctaaorden] [numeric](1, 0) NOT NULL,
	[cprakilos] [numeric](1, 0) NOT NULL,
	[siinforma] [numeric](1, 0) NOT NULL,
	[importado] [numeric](1, 0) NOT NULL,
	[esinsumo] [numeric](1, 0) NOT NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_product1] UNIQUE NONCLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [ctaaorden]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND name = N'ctaaorden')
CREATE NONCLUSTERED INDEX [ctaaorden] ON [dbo].[producto] 
(
	[ctaaorden] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [esinsumo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND name = N'esinsumo')
CREATE NONCLUSTERED INDEX [esinsumo] ON [dbo].[producto] 
(
	[esinsumo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [importado]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND name = N'importado')
CREATE NONCLUSTERED INDEX [importado] ON [dbo].[producto] 
(
	[importado] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [nombre]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND name = N'nombre')
CREATE NONCLUSTERED INDEX [nombre] ON [dbo].[producto] 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [siinforma]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND name = N'siinforma')
CREATE NONCLUSTERED INDEX [siinforma] ON [dbo].[producto] 
(
	[siinforma] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[UW_ZeroDefault]', @objname=N'[dbo].[producto].[internoporce]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[UW_ZeroDefault]', @objname=N'[dbo].[producto].[ctaaorden]' , @futureonly='futureonly'
GO
/****** Objeto:  Table [dbo].[cbioprecio]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cbioprecio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cbioprecio](
	[id] [int] NOT NULL,
	[idarticulo] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[sucursal] [numeric](3, 0) NOT NULL,
	[terminal] [numeric](3, 0) NOT NULL,
	[costov] [numeric](11, 3) NULL,
	[coston] [numeric](11, 3) NULL,
	[bonif1v] [numeric](6, 3) NULL,
	[bonif1n] [numeric](6, 3) NULL,
	[bonif2v] [numeric](6, 3) NULL,
	[bonif2n] [numeric](6, 3) NULL,
	[bonif3v] [numeric](6, 3) NULL,
	[bonif3n] [numeric](6, 3) NULL,
	[bonif4v] [numeric](6, 3) NULL,
	[bonif4n] [numeric](6, 3) NULL,
	[costobonv] [numeric](11, 3) NULL,
	[costobonn] [numeric](11, 3) NULL,
	[fletev] [numeric](11, 3) NULL,
	[fleten] [numeric](11, 3) NULL,
	[segfletev] [numeric](11, 3) NULL,
	[segfleten] [numeric](11, 3) NULL,
	[costorepov] [numeric](11, 3) NULL,
	[costorepon] [numeric](11, 3) NULL,
	[internov] [numeric](11, 3) NULL,
	[internon] [numeric](11, 3) NULL,
	[internoporcev] [numeric](9, 5) NULL,
	[internoporcen] [numeric](9, 5) NULL,
	[tasav] [numeric](5, 2) NULL,
	[tasan] [numeric](5, 2) NULL,
	[prevta1v] [numeric](11, 3) NULL,
	[prevta1n] [numeric](11, 3) NULL,
	[prevta2v] [numeric](11, 3) NULL,
	[prevta2n] [numeric](11, 3) NULL,
	[prevta3v] [numeric](11, 3) NULL,
	[prevta3n] [numeric](11, 3) NULL,
	[prevta4v] [numeric](11, 3) NULL,
	[prevta4n] [numeric](11, 3) NULL,
	[endolarv] [numeric](1, 0) NULL,
	[endolarn] [numeric](1, 0) NULL,
 CONSTRAINT [PK_cbioprecio] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

/****** Objeto:  Index [fecha]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cbioprecio]') AND name = N'fecha')
CREATE NONCLUSTERED INDEX [fecha] ON [dbo].[cbioprecio] 
(
	[idarticulo] ASC,
	[fecha] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO

/****** Objeto:  Index [idarticulo]    Fecha de la secuencia de comandos: 12/18/2012 14:20:27 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cbioprecio]') AND name = N'idarticulo')
CREATE NONCLUSTERED INDEX [idarticulo] ON [dbo].[cbioprecio] 
(
	[idarticulo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[UW_ZeroDefault]', @objname=N'[dbo].[cbioprecio].[internoporcev]' , @futureonly='futureonly'
GO
EXEC sys.sp_bindefault @defname=N'[dbo].[UW_ZeroDefault]', @objname=N'[dbo].[cbioprecio].[internoporcen]' , @futureonly='futureonly'
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_caberuta_caberuta]') AND parent_object_id = OBJECT_ID(N'[dbo].[caberuta]'))
ALTER TABLE [dbo].[caberuta]  WITH CHECK ADD  CONSTRAINT [FK_caberuta_caberuta] FOREIGN KEY([id])
REFERENCES [dbo].[caberuta] ([id])
GO
ALTER TABLE [dbo].[caberuta] CHECK CONSTRAINT [FK_caberuta_caberuta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_caberuta_caberuta1]') AND parent_object_id = OBJECT_ID(N'[dbo].[caberuta]'))
ALTER TABLE [dbo].[caberuta]  WITH CHECK ADD  CONSTRAINT [FK_caberuta_caberuta1] FOREIGN KEY([id])
REFERENCES [dbo].[caberuta] ([id])
GO
ALTER TABLE [dbo].[caberuta] CHECK CONSTRAINT [FK_caberuta_caberuta1]
