package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * Platform entity managed by Ebean
 */
@Entity
@Table(name = "platform") 
public class Platform extends Model {

	@Column(name="Platform_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Platform_Name")
    @Constraints.Required
    public String name;
    
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Platform> find = new Finder<Long,Platform>(Long.class, Platform.class); 
    
    /**
     * Return a page of Platform
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<Platform> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    
}

