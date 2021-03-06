USE [data_alarcia]
GO
/****** Objeto:  Table [dbo].[afestockrto]    Fecha de la secuencia de comandos: 05/18/2016 10:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[afestockrto](
	[id] [numeric](12, 0) NOT NULL,
	[idfactura] [numeric](12, 0) NOT NULL,
	[idmaoperaf] [numeric](12, 0) NOT NULL,
	[afecta] [int] NOT NULL,
	[idorigen] [numeric](12, 0) NOT NULL,
	[idcuerfac] [numeric](12, 0) NOT NULL,
 CONSTRAINT [PK_afestockrto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
