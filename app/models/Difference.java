package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * Difference entity managed by Ebean
 */
@Entity 
public class Difference extends Model {

	@Column(name="Difference_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Difference_Name")
    @Constraints.Required
    public String name;
    
	@Column(name="DiffType_ID")
	@OneToOne
	@JoinColumn(name="DiffType_ID")
	public DiffType difftype;
	
	@ManyToMany
	@JoinTable(
		name="pagetodifference",
		joinColumns=@JoinColumn(name="Difference_ID", referencedColumnName="Difference_ID"),
		inverseJoinColumns=@JoinColumn(name="Page_ID", referencedColumnName="Page_ID")
	)
	public Set<PageOut> pagesoutdifference = new HashSet<PageOut>();
	
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Difference> find = new Finder<Long,Difference>(Long.class, Difference.class); 
    
    /**
     * Return a page of Difference
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<Difference> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("difftype")
                .findPagingList(pageSize)
                .getPage(page);
    }
	

	
	/**
	 * Returns a list of differences associated with that Page
	 * 
	 * @param page The page to fin differences of
	 * @return Returns list of differences
	 */
	public static List<Difference> listDifferences(PageOut pageout){
		return 
			find.where()
				.eq("pagesoutdifference",pageout)
				.findList();
	}
	
    
}

