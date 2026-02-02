/*
===========================================================
 File Name : demo_sql_backup_commands.sql
 Purpose   : Demonstrate SQL Server backup commands
 Database  : Any (replace [DataBaseName] with actual name)
 Author    : Mahdi Davoudi
===========================================================

 Notes:
 - Full Backup: complete database backup
 - Differential Backup: backup of changes since last full backup
 - Transaction Log Backup: backup of transaction log for point-in-time recovery
 - Recommended file naming convention:
   [DataBaseName]_[YYYYMMDD]_[HHMM].bak | .diff | .trn
*/

-----------------------------------------------------------
-- 1) FULL DATABASE BACKUP
-----------------------------------------------------------
-- Example: Full backup of ERP database
-- File name format: ERP_YYYYMMDD_HHMM.bak

BACKUP DATABASE [DataBaseName] TO DISK ='[AddressFlieName].bak'
WITH INIT , CHECKSUM , COMPRESSION , STOP_ON_ERROR ;
GO 

-----------------------------------------------------------
-- 2) DIFFERENTIAL DATABASE BACKUP
-----------------------------------------------------------
-- Example: Differential backup of ERP database
-- File name format: ERP_YYYYMMDD_HHMM.diff

BACKUP DATABASE [DataBaseName] TO DISK ='[AddressFlieName].diff'
WITH INIT , CHECKSUM , COMPRESSION , STOP_ON_ERROR , DIFFERENTIAL ;
GO 

-----------------------------------------------------------
-- 3) TRANSACTION LOG BACKUP
-----------------------------------------------------------
-- Example: Transaction log backup of ERP database
-- File name format: ERP_YYYYMMDD_HHMM.trn

BACKUP LOG [DataBaseName] TO DISK ='[AddressFlieName].trn'
WITH INIT , CHECKSUM , COMPRESSION;
GO 