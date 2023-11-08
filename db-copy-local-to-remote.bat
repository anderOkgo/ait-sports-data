@ECHO OFF
call com\db-local-data-backup.bat
call com\db-join-full-backup.bat
call com\db-sync-FTP-both.bat
call com\db-remote-restore-swap.vbs
PAUSE
