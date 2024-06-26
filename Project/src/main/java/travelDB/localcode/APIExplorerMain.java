package travelDB.localcode;

public class APIExplorerMain {

	public static void main(String[] args) {
		
		APIExplorer explorer = new APIExplorer();
		String jsonStr = explorer.getLocalcodeInfo();
		
		JSONparse jsonParse = new JSONparse();
		jsonParse.parseJSON(jsonStr);
		
	}

}