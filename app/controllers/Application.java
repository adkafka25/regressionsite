package controllers;

import java.util.List;

import play.*;
import play.mvc.*;

//Get scala templates
import views.html.*;
//For forms
import play.data.*;
import play.data.Form.*;
//Get objects
import models.*;

//for testing/file
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.*;

// For excel file
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import java.io.FileOutputStream;





public class Application extends Controller  {
	/**
     * This result directly redirect to application home.
     */
    public static Result GO_HOME = redirect(
        routes.Application.overview()
    );
    /**
     *  Go to the Run Index.
     */
    public static Result RUN_INDEX = redirect( 
    	routes.Application.listRun(0, "name", "asc", "","name")
    );
  
    public static Result runIndex() {
    	return RUN_INDEX;
    }
    
    public static Result index() {
        return GO_HOME;
    }
    
    public static Result overview() {
        return ok(
            overview.render()
        );
    }
    public static Result home() {
        return ok(
            homePage.render()
        );
    }
 
    

    /**
     * Javascript routes. Allows for easier navigation in the html files.
     * Note that, in jsroutes, there are no arguments needed. However you still
     * need to put in arguments in the html file
     * @return page you want to redirect to
     */
	
	public static Result javascriptRoutes()  {
		response().setContentType("text/javascript");
		return ok(
			Routes.javascriptRouter("jsRoutes",
				//Routes
				controllers.routes.javascript.Application.deleteRun(),
				controllers.routes.javascript.Application.overview(),
				controllers.routes.javascript.Application.dataList(),
				controllers.routes.javascript.Application.getData(),
				controllers.routes.javascript.Application.runIndex(),
				controllers.routes.javascript.Application.listPageByRun(),
				controllers.routes.javascript.Application.listRun(),
				controllers.routes.javascript.Application.listBug(),
				controllers.routes.javascript.Application.listPage(),
								
			//	controllers.routes.javascript.Application.createNewRun(),

				controllers.routes.javascript.Application.importRun(),
				controllers.routes.javascript.Application.addBugNum(),
				controllers.routes.javascript.Application.addDiffDesc(),
			    controllers.routes.javascript.Application.recentRuns(),
			 	controllers.routes.javascript.Application.createFile()
				
			)
		);
	}
	/**
	 * This method takes a run and returns and excel spreadsheet with data from 
	 * the runs pages.
	 * @param run, the run you are using.
	 * @return file, the excel spreadsheet.
	 * @throws IOException
	 */
	public static Result pageExcel(Long id) throws IOException {
		
		
		
		
		File file = new File("mydata.xls");
        FileOutputStream fileOut = new FileOutputStream(file);
        Workbook wb = new HSSFWorkbook();
        Run run = Run.getRunByID(id);
        String filename = run.name + ".xls";
        
        Sheet sheet = wb.createSheet("Sheet1");
        int rNum = 0;
        Row row = sheet.createRow(rNum);
        int cNum = 0;
        Cell cell = row.createCell(cNum);
        cell.setCellValue("Page Name");
        row.createCell(1).setCellValue("Run Name");
        row.createCell(2).setCellValue("Format");
        row.createCell(3).setCellValue("Performance Time");
        row.createCell(4).setCellValue("Error");
        row.createCell(5).setCellValue("Difference Description");
        
        
        List<PageOut> list = PageOut.pageList(id);
        int brNum = 1;
        for (PageOut page: list) {
        	Row bro = sheet.createRow(brNum);
        	bro.createCell(0).setCellValue(page.name);
        	bro.createCell(1).setCellValue(run.name);
            bro.createCell(2).setCellValue(run.format.name);
            
            try {
            bro.createCell(3).setCellValue(run.performance.time);
            }
            catch (NullPointerException i) {	
            }
            try {
            bro.createCell(4).setCellValue(page.error.description);
            }
            catch (NullPointerException i) {	
            }
            try {
            	List<Difference> diff = Difference.listDifferences(page);
            	String dif = " ";
            	
            		for(Difference difference: diff) {
            			if(difference.name != null) {
            				dif += difference.name + " / ";
            			}
            	}
            	bro.createCell(5).setCellValue(dif);
            }
            
            	
            catch (NullPointerException i) {
            	
            }
            brNum++;
        }
        	for(int i = 0; i < 11; i++) {
        		sheet.autoSizeColumn(i);
            	}
        
        
        wb.write(fileOut);
        fileOut.close();
        response().setContentType("application/x-download");  
		response().setHeader("Content-disposition","attachment; filename=" + filename);  
		
		
        return ok(file);
		
		
	}
	
	/**
	 * This creates excel spreadsheet for report. Method should be modified at some point into 
	 * a couple different methods.
	 * The parameters create the list you want. 
	 * @return The excel file
	 * @throws IOException
	 */
	public static Result createFile(String f1, String f2, String p1, String p2) throws IOException  {
		
		File file = new File("mydata.xls");
        FileOutputStream fileOut = new FileOutputStream(file);
        Workbook wb = new HSSFWorkbook();
        String filename = f1 + "/" + f2 + ".xls";
           
        Sheet sheet = wb.createSheet("Sheet1");
        int rNum = 0;
        Row row = sheet.createRow(rNum);
        int cNum = 0;
        Cell cell = row.createCell(cNum);
        cell.setCellValue("Date");
        row.createCell(1).setCellValue("Run Name");
        row.createCell(2).setCellValue("Version");
        row.createCell(3).setCellValue("Format");
        row.createCell(4).setCellValue("SVN");
        row.createCell(5).setCellValue("Performance Time");
        row.createCell(6).setCellValue("# Better");
        row.createCell(7).setCellValue("# Worse");
        row.createCell(8).setCellValue("# Neutral");
        row.createCell(9).setCellValue("# Bugs");
        row.createCell(10).setCellValue("# Not Decompressed");
        
        List<Run> list = Run.dataSet(f1, f2, p1, p2);
        int brNum = 1;
        
        for (Run run: list) {
        	Row bro = sheet.createRow(brNum);
        	bro.createCell(0).setCellValue(run.date.name);
        	bro.createCell(1).setCellValue(run.name);
            bro.createCell(2).setCellValue(run.version.name);
            bro.createCell(3).setCellValue(run.format.name);
            try{
            bro.createCell(4).setCellValue(run.svn.num);
            }
            catch (NullPointerException i) {	
            }
            try{
            bro.createCell(5).setCellValue(run.performance.time);
            }
            catch (NullPointerException i) {	
            }
            bro.createCell(6).setCellValue(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Better"))));
            bro.createCell(7).setCellValue(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Worse"))));
            bro.createCell(8).setCellValue(Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral"))));
            bro.createCell(9).setCellValue(Run.calculateBugs(run));
            bro.createCell(10).setCellValue(PageOut.getPagesNotDecompressed(run.id));
            brNum++;
        }
        
       
        for(int i = 0; i < 11; i++) {
            sheet.autoSizeColumn(i);
            }
        
        wb.write(fileOut);
        fileOut.close();
        response().setContentType("application/x-download");  
		response().setHeader("Content-disposition","attachment; filename=" + filename);  
		
		
        return ok(file);
	}	
	
	
	/**
     * Display the paginated list of runs.
     *
     * @param page Current page number (starts from 0)
     * @param sortBy Column to be sorted
     * @param order Sort order (either asc or desc)
     * @param filter Filter applied on page names
     */
    public static Result listRun(int page, String sortBy, String order, String filter, String filterBy) {
        return ok(
            listRuns.render(
                Run.page(page, 10, sortBy, order, filter, filterBy),
                sortBy, order, filter, filterBy
            )
        );
    }
	
	
	
	/**
     * Display the paginated list of pages.
     *
     * @param page Current page number (starts from 0)
     * @param sortBy Column to be sorted
     * @param order Sort order (either asc or desc)
     * @param filter Filter applied on page names
     */
    public static Result listPage(int page, String sortBy, String order, String filter) {
        return ok(
            listPages.render(
                PageOut.page(page, 10, sortBy, order, filter),
                sortBy, order, filter
            )
        );
    }
	
		/**
     * Display the paginated list of bugs.
     *
     * @param page Current page number (starts from 0)
     * @param sortBy Column to be sorted
     * @param order Sort order (either asc or desc)
     * @param filter Filter applied on page names
     */
    public static Result listBug(int page, String sortBy, String order, String filter) {
        return ok(
            listBugs.render(
                Bug.page(page, 10, sortBy, order, filter),
                sortBy, order, filter
            )
        );
    }
	
	/**
     * Display the paginated list of pages given a run.
     *
     * @param page Current page number (starts from 0)
     * @param sortBy Column to be sorted
     * @param order Sort order (either asc or desc)
     * @param runID Filter applied on page names
     */
    public static Result listPageByRun(int page, String sortBy, String order, Long runID, String filter, String diff) {
        if(Run.getRunByID(runID)==null){//if runID does not exist...
			return RUN_INDEX;
		}
		return ok(
            listPagesByRun.render(
                PageOut.pageFromRun(page, 10, sortBy, order, runID, filter, diff),
                sortBy, order, runID, filter, diff
            )
        );
    
    }

    /**
     * Creates data for the home page graph.     
     * @return a string that is formatted for google graphs.
     */

public static String createData(){
	
		List<models.Date> allDates = models.Date.getListUsed();
		//int[] frequency = models.Company.allFrequency();
		
		String data = "[ ";
		
		for(models.Date date: allDates){
			String name = date.jsDate();
			int jBugs= models.Bug.frequency(date, "Java" );
			int seventy = 70;
			String jMes = null;
			String jTitle = null;
			int nBugs = models.Bug.frequency(date, "Native");
			String nMes = null;
			String nTitle = null;
			
			data += name + jBugs + "," + nBugs + "], ";
		}
		data = data.substring(0,data.length()-1); // cut off the comma at the end
		
		data+="]";
		
		
		
		
		//data+= "[new Date(2008, 1 ,8), 30000, null, null, 40645, null, null]]";
		
		return data;
	}

	
	
	/**
	 * This function creates the form for adding a new run
	 */
	public static Result importRun() {
		Form<Run> runForm = Form.form(Run.class);
        return ok(
            importRun.render(runForm)
        );
	}
	/**
	 * This function creates the form for loading data from a 
	 * specific run.
	 * @return the page runData.
	 */
	public static Result getData(long id) {
		if (Run.getRunByID(id)==null) {
			return GO_HOME;
		}
		Form<Run> data = Form.form(Run.class);
		return ok(
			runData.render(id, data)
		
		);
	}
	/**
	 * This function creates the form for loading data from a 
	 * specific bug.
	 * @return the page bugData.
	 */
	public static Result bugData(long id) {
		if(Bug.getBugFromID(id)==null) {//if bugID does not exist...
			return GO_HOME;
		}
		Form<Bug> data = Form.form(Bug.class);
		return ok(
			bugData.render(id, data)
		
		);
	}
	/**
	 * This function returns a list of recent runs that share the same characteristics.
	 * @param days how far you are willing to go back.
	 * @return recentrun page
	 */
	public static Result recentRuns(String filter1, String filter2, String param1, String param2, int days) {
		Form<Run> data = Form.form(Run.class);
		return ok(
			recentRuns.render(filter1, filter2, param1, param2, days, data)	
				);
	}
	/**
	 * Function loads a page which shows list of runs share similar characteristics
	 * Param1 and Param2 are the data types you are looking for (example: Format or Date)
	 * Filter1 and Filter2, respectively, are what you are searching for (example: PDF or 12/12/2000)
	 * @return the page dataList
	 */
   public static Result dataList(String filter1, String filter2, String param1, String param2) {
	   
		Form<Run> data = Form.form(Run.class);
		return ok(
			dataList.render( filter1, filter2, param1,  param2, data)	
				);
	}
	  
	/**
     * Handle run deletion
     */
    public static Result deleteRun(Long id) {
		if(Run.getRunByID(id)!=null){//if run exists...
			Run.find.ref(id).delete();
			flash("success", "Run has been deleted");
			return listRun(0, "name", "asc", "", "name");
		}
		else{ //Run doesn't exist
			return runIndex();
		}
	}
	
	/**
	 * Handle submitting bug number manually
	 */
	public static Result addBugNum (){
		Form<Bug> bugForm = Form.form(Bug.class).bindFromRequest();//Get from info from POST
		
		Bug bug = Bug.getBugFromID(bugForm.get().id);
		bug.number=bugForm.get().number;
		bug.save();
		return ok();
	}
	
	/**
	 * Handle submitting difference description manually
	 */
	public static Result addDiffDesc (){
		Form<Difference> diffForm = Form.form(Difference.class).bindFromRequest();//Get from info from POST
		
		Difference difference = Difference.getByID(diffForm.get().id);
		difference.name=diffForm.get().name;
		difference.save();
		return ok();
	}
	
	
	
	
	
}
