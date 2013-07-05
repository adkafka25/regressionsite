package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;


public class NewRun extends Model {
    //Name
    @Constraints.Required
    public String name;
	//Format
	@Constraints.Required
	public FileFormat[] format;
	//Path to issues folder
	@Transient
	public String path;
	//Path to comparison directory
	@Transient
	public String compDir;
	//Path to input directory
	@Transient
	public String inputDir;
	

}