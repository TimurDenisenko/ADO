
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/04/2024 14:12:30
-- Generated from EDMX file: C:\Users\opilane\source\repos\TimurDenisenkoTARpv22\ADO\mudel_kutsekool.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [kutsekool_Denisenko];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'OpilaneSet'
CREATE TABLE [dbo].[OpilaneSet] (
    [opilaneId] int IDENTITY(1,1) NOT NULL,
    [eesnimi] nvarchar(max)  NOT NULL,
    [perenimi] nvarchar(max)  NOT NULL,
    [synniaeg] datetime  NOT NULL,
    [Ryhm_ryhmId] int  NOT NULL
);
GO

-- Creating table 'RyhmSet'
CREATE TABLE [dbo].[RyhmSet] (
    [ryhmId] int IDENTITY(1,1) NOT NULL,
    [ryhmNimi] nvarchar(max)  NOT NULL,
    [osakond] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [opilaneId] in table 'OpilaneSet'
ALTER TABLE [dbo].[OpilaneSet]
ADD CONSTRAINT [PK_OpilaneSet]
    PRIMARY KEY CLUSTERED ([opilaneId] ASC);
GO

-- Creating primary key on [ryhmId] in table 'RyhmSet'
ALTER TABLE [dbo].[RyhmSet]
ADD CONSTRAINT [PK_RyhmSet]
    PRIMARY KEY CLUSTERED ([ryhmId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Ryhm_ryhmId] in table 'OpilaneSet'
ALTER TABLE [dbo].[OpilaneSet]
ADD CONSTRAINT [FK_RyhmOpilane]
    FOREIGN KEY ([Ryhm_ryhmId])
    REFERENCES [dbo].[RyhmSet]
        ([ryhmId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RyhmOpilane'
CREATE INDEX [IX_FK_RyhmOpilane]
ON [dbo].[OpilaneSet]
    ([Ryhm_ryhmId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------