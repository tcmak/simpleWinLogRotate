# simpleWinLogRotate
A really simple log rotation script for windows

# Usage
logRotate <fileName in full path>

This script assumes that:
- Run as a schedule task on regular interval (day, week, month, year)
- Rename the log file by appending YYYYMMDD at the end of filename
- The compressed archive will be located in the same directory as the log file.
- It exits upon successful finish

# Multiple files

write a batch such as this

@echo off
start logRotate.bat C:\logs\a.log
start logRotate.bat C:\logs\b.log
start logRotate.bat C:\logs\c.log


To Do:
- The archived file will be compressed by the tool specified. No compression will be done if not specified
