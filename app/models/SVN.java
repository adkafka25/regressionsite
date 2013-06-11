package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * SVN entity managed by Ebean
 */
@Entity 
public class SVN extends Model {

	@Column(name="SVN_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="SVN_Num")
    @Constraints.Required
    public Long num;
    
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,SVN> find = new Finder<Long,SVN>(Long.class, SVN.class); 
    
    /**
     * Return a page of SVN
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<SVN> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("INSERT FOREIGN KEY NAME")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    
}

