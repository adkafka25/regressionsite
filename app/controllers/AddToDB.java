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
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

//For entering data to mysql
import com.avaje.ebean.*;
import play.db.*;
import java.sql.*;

//For regex
import java.util.regex.*;

public class AddToDB extends Controller{
	
	/**
	 * This function lists all files in startFolder and its subdirectories recursively
	 * @param startFolder A File object that signifies where to start
	 * @param files The list to append all files to
	 * Adds all files to supplied List. Does not return it, but list will be altered
	 */
	public static void listFilesRecursively (File startFolder, List<String> files){
		if(!startFolder.isDirectory()){//If startFolder is a file, add it to list
			files.add(startFolder.toString());
		}
		else { //startFolder is a folder
			for (File folder : startFolder.listFiles()){ //For each folder in subfolder, run this method
				listFilesRecursively(folder, files);
			}
		}
	}
	
	/**
	 * This function takes a list of file names and inserts it into the database
	 * @param allFiles is a list of file-name strings that should be added into the DB 
	 */
	public static List<String> enterIntoDB(List<String> allFiles, String dirname){
		String[] ignoreList = {"Thumbs.db" };
				
		List<String> files = new ArrayList<String>();
		
		files.add("diffType____difference____ bugNum___fileName");
		
		for(String filePath : allFiles){//for each file in List allFiles...
			//Take out dirname from path
			filePath=filePath.substring(dirname.length()+1); //and remove beginning \
			
			//At this point, filePath is the path to the file after dirname
			
			String[] fileAsArray = filePath.split("\\\\");//had to escape the backslash
			
			String fileName=getFileName(filePath); //FileName
			
			//String[] fileNameArray = fileName.split("\\."); //had to escape again
			
			if (Arrays.asList(ignoreList).contains(fileName)){//If file name is in ignore list
				continue;//ignore this file and move to the next one
			}
			
			String diffType = getDiffType(fileAsArray[0]);//Store what kind of difference (Better, Neutral, or Worse)
			
			String difference=null;
			if(fileAsArray.length>2){
				difference = getDifference(fileAsArray);//Stores description of difference
			}
			
			Long bugNum=null;
			if(fileAsArray.length>2){
				bugNum = getBugNum(fileAsArray);//Stores description of difference
			}
			
			if(diffType!=null && fileName!=null){
				//Run query and insert data
			}
			
			/*
			String query = "INSERT INTO Page (Page_Name,Run_ID) VALUES (\'"+fileName+"\',\'"+4+"\')";
			try{
				//Start connection
				Connection connection = DB.getConnection();
				//Create new statement
				Statement stmt = connection.createStatement();
				//Run query
				stmt.executeUpdate(query);
				//Close statement
				stmt.close();
			}
			catch (SQLException e){
				e.printStackTrace();
			}
			*/
			files.add(filePath);
			files.add(diffType+" "+difference+" "+bugNum+" "+fileName);
			files.add("");
		}
		return files;
	}
	
	/**
	 * This method gets the file name of a given filePath
	 * @param filePath A string similar to "Difftype\?Difference\?BugNum\FileName"
	 * @return FileName
	 */
	public static String getFileName(String filePath){
		String[] fileAsArray = filePath.split("\\\\");//had to escape the backslash
		String fileName=fileAsArray[fileAsArray.length-1];
		
		if(fileName.contains(".")){
			return fileName;
		}
		else{
			return null;//No filename found
		}
	}
	
	/**
	 * This method gets the difference Type of a given filePath
	 * @param filePath A string similar to "Difftype"
	 * @return "Better", "Neutral", "Worse", or error
	 */
	public static String getDiffType(String filePath){
		if(filePath.toLowerCase().contains("neutral")){
			return "Neutral";
		}
		else if(filePath.toLowerCase().contains("better")){
			return "Better";
		}
		else if(filePath.toLowerCase().contains("worse")){
			return "Worse";
		}
		else{
			return null;//Difftype not found 
		}
	}
	
	/**
	 * This method gets the difference description of filePath
	 * @param filePath A string similar to "Difftype\?Difference\?BugNum\FileName"
	 * @return String that describes the difference
	 */
	public static String getDifference(String[] fileAsArray){
		if(fileAsArray[1].matches("[A-z ]*")){
			return fileAsArray[1];
		}
		else if(fileAsArray[2].matches("[A-z ]*")){
			return fileAsArray[2];
		}
		else{
			return null;
		}
	}
	
	/**
	 * This method gets the difference description of filePath
	 * @param filePath A string similar to "Difftype\?Difference\?BugNum\FileName"
	 * @return String that describes the difference
	 */
	public static Long getBugNum(String[] fileAsArray){
		
	
		if(fileAsArray[1].matches("[0-9]{1,5}")){
			return Long.parseLong(fileAsArray[1]);
		}
		else if(fileAsArray[2].matches("[0-9]{1,5}")){
			return Long.parseLong(fileAsArray[2]);
		}
		else{
			return null;
		}
	}
	
	//send List to /test
	public static Result test(){
		String dirname = "//snowtest/Regression/java/13.5-Build2.1-AFP/Issues.13.5-Build2-AFP";
		File startFile = new File(dirname);
		
		List<String> allFiles = new ArrayList<String>();
		
		listFilesRecursively(startFile, allFiles); //allFiles is now a List<String> of all files
		
		
		
		return ok(
			test.render(
				enterIntoDB(allFiles, dirname)
			)
		);
	}
	
	/**
     * Handle the 'new run form' submission 
     */
    public static Result saveRun() {
        Form<Run> runForm = Form.form(Run.class).bindFromRequest();
		
		//Form<Run> fixedRunForm = runForm.fill(Version.getVersionID(runForm.get().version.id));
		
		 if(runForm.hasErrors()) { //doesn't do much...
            return badRequest(createForm.render(runForm));
        }
		
		String versionName=runForm.get().version.name;
		
		//Get foreign keys for all necessary fields
		String query = "INSERT INTO Run (Run_Name,Version_ID,Format_ID,Date_ID,SVN_ID,Performance_ID) VALUES (\'"+runForm.get().name+"\',\'"+Version.getVersionID(versionName, runForm.get().version.platform.id)+"\',\'"+runForm.get().format.id+"\',\'"+models.Date.getDateID(runForm.get().date.name)+"\',\'"+SVN.getSvnID(runForm.get().svn.num)+"\',\'"+Performance.getPerformanceID(runForm.get().performance.time)+"\')";
		try{
			//Start connection
			Connection connection = DB.getConnection();
			//Create new statement
			Statement stmt = connection.createStatement();
			//Run query
			stmt.executeUpdate(query);
			//Close statement
			stmt.close();
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
        //runForm.get().save();
        flash("success", "Run " + runForm.get().name + " has been created");
        return Application.GO_HOME;
    }
}