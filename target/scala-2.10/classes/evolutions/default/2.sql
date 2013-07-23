# --- Rename Get rid of format in Page

# --- !Ups
ALTER TABLE `RegressionSite`.`Page` 
	DROP FOREIGN KEY `Page_Format`,
	DROP COLUMN `Format_ID`, 
	DROP INDEX `FileFormatID_idx` ;

# --- !Downs
ALTER TABLE `RegressionSite`.`Page` 
	ADD `Format_ID` INT NOT NULL ,
	ADD INDEX `FileFormatID_idx` (`Format_ID` ASC) ,
	ADD CONSTRAINT `Page_Format`
		FOREIGN KEY (`Format_ID` )
		REFERENCES `RegressionSite`.`Format` (`Format_ID` )
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	
