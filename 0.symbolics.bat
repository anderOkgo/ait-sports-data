@ECHO OFF
SETLOCAL
SET "unit=C:"
SET "project_container=Projects"
SET "project_folder=ait-sports-data"  :: Just change the folder name
SET "db_folder=sql"
SET "key_folder=keys"
SET "symbolic_file=0.symbolics.bat"
SET "db_data_file=db-data.sql"
SET "db_structre_data_file=db-swap.sql"
SET "com_folder=com\%key_folder%"
SET "FTPSync_path=C:\Projects\Var\%project_folder%"
SET "project_folder_path=%unit%\%project_container%\%project_folder%"

CD  %project_folder_path% & %unit%

IF EXIST %key_folder%                           RMDIR /s /q %key_folder% & MKDIR %key_folder%
IF EXIST %com_folder%                           RMDIR /s /q %com_folder%
IF EXIST %db_folder%\%db_data_file%             DEL   /f /q %db_folder%\%db_data_file%
IF EXIST %db_folder%\%db_structre_data_file%    DEL   /f /q %db_folder%\%db_structre_data_file%
IF EXIST %project_folder_path%\%symbolic_file%  DEL   /f /q %project_folder_path%\%symbolic_file%

MKLINK %db_folder%\%db_data_file%               "%FTPSync_path%\%db_folder%\%db_data_file%"
MKLINK %db_folder%\%db_structre_data_file%      "%FTPSync_path%\%db_folder%\%db_structre_data_file%"
MKLINK %project_folder_path%\%symbolic_file%    "%FTPSync_path%\%symbolic_file%"
MKLINK /D %com_folder%                          "%project_folder_path%\%key_folder%\"

SET "back_key_folder=%FTPSync_path%\%key_folder%"
FOR /f "delims=" %%f IN ('dir /b "%back_key_folder%"') DO (
  MKLINK "%key_folder%\%%f"  "%back_key_folder%\%%f"
)
PAUSE
EXIT