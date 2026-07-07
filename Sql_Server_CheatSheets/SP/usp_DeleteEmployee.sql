/*
====================================================
 Stored Procedure Example

 Author      : Mahdi Davoodi

 Description :
 Creates a Stored Procedure to safely delete an employee
 from the Employees table.

 Before deletion, the procedure checks whether the
 employee has related orders. If related records exist,
 deletion will be prevented.

 Features:
 - Dependency check before delete operation.
 - Transaction error handling using TRY...CATCH.
 - Error handling with custom messages.
 - Prevents deleting employees with existing orders.

 Parameters:
 @EmployeeID : Employee identifier to delete.

 Returns:
 Deletes the employee record if no dependencies exist.

 Date        : 2026/07/07
====================================================
*/

USE Northwind;
GO 


CREATE OR ALTER PROC usp_DeleteEmployee @EmployeeID int
AS 
BEGIN 
        /* 
            Author    : Mahdi Davoudi
            Date      : 2026-07-06
            Subject   : Delete employee information.        
            Version   : 1.0.0
     */
    SET NOCOUNT ON;
	SET XACT_ABORT ON;
	   BEGIN TRY 
          IF EXISTS (SELECT EmployeeID FROM Orders WHERE EmployeeID IN (@EmployeeID))
                 BEGIN 
                    RAISERROR(N'One or more employees have orders and cannot be deleted.',16,1);
                    RETURN;
                 END
                DELETE FROM Employees 
                WHERE EmployeeID = @EmployeeID
                IF @@ROWCOUNT = 0 
                 BEGIN 
                     RAISERROR(N'Employee not found.',16,1);
                     RETURN;
                 END
	   END TRY
	   BEGIN CATCH
           DECLARE @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
           DECLARE @ErrorSeverity int = ERROR_SEVERITY();
           DECLARE @ErrorState int  =  ERROR_STATE();
           SELECT ERROR_PROCEDURE() AS ErrorProcedure;
           RAISERROR (@ErrorMessage,@ErrorSeverity,@ErrorState);
	   END CATCH
END


-- EXECUTE usp_DeleteEmployee @EmployeeID = @EmployeeID