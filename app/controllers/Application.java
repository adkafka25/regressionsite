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
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class Application extends Controller {
	/**
     * This result directly redirect to application home.
     */
    public static Result GO_HOME = redirect(
        routes.Application.home()
    );
    public static Result RUN_INDEX = redirect( 
    	routes.Application.listRun(0, "name", "asc", "","name")
    );
  
    public static Result runIndex() {
    	return RUN_INDEX;
    }
    
    public static Result index() {
        return GO_HOME;
    }
    public static Result home() {
        return ok(
            home.render()
        );
    }
 

  	//For javascript routes
	public static Result javascriptRoutes() {
		response().setContentType("text/javascript");
		return ok(
			Routes.javascriptRouter("jsRoutes",
				//Routes
				controllers.routes.javascript.Application.deleteRun()
			)
		);
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
    public static Result listPageByRun(int page, String sortBy, String order, Long runID, String filter) {
        return ok(
            listPagesByRun.render(
                PageOut.pageFromRun(page, 10, sortBy, order, runID, filter),
                sortBy, order, runID, filter
            )
        );
    
    }

    /**
     * Creates data for the home page graph.     
     * @return a string that is formatted for google graphs.
     */
    public static String createData(){
		List<models.Date> allDates = models.Date.getList();
		//int[] frequency = models.Company.allFrequency();
		
		String data = "[['Date','Java','Native'],";
		
		for(models.Date date: allDates){
			String name=date.getDateName();
			int javaOc = models.Bug.frequency(date, "SnowBatch" );
			int nativeOc = models.Bug.frequency(date, "Native");
			data+="['"+name+"', "+ javaOc + "," + nativeOc +"],";
		}
		data = data.substring(0,data.length()-1);
		
		data+="]";
		
		return data;
	}

	
	
	/**
	 * This function creates the form for adding a new run
	 */
	public static Result createNewRun() {
		Form<Run> runForm = Form.form(Run.class);
        return ok(
            createForm.render(runForm)
        );
	}
	/**
	 * This function creates the form for loading data from a 
	 * specific run.
	 * @return the page runData.
	 */
	public static Result getData(long id) {
		Form<Run> data = Form.form(Run.class);
		return ok(
			runData.render(id, data)
		
		);
	}
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
}
