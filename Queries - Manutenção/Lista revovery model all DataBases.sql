/*======================================================
DESCRIÇÃO:
	 Lista o RECOVERY MODEL de todas as bases de dados

========================================================*/

SELECT 
	RECOVERY_MODEL_DESC, 
	COUNT(*) 
FROM SYS.DATABASES
GROUP BY RECOVERY_MODEL_DESC;