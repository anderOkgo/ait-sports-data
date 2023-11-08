REM copy local data and join with the new structure and restore again (all local)
@ECHO OFF
call com\db-local-data-backup.bat
call com\db-join-full-backup.bat
call com\db-local-restore-swap.bat
PAUSE
