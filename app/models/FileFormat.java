package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * FileFormat entity managed by Ebean
 */
@Entity
@Table(name = "format")
public class FileFormat extends Model {

	@Column(name="Format_ID")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name="Format_Name")
    @Constraints.Required
    public String name;
    
	@Column(name="Default_Input_Dir")
	public String defInputDir;
	
    /**
     * Generic query helper for entity Computer with id Long
     */
    public static Finder<Long,FileFormat> find = new Finder<Long,FileFormat>(Long.class, FileFormat.class); 
    
    /**
     * Return a page of FileFormat
     *
     * @param page Page to display
     * @param pageSize Number of computers per page
     * @param sortBy Computer property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<FileFormat> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike("name", "%" + filter + "%")
                .orderBy(sortBy + " " + order)
                .fetch("INSERT FOREIGN KEY NAME")
                .findPagingList(pageSize)
                .getPage(page);
    }
    /**
     * Creates a list of File Formats
     * @return a list of all the File Formats.
     */
    public static List<FileFormat> getList() {
    	return 
			find.where()
				.orderBy("name asc")
				.findList();
    }
    
    /**
     * 
     * @return name of File Format.
     */
    public String getFileFormatName() {
    	return name;
    }
	
	//Used for creating a list of all companies. Implemented in createForm.scala.html in @select
    public static Map<String,String> options() {
        LinkedHashMap<String,String> options = new LinkedHashMap<String,String>();
        for(FileFormat c: FileFormat.find.orderBy("name").findList()) {
            options.put(c.id.toString(), c.name);
        }
        return options;
    }
	
	public static FileFormat getByID(long formatID){
		return 
			find.where()
				.eq("id",formatID)
				.findUnique();
	}
    
	public static FileFormat getByName(String formatName){
		return 
			find.where()
				.eq("name",formatName)
				.findUnique();
	}
}

