set local

REM Configuration

REM files to compress
set log_file[0]=""

REM Program starts here

REM Preparing Timestamp Information
set year=%date:~6,4%
set month=%date:~0,2%
set day=%date:~3,2%

set "x=0"

:SymLoop
if defined log_file[%x%] (
  for /f "delims==" %%F in (%log_file[0]%) do (
    set dest=%%~dF%%~pF%%~nF_%year%%month%%day%%%~xF
    copy %log_file[0]% %dest%
    set executeCompression=%compressCommand% a -t7z %dest%.7z %dest%
    %executeCompression%
  )
  set /a "x+=1"
  GOTO :SymLoop
)
