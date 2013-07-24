package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * PageOut entity managed by Ebean
 */
@Entity
@Table(name="page")  
public class PageOut extends Model {

	@Column(name="Page_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Page_Name")
    @Constraints.Required
    public String name;
	//Run - also includes format!
	@Column(name="Run_ID")
	@OneToOne
	@JoinColumn(name="Run_ID")
	public Run run;
	
	@Column(name="Performance_ID")
    @OneToOne
	@JoinColumn(name="Performance_ID")
	public Performance performance;

	@Column(name="Error_ID")
	@OneToOne
	@JoinColumn(name="Error_ID")
	public Error error;

    //@Column(name="Difference_ID")
	@ManyToMany(mappedBy="pagesoutdifference")
	//@JoinColumn(name="Difference_ID")
	public Set<Difference> difference = new HashSet<Difference>();
	
	@ManyToMany(mappedBy="pagesoutbug")
	//public Set<Bug> bug = new HashSet<Bug>();
	public Map<PageOut,Bug> bug = new HashMap<PageOut,Bug>();

    /**
     * Generic query helper for entity PageOut with id Long
     */
    public static Finder<Long,PageOut> find = new Finder<Long,PageOut>(Long.class, PageOut.class); 
    
    /**
     * Return a page of PageOut
     *
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<PageOut> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("run")
				.fetch("performance")
				.fetch("error")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
	/**
	 * Returns a list of pages associated with that page
	 * 
	 * @param page The page to fin differences of
	 * @return Returns list of differences
	 */
	public static List<PageOut> listPageFromDifference(Difference difference){
		return
			find.where()
				.eq("difference",difference)
				.findList();
	}
	
	/**
	 * Returns a list of pages associated with that bug
	 * 
	 * @param page The page to fin differences of
	 * @return Returns list of differences
	 */
	public static List<PageOut> listPagesFromBug(Bug bug){
		return
			find.where()
				.eq("bug.number",bug.number)
				.findList();
	}
	
	/**
	 * This method takes a list of pages and returns a list of runs associated with that page
	 * @param pages List of pages to test for
	 * @return List of runs associated with thos pages
	 */
	public static List<Run> listRunsFromPages(List<PageOut> pages){
		List<Run> runs = new ArrayList();
		for(PageOut page : pages){
			//if runs doesnt this run...
			if(!runs.contains(page.run)){
				//add it to run
				runs.add(page.run);
			}
		}
		return runs;
	}
	
	/**
	 * Returns one Page associated with that Page
	 * 
	 * @param page The page to fin differences of
	 * @return Returns list of differences
	 */
	public static PageOut pageFromBug( Bug bug ){
		List<PageOut> listPages = listPagesFromBug(bug);
		if(listPages.size()>0){
			return listPages.get(0);
		}
		return null;
	}
	
	/**
     * Return a page of PageOut
     *
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     * @param diff necessary for redirecting function to proper page ("Error", "All", etc)
     */
	public static Page<PageOut> pageFromRun(int page, int pageSize, String sortBy, String order, Long runID, String filter, String diff) {
    	
    	// error
    	if(diff.equals("error")) {
			return pageErrorRun(page, pageSize, sortBy, order, runID, filter, diff);
		}
    	
    	 //better, worse, neutral
    	else if(!diff.equals("all")) {
    		return pageDifRun(page, pageSize, sortBy, order, runID, filter, diff);		
			}
			// All pages
			else {
				
				return pageAllRun(page, pageSize, sortBy, order, runID, filter, diff);			
		}
    }
    /**
     * Returns all pages of a certain run with errors.
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column 
     */
    public static Page<PageOut> pageAllRun(int page, int pageSize, String sortBy, String order, Long runID, String filter, String diff) {
    	return
    			find.where()
    				.eq("run.id", runID)
    				.isNotNull("error")
    				.ilike("name", "%" + filter + "%")
    				.orderBy(sortBy + " " + order)
    				.fetch("run")
    				.fetch("performance")
    				.fetch("error")
    				.findPagingList(pageSize)
    				.getPage(page);
    }
    /**
     * Returns all pages of a certain run.
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column 
     * @return
     */
    public static Page<PageOut> pageErrorRun(int page, int pageSize, String sortBy, String order, Long runID, String filter, String diff) {
    	return
    			find.where()
    				.eq("run.id", runID)
    				.isNotNull("error")
    				.ilike("name", "%" + filter + "%")
    				.orderBy(sortBy + " " + order)
    				.fetch("run")
    				.fetch("performance")
    				.fetch("error")
    				.findPagingList(pageSize)
    				.getPage(page);
    }
    
    
    /**
     * Returns all pages of a certain difference.
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column 
     */
    public static Page<PageOut> pageDifRun(int page, int pageSize, String sortBy, String order, Long runID, String filter, String diff) {
    	return
    			find.where()
                	.eq("run.id", runID)
                	.eq("difference.difftype.id", DiffType.getDiffTypeID(diff))
                	.ilike("name", "%" + filter + "%")
                	.orderBy(sortBy + " " + order)
                	.fetch("run")
                	.fetch("performance")
                	.fetch("error")
                	.findPagingList(pageSize)
                	.getPage(page);
    }
    
    public static List <PageOut> pageList(Long runID) {
		
    	return 
            find.where()
                .eq("run.id", runID)
                .orderBy("name" + " " + "asc")
                .findList();
    			
    			
			
    }
	/**
	 * Returns the pageID of given page and runID
	 * @param page Which page name to find ID for
	 * @param runID The ID corresponding to which run created the row
	 * @return id of page. Creates new one if no page with that run previously existed
	 */
	public static Long getPageID(String page, Long runID){ //Used in AddToDB
		PageOut pageOut=find.where()
			.eq("name",page)
			.eq("run.id",runID)
			.findUnique();
		if( pageOut == null ){ //If no page was found... add it and return that id
			PageOut newPage = new PageOut();
			newPage.name=page;
			newPage.run=Run.getRunByID(runID);
			newPage.save();
			return newPage.id;
		}
		return pageOut.id;
	}
	
	/**
	 * Check if page already exists
	 * @param page Name of page
	 * @param runID ID of run corresponding to this page
	 * @return boolean True for already exists. False for no
	 */
	public static boolean testPageExists(String page, Long runID){
		PageOut pageOut=find.where()
			.eq("name",page)
			.eq("run.id",runID)
			.findUnique();
		if( pageOut == null ){//Didn't find anything in previous search
			return false; //page doesn't exist
		}
		else{
			return true; //page does already exist
		}
	}
	
	/**
	 * Check if page to difference relationship already exists
	 * @param page Name of page
	 * @param runID ID of run corresponding to this page
	 * @param diffID the ID of the difference to test for
	 * @return boolean True for already exists. False for no
	 */
	public static boolean testPageDiffExists(String page, Long runID, Long diffID){
		PageOut pageOut=find.where()
			.eq("name",page)
			.eq("run.id",runID)
			.eq("difference.id",diffID)
			.findUnique();
		if( pageOut == null ){//Didn't find anything in previous search
			return false; //page doesn't exist
		}
		else{
			return true; //page does already exist
		}
	}
    
	/**
	 * Check if page to bug relationship already exists
	 * @param page Name of page
	 * @param runID ID of run corresponding to this page
	 * @param bugID the ID of the bug to test for
	 * @return boolean True for already exists. False for no
	 */
	public static boolean testPageBugExists(String page, Long runID, Long bugID){
		PageOut pageOut=find.where()
			.eq("name",page)
			.eq("run.id",runID)
			.eq("bug.id",bugID)
			.findUnique();
		if( pageOut == null ){//Didn't find anything in previous search
			return false; //page doesn't exist
		}
		else{
			return true; //page does already exist
		}
	}
	
	/**
	 * This method calculates how many differences of diffType occured in given run
	 * @param run Which run to calculate
	 * @param diffType Which difftpye of run to calculate
	 * @return Number of differences of diffType in run
	 */
	public static int calculateDifferences(Run run, DiffType difftype){
		return
			find.where()
                .eq("run.id", run.id)
				.eq("difference.difftype.id",difftype.id)
                .findRowCount();
	}
	/**
	 * This method creates a list of diffType that occured in given run
	 * @param run Which run to calculate
	 * @param diffType Which difftpye of run to calculate
	 * @return list of diffType in run
	 */
	public static List<PageOut> listDifferences(Run run, DiffType difftype){
		return
			find.where()
                .eq("run.id", run.id)
				.eq("difference.difftype.id",difftype.id)
                .findList();
	}
	
	/**
	 * This method returns a list of all pages from a given run that are missing a difference description
	 * @param runID ID of the run in which to perform this search
	 * @return List of PageOut that fit the query
	 */
	public static List<PageOut> getPagesMissingDiffDesc(long runID){
		return
			find.where()
				.eq("run.id", runID)
				.or(
					Expr.eq("difference.difftype.id",DiffType.getDiffTypeID("Worse")),
					Expr.eq("difference.difftype.id",DiffType.getDiffTypeID("Better"))
				)
				.findList();
	}
	
	
	/**
	 * This method returns a list of all pages from a given run that are missing a bugNum
	 * @param runID ID of the run in which to perform this search
	 * @return List of PageOut that fit the query
	 */
	public static List<PageOut> getPagesMissingBugNum(long runID){
		return
			find.where()
				.eq("run.id", runID)
				.eq("difference.difftype.id",DiffType.getDiffTypeID("Worse"))
				.isNull("difference.bug")
				.findList();
	}
	
	/**
	 * This method returns how many pages were NOT DECOMPRESSED in a given run
	 * @param runID Id of run to get how many pages were not decompressed
	 * @return int How many pages did not decompress
	 */
	public static int getPagesNotDecompressed(long runID){
		return
			find.where()
				.eq("run.id", runID)
				.isNotNull("error")
				.findRowCount();
	}
	
	/**
	 * This method returns the list of pages NOT DECOMPRESSED in a given run
	 * @param runID Id of run to get how many pages were not decompressed
	 * @return list How many pages did not decompress
	 */
	public static List<PageOut> getListNotDecompressed(long runID){
		return
			find.where()
				.eq("run.id", runID)
				.isNotNull("error")
				.findList();
	}
	
	/**
	 * This method returns a string that is a comma seperated list of all files with given difference from given run
	 * @param runID The ID of the run to check
	 * @param difference The difference to check
	 * @return String of pages formatted like file1,file2,file3.....
	 */
	public static String listFilesFromDiff(Long runID, Difference difference){
		List<PageOut> pages = find.where()
			.eq("run.id", runID)
			.eq("difference",difference)
			.findList();
		String listPages="";
		for(PageOut page : pages){
			listPages+=page.name+", ";
		}
		return listPages.substring(0,(listPages.lastIndexOf(",")));
	}
	
	
}