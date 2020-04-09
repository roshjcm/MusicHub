
import java.sql.*;


public class Listener {
	
	private Connection con;
	private int userID, creditInfo, libID;
	private String name, email, username, password, country, dob;
	
	public Listener(Connection con, String name, String email, String username, String password, String country,
			String dob, int creditInfo) {
		this.con = con;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.country = country;
		this.dob = dob;
		this.creditInfo = creditInfo;
		this.libID = 0;
		this.createUserID();
	}
	
	
	private void createUserID() { 		
		int x = (int) (Math.random()*1000);		
		
		while (!isValidID(x)) {
			x = (int) (Math.random()*1000);
		}	
		this.userID = x;
	}
	
	private boolean isValidID(int id) { 
		
		boolean valid = false;
		
		try {
			PreparedStatement findID = con.prepareStatement("SELECT * FROM Users WHERE uid = ?;");
			findID.setInt(0,  id);
			ResultSet rs = findID.executeQuery();
			
			if (rs != null) { 
				valid = false;
			}
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
		}
		return valid;
	}
	
	

	public boolean createCart() { 
		
		boolean created = true;
		int order_id = (int) (Math.random()*1000);
		
		try { 
			// Create Shopping Cart entry
			PreparedStatement createSCEntry = con.prepareStatement("INSERT INTO shopping_carts(order_id, total_amount,num_articles) values (?,?,?);");
			createSCEntry.setInt(0, order_id);
			createSCEntry.setFloat(1, ((float) 0.0));
			createSCEntry.setInt(2, 1);
			ResultSet rs1 = createSCEntry.executeQuery();
			
			// Create Uses entry
			PreparedStatement createUsesEntry = con.prepareStatement("INSERT INTO Uses(order_id, listener_id) VALUES (?, ?);");
			createUsesEntry.setInt(0, order_id);
			createUsesEntry.setInt(1, userID);
			ResultSet rs2 = createUsesEntry.executeQuery();
			
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
			ResultSet rs1 = incrementNumArticles.executeQuery();
			
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
				int num_songs = getLibDetails.getInt(1);
				
				num_songs++;
				
				PreparedStatement incrementLibSongs = con.prepareStatement("UPDATE libraries SET num_songs = ? WHERE lib_id = ?;");
				incrementLibSongs.setInt(1, this.libID);
				incrementLibSongs.setInt(0, num_songs);	
				ResultSet rs1 = incrementLibSongs.executeQuery();
				
				// Adds entry to IsAddedTo table
				PreparedStatement incIsAddedTo = con.prepareStatement("INSERT INTO IsAddedTo(lib_id,article_id) values (?, ?);");
				incIsAddedTo.setInt(0, this.libID);
				incIsAddedTo.setInt(1, articleID);
				ResultSet rs2 = incIsAddedTo.executeQuery();
				
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
			PreparedStatement initPlaylist = con.prepareStatement("INSERT INTO playlists(name,status,num_songs,lib_id) values (?, ?, ?, ?);");
			initPlaylist.setString(0, name);
			initPlaylist.setString(1, status);
			initPlaylist.setInt(2, n_songs);
			initPlaylist.setInt(3, this.libID);

			ResultSet rs1 = initPlaylist.executeQuery();
			
			// Creates entry in Creates table
			PreparedStatement addToCreate = con.prepareStatement("INSERT INTO Creates(listener_id,lib_id,name) values (?, ?, ?);");
			addToCreate.setInt(0, this.userID);
			addToCreate.setInt(1, this.libID);
			addToCreate.setString(2, name);

			ResultSet rs2 = addToCreate.executeQuery();
			
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
				int num_songs = getPlaylistDetails.getInt(2);
				
				num_songs++;				// Increments num_songs in playlist
				
				PreparedStatement incrementPlaylistSongs = con.prepareStatement("UPDATE playlist SET num_songs = ? WHERE name = ?;");
				incrementPlaylistSongs.setInt(0, num_songs);
				incrementPlaylistSongs.setString(1, name);	
				ResultSet rs1 = incrementPlaylistSongs.executeQuery();
				
				// Creates entry in IsPartOf table
				PreparedStatement addToIPO = con.prepareStatement("INSERT INTO IsPartOf(name,lib_id) values (?, ?);");
				addToIPO.setString(0, name);
				addToIPO.setInt(1, this.libID);
				ResultSet rs2 = addToIPO.executeQuery();
								
				// Create entry in ComprisesOf table
				PreparedStatement addtoCO = con.prepareStatement("INSERT INTO ComprisesOf(lib_id,name,song_id) values (?, ?, ?);");
				addtoCO.setInt(0, this.libID);
				addtoCO.setString(1, name);
				addtoCO.setInt(2, articleID);
				ResultSet rs3 = addtoCO.executeQuery();
				
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
			PreparedStatement inLib = con.prepareStatement("SELECT * FROM IsAddedTo WHERE lib_id = ? AND article_id = ?;");
			inLib.setInt(0, this.libID);
			inLib.setInt(1,  articleID);
			ResultSet rs = inLib.executeQuery();
			
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
	
	
	private boolean doesArticleExist(int articleID){
		boolean exist = true;
		
		try {
			PreparedStatement findSong = con.prepareStatement("SELECT * FROM articles WHERE article_id = ?;");
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
	
	
	
	public boolean createLibID() { 
		
		boolean created = true;
		this.libID = (int) (Math.random()*1000);
		boolean lib_exists = true;
		
		try { 
			
			// checks if lib_id already exists
			while (lib_exists) {
				this.libID = (int) (Math.random()*1000);
				
				PreparedStatement findLib = con.prepareStatement("SELECT * FROM libraries WHERE lib_id = ?;");
				findLib.setInt(0, this.libID);
				ResultSet rs = findLib.executeQuery();
				
				if (rs == null) {
					lib_exists = false;
				}
			}
			
			// adds to libraries table
			PreparedStatement addtoLib = con.prepareStatement("INSERT INTO libraries(lib_id,num_songs) values (0, 0);");
			addtoLib.setInt(0, this.libID);
			addtoLib.setInt(1, 0);
			ResultSet rs1 = addtoLib.executeQuery();
			
			// adds to has table
			PreparedStatement addtoHas = con.prepareStatement("INSERT INTO Has(listener_id,lib_id) values (?, ?);");
			addtoHas.setInt(0, this.userID);
			addtoHas.setInt(1, this.libID);

			ResultSet rs2 = addtoHas.executeQuery();
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
			created = false;
		}
		return created;		
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}


}
