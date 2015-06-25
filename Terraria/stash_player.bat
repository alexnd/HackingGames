set playername=Bob
set SRC_DIR=%1
set DEST_DIR=c:\tmp\TERRARIA_STASH\
copy "%SRC_DIR%Players\%playername%.plr" "%DEST_DIR%Players\%playername%.plr"
copy "%SRC_DIR%Players\%playername%.bak" "%DEST_DIR%Players\%playername%.bak"
xcopy "%SRC_DIR%Players\%playername%" "%DEST_DIR%Players\%playername%" /E /Y
