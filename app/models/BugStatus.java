package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * BugStatus entity managed by Ebean
 */
@Entity 
@Table(name="bugstatus")
public class BugStatus extends Model {

	@Column(name="BugStatus_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="BugStatus_Name")
    @Constraints.Required
    public String name;
    
    /**
     * Generic query helper for entity BugStatus with id Long
     */
    public static Finder<Long,BugStatus> find = new Finder<Long,BugStatus>(Long.class, BugStatus.class); 
    
    /**
     * Return a page of BugStatus
     *
     * @param page Page to display
     * @param pageSize Number of BugStatuss per page
     * @param sortBy BugStatus property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<BugStatus> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("INSERT FOREIGN KEY NAME")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    
}

