package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * DiffType entity managed by Ebean
 */
@Entity 
@Table(name="DiffType")
public class DiffType extends Model {

	@Column(name="DiffType_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="DiffType_Name")
    @Constraints.Required
    public String name;
    
    /**
     * Generic query helper for entity DiffType with id Long
     */
    public static Finder<Long,DiffType> find = new Finder<Long,DiffType>(Long.class, DiffType.class); 
    
    /**
     * Return a page of DiffType
     *
     * @param page Page to display
     * @param pageSize Number of DiffTypes per page
     * @param sortBy DiffType property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<DiffType> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("INSERT FOREIGN KEY NAME")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    
}

