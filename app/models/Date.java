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
@Table(name="date") 
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
	 * This method returns a list of dates with runs in the DB
	 */
	public static List<Date> getListUsed(){
		List<Date> usedDates = find.where()
			.orderBy("name asc")
			.findList();
		Iterator<Date> i = usedDates.iterator();
		while (i.hasNext()) {
			Date date = i.next(); // must be called before you can call i.remove()
			if(!Run.dateOccurs(date)){//Date is not in any runs in DB
				//remove from list
				i.remove();
			}
		}
		return usedDates;
	}
	
    /**
     * returns name, which is essentially the date.
     * @return date.
     */
    public String getDateName() {
    	return name;
    }
    /**
     * Converts date into MM.DD.YYYY format
     * @return
     */
    public String convertDate() {
    	
    	String date = name.substring(5, 7) + "." +name.substring(8,10) + "." + name.substring(0,4);
    	return date;
    }
    
    public String jsDate() {
    	String date = "[new Date(" + name.substring(0,4) + "," + name.substring(8,10) + "," + name.substring(5,7) + "), ";
    	return date;
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

