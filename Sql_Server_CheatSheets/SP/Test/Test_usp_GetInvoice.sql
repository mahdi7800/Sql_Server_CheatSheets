/*
====================================================
 Stored Procedure Execution Example

 Description :
 Executes the Stored Procedure to retrieve invoice
 details for a specific customer order.

 The procedure returns:
 - Customer information
 - Order information
 - Product details
 - Quantity and unit price
 - Line total
 - Grand total of the invoice

 Parameters:
 @CustomerID : Customer identifier.
 @OrderID    : Order identifier.

 Example:
 Retrieves invoice details for customer ALFKI
 with OrderID 10643.

 Date : 2026/07/07
====================================================
*/

EXEC usp_GetInvoic @CustomerID =N'ALFKI' , @OrderID = 10643 


