
import java.sql.*;

import java.util.Scanner;
import java.time.LocalDate;
//import com.sun.scenario.effect.Offset; 
import java.time.format.DateTimeFormatter;

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
 * 		LISTENER 
 * 
 * To create an instance (insert into Users table), 
		' Listener user = new Listener (con, name, email, username, pass, country, date (str), credit_info (str))';
	
		E.G. Listener user = new Listener(con, "Janna Agustin", "jannajanna123@gmail.com", "jannalouise", "temp123", "Canada", "2015-05-12", "12345678");
 * 
 * 
 * Functions 
 * 
 * -- createCart()
 * -- addToCart(orderID, articleID)
 * -- checkOutCart(orderID)
 * 
 * -- addToLibrary(articleID)
 * 
 * -- createPlaylist(name, status, n_songs)
 * -- addToPlaylist(name, articleID)
 * 
 */
			//enter log in + password
			//choose which option of account
			//call the respective log in 
			//if succesful and type is artist 

			Boolean logInSuccesful = false;
			String typeUser = "artist";
			int uid = 0;
			
			if(typeUser.toLowerCase().equals("artist")) {
				Artist art = new Artist(con, "", "", "", "", "", "","", "");
				
				logInSuccesful = art.logIn(uid);
				if (logInSuccesful) {
					String answ = "no";
					while(answ.toLowerCase().equals("no")) {
						System.out.println("Welcome " + art.stageName + " !");
						Scanner myObj = new Scanner(System.in);
						System.out.println("Options: 1.Show balance or 2.Upload Article");
						int option = myObj.nextInt();  // Read user input
						
						if(option ==1) System.out.println("You're balance is of $" + art.balance);
						else if (option ==2) {
							System.out.println("Please enter the article information : title, genre, price (each followed by enter)");
							String title = myObj.nextLine();
							String genre = myObj.nextLine();
							float price = myObj.nextFloat();
							
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							LocalDate localDate = LocalDate.now();
							 art.releasesArticle( title,  genre,  localDate.toString(),  price);
						}
						
						System.out.println("Exit ?");
						answ = myObj.nextLine();
					}
				}
			}
		
			
			closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	

}
