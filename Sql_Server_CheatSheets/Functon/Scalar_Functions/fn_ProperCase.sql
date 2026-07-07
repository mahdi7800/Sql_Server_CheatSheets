/*
====================================================
 Scalar Function Example

 Author      : Mahdi Davoodi

 Description :
 Creates a Scalar Function to convert a text value
 into Proper Case format.

 The function:
 - Converts the first character to uppercase.
 - Converts the remaining characters to lowercase.
 - Returns NULL if the input value is NULL.

 Parameters:
 @Text : Input text value that needs formatting.

 Returns:
 Formatted text value as NVARCHAR(80).

 Date        : 2026/07/07
====================================================
*/

CREATE OR ALTER FUNCTION dbo.fn_ProperCase (@Text nvarchar(80))
RETURNS nvarchar(80)
AS 
BEGIN 
     IF @Text IS NULL
       RETURN NULL
     ELSE 
       SET @Text =  UPPER(LEFT(@Text,1))+LOWER(SUBSTRING(@Text,2,LEN(@Text)));
RETURN @Text
END