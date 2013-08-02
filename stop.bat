@ECHO OFF

ECHO This script will kill the running play service started with 'play start'

set /p PID=<RUNNING_PID

ECHO Killing PID="%PID%"...

taskkill /F /PID %PID%

ECHO Deleting RUNNING_PID

del RUNNING_PID

PAUSE