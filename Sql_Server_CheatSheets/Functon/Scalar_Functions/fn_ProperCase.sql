/*
===============================================================================
Author      : Mahdi Davoodi
Date        : 2026/07/25
Function    : dbo.fn_ProperCase
Database    : Northwind

Description:
    Converts the first letter of each word in the input string to uppercase
    and converts all remaining characters to lowercase.

Business Rules:
    - Returns NULL if the input value is NULL.
    - Converts the entire string to lowercase before processing.
    - Capitalizes the first character of the string.
    - Capitalizes the first character following each space.
    - Uses a WHILE loop to scan the string character by character.

Parameters:
    @Value          : Input string (NVARCHAR(100)).

Returns:
    - Returns the string in Proper Case format.
    - Returns NULL if the input value is NULL.

Examples:
    SELECT dbo.fn_ProperCase(N'mAHDI dAVOODI');
    -- Result: Mahdi Davoodi

    SELECT dbo.fn_ProperCase(N'SQL SERVER');
    -- Result: Sql Server

    SELECT dbo.fn_ProperCase(N'hello world from sql server');
    -- Result: Hello World From Sql Server

    SELECT dbo.fn_ProperCase(NULL);
    -- Result: NULL
===============================================================================
*/


CREATE OR ALTER FUNCTION dbo.fn_ProperCase (@Value nvarchar(100))
RETURNS nvarchar(100)
AS 
BEGIN 
    DECLARE @Result nvarchar (100);
    DECLARE @Index int; 
           SET @Index = 2; 

    IF @Value IS NULL
      RETURN NULL;

    SET @Result = LOWER(@Value);

    SET @Result = UPPER(LEFT(@Result,1)) + SUBSTRING(@Result,2,LEN(@Result));

    WHILE @Index <= LEN(@Result)
      BEGIN 
         IF SUBSTRING(@Result,@Index-1,1) = N' '
          BEGIN 
              SET @Result = STUFF(@Result,@Index,1,UPPER(SUBSTRING(@Result , @Index , 1)));
          END 
         SET @Index += 1 
      END
        
     RETURN @Result;

END 

GO 