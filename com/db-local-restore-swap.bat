@ECHO OFF
SETLOCAL
IF EXIST setter.bat (CD.. & CALL com\setter.bat) ELSE ( CALL com\setter.bat )
CMD /c %Mysqlpath.txt% -u %MysqlUserLocal.txt% -h %MysqlHost.txt% %MysqlDBLocal.txt% --default-character-set=utf8<sql\db-swap.sql
PAUSE
