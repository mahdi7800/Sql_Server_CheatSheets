/*
===========================================================
 File Name : demo_rebuild_log_file.sql
 Purpose   : Demonstrate recovery of damaged log file in SQL Server
 Database  : Any (replace [DataBaseName] with actual name)
 Author    : Mahdi Davoudi
===========================================================

 Notes:
 - This scenario assumes:
   1) Data files are OK
   2) Log file is damaged
   3) Backup log exists
 - Procedure:
   1) Set database to EMERGENCY mode
   2) Rebuild log file on a new location
   3) Set database back to MULTI_USER
*/

-----------------------------------------------------------
-- 1) Set Database to EMERGENCY Mode
-----------------------------------------------------------

ALTER DATABASE [DataBaseName] SET EMERGENCY 
GO 

-----------------------------------------------------------
-- 2) Rebuild the Log File
-----------------------------------------------------------

ALTER DATABASE [DataBaseName] 
REBUILD LOG ON 
(
NAME = '[DataBaseName]_log' ,   -- Logical log file name
FILEGROUP ='[AdressFile_logfile_to_disk_new]\[DataBaseName]_log.ldf'  -- New physical path
);
GO 

-----------------------------------------------------------
-- 3) Set Database Back to MULTI_USER
-----------------------------------------------------------

ALTER DATABASE [DataBaseName] SET MULTI_USER ;
GO

-- Crash physical => Data Files Are OK But Log File Is DAMIAGED And BackUp Log is OK
