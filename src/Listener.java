
import java.sql.*;


public class Listener {
	
	private Connection con;
	private int userID, creditInfo;
	private String name, email, username, password, country, dob;
	
	public Listener(Connection con, int userID, String name, String email, String username, String password, String country,
			String dob, int creditInfo) {
		this.con = con;
		this.userID = userID;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.country = country;
		this.dob = dob;
		this.creditInfo = creditInfo;
	}
	

	public boolean createCart() { 
		
		boolean created = true;
		int order_id = (int) (Math.random()*1000);
		
		try { 
			// Create Uses entry
			PreparedStatement createUsesEntry = con.prepareStatement("INSERT INTO Uses(order_id, listener_id) VALUES (?, ?);");
			createUsesEntry.setInt(0, order_id);
			createUsesEntry.setInt(1, userID);	
		
			// Create Shopping Cart entry
			PreparedStatement createSCEntry = con.prepareStatement("INSERT INTO shopping_carts(order_id, total_amount,num_articles) values (?,?,?);");
			createSCEntry.setInt(0, order_id);
			createSCEntry.setFloat(1, ((float) 0.0));
			createSCEntry.setInt(2, 1);
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			created = false;
		}
		
		return created;
	}
	
	public boolean addToCart(int order_id) {
		
		boolean added = true;
		
		try {
			// Get Cart Details
			Statement stmt = con.createStatement();
			ResultSet getCartDetails = stmt.executeQuery("SELECT * FROM shopping_carts WHERE order_id = " + order_id + ");");
			int num_articles = getCartDetails.getInt(2);
			num_articles++; // Increment # of articles
			
			PreparedStatement incrementNumArticles = con.prepareStatement("UPDATE shopping_carts SET num_articles = ? WHERE order_id = ?;");
			incrementNumArticles.setInt(0, num_articles);
			incrementNumArticles.setInt(1, order_id);				
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			added = false;
		}
		
		
		return added;
		
	}
	
	public boolean addToLibrary(int articleID) {
		
		boolean added = true;
		
		if (doesArticleExist(articleID)) { 
			try {
				// Increments num_songs in listener's library
				Statement stmt = con.createStatement();
				ResultSet getListenerLib = stmt.executeQuery("SELECT lib_id FROM Has WHERE listener_id = " + this.userID + ");");
				int lib_id = getListenerLib.getInt(0);
				
				ResultSet getLibDetails = stmt.executeQuery("SELECT * FROM library WHERE lib_id = " + lib_id + ");");
				int num_songs = getLibDetails.getInt(1);
				
				num_songs++;
				
				PreparedStatement incrementLibSongs = con.prepareStatement("UPDATE library SET num_songs = ? WHERE lib_id = ?;");
				incrementLibSongs.setInt(1, lib_id);
				incrementLibSongs.setInt(0, num_songs);	
				
			} catch (SQLException e) {
				System.err.println("msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());	
				added = false;
			}
		} else { 		
			System.out.println("Song does not exist");
			added = false;
		}
		return added;
	}
	
	
	public boolean createPlaylist() {
		// input -- all fields for Playlist object
		
		// If successful,
		return true;
	}
	
	public boolean changeProfile() { 
		
		// input -- part of profile to change 
		// Modifies User DB table 	
		
		// If successful,
		return true;
		
	}
	
	private boolean isInLibrary(int articleID) { 
		boolean exist = true;
		
		return exist;
	}
	
	private boolean doesArticleExist(int articleID){
		boolean exist = true;
		
		try {
			PreparedStatement findSong = this.con.prepareStatement("SELECT * FROM articles WHERE article_id = ?;");
			findSong.setInt(0, articleID);
			ResultSet rs = findSong.executeQuery();
			
			if (rs == null) {
				exist = false;
			}
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
								"code: " + e.getErrorCode() + 
								"state: " + e.getSQLState());
			exist = false;
		}
		return exist;
	}
	
	
	
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}


}
