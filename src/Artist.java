import java.sql.*;


public class Artist {
	
	private Connection con;
	private int userID;
	private String stageName;
	private float balance;
	
	
	
	
	public Artist(String name, Connection con) {
		this.con = con;
		this.stageName = name;
		this.balance = (float) 0.0;
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
	
	
	
	
	public boolean releasesArticle(int article_id, String title, String genre, Date release_date, float price) {
		
		boolean released = true;
		
		try { 
			// Creates article
			PreparedStatement createArt = con.prepareStatement("INSERT INTO articles(article_id,title,genre,release_date,price) values (?, ?, ?, ?, ?);");
			createArt.setInt(0,  article_id);
			createArt.setString(1, title);
			createArt.setString(2, genre);
			createArt.setDate(3, release_date);
			createArt.setFloat(4, price);
			ResultSet rs = createArt.executeQuery();
			
			// adds entry to releases table
			PreparedStatement addtoRel = con.prepareStatement("INSERT INTO Releases(artist_id,article_id) values (?, ?);");
			addtoRel.setInt(0,  this.userID);
			addtoRel.setInt(1, article_id);
			ResultSet rs2 = addtoRel.executeQuery();			
			
		} catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
			released = false;
		}
		return released;	
	}
	
	
	
	public boolean depositEarnings () { 
		
		boolean deposited = true;
		
		// not sure how to implement
		
		
		return deposited;
	}
	
	

}
