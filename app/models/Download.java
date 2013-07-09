package models;

import java.util.*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

import com.avaje.ebean.*;


public class Download extends Model {
	
    @Constraints.Required
    @Id
    public String content;
	
}