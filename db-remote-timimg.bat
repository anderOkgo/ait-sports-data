REM copy remote data and join with the new structure and restore again (all remote)
@ECHO OFF
call com\db-remote-data-backup.vbs | EXIT
call com\db-sync-FTP-both.bat
call com\db-join-full-backup.bat
call com\db-sync-FTP-both.bat
call com\db-remote-restore-swap.vbs
PAUSE
