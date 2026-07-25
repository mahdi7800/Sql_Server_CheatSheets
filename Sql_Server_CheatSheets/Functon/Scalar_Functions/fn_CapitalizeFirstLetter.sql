/*
===============================================================================
Author      : Mahdi Davoodi
Date        : 2026/07/25
Function    : dbo.fn_ProperCase
Database    : Northwind

Description:
    Converts the first character of the input string to uppercase and converts
    all remaining characters to lowercase.

Business Rules:
    - Returns NULL if the input value is NULL.
    - Converts only the first character to uppercase.
    - Converts all remaining characters to lowercase.
    - Does not capitalize the first letter of each word.

Parameters:
    @Text            : Input string (NVARCHAR(100)).

Returns:
    - Returns the formatted string.
    - Returns NULL if the input value is NULL.

Examples:
    SELECT dbo.fn_CapitalizeFirstLetter(N'mAHDI');
    -- Result: Mahdi

    SELECT ddbo.fn_CapitalizeFirstLetter(N'mAHDI dAVOODI');
    -- Result: Mahdi davoodi

    SELECT dbo.fn_CapitalizeFirstLetter(NULL);
    -- Result: NULL
===============================================================================
*/


USE Northwind;
GO 



CREATE OR ALTER FUNCTION dbo.fn_CapitalizeFirstLetter (@Text nvarchar(80))
RETURNS nvarchar(80)
AS 
BEGIN 
     IF @Text IS NULL
       RETURN NULL
     ELSE 
       SET @Text =  UPPER(LEFT(@Text,1))+LOWER(SUBSTRING(@Text,2,LEN(@Text)));
RETURN @Text
END