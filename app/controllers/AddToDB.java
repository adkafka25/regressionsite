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
import com.avaje.ebean.*;
import play.db.*;
import java.sql.*;

//For regex
import java.util.regex.*;

public class AddToDB extends Controller{
	
	/**
	 * This function lists all files (not folders) in startFolder and its subdirectories recursively
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
	public static List<String> enterIntoDB(List<String> allFiles, String dirname, Long runID){
		String[] ignoreList = {"Thumbs.db" };
				
		List<String> log = new ArrayList<String>();
		
		log.add("Log for adding files from "+dirname);
		log.add("LogLevel___fileName___diffType___RunID____difference____ bugNum");
		
		for(String filePath : allFiles){//for each file in List allFiles...
			//Take out dirname from path
			filePath=filePath.substring(dirname.length()+1); //and remove beginning \
			
			//At this point, filePath is the path to the file after dirname
			
			String[] fileAsArray = filePath.split("\\\\");//had to escape the backslash
			
			String fileName=getFileName(filePath); //FileName
			//String[] fileNameArray = fileName.split("\\."); //had to escape again //no longer necessary
			
			//If file name is in ignore list
			if (Arrays.asList(ignoreList).contains(fileName)){
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
			
			if(diffType!=null && fileName!=null){ //Mandatroy to be inserted
				log.add(enterFileInfo(fileName, diffType, runID, difference, bugNum)); //Avtually insert the data into DB
			}
			else{
				if(diffType==null){
					log.add("ERROR: Unknown difftype in "+filePath+" ---- Not added");
				}
				else{
					log.add("ERROR: Can't find file name in file: "+filePath+" ---- Not added");
				}
			}
		}
		return log;
	}
	
	/**
	 * This method executes a mySQL UPDATE statement
	 * @param SQLStatement The statemnt as a string that should be run
	 * @return nothing
	 */
	public static void sqlUpdate(String SQLStatement){
		//Start connection
		Connection connection = DB.getConnection();
		
		try{
			//Create new statement
			Statement stmt = connection.createStatement();
			//Run query
			stmt.executeUpdate(SQLStatement);
			//Close statement
			stmt.close();
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		//Close connection
		try{
			connection.close();
		}
		catch (SQLException e){
			e.printStackTrace();
		}
	}
	 
	/**
	 * This method takes file info as input, inputs them into the DB, and returns a string with ther results
	 * @param fileName Name of file to enter into DB
	 * @param diffType The kind of difference
	 * @param runID The runID that corresponds to this run
	 * @param difference String describing the difference
	 * @param bugNum The bug number corresponding to 
	 * @return Log messege if there was no error
	 */
	public static String enterFileInfo(String fileName, String diffType, Long runID, String difference, Long bugNum){
		//For log info
		String returnInfo="";
		
		if(!PageOut.testPageExists(fileName,runID)){//if page has not been added before
			//Begin log info for this file
			returnInfo+="---Log Info for "+fileName+"---";
			
			long pageID=-1L; //will store ID for page here.
			
			//Get page_ID, create one if deosn't already exist
			pageID=PageOut.getPageID(fileName,runID);
			returnInfo+="INFO: "+fileName+" added to DB with runID="+runID;
		
			//Deal with difference and pagetodifference
			if(diffType!=null){ //
				if(difference==null){//If difference is not set, set it to this default value
					difference="No description";
				}
				//get ID of difference
				long diffID = Difference.getDifferenceID(difference,diffType);
				//Prepare SQL statement
				String SQLpagetodiff="INSERT INTO pagetodifference (Page_ID,Difference_ID) VALUES ('"+pageID+"','"+diffID+"')";
				//Run SQL statement
				sqlUpdate(SQLpagetodiff);
				//Add log info (if no error) - If error occured, dealt with in sqlUpdate method
				returnInfo+=" INFO: "+fileName+" linked with difference: "+difference+" of difference type"+diffType;

			}
			//Deal with bug and pagetobug
			if(bugNum!=null){
				//Get id of bug Num
				long bugID = Bug.getBugID(bugNum);
				//Prepare SQL statement
				String SQLpagetobug="INSERT INTO pagetobug (Page_ID,Bug_ID) VALUES ('"+pageID+"','"+bugID+"')";
				//Run SQL statement
				sqlUpdate(SQLpagetobug);
				//Add log info (if no error) - If error occured, dealt with in sqlUpdate method
				returnInfo+=" INFO: "+fileName+" linked with bug: "+bugNum;
				
			}
		}
		return returnInfo; //return log
	}
	
	/**
	 * This method gets the file name of a given filePath
	 * @param filePath A string similar to "Difftype\?Difference\?BugNum\FileName"
	 * @return FileName
	 */
	public static String getFileName(String filePath){
		String[] fileAsArray = filePath.split("\\\\");//had to escape the backslash
		String fileName=fileAsArray[fileAsArray.length-1];
		
		fileName=fileName.replaceAll(".(ref|new|dif).",""); //Take out .1ref,.2new,.3dif....
		
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
	public static Result addFilesFromRun(String dirname, Long runID){
		File startFile = new File(dirname);
		
		List<String> allFiles = new ArrayList<String>();
		
		listFilesRecursively(startFile, allFiles); //allFiles is now a List<String> of all files paths
		
		return ok(
			test.render(
				enterIntoDB(allFiles, dirname, runID), runID
			)
		);
	}
	
	/**
     * Handle the 'new run form' submission 
     */
    public static Result saveRun() {
        Form<Run> runForm = Form.form(Run.class).bindFromRequest();//Get from info from POST
		
		 if(runForm.hasErrors()) { //doesn't do much...
            return badRequest(createForm.render(runForm));
        }
		
		String folderPath = runForm.get().path;
		File folder = new File(folderPath); //for checking if it exists
		
		//if path is invalid, log it and don't create run
		if(folderPath==null || !folder.exists()){
			List<String> log = new ArrayList<String>();
			log.add("ERROR: Invalid please set Path to Issues Folder");
			log.add("Path = "+folderPath+" is invalid or non-existant");
			return badRequest(
				test.render(log, 0L)
			);
		}
		
		//Get foreign keys for all necessary fields
		String query = "INSERT INTO Run (Run_Name,Version_ID,Format_ID,Date_ID,SVN_ID,Performance_ID) VALUES (\'"+runForm.get().name+"\',\'"+Version.getVersionID(runForm.get().version.name, runForm.get().version.platform.id)+"\',\'"+runForm.get().format.id+"\',\'"+models.Date.getDateID(runForm.get().date.name)+"\',\'"+SVN.getSvnID(runForm.get().svn.num)+"\',\'"+Performance.getPerformanceID(runForm.get().performance.time)+"\')";
		long runID=-1L;
		
		ResultSet generatedKeys = null;
		
		try{
			//Start connection
			Connection connection = DB.getConnection();
			//Create new statement
			Statement stmt = connection.createStatement();
			//Run query
			int affectedRows = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			
			if(affectedRows == 0){
				throw new SQLException("Creating page failed, no rows affected.");
			}
			//Get ID
			generatedKeys = stmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				runID=(generatedKeys.getLong(1)); //store genereated ID for run as runID
			} else {
				throw new SQLException("Creating page failed, no generated key obtained.");
			}
			
			//Close statement
			generatedKeys.close();
			stmt.close();
			connection.close();
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		
		if(runID!=-1L){//Path to issues folder given
			//Change path to / slashes. Run method
			String dirname = runForm.get().path.replace("\\","/");
			return addFilesFromRun(dirname, runID); //Run method to add pages toDB from run info
		}
		else{//For errors
			List<String> log = new ArrayList<String>();
			if(runID==-1L){
				log.add("ERROR: Error creating run and getting its ID");
			}
			else{
				log.add("ERROR: Unknown error occured before files could be added");
			}
			return ok(
				test.render(log,runID)
				);
		}
		
        //runForm.get().save();
        //flash("success", "Run " + runForm.get().name + " has been created");
        //return Application.GO_HOME;
    }
}