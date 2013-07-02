@echo off
REM We use today's date for creating all the new regression output directories

SET theDATE=%date:~-4,4%-%date:~-10,2%-%date:~-7,2%
echo Start of Java regression test on %theDATE% %time%

REM We use the last run date for comparing the results against the previous run
REM Set the "lastRun" environment variable by reading this in from a file that was
REM created the last time we ran this.

call D:\Regression\bin\SetLastRun.Java.bat
echo Comparing the results to the last run on: %lastRun%

ECHO Changing to the regression test bin directory
call cd D:\Regression\bin

ECHO %time%	MSG
call ant all -Dtype=java -Dname=trunk-13.5vsNothing-MSG -Dref=Nothing-MSG -Dinput.dir=D:\Geoff\MSGs

rmdir D:\Regression\java\Trunk\trunk-13.5vsNothing-APITest /S /Q

ECHO %time%	GIF and friends
call ant all -Dtype=java -Dname=trunk-13.5vsNothing-GIF-PNG-DICOM -Dref=Nothing-GIF-PNG-DICOM -Dinput.dir=D:\Geoff\GIF-PNG-DICOM

rmdir D:\Regression\java\Trunk\trunk-13.5vsNothing-APITest /S /Q


echo %time%	Java regression tests complete


REM Now clean up source area


mkdir D:\Regression\Source\java\ARCHIVE\trunk-%theDATE%
mkdir D:\Regression\Source\java\ARCHIVE\trunk-%theDATE%\Snow
xcopy /E /S /Y /Q D:\Regression\Source\java\Snow D:\Regression\Source\java\ARCHIVE\trunk-%theDATE%\Snow

del D:\Regression\Source\java\Snow\Snowbnd.class

echo %time%	Java cleanup complete
