package travelDB.travel_destination;

public class APIExplorerMain {

	public static void main(String[] args) {
		
		APIExplorer explorer = new APIExplorer();
		String jsonStr = explorer.getTravleDestinationInfo();
		
		JSONparse jsonParse = new JSONparse();
		jsonParse.parseJSON(jsonStr);
		
	}

}