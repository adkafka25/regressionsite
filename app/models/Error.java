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
@Table(name="error")
public class Error extends Model {

	@Column(name="Error_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Error_Num")
    @Constraints.Required
    public Long num;
    
	@Column(name="Error_Desc")
	public String description;
	
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
	/**
	 * Returns the errorID of given error.num
	 * @param errorNum Which subversion number to find ID for
	 * @param description The description of the error
	 * @return id of error. Creates new one if no errorNum already existed
	 */
	public static Long getIDByNum(Long errorNum, String description){ //Used in saveRun
		Error error=find.where()
			.eq("num",errorNum)
			.eq("description",description)
			.findUnique();
		if( error == null ){ //If no Error was found... add it and return that id
			Error newError = new Error();
			newError.num=errorNum;
			newError.description=description;
			newError.save();
			return newError.id;
		}
		return error.id;
	}
    /**
	 * This method returns the error for the given error id
	 * @param errorID The error ID to search for
	 * 
	 * @return Corresponding error to given errorID
	 */
	public static Error getErrorByID(Long errorID){
		Error error=find.where()
			.eq("id",errorID)
			.findUnique();
		return error;
	}
}

