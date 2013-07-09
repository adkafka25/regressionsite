package models;

import java.util.List;



/** 
 * Nested class. Obtains information necessary to create statistics on data.
 *
 */
public class CallData {
	public int better, worse, neutral, bugs;
	public CallData(List <Run> data) {
		better = getBetter(data);
		worse = getWorse(data);
		neutral = getNeutral(data);
		bugs = getBugs(data);
	}
	
	
	
	public int getBetter(List <Run> data) {
		int better = 0;
		for( Run run: data) {
			better += (Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Better"))));
		}
		return better;
	}
	
	public int getWorse(List <Run> data) {
		int worse = 0;
		for( Run run: data) {
			worse += (Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Worse"))));
		}
		return worse;
	}
	
	public int getNeutral(List <Run> data) {
		int neutral = 0;
		for( Run run: data) {
			neutral += (Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral"))));
		}
		return neutral;
		
	}
	public int getBugs(List <Run> data) {
		int bugs = 0;
		for( Run run: data) {
			bugs += (Run.calculateDifferences(run,DiffType.getDiffTypeByID(DiffType.getDiffTypeID("Neutral"))));
		}
		return bugs;
		
	}
}