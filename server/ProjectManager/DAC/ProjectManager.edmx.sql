
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/05/2019 22:58:09
-- Generated from EDMX file: C:\Users\Gopra\SBAProjectManager\server\ProjectManager\DAC
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjectManager];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Project_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK_Project_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Task_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_Task_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ParentTask]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ParentTask];
GO
IF OBJECT_ID(N'[dbo].[Project]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Project];
GO
IF OBJECT_ID(N'[dbo].[Task]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Task];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ParentTasks'
CREATE TABLE [dbo].[ParentTasks] (
    [Parent_ID] int IDENTITY(1,1) NOT NULL,
    [Parent_Task_Name] nvarchar(50)  NULL
);
GO

-- Creating table 'Projects'
CREATE TABLE [dbo].[Projects] (
    [Project_ID] int IDENTITY(1,1) NOT NULL,
    [Project_Name] nvarchar(50)  NULL,
    [Start_Date] datetime  NULL,
    [End_Date] datetime  NULL,
    [Priority] int  NULL,
    [Manager] int  NULL
);
GO

-- Creating table 'Tasks'
CREATE TABLE [dbo].[Tasks] (
    [Task_ID] int IDENTITY(1,1) NOT NULL,
    [Parent_ID] int  NULL,
    [Project_ID] int  NULL,
    [Task_Name] nvarchar(50)  NULL,
    [Start_Date] datetime  NULL,
    [End_Date] datetime  NULL,
    [Priority] int  NULL,
    [Status] int  NOT NULL,
    [Assignee] int  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [User_ID] int IDENTITY(1,1) NOT NULL,
    [First_Name] nvarchar(50)  NOT NULL,
    [Last_Name] nvarchar(50)  NOT NULL,
    [Employee_ID] nchar(10)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Parent_ID] in table 'ParentTasks'
ALTER TABLE [dbo].[ParentTasks]
ADD CONSTRAINT [PK_ParentTasks]
    PRIMARY KEY CLUSTERED ([Parent_ID] ASC);
GO

-- Creating primary key on [Project_ID] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [PK_Projects]
    PRIMARY KEY CLUSTERED ([Project_ID] ASC);
GO

-- Creating primary key on [Task_ID] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [PK_Tasks]
    PRIMARY KEY CLUSTERED ([Task_ID] ASC);
GO

-- Creating primary key on [User_ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([User_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Assignee] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK_Task_User]
    FOREIGN KEY ([Assignee])
    REFERENCES [dbo].[Users]
        ([User_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Task_User'
CREATE INDEX [IX_FK_Task_User]
ON [dbo].[Tasks]
    ([Assignee]);
GO

-- Creating foreign key on [Manager] in table 'Projects'
ALTER TABLE [dbo].[Projects]
ADD CONSTRAINT [FK_Project_User]
    FOREIGN KEY ([Manager])
    REFERENCES [dbo].[Users]
        ([User_ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Project_User'
CREATE INDEX [IX_FK_Project_User]
ON [dbo].[Projects]
    ([Manager]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------