/*
===========================================================
 File Name : demo_system_functions_and_variables_complete.sql
 Purpose   : Comprehensive demonstration of system functions
             and system variables in SQL Server
 Database  : Any (works with Northwind or default)
 Author    : Mahdi Davoudi
===========================================================

 This script covers:
 1. System date/time functions
 2. System and session information functions
 3. System variables
 4. Error-related functions
 5. Data handling functions
 6. Server properties and metadata
*/

-----------------------------------------------------------
-- 1) Date and Time Functions
-----------------------------------------------------------
-- Current date and time
SELECT GETDATE() AS CurrentDateTime;

-- Higher precision date and time
SELECT SYSDATETIME() AS CurrentDateTimePrecise;

-- Current UTC date and time
SELECT GETUTCDATE() AS CurrentUTCDateTime;

-- Add 7 days to current date
SELECT DATEADD(DAY, 7, GETDATE()) AS DatePlus7Days;

-- Difference in days between two dates
SELECT DATEDIFF(DAY, '2026-01-01', GETDATE()) AS DaysSinceJan1;

-- Format date as YYYY-MM-DD
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS FormattedDate;
GO

-----------------------------------------------------------
-- 2) System and Session Information
-----------------------------------------------------------
-- Current login name
SELECT SUSER_SNAME() AS CurrentLogin;

-- Current database user
SELECT SESSION_USER AS SessionUser;

-- Current system login
SELECT SYSTEM_USER AS SystemLogin;

-- Current application name
SELECT APP_NAME() AS ApplicationName;

-- Current host machine name
SELECT HOST_NAME() AS HostName;

-- Current database name
SELECT DB_NAME() AS CurrentDatabase;

-- Current user in database context
SELECT CURRENT_USER AS CurrentDatabaseUser;
GO

-----------------------------------------------------------
-- 3) System Variables
-----------------------------------------------------------
-- Number of active transactions for current connection
SELECT @@TRANCOUNT AS TransactionCount;

-- Status of last T-SQL statement (0 = success)
SELECT @@ERROR AS LastErrorCode;

-- Last identity value inserted in current session
SELECT @@IDENTITY AS LastIdentityInserted;
SELECT SCOPE_IDENTITY() AS LastIdentityInScope;

-- Current session ID (SPID)
SELECT @@SPID AS SessionID;

-- Status of last cursor fetch
SELECT @@FETCH_STATUS AS LastCursorFetchStatus;
GO

-----------------------------------------------------------
-- 4) Error Functions (use inside TRY/CATCH blocks)
-----------------------------------------------------------
SELECT ERROR_NUMBER() AS ErrorNumber;
SELECT ERROR_MESSAGE() AS ErrorMessage;
SELECT ERROR_SEVERITY() AS ErrorSeverity;
SELECT ERROR_LINE() AS ErrorLine;
SELECT ERROR_PROCEDURE() AS ErrorProcedure;
GO

-----------------------------------------------------------
-- 5) Data Handling Functions
-----------------------------------------------------------
-- Replace NULL values
SELECT ISNULL(NULL, 'DefaultValue') AS ISNULLExample;

-- First non-NULL value among multiple expressions
SELECT COALESCE(NULL, NULL, 'FirstNonNull') AS CoalesceExample;

-- Return NULL if values are equal
SELECT NULLIF(5, 5) AS NullIfExample;
GO

-----------------------------------------------------------
-- 6) Server Properties and Metadata
-----------------------------------------------------------
-- SQL Server version
SELECT @@VERSION AS SqlServerVersion;

-- Product version (numeric)
SELECT SERVERPROPERTY('ProductVersion') AS ProductVersion;

-- Service Pack or patch level
SELECT SERVERPROPERTY('ProductLevel') AS ProductLevel;

-- SQL Server edition
SELECT SERVERPROPERTY('Edition') AS SqlServerEdition;

-- Engine edition (numeric code)
SELECT SERVERPROPERTY('EngineEdition') AS EngineEdition;
GO
