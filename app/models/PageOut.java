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
@Table(name="Page")  
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
	public static List<PageOut> listPageFromBug(Bug bug){
		return
			find.where()
				.eq("bug.number",bug.number)
				.findList();
	}
	
	/**
	 * Returns one Page associated with that Page
	 * 
	 * @param page The page to fin differences of
	 * @return Returns list of differences
	 */
	public static PageOut pageFromBug( Bug bug ){
		List<PageOut> listPages = listPageFromBug(bug);
		return listPages.get(0);
	}
	
	/**
     * Return a page of PageOut
     *
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<PageOut> pageFromRun(int page, int pageSize, String sortBy, String order, Long runID, String filter) {
		return 
            find.where()
                .eq("run.id", runID)
				.ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("run")
				.fetch("performance")
				.fetch("error")
                .findPagingList(pageSize)
                .getPage(page);
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
}

