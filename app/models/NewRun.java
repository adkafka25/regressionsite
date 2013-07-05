package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;

//Not managed by ebeans
public class NewRun extends Model {
    //Name
	@Id
    @Constraints.Required
    public String name;
	//Platform
	@Constraints.Required
	public Platform platform;
	//Format
	@Constraints.Required
	public String formats; //comma seperated list of formats
	//Path to comparison directory
	@Constraints.Required
	public String compDir;
	//Path to input directory
	@Constraints.Required
	public String inputDir;
	

}