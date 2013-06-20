package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * Version entity managed by Ebean
 */
@Entity 
public class Version extends Model {

	@Column(name="Version_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Version_Name")
    @Constraints.Required
    public String name;
    
	@Column(name="Platform_ID")
    @OneToOne
	@JoinColumn(name="Platform_ID")
    public Platform platform;
	
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Version> find = new Finder<Long,Version>(Long.class, Version.class); 
    
    /**
     * Return a page of version
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<Version> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("platform")
                .findPagingList(pageSize)
                .getPage(page);
    }
    /**
     * @return all versions.
     */
    public static List<Version> getList() {
    	return find.all();
    }
    /**
     * 
     * @return name of version.
     */
	public String getName() {
		return name;
	}
    
}
