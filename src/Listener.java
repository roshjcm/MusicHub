
import java.sql.*;
import java.util.ArrayList;

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
		this.createLibID();
		this.createUser();
	}
	
	public Listener(Connection con, int uid, String username, String password) {
		this.con = con; 
		boolean loggedIn = this.logIn(uid);
			
		if (!loggedIn) System.out.println("Cannot log in, Please enter valid credidentials");
		
	}
	
	
	
	public boolean logIn(int uid) { 
		try {
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE uid=" + uid + ";");
			
			
			while (rs.next()) { 
				this.userID = rs.getInt(1);
				this.name = rs.getString(2);
				this.username = rs.getString(3);
				this.country = rs.getString(4);
				this.email = rs.getString(5);
				this.dob = rs.getString(6);
				this.creditInfo = rs.getString(7);
			}
			
			rs = stmt.executeQuery("SELECT lib_id FROM has WHERE listener_id=" + this.userID + ";");
			if (rs.next()) this.libID = rs.getInt("lib_id");
			else return false;
						
			stmt.close();
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			return false;
		}
		return true;
	}
	
	
	public void printLibrary() { 
		try { 
			System.out.println("Library of user :" + this.name);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM libraries WHERE lib_id=" + this.libID + ";");
			ResultSetMetaData rsmd = rs.getMetaData();
	
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
			    for (int i = 1; i <= columnsNumber; i++) {
			        if (i > 1) System.out.print(",  ");
			        String colVal = rs.getString(i);
			        System.out.print(colVal + " " + rsmd.getColumnName(i));
			    }
			    System.out.println("");
			}
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
		}
	}
	

	public int createCart() { 
		
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
			
			return -1;
		}
		return order_id;
	}
	
	
	public boolean searchArtist(String stage_name) {
		boolean searched = true;
		
		try {
			// Get Cart Details
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT a.article_id, a.title, a.genre, a.price FROM articles a, releases r, artists ar WHERE ar.stage_name = '" 
			+ stage_name + "' AND r.artist_id = ar.uid AND a.article_id = r.article_id;");
			ResultSetMetaData rsmd = rs.getMetaData();
			
			int columnsNumber = rsmd.getColumnCount();
			while (rs.next()) {
			    for (int i = 1; i <= columnsNumber; i++) {
			        if (i > 1) System.out.print(",  ");
			        String colVal = rs.getString(i);
			        System.out.print(colVal + " " + rsmd.getColumnName(i));
			    }
			    System.out.println("");
			}
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("ADD TO CART msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			searched = false;
		}
		return searched;
	}
	
	public boolean addToCart(int order_id, int article_id) {
		
		boolean added = true;
		
		try {
			// Get Cart Details
			Statement stmt = con.createStatement();
			ResultSet getCartDetails = stmt.executeQuery("SELECT * FROM shopping_carts WHERE order_id = " + order_id + ";");
			
			int num_articles =0;
			if(getCartDetails.next()) {
				num_articles = getCartDetails.getInt(3);
				num_articles++;	
			}
										 // Increment # of articles
			stmt.executeUpdate("UPDATE shopping_carts SET num_articles = " + num_articles
								+ "WHERE order_id =" + order_id + ";");
			
			// Add Entry to Contains 
			stmt.executeUpdate("INSERT INTO Contains(order_id, article_id) "
							+ "values (" + order_id + "," + article_id + ");");
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("ADD TO CART msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			added = false;
		}
		return added;
	}
	
	
	public boolean checkOutCart(int order_id) {
		
		boolean completed = true;
		// deposit money into artist ID (call Artist class?)
			try {
				Statement stmt = con.createStatement();
				Statement t = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT SUM(art.price) as earned, r.artist_id FROM articles art, contains c, releases r"
						+ " WHERE c.order_id =" + order_id 
						+ " AND c.article_id = art.article_id AND art.article_id = r.article_id GROUP BY r.artist_id" + ";");

				while (rs.next()) { 
					int A = rs.getInt("artist_id");
					float M = rs.getFloat("earned");
					t.executeUpdate("INSERT INTO moneyEarned(artist_id,order_id,money_received) "
							+ "values(" + A + "," + order_id + ","+ M + ");");
				
					Artist artist = new Artist(con);
					artist.logIn(A);
					artist.depositEarnings(M);
				}
				stmt.close();
				t.close();

			}catch (SQLException e) {
				System.err.println("CHECK OUT CART msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());	
				completed = false;
			}

			return completed;
	}
	
	
	public boolean addToLibrary(int articleID) {
		
		boolean added = true;
		
		if (doesArticleExist(articleID)) { 
			try {
				Statement stmt = con.createStatement();
				
				// Increments num_songs in listener's library
				ResultSet getLibDetails = stmt.executeQuery("SELECT * FROM libraries WHERE lib_id = " + this.libID + ");");
				
				int num_songs =0;
				if(getLibDetails.next()) {
					num_songs = getLibDetails.getInt(2);
					num_songs++;	
				}
				
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
			System.out.println("Song does not exist.");
			added = false;
		}
		return added;
	}
	
	
	public boolean createPlaylist(String name, String status) {
		boolean created = true;
		
		try {
			// Creates entry in Playlist table
			Statement stmt = con.createStatement();

			stmt.executeUpdate("INSERT INTO playlists(name,status,num_songs,lib_id) "
							+ "values (\'" + name + "\',\'" + status + "\'," + 0 + "," + this.libID + ");");
			
			// Creates entry in Creates table
			stmt.executeUpdate("INSERT INTO Creates(listener_id,lib_id,name) "
							+ "values (" + this.userID + "," + this.libID + ", \'" + name + "\');");
			
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
				ResultSet getPlaylistDetails = stmt.executeQuery("SELECT * FROM playlists WHERE name= \'" + name + "\';");
				
				int num_songs = 0;
				if(getPlaylistDetails.next()) {
					num_songs = getPlaylistDetails.getInt(3);
					num_songs++;	
				}							// Increments num_songs in playlist

				stmt.executeUpdate("UPDATE playlists SET num_songs = " + num_songs 
									+ "WHERE name =\'" + name + "\';");
				
				// Creates entry in IsPartOf table
				stmt.executeUpdate("INSERT INTO IsPartOf(name,lib_id) "
								+ "values (\'" + name + "\'," + this.libID + ");");
								
				// Create entry in ComprisesOf table
				stmt.executeUpdate("INSERT INTO ComprisesOf(lib_id,name,song_id) "
								+ "values (" + this.libID + ",\'" + name + "\'," + articleID + ");");
				
				System.out.println("Item successfully added to playlist.");
				stmt.close();
				
			} catch (SQLException e) {
				System.err.println("ADDING TO PLAYLIST msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());	
				added = false;
			}
		} else System.out.println("This article is not in your library !");
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
			int uid = -1;
			if (rs.next()) { 
				uid = rs.getInt("uid");
			}
			valid = (uid==-1);
			stmt.close();
			
		} catch (SQLException e) {
			System.err.println("IS VALID ID msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
			return true;
		}
		return valid;
	}
	
	private void createUser(){
		
		int x = (int) (Math.random()*1000);
		
		while (!isValidUserID(x)) {
			x = (int) (Math.random()*1000);
		}	
		this.userID = x;
		
		try {
				Statement stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO users(uid,name,username,country,email,dob,credit_info) "
								+ "values (" + this.userID + ", \'" + this.name + "\', \'" + this.username
								+ "\', \'" + this.country + "\', \'" + this.email + "\'," + this.dob + "," 
								+ this.creditInfo + ");");
				
				stmt.executeUpdate("INSERT INTO listeners(uid) values (" + this.userID + ");");
				
				System.out.println("Listener user successfully created and added to DB.");
				stmt.close();
			} catch (SQLException e) {
				System.err.println("msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());
		}
		System.out.println("IMPORTANT: Your user ID number is: " + this.userID);
	}
	
	
	private void createLibID() { 
	
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
