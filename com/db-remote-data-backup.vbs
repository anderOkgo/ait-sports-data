Set objshell = createobject("wscript.shell")
MysqlDB = CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\MysqlDB.txt").ReadLine
MysqlHost = CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\MysqlHost.txt").ReadLine
Mysqlpss = CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\Mysqlpss.txt").ReadLine
MysqlUser = CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\MysqlUser.txt").ReadLine
FTPPath =CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\FTPPath.txt").ReadLine
FTPFolder =CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\FTPFolder.txt").ReadLine
SSHps =CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\SSHps.txt").ReadLine
SSHConn =CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\SSHConn.txt").ReadLine
SSHMainps =CreateObject("Scripting.FileSystemObject").OpenTextFile("keys\SSHMainps.txt").ReadLine
Set bloc = objshell.exec("cmd /c start ")
Wscript.sleep 3000
Objshell.sendkeys SSHConn
Objshell.sendkeys "{ENTER}"
Wscript.sleep 5000
Objshell.sendkeys SSHMainps
Wscript.sleep 100
Objshell.sendkeys "{ENTER}"
Wscript.sleep 4000
Objshell.sendkeys "mysqldump -u " & MysqlUser &  " -h " & MysqlHost & "  -p " & MysqlDB & " --no-create-info --complete-insert --default-character-set=utf8 --skip-triggers --compact --no-create-db >" & FTPPath &  "/"  & FTPFolder & "/db-data.sql"
Wscript.sleep 1000
Objshell.sendkeys "{ENTER}"
Wscript.sleep 3000
Objshell.sendkeys Mysqlpss
Wscript.sleep 200
Objshell.sendkeys "{ENTER}"
Wscript.sleep 5000
Objshell.sendkeys "exit"
Wscript.sleep 200
Objshell.sendkeys "{ENTER}"
Wscript.sleep 1000
Objshell.sendkeys "exit"
Wscript.sleep 200
Objshell.sendkeys "{ENTER}"
Wscript.sleep 200
Wscript.quit
