/*======================================================
DESCRIÇÃO:
	 Lista últimos backups FULL executados
========================================================*/
SELECT 
 DATABASE_NAME,
 MAX(BACKUP_FINISH_DATE) DATA_TERMINO,
 CASE TYPE 
 WHEN 'L' THEN 'LOG' END,
 RECOVERY_MODEL 
FROM MSDB..BACKUPSET
WHERE TYPE = 'L'
GROUP BY 
 DATABASE_NAME,
 TYPE,
 RECOVERY_MODEL
ORDER BY 2