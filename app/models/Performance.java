package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * Performance entity managed by Ebean
 */
@Entity 
@Table(name="performance")
public class Performance extends Model {

	@Column(name="Performance_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Performance_Time")
    @Constraints.Required
	@Formats.DateTime(pattern="hh:mm:ss")
    public String time;
    
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,Performance> find = new Finder<Long,Performance>(Long.class, Performance.class); 
    
    /**
     * Return a page of Performance
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<Performance> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("INSERT FOREIGN KEY NAME")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    /**
	 * Returns the PerformanceID of given performance time
	 * @param performanceTime Which subversion number to find ID for
	 * @return id of Performance. Creates new one if no performanceTime already existed
	 */
	public static Long getPerformanceID(String performanceTime){ //Used in saveRun
		Performance performance=find.where()
			.eq("time",performanceTime)
			.findUnique();
		if( performance == null ){ //If no Performance was found... add it and return that id
			Performance newPerformance = new Performance();
			newPerformance.time=performanceTime;
			newPerformance.save();
			return newPerformance.id;
		}
		return performance.id;
	}
}

