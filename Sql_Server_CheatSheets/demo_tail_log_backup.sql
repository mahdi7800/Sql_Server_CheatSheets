/*
===========================================================
 File Name : demo_tail_log_backup.sql
 Purpose   : Demonstrate Tail-Log Backup in SQL Server
 Database  : Any (replace [DataBaseName] with actual name)
 Author    : Mahdi Davoudi
===========================================================

 Notes:
 - Tail-log backup captures the log records that have not yet
   been backed up, usually taken before restoring a database.
 - Recommended file naming: [DataBaseName]_tail.trn
*/

-----------------------------------------------------------
-- 1) Set Database to SINGLE_USER Mode (if required)
-----------------------------------------------------------


USE master;
GO



ALTER DATABASE [DataBaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE   -- Disconnect all users immediately
GO

-----------------------------------------------------------
-- 2) Set Database back to MULTI_USER Mode
-----------------------------------------------------------

ALTER DATABASE [DataBaseName] SET MULTI_USER
GO

-----------------------------------------------------------
-- 3) Tail-Log Backup
-----------------------------------------------------------
-- File name example: ERP_tail.trn

BACKUP LOG [DataBaseName] TO DISK = '[AdressFileName].trn'
WITH INIT , CHECKSUM , COMPRESSION ,CONTINUE_AFTER_ERROR , NO_TRUNCATE , NORECOVERY;
GO 