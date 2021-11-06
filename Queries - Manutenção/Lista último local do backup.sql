/*======================================================
DESCRIÇÃO:
	 Lista último local (no disco) do backup
========================================================*/
SELECT bs.name, 
	bmf.physical_device_name, 
	max(bs.backup_finish_date)
FROM msdb..backupset bs 
		JOIN msdb..backupmediafamily bmf
		ON bs.media_set_id = bmf.media_set_id
WHERE 
	physical_device_name LIKE '%:%'
GROUP BY 
	bs.name, 
	bmf.physical_device_name
ORDER BY 3 DESC;