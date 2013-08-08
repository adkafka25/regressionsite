package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

//Not managed by ebeans
public class BatchScriptTemplate extends Model {
	public static String getContents(){
		String content = "@echo off \n"+
			"REM We use today's date for creating all the new regression output directories \n"+
			" \n"+
			"SET theDATE=%date:~-4,4%-%date:~-10,2%-%date:~-7,2% \n"+
			"echo Start of Java regression test on %theDATE% %time% \n"+
			" \n"+
			"REM We use the last run date for comparing the results against the previous run \n"+
			"REM Set the 'lastRun' environment variable by reading this in from a file that was \n"+
			"REM created the last time we ran this. \n"+
			" \n"+
			"call D:\\Regression\\bin\\SetLastRun.Java.bat \n"+
			"echo Comparing the results to the last run on: %lastRun% \n"+
			" \n"+
			"ECHO Changing to the regression test bin directory \n"+
			"call cd D:\\Regression\\bin \n"+
			" \n"+
			"REM Run regressions \n"+
			"//COMMANDS GO HERE// \n"+
			"REM Done running regressions \n"+
			" \n"+
			"echo %time%Java regression tests complete \n"+
			" \n"+
			" \n"+
			"REM Now clean up source area \n"+
			" \n"+
			" \n"+
			"mkdir D:\\Regression\\Source\\java\\ARCHIVE\\trunk-%theDATE% \n"+
			"mkdir D:\\Regression\\Source\\java\\ARCHIVE\\trunk-%theDATE%\\Snow \n"+
			"xcopy /E /S /Y /Q D:\\Regression\\Source\\java\\Snow D:\\Regression\\Source\\java\\ARCHIVE\\trunk-%theDATE%\\Snow \n"+
			" \n"+
			"del D:\\Regression\\Source\\java\\Snow\\Snowbnd.class \n"+
			" \n"+
			"echo %time%Java cleanup complete \n"+
			" \n";
		return content;
	}
}