/*
====================================================
 Schema Management Examples
 Author      : Mahdi Davoodi

 Description :
 Examples of Schema Creation, Object Transfer
 and Synonym Management in SQL Server

 Date        : 2026/06/20
====================================================
*/

----------------------------------------------------
-- Create ERP Database
----------------------------------------------------

CREATE DATABASE ERP;
GO

----------------------------------------------------
-- Select ERP Database
----------------------------------------------------

USE ERP;
GO

----------------------------------------------------
-- Create a new Schema
----------------------------------------------------

CREATE SCHEMA NameSchemaNew;
GO

----------------------------------------------------
-- Transfer an existing table from dbo schema
-- to the new schema
--
-- Before:
-- dbo.TableName
--
-- After:
-- NameSchemaNew.TableName
----------------------------------------------------

ALTER SCHEMA NameSchemaNew
TRANSFER dbo.TableName;
GO

----------------------------------------------------
-- Create a Synonym
--
-- This allows legacy queries and applications
-- to continue using dbo.TableName while the
-- actual object resides in NameSchemaNew.
----------------------------------------------------

CREATE SYNONYM dbo.TableName
FOR NameSchemaNew.TableName;
GO