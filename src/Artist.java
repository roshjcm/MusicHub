import java.sql.*;


public class Artist {
	
	private Connection con;
	private int userID;
	private String stageName, name, email, username, password, country, creditInfo, dob;
	private float balance;
	
	
	public Artist(Connection con, String name, String stageName, String email, 
			String username, String password, String country,
			String dob, String creditInfo) {
		this.con = con;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.country = country;
		this.dob = dob;
		this.creditInfo = creditInfo;
		
		this.stageName = name;
		this.balance = (float) 0.0;
		this.createUser();
	}
	
	
	
	
	
	public boolean releasesArticle(int article_id, String title, String genre, String release_date, float price) {
		
		boolean released = true;
		
		try { 

			Statement stmt = con.createStatement();
			
			// Creates article	
			stmt.executeUpdate("INSERT INTO articles(article_id,title,genre,release_date,price) "
							+ "values (" + article_id + "," + title + "," + genre + "," + release_date + "," + price + ");");
			
			// Adds entry to Releases table
			stmt.executeUpdate("INSERT INTO Releases(artist_id,article_id) "
					+ "values (" + this.userID + "," + article_id + ");");
			
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
	
	
	private void createUser(){
		
		int x = (int) (Math.random()*1000);
		System.out.println("Generated id: " + x);
		
		while (!isValidUserID(x)) {
			System.out.println("Trying userID:" + x);
			x = (int) (Math.random()*1000);
		}	
		this.userID = x;
		
		try {
				
				Statement stmt = con.createStatement();
				stmt.executeUpdate("INSERT INTO users(uid,name,username,country,email,dob,credit_info) "
								+ "values (" + this.userID + ", \'" + this.name + "\', \'" + this.username
								+ "\', \'" + this.country + "\', \'" + this.email + "\'," + this.dob + "," 
								+ this.creditInfo + ");");
				
				stmt.executeUpdate("INSERT INTO artist(uid, stage_name,balance) values (" + 
									this.userID + "," + this.stageName + "," + this.balance + ");");
				
				System.out.println("Artist user successfully created + added to DB.");
				stmt.close();
			} catch (SQLException e) {
				System.err.println("msg: " + e.getMessage() + 
						"code: " + e.getErrorCode() + 
						"state: " + e.getSQLState());
		}
	}
	

	
	private boolean isValidUserID(int id) { 
		
		boolean valid = false;
		
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE uid=" + id + ";");
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

}
