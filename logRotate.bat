@echo off

REM Preparing Timestamp Information
set year=%date:~6,4%
set month=%date:~3,2%
set day=%date:~0,2%

REM Compression command
set "compressCommand=C:\Program Files\7-Zip\7z.exe"
set "compressFileType=7z"
set "compressSwitches=a -t7z"

if [%1] == [] goto end

For %%a in (%1) do (
    set filepath=%%~dpa
    set filename=%%~na
    set extname=%%~xa
)    

set dest=%filename%_%year%%month%%day%%extname%
ren %1 %dest%

"%compressCommand%" %compressSwitches% "%filepath%%dest%.%compressFileType%" "%filepath%%dest%"
del  "%filepath%%dest%"

exit 0
:end
echo Usage: logRotate.bat filename
