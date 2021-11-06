/*======================================================
DESCRIÇÃO:
	Restaurar backup
========================================================*/

-- Altera a base de dados para SINGLE_USER
ALTER DATABASE [NomeBaseDeDados] --Mudar para seu Db.
SET SINGLE_USER WITH
ROLLBACK 
   --AFTER 60 --Espera 60 segundos para que as transações ativas sejam completadas
   IMMEDIATE  --Termina as transações ativas imediatamente

-- Restore
RESTORE DATABASE [NomeBaseDeDados]
FROM 
	DISK = 'D:\BackUp\ArquivoBackup.bak' -- caminho do backup
	WITH MOVE 'NomeLogicoArquivoMDF'  -- mdf
		TO 'D:\Data\ArquivoMDF.mdf', -- mdf
	MOVE 'NomeLogicoArquivoLDF' -- log
		TO 'D:\Data\ArquivoLDF.ldf' -- log

/*If there is no error in statement before database will be in multiuser
mode.  If error occurs please execute following command it will convert
database in multi user.*/

-- Altera a base de dados para MULTI_USER
ALTER DATABASE [NomeBaseDeDados] SET MULTI_USER
GO