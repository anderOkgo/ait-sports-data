@ECHO OFF
call com\db-remote-data-backup.vbs
call com\db-sync-FTP-both.bat
call com\db-join-full-backup.bat
call com\db-local-restore-swap.bat
PAUSE
