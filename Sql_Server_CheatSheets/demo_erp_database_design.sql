/*
====================================================================
 Project     : ERP Database Design
 File        : demo_erp_database_design.sql
 Author      : Mahdi Davoodi
 Created     : 2026-06-20

 Description :
 This script demonstrates the creation of an ERP database,
 schema definition, table creation, and implementation of
 common SQL Server constraints including:

   - Primary Key
   - Foreign Key
   - Unique Constraint
   - Check Constraint
   - Default Constraint
   - Computed Column

 Database    : ERP
 Schema      : Anbar

====================================================================
*/

------------------------------------------------------------
-- Create ERP Database
------------------------------------------------------------
CREATE DATABASE ERP;
GO

------------------------------------------------------------
-- Select ERP Database
------------------------------------------------------------
USE ERP;
GO

------------------------------------------------------------
-- Create Schema: Anbar
------------------------------------------------------------
CREATE SCHEMA Anbar;
GO

/*
------------------------------------------------------------
 General CREATE TABLE Syntax
------------------------------------------------------------

CREATE TABLE [SchemaName].[TableName]
(
    ColumnName DataType NOT NULL,
    ...

    CONSTRAINT PK_Table PRIMARY KEY (ColumnName)
)
ON [PRIMARY];

GO
*/

------------------------------------------------------------
-- Create Category Table
------------------------------------------------------------
CREATE TABLE Anbar.Category
(
    CategoryID   INT IDENTITY NOT NULL PRIMARY KEY,
    CategoryName NVARCHAR(30) NOT NULL UNIQUE
)
ON [PRIMARY];
GO

------------------------------------------------------------
-- Create Kala (Product) Table
------------------------------------------------------------
CREATE TABLE Anbar.Kala
(
    -- Product Identifier
    KalaID BIGINT NOT NULL,

    -- Product Name
    KalaName NVARCHAR(50) NOT NULL,

    -- Country of Origin
    Country NVARCHAR(50) NOT NULL
        DEFAULT (N'IRAN'),

    -- Product Unit Price
    UnitPrice MONEY NOT NULL,

    -- Related Category
    CategoryID INT NOT NULL,

    -- Value Added Tax (9%)
    VAT AS (UnitPrice * 0.09) PERSISTED,

    --------------------------------------------------------
    -- Constraints
    --------------------------------------------------------

    -- Primary Key
    CONSTRAINT PK_Kala
        PRIMARY KEY (KalaID),

    -- Unique Product Name
    CONSTRAINT UQ_Kala_KalaName
        UNIQUE (KalaName),

    -- Unit Price Must Be Greater Than Zero
    CONSTRAINT CK_Kala_UnitPrice
        CHECK (UnitPrice > 0),

    -- Relationship with Category Table
    CONSTRAINT FK_Kala_Category
        FOREIGN KEY (CategoryID)
        REFERENCES Anbar.Category(CategoryID)
)
ON [PRIMARY];
GO