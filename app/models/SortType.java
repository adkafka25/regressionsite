package models;

/**
 * Class of SortTypes. Made to populate list in "listruns".
 * Examples of Sort Types include Date, SVN, etc.
 *
 *
 */
public class SortType {
	/**
	Part of the Sort Type that the filter uses. 
	 */
	private String value;
	
	/**
	Header of the Sort Type.  
	 */
	private String header;
	
	/**
	 * 
	 * @param v value of Sort Type.
	 * @param h header of Sort Type.
	 */
	
	public SortType(String v, String h) {
		value = v;
		header = h;
	}
	/**
	 * Returns header.
	 * @return header.
	 */
	public String getHeader() {
		return header;
	}
	/**
	 * returns value.
	 * @return value.
	 */
	public String getValue() {
		return value;
	}
	
}
