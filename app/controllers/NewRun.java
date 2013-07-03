package controllers;

import play.*;
import play.mvc.*;

//For forms
import play.data.*;
import play.data.Form.*;

//Get scala templates
import views.html.*;
//Get objects
import models.*;

//for testing/file
import java.io.File;
import java.util.*;

//For entering data to mysql
import play.db.*;

//For regex
import java.util.regex.*;

public class NewRun extends Controller{
	public static Result addNewRun(){
		Form<Run> runForm = Form.form(Run.class).bindFromRequest();//Get from info from POST
		
		if(runForm.hasErrors()) { //doesn't do much...
            runForm.discardErrors();
			System.out.println("Errors in addNewRun");
        }
		
		/*
		runForm.get().name+"\n"+
		Platform.getByID(runForm.get().version.platform.id).name+"\n"+
		runForm.get().version.name+"\n"+
		FileFormat.getByID(runForm.get().format.id).name+"\n"+
		runForm.get().compDir+"\n"+
		runForm.get().inputDir+"\n"
		*/
		
		
		return ok(
			generateCommand(Platform.getByID(runForm.get().version.platform.id).name,
				runForm.get().name,
				runForm.get().compDir,
				runForm.get().inputDir,
				FileFormat.getByID(runForm.get().format.id).name
				)
		);
	}
	/** This method takes a string command and enters it into the batch file template
	 * @param Dtype The platform of the run
	 * @param Dname The name of the run
	 * @param Dref Reference directory for output
	 * @param Dinputdir Input directory 
	 * @param format Format of this particular run
	 * @return String of command to run the regression
	 * Example output = 
	 call ant all -Dtype=java -Dname=Idaho.13.4-PDF -Dref=13.4vsNothing-PDF -Dinput.dir=D:\Geoff\PDFs.Nightly
	 
	 rmdir D:\Regression\java\Trunk\Idaho.13.4-PDF
	 
	 */
	public static String generateCommand(String Dtype, String Dname, String Dref, String Dinputdir, String format){
		return "\n"+
			"ECHO %time% "+format.toUpperCase()+
			"\n"+
			"call ant all -Dtype="+Dtype.toLowerCase()+" -Dname="+Dname+" -Dref="+Dref+" -Dinput.dir="+Dinputdir+
			"\n"+
			"rimdir D:\\Regression\\java\\Trunk\\"+Dname;
	}
	/** This method takes a string command and enters it into the batch file template
	 * @param command A string of the command that should be inserted into the template
	 * @return String of complete batch file
	 
	public static String generateBatchFile(String command){
		//
	}*/
}