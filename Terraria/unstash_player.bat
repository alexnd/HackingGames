set playername=Bob
set username=nobody
set SRC_DIR=%1
set DEST_DIR=c:\Users\%username%\Documents\My Games\Terraria\
copy "%SRC_DIR%Players\%playername%.plr" "%DEST_DIR%Players\%playername%.plr"
copy "%SRC_DIR%Players\%playername%.bak" "%DEST_DIR%Players\%playername%.bak"
xcopy "%SRC_DIR%Players\%playername%" "%DEST_DIR%Players\%playername%" /E /Y
