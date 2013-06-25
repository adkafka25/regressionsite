package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * Date entity managed by Ebean
 */
@Entity 
public class Date extends Model {

	@Column(name="Date_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Date_Name")
    @Constraints.Required
	@Formats.DateTime(pattern="yyyy-mm-dd")
    public String name;
    
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Date> find = new Finder<Long,Date>(Long.class, Date.class); 
    
    /**
     * Return a page of Date
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<Date> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .findPagingList(pageSize)
                .getPage(page);
    }
    
    public static List<Date> getList() {
    	return find.all();
    }
    /**
     * returns name, which is essentially the date.
     * @return date.
     */
    public String getDateName() {
    	return name;
    }
	
	/**
	 * Returns the dateID of given date.name
	 * @param dateName Which date name to find ID for
	 * @return id of date. Creates new one if no dateName already existed
	 */
	public static Long getDateID(String dateName){ //Used in saveRun
		Date date=find.where()
			.eq("name",dateName)
			.findUnique();
		if( date == null ){ //If no date was found... add it and return that id
			Date newDate = new Date();
			newDate.name=dateName;
			newDate.save();
			return newDate.id;
		}
		return date.id;
	}
	
    
}

