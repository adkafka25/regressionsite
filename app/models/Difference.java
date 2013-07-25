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
@Table(name="difference") 
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
	
	//@OneToOne(mappedBy="difference")
	//public Bug bug;
	
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
				.fetch("bug")
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
	
    /**
	 * Returns the differneceID of given difference and difftype
	 * @param difference Which difference name to find ID for
	 * @param diffType What difference type it is (Better, Neutral, Worse)
	 * @return id of difference. Creates new one if no difference previously existed
	 */
	public static Long getDifferenceID(String difference, String diffType){ //Used in AddToDB
		long diffTypeID=DiffType.getDiffTypeID(diffType);
		
		Difference diff=find.where()
			.eq("name",difference)
			.eq("difftype.id",diffTypeID)
			.findUnique();
		if( diff == null ){ //If no difference was found... add it and return that id
			Difference newDifference = new Difference();
			newDifference.name=difference;
			newDifference.difftype=DiffType.getDiffTypeByID(diffTypeID);
			newDifference.save();
			return newDifference.id;
		}
		return diff.id;
	}
	
	/**
	 * Returns Difference of given id
	 */
	public static Difference getByID(Long diffID){
		Difference difference=find.where()
			.eq("id",diffID)
			.findUnique();
		return difference;
	}
	
	/**
	 * This method returns a list of all differences from a given run that are missing a difference description
	 * @param runID ID of the run in which to perform this search
	 * @return List of PageOut that fit the query
	 */
	public static List<Difference> getMissingDiffDesc(long runID){ //tested and seems to be working
		return
			find.where()
				.eq("pagesoutdifference.run.id", runID)
				.or(
					Expr.eq("difftype.name","Worse"),
					Expr.eq("difftype.name","Better")
				)
				.isNull("name")
				.findList();
	}
}

