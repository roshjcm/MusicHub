
import java.sql.*;

public class Listener {
	
	private Connection con;
	private int userID, libID;
	private String name, email, username, password, country, creditInfo, dob;
	
	public Listener(Connection con, String name, String email, String username, 
			String password, String country,
			String dob, String creditInfo) {
		this.con = con;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.country = country;
		this.dob = dob;
		this.creditInfo = creditInfo;
		createLibID();
		createUser();
	}
	

	public boolean createCart() { 
		
		boolean created = true;
		int order_id = (int) (Math.random()*1000);
		
		try { 
			Statement stmt = con.createStatement();
			
			// Create Shopping Cart entry		
			stmt.executeUpdate("INSERT INTO shopping_carts(order_id, total_amount,num_articles) "
							+ "values (" + order_id + "," + (float) 0.0 + "," + 0 + ");");
			
			// Create Uses entry
			stmt.executeUpdate("INSERT INTO Uses(order_id, listener_id) "
							+ "values (" + order_id + "," + this.userID + ");");
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			created = false;
		}
		return created;
	}
	
	
	public boolean addToCart(int order_id, int article_id) {
		
		boolean added = true;
		
		try {
			// Get Cart Details
			Statement stmt = con.createStatement();
			ResultSet getCartDetails = stmt.executeQuery("SELECT * FROM shopping_carts WHERE order_id = " + order_id + ");");
			int num_articles = getCartDetails.getInt(3);
			num_articles++;								 // Increment # of articles
			stmt.executeUpdate("UPDATE shopping_carts SET num_articles = " + num_articles
								+ "WHERE order_id =" + order_id + ");");
			
			// Add Entry to Contains 
			stmt.executeUpdate("INSERT INTO Contains(order_id, article_id) "
							+ "values (" + order_id + "," + article_id + ");");
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			added = false;
		}
		return added;
	}
	
	
	public boolean checkOutCart(int order_id) {
		
		boolean completed = true;
		
		
		// deposit money into artist ID (call Arist class?)
		
		
		return completed;
	}
	
	
	public boolean addToLibrary(int articleID) {
		
		boolean added = true;
		
		if (doesArticleExist(articleID)) { 
			try {
				Statement stmt = con.createStatement();
				
				// Increments num_songs in listener's library
				ResultSet getLibDetails = stmt.executeQuery("SELECT * FROM libraries WHERE lib_id = " + this.libID + ");");
				int num_songs = getLibDetails.getInt(2);
				num_songs++;
				
				stmt.executeUpdate("UPDATE libraries SET num_songs = " + num_songs
						+ "WHERE lib_id =" + this.libID + ");");

				// Adds entry to IsAddedTo table
				stmt.executeUpdate("INSERT INTO IsAddedTo(lib_id,article_id) "
								+ "values (" + this.libID + "," + articleID + ");");
				
				stmt.close();
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
	
	
	public boolean createPlaylist(String name, String status, int n_songs) {
		boolean created = true;
		
		try {
			// Creates entry in Playlist table
			Statement stmt = con.createStatement();

			stmt.executeUpdate("INSERT INTO playlists(name,status,num_songs,lib_id) "
							+ "values (" + name + "," + status + "," + n_songs + "," + this.libID + ");");
			
			// Creates entry in Creates table
			stmt.executeUpdate("INSERT INTO Creates(listener_id,lib_id,name) "
							+ "values (" + this.userID + "," + this.libID + ", " + name + ");");
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			created = false;
		}
		return created;
	}
	
	
	public boolean addToPlaylist(String name, int articleID) {
		
		boolean added = true;
		
		if (isInLibrary(articleID)) {
			
			try {
				
				// Edit entry in Playlist table
				Statement stmt = con.createStatement();
				ResultSet getPlaylistDetails = stmt.executeQuery("SELECT * FROM playlists WHERE name= " + name + ");");
				int num_songs = getPlaylistDetails.getInt(3);
				num_songs++;				// Increments num_songs in playlist

				stmt.executeUpdate("UPDATE playlist SET num_songs = " + num_songs 
									+ "WHERE name =" + name + ");");
				
				// Creates entry in IsPartOf table
				stmt.executeUpdate("INSERT INTO IsPartOf(name,lib_id) "
								+ "values (" + name + "," + this.libID + ");");
								
				// Create entry in ComprisesOf table
				stmt.executeUpdate("INSERT INTO ComprisesOf(lib_id,name,song_id) "
								+ "values (" + this.libID + "," + name + "," + articleID + ");");
				
				stmt.close();
				
			} catch (SQLException e) {
				System.err.println("msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());	
				added = false;
			}
		}
		return added; 
	}
	
	
	private boolean isInLibrary(int articleID) { 
		boolean exist = true;
		
		try { 
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM IsAddedTo WHERE lib_id=" + this.libID + 
					"AND article_id = " + articleID + ";");
			
			if (rs.next() == false) { 
				exist = false;
			}
			stmt.close();
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			return false;
		}
		return exist;
	}
	
	
	private boolean doesArticleExist(int articleID){
		boolean exist = true;
		
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM artciles WHERE article_id=" + articleID + ";");
			
			if (rs.next() == false) { 
				exist = false;
			}		
			stmt.close();
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
								"code: " + e.getErrorCode() + 
								"state: " + e.getSQLState());
			return false;
		}
		return exist;
	}

	private boolean isValidUserID(int id) { 
		
		boolean valid = false;
		
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM Users WHERE uid=" + id + ";");
			System.out.println("Query executed.");
		
			if (rs.next() == false) { 
				System.out.println("User id " + id + " is valid.");
				valid = true;
			}
			stmt.close();
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
			return true;
		}
		return valid;
	}
	
private void createUser(){
		
		int x = (int) (Math.random()*1000);
		System.out.println("Generated id: " + x);
		
		while (!isValidUserID(x)) {
			System.out.println("Trying userID:" + x);
			x = (int) (Math.random()*1000);
		}	
		this.userID = x;
		
		try {
				System.out.println("Creating user (" + this.userID + "," + this.name + ", " + this.username + ", " + this.country
						+ ", " + this.email + "," + this.dob + "," + this.creditInfo + ");");
				
				Statement stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO users(uid,name,username,country,email,dob,credit_info) "
								+ "values (" + this.userID + ", \'" + this.name + "\', \'" + this.username
								+ "\', \'" + this.country + "\', \'" + this.email + "\'," + this.dob + "," 
								+ this.creditInfo + ");");
				
				stmt.executeUpdate("INSERT INTO listeners(uid) values (" + this.userID + ");");
				
				System.out.println("Listener user successfully created + added to DB.");
				stmt.close();
			} catch (SQLException e) {
				System.err.println("msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());
		}
	}
	
	
	private void createLibID() { 
		
		this.libID = (int) (Math.random()*1000);
		boolean lib_exists = true;
		
		try { 
			// checks if lib_id already exists
			while (lib_exists) {
				this.libID = (int) (Math.random()*1000);

				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM libraries WHERE lib_id=" + this.libID + ";");
				
				if (rs.next() == false) { 
					lib_exists = false;
				}
				stmt.close();
			}

			Statement stmt = con.createStatement();
			
			// adds to libraries table
			stmt.executeUpdate("INSERT INTO libraries(lib_id,num_songs) "
							+ "values (" + this.libID + "," + 0 + ");");
			
			// adds to has table
			stmt.executeUpdate("INSERT INTO Has(listener_id,lib_id) "
							+ "values (" + this.userID + "," + this.libID + ");");		
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
		}	
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}


}
