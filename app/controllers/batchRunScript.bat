REM THIS FILE IS ONLY USESD AS A REFERENCE. THE ACTUAL TEMPLATE IS IN app/models/BatchScriptTemplate.java




@echo off
REM We use today's date for creating all the new regression output directories

SET theDATE=%date:~-4,4%-%date:~-10,2%-%date:~-7,2%
echo Start of Java regression test on %theDATE% %time%

REM We use the last run date for comparing the results against the previous run
REM Set the 'lastRun' environment variable by reading this in from a file that was
REM created the last time we ran this.

call D:\Regression\bin\SetLastRun.Java.bat
echo Comparing the results to the last run on: %lastRun%

ECHO Changing to the regression test bin directory
call cd D:\Regression\bin

REM Run regressions
//COMMANDS GO HERE//
REM Done running regressions

echo %time%	Java regression tests complete


REM Now clean up source area


mkdir D:\Regression\Source\java\ARCHIVE\trunk-%theDATE%
mkdir D:\Regression\Source\java\ARCHIVE\trunk-%theDATE%\Snow
xcopy /E /S /Y /Q D:\Regression\Source\java\Snow D:\Regression\Source\java\ARCHIVE\trunk-%theDATE%\Snow

del D:\Regression\Source\java\Snow\Snowbnd.class

echo %time%	Java cleanup complete
