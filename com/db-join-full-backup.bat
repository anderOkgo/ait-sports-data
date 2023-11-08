@ECHO OFF
SETLOCAL
IF EXIST setter.bat (CD.. & CALL com\setter.bat) ELSE ( CALL com\setter.bat )
TYPE "%FTPFolder.txt%\db-structure.sql" "%FTPFolder.txt%\db-data.sql"  "%FTPFolder.txt%\db-trigger.sql">"%FTPFolder.txt%\db-swap.sql"
PAUSE
