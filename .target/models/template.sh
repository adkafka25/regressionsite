#!/bin/sh
NAME=$1
TEXT="package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

/**
 * ${NAME} entity managed by Ebean
 */
@Entity 
public class ${NAME} extends Model {

	@Column(name=\"${NAME}_ID\")
    @Id
	@GeneratedValue
    public Long id;
    
	@Column(name=\"${NAME}_Name\")
    @Constraints.Required
    public String name;
    
    /**
     * Generic query helper for entity ${NAME} with id Long
     */
    public static Finder<Long,${NAME}> find = new Finder<Long,${NAME}>(Long.class, ${NAME}.class); 
    
    /**
     * Return a page of ${NAME}
     *
     * @param page Page to display
     * @param pageSize Number of ${NAME}s per page
     * @param sortBy ${NAME} property used for sorting
     * @param order Sort order (either or asc or desc)
     * @param filter Filter applied on the name column
     */
    public static Page<${NAME}> page(int page, int pageSize, String sortBy, String order, String filter) {
        return 
            find.where()
                .ilike(\"name\", \"%\" + filter + \"%\")
                .orderBy(sortBy + \" \" + order)
                .fetch(\"INSERT FOREIGN KEY NAME\")
                .findPagingList(pageSize)
                .getPage(page);
    }
	
    
}
"

echo "$TEXT" > ${NAME}.java
