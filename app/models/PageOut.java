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
	@ManyToMany(mappedBy="pagesout")
	//@JoinColumn(name="Difference_ID")
	public Set<Difference> difference = new HashSet<Difference>();

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
	 * Returns a list of differences associated with that Page
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
     * Return a page of PageOut
     *
     * @param page Page to display
     * @param pageSize Number of PageOuts per page
     * @param sortBy PageOut property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<PageOut> pageFromRun(int page, int pageSize, String sortBy, String order, Long runID) {
		return 
            find.where()
                .eq("run.id", runID)
                .orderBy(sortBy + " " + order)
                .fetch("run")
				.fetch("performance")
				.fetch("error")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
	
    
}

