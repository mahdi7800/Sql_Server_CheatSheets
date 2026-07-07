/*
====================================================
 Stored Procedure Execution Examples

 Description :
 Demonstrates how to execute employee management
 procedures for different operations.

 Supported Operations:
 - Insert Employee
 - Update Employee
 - Delete Employee

 Output:
 Returns operation result message through @Result
 output parameter.

 Date : 2026/07/07
====================================================
*/


DECLARE @Result nvarchar(200);


-- Insert Employee Example
EXEC usp_ProcessEmployeeOperation
     @type = N'I',
     @LastName = N'Mahdi',
     @FirstName = N'Davoodi',
     @BirthDate = '2004-09-09',
     @City = NULL,
     @Country = NULL,
     @TitleOfCourtesy = NULL,
     @EmployeeID = NULL,
     @Result = @Result OUTPUT;



-- Update Employee Example
EXEC usp_ProcessEmployeeOperation
     @type = N'U',
     @LastName = N'Mahdi',
     @FirstName = N'Davoodi',
     @BirthDate = '1999-03-05',
     @City = N'Tehran',
     @Country = N'IRAN',
     @TitleOfCourtesy = NULL,
     @EmployeeID = 12,
     @Result = @Result OUTPUT;



-- Delete Employee Example
EXEC usp_ProcessEmployeeOperation
     @type = N'D',
     @EmployeeID = 13,
     @Result = @Result OUTPUT;



SELECT @Result AS Result;