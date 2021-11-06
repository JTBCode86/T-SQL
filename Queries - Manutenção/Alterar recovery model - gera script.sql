/*======================================================
DESCRIÇÃO:
	 Gera script para alterar RECOVERY MODEL
========================================================*/
SELECT 'ALTER DATABASE ['+NAME+'] SET RECOVERY FULL;' 
FROM SYS.DATABASES 
WHERE RECOVERY_MODEL_DESC = 'SIMPLE' 
      AND DATABASE_ID > 4
ORDER BY NAME;