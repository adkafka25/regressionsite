package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * Error entity managed by Ebean
 */
@Entity
public class Error extends Model {

	@Column(name="Error_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Error_Num")
    @Constraints.Required
    public Long num;
    
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Error> find = new Finder<Long,Error>(Long.class, Error.class); 
    
    /**
     * Return a page of Error
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<Error> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("INSERT FOREIGN KEY NAME")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    
}

