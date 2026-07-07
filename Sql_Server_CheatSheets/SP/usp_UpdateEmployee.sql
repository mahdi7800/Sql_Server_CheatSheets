/*
====================================================
 Stored Procedure Example

 Author      : Mahdi Davoodi

 Description :
 Creates a Stored Procedure to update employee
 information in the Employees table.

 The procedure:
 - Updates employee details based on EmployeeID.
 - Supports partial updates using optional parameters.
 - Formats name and location values into Proper Case.
 - Preserves existing values when parameters are NULL.
 - Handles errors using TRY...CATCH.

 Features:
 - Dynamic update of employee information.
 - NULL parameter handling with ISNULL().
 - Data formatting before update operation.
 - Error handling with custom messages.

 Parameters:
 @EmployeeID        : Employee identifier.
 @LastName          : Updated employee last name.
 @FirstName         : Updated employee first name.
 @BirthDate         : Updated employee birth date.
 @City              : Updated employee city.
 @Country           : Updated employee country.
 @TitleOfCourtesy   : Updated employee title.

 Returns:
 Updates employee record if EmployeeID exists.

 Date        : 2026/07/07
====================================================
*/
USE Northwind;
GO 

CREATE OR ALTER PROCEDURE usp_UpdateEmploye @EmployeeID int , @LastName nvarchar(20) = NULL , @FirstName nvarchar(10) = NULL ,@BirthDate datetime = NULL , @City nvarchar(15) = NULL , @Country nvarchar(15) = NULL , @TitleOfCourtesy nvarchar(25) = NULL 
AS 
BEGIN 
   /*
        Author    : Mahdi Davoudi
        Date      : 2026-07-06
        Subject : Update employee details by EmployeeID.
        Version   : 1.0.0
   */
   SET NOCOUNT ON;
   SET XACT_ABORT ON;
      BEGIN TRY 
      DECLARE @FirstNameNew nvarchar(10); 
              SET @FirstNameNew = UPPER(LEFT(@FirstName,1))+LOWER(SUBSTRING(@FirstName,2,LEN(@FirstName)));
          DECLARE @LastNameNew nvarchar(20); 
              SET @LastNameNew = UPPER(LEFT(@LastName,1))+LOWER(SUBSTRING(@LastName,2,LEN(@LastName)));
          DECLARE @CityNew nvarchar(15);
              SET @CityNew = UPPER(LEFT(@City,1))+LOWER(SUBSTRING(@City,2,LEN(@City)));
          DECLARE @CountryNew nvarchar(15);
              SET @CountryNew = UPPER(LEFT(@Country,1))+LOWER(SUBSTRING(@Country,2,LEN(@Country)));
         UPDATE Employees
            SET FirstName = ISNULL(@FirstNameNew,FirstName) , LastName = ISNULL(@LastNameNew ,LastName) , TitleOfCourtesy = ISNULL(@TitleOfCourtesy,TitleOfCourtesy ) , BirthDate = ISNULL(@BirthDate,BirthDate) , Country = ISNULL(@CountryNew,Country) ,City = ISNULL(@CityNew,City)
            WHERE EmployeeID = @EmployeeID
      END TRY
   BEGIN CATCH 
     DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
     DECLARE @ErrorSeverity int = ERROR_SEVERITY();
     DECLARE @ErrorState int  =  ERROR_STATE();
     SELECT ERROR_PROCEDURE() AS ErrorProcedure;
     RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
   END CATCH 
END

GO
