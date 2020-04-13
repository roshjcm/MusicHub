import java.sql.*;


public class Artist {
	
	private Connection con;
	public int userID;
	public String stageName, name, email, username, password, country, creditInfo, dob;
	public float balance;
	
	
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
	//	this.createUser();
	}

	public boolean logIn(int userID) {
		try { 
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM artists WHERE uid=" + userID + ";");
			
			if (rs.next() == false) { 
				return false;
			}else {
				this.userID = rs.getInt("uid");
				this.stageName = rs.getString("stage_name");
				this.balance = rs.getFloat("balance");
				
				ResultSet hs = stmt.executeQuery("SELECT * FROM users WHERE uid=" + userID + ";");
				if (hs.next() == false) { 
					return false;
				} else {
					this.userID = hs.getInt(1);
					this.name = hs.getString(2);
					this.username = hs.getString(3);
					this.country = hs.getString(4);
					this.email = hs.getString(5);
					this.dob = hs.getString(6);
					this.creditInfo = hs.getString(7);
				}
			}
		

			stmt.close();
		} catch (SQLException e) {
			System.err.println("LOG IN ARTIST msg: " + e.getMessage() + 
					" code: " + e.getErrorCode() + 
					" state: " + e.getSQLState());	
			return false;
		}
		return true;
	}
	
	public boolean releasesArticle(String title, String genre, String release_date, float price) {
		
		int x = (int) (Math.random()*1000);
		System.out.println("Generated id: " + x);
		
		while (!isValidArticleID(x)) {
			System.out.println("Trying userID:" + x);
			x = (int) (Math.random()*1000);
		}
		
		int article_id = x;
		
		boolean released = true;
		
		try { 

			Statement stmt = con.createStatement();

			// Creates article	
			stmt.executeUpdate("INSERT INTO articles(article_id,title,genre,release_date,price) "
					+ "values(" + article_id + ",'" + title + "','" + genre + "','" +release_date + "'," + price + ");");
			
			// Adds entry to Releases table
			stmt.executeUpdate("INSERT INTO Releases(artist_id,article_id) "
					+ "values (" + this.userID + "," + article_id + ");");
			
			
			System.out.println("The article has been added : " + article_id + "," + title + "," + genre + "," + release_date + "," + price);
			
			stmt.close();
		} catch (SQLException e) {
			System.err.println("Adding Article : msg: " + e.getMessage() + 
					" code: " + e.getErrorCode() + 
					" state: " + e.getSQLState());
			released = false;
		}
		return released;	
	}
	
	
	
	public boolean depositEarnings (float moneyEarned) { 
		
		boolean deposited = true;
		
		try {
			Statement stmt = con.createStatement();
			
			ResultSet getBalanceDetails = stmt.executeQuery("SELECT * FROM artists WHERE artist_id = " + this.userID + ");");
			float balance = getBalanceDetails.getFloat("balance");
			balance += moneyEarned;
			
			stmt.executeUpdate("UPDATE artists SET balance = " + balance
					+ " WHERE artist_id =" + this.userID + ");");
			
			stmt.close();
		}catch (SQLException e) {
			System.err.println("msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());	
			deposited = false;
		}
		
		
		// not sure how to implement
		
		
		return deposited;
	}
	
	
	public void createUser(){
		
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
								+ "values (" + this.userID + ",'" + this.name + "', '" + this.username
								+ "', '" + this.country + "', '" + this.email + "','" + this.dob + "'," 
								+ this.creditInfo + ");");
				
				stmt.executeUpdate("INSERT INTO artists(uid, stage_name,balance) values (" + 
									this.userID + ",'" + this.stageName + "'," + this.balance + ");");
				
				System.out.println("Artist user successfully created and added to DB.");
				stmt.close();
			} catch (SQLException e) {
				System.err.println("CREATING ARTIST USER msg: " + e.getMessage() + 
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
			System.err.println(" is valid user id : msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
			return true;
		}
		return valid;
	}
	
private boolean isValidArticleID(int id) { 
		
		boolean valid = false;
		
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM articles WHERE article_id=" + id + ";");
			//System.out.println("Query executed.");
		
			if (rs.next() == false) { 
				System.out.println("Article id " + id + " is valid.");
				valid = true;
			}
			stmt.close();
			
		} catch (SQLException e) {
			System.err.println(" checking article id : msg: " + e.getMessage() + 
					"code: " + e.getErrorCode() + 
					"state: " + e.getSQLState());
			return true;
		}
		return valid;
	}

}
