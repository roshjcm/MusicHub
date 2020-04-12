
import java.sql.*;
//import com.sun.scenario.effect.Offset; 

public class Driver {	

	public static Connection openCon(String user, String pass) throws Exception {
		Connection con = DriverManager.getConnection("jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421", user, pass);
		return con;	
	}
	
	public static void closeCon(Connection con) throws SQLException {
		con.close();
	}
	
	
	
	
	
	public static void main(String[] args) { 
		
		String username = "cs421g40";
		String pass = "musichub40";
		Connection con = null;
	
		 
		try {			
		    DriverManager.registerDriver ( new org.postgresql.Driver() ) ;
			con = openCon(username, pass);			// open connection to database
			

			System.out.println("DRIVER: Connection successful.");
			
			
			/**
			 * Hello, welcome to Music Hub!
			 * 
			 * Choose one option: 			 	
			 * 		0 - Login 
			 * 				- Enter login + pass
			 * 				- Queries users + listeners/artists table (chooses automatically)
			 * 		1 -- Create Account 
			 * 				0 -- Listener
			 * 						-- Enters all info
			 * 						-- Creates account
			 * 				1 -- Artist
			 * 						-- Enters all info
			 * 						-- Creates account
			 * 
			 * ListenerMenu (class -- to create)
			 * 
			 * Choose one option:
			 * 		0 -- Create Playlist
			 * 				-- Enter info (name)
			 * 				-- Calls createPlaylist (Listener class)
			 * 		1 -- My Library
			 * 				-- Calls printLibrary(Listener class -- to create)
			 * 		2 -- Buy Article
			 * 				-- Print reminder to remember orderID and articleID
			 * 				-- Calls createCart(), prints orderID
			 * 				-- Calls addToCart(orderID, articleID)
			 * 				-- When ready to check out, call checkOutCart
			 * 
			 * 
			 * ArtistMenu (class -- to create)
			 * 
			 * Choose one: 
			 * 		0 -- Show balance
			 * 		1 -- Upload article 
			 * 				-- Enter info (title, genre, price, article type, duration, album_type)
			 * 					-- 0 - Song (input duration)
			 * 					-- 1 - Album (input album type)
			 * 				-- Call releaseArticle(Artist class)
			 * 				-- Print success
			 * 
			 */
		
			
						
				/**
				 * 		LISTENER 
				 * 
				 * To create an instance (insert into Users table), 
						' Listener user = new Listener (con, name, email, username, pass, country, date (str), credit_info (str))';
					
						E.G. Listener user = new Listener(con, "Janna Agustin", "jannajanna123@gmail.com", "jannalouise", "temp123", "Canada", "2015-05-12", "12345678");
				 * 
				 * 
				 * Functions 
				 * 
				 * Shopping Cart:
				 * -- createCart()
				 * -- addToCart(orderID, articleID)
				 * -- checkOutCart(orderID)
				 * 
				 * Library:
				 * -- addToLibrary(articleID)
				 * 
				 * Playlist:
				 * -- createPlaylist(name, status, n_songs)
				 * -- addToPlaylist(name, articleID)
				 * 
				 */

	
			
			
		
			
			closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
