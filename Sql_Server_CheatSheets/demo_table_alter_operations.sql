/*
====================================================================
 Project     : SQL Server Table Modification Examples
 File        : Table_Alter_Operations.sql
 Author      : Mahdi Davoodi
 Created     : 2026-06-20

 Description :
 Examples of table modification operations including:

   - Add Column
   - Drop Column
   - Drop Constraints
   - Modify Column Data Type
   - Add Constraints
   - Enable / Disable Constraints

====================================================================
*/

------------------------------------------------------------
-- Add New Column with Default and Check Constraint
------------------------------------------------------------
ALTER TABLE Products
ADD NewCol INT NOT NULL
    DEFAULT (0)
    CHECK (NewCol >= 0);
GO

/*
------------------------------------------------------------
 Before Dropping a Column:
 Constraints associated with the column must be removed.
------------------------------------------------------------
*/

------------------------------------------------------------
-- Drop Check Constraint
------------------------------------------------------------
ALTER TABLE Products
DROP CONSTRAINT CK__Products__Newcol__6EF57B66;
GO

------------------------------------------------------------
-- Drop Default Constraint
------------------------------------------------------------
ALTER TABLE Products
DROP CONSTRAINT DF__Products__Newcol__6E01572D;
GO

------------------------------------------------------------
-- Drop Column
------------------------------------------------------------
ALTER TABLE Products
DROP COLUMN NewCol;
GO

/*
------------------------------------------------------------
 Changing a Column Definition

 When modifying a column data type or nullability,
 related constraints should be removed first and
 recreated after the modification.
------------------------------------------------------------
*/

------------------------------------------------------------
-- Remove Existing Constraints
------------------------------------------------------------
ALTER TABLE Products
DROP CONSTRAINT CK_UnitsInStock;
GO

ALTER TABLE Products
DROP CONSTRAINT DF_Products_UnitsInStock;
GO

------------------------------------------------------------
-- Modify Column Definition
------------------------------------------------------------
ALTER TABLE Products
ALTER COLUMN UnitsInStock INT NULL;
GO

------------------------------------------------------------
-- Recreate Check Constraint
------------------------------------------------------------
ALTER TABLE Products
ADD CONSTRAINT CK_UnitsInStock
CHECK (UnitsInStock >= 0);
GO

------------------------------------------------------------
-- Recreate Default Constraint
------------------------------------------------------------
ALTER TABLE Products
ADD CONSTRAINT DF_Products_UnitsInStock
DEFAULT (0) FOR UnitsInStock;
GO

------------------------------------------------------------
-- Disable Specific Constraint
------------------------------------------------------------
ALTER TABLE Products
NOCHECK CONSTRAINT CK_UnitsInStock;
GO

------------------------------------------------------------
-- Enable Specific Constraint
------------------------------------------------------------
ALTER TABLE Products
CHECK CONSTRAINT CK_UnitsInStock;
GO

------------------------------------------------------------
-- Disable All Constraints
------------------------------------------------------------
ALTER TABLE Products
NOCHECK CONSTRAINT ALL;
GO

------------------------------------------------------------
-- Enable All Constraints
------------------------------------------------------------
ALTER TABLE Products
CHECK CONSTRAINT ALL;
GO