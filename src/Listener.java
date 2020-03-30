
public class Listener {
	
	int userID, creditInfo;
	String name, email, username, password, country, dob;
	
	public Listener(int userID, String name, String email, String username, String password, String country,
			String dob, int creditInfo) {
		this.userID = userID;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.country = country;
		this.dob = dob;
		this.creditInfo = creditInfo;
	}
	
	
	public static boolean buyMusic() {
		// Checks availability
		// Puts in shopping cart (SQL) 
		// Executes transaction 
		// Adds to User library (SQL)
		
		// If successful,
		return true;
	}
	
	public static boolean createPlaylist() {
		// input -- all fields for Playlist object
		
		// If successful,
		return true;
	}
	
	public static boolean changeProfile() { 
		
		// input -- part of profile to change 
		// Modifies User DB table 	
		
		// If successful,
		return true;
		
	}
	
	private static void checkAvailability(){
		// Checks if song exists
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}


}
