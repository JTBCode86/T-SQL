/*=================================================
	Descrição:
		Backup em todos os bancos de dados.
===================================================*/

DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name
DECLARE @name VARCHAR(256)
-- Especifica o diretório para o backup dos bancos
SET @path = 'C:\teste\'  
 
-- Especifica o formato do arquivo
SELECT @fileDate = CONVERT(VARCHAR(20),GETDATE(),112) 
 
DECLARE db_cursor CURSOR FOR  
SELECT name 
FROM master.dbo.sysdatabases

-- exclude these databases
WHERE name NOT IN ('master','model','msdb','tempdb')  

OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   
 
WHILE @@FETCH_STATUS = 0   
BEGIN   
       SET @fileName = @path + @name + '_' + @fileDate + '.BAK'  
       BACKUP DATABASE @name TO DISK = @fileName  

        FETCH NEXT FROM db_cursor INTO @name   
END   

 
CLOSE db_cursor   
DEALLOCATE db_cursor