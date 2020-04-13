
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
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
			 */
			
			Scanner scan = new Scanner(System.in);  // Create a Scanner object
			int userType = -1;
			
			System.out.println("Hello, welcome to Music Hub!");
			
			
			System.out.println("Choose one option:");
			System.out.println("0 -- Log in \n1 -- Create a new account");
			int option = scan.nextInt();  
			scan.nextLine();
			
			if (option == 0) {
				boolean loggedIn = false;
				int uidn =0;
				String user = "", pw ="";
				while(!loggedIn) {
					System.out.println("Enter user ID number: ");
					uidn = scan.nextInt();
					
					System.out.println("Enter user name: ");
					scan.nextLine();	
					user = scan.nextLine();
					
					System.out.println("Enter password: ");
					pw = scan.nextLine();
					
					System.out.println("Choose account type. \n0 -- Listener ; 1 -- Artist");
					userType = scan.nextInt();
					
					if (userType == 0) { 
						// Check if login works in Listener class 
						Listener list = new Listener(con, uidn, user, pw);
						loggedIn = list.logIn(uidn);
						
					} else { 
						// Check if login works in Artist class
						System.out.println("Enter your stage name: ");
						String stage_name = scan.nextLine();
						Artist artist = new Artist(con, "", "", "", "","", "","", "");
						loggedIn = artist.logIn(uidn);
						if(!loggedIn) System.out.println("Cannot log in, Please enter valid credidentials");
					}
					
				}	if(userType ==0) {
					Listener list = new Listener(con, uidn, user, pw);
					ListenerMenu(list, scan);
				}else {
						Artist artist = new Artist(con, "", "", "", user, pw, "","", "");
						artist.logIn(uidn);
						ArtistMenu(artist,scan);
					}

			} else {
				System.out.println("You are now creating a new account.");
				
				System.out.println(" Enter your full name: ");
				String fullName = scan.nextLine();

				System.out.println("Enter user name: ");
				String user = scan.nextLine();
				
				System.out.println("Enter your email: ");
				String email = scan.nextLine();
				
				System.out.println("Enter your password: ");
				String pwd = scan.nextLine();
				
				System.out.println("Enter your country: ");
				String country = scan.nextLine();
				
				System.out.println("Enter your date of birth: ");
				String dateOfBirth = scan.nextLine();
				
				System.out.println("Enter your credit: ");
				String credit = scan.nextLine();
				
				System.out.println("Are you a listener or an artist? \n0 -- Listener ; 1 -- Artist");
				int c = scan.nextInt();
				
				if (c == 1) { 
					System.out.println("Enter your stage name: ");
					scan.nextLine();	
					String stageName = scan.nextLine();
					
					 Artist art = new Artist(con, fullName, stageName, email, user, pwd, country, dateOfBirth, credit);
					 art.createUser();
				}
				
				Listener list = new Listener(con, fullName, email, user, pwd, country, dateOfBirth, credit);	
				
			}
			
				//Listener listener = new Listener(con, "", "jannajanna123@gmail.com", "jannalouise", "temp123", "Canada", "2015-05-12", "12345678");
			// uid = 131
			
			//
			//
			//
			//				 LISTENER MENU 
			//
			// if (userType == 0) { 
			//
			
			scan.close();			
			closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	public static void ArtistMenu(Artist artist,Scanner scan) {
		
		String answ = "no";
		System.out.println("Welcome " + artist.stageName + " !");
		while(answ.toLowerCase().equals("no") ||answ.toLowerCase().equals("n") ) {
			System.out.println("Options: 1.Show balance or 2.Upload Article");
			int opt = scan.nextInt();  // Read user input
			
			if(opt ==1) System.out.println("You're balance is of $" + artist.balance);
			else if (opt ==2) {
				System.out.println("Please enter the article information : title, genre, price (each followed by enter)");
				scan.nextLine();
				String title = scan.nextLine();
				System.out.println("title : " + title);
				String genre = scan.nextLine();
				System.out.println("genre : " + genre);
				String p = scan.nextLine();
				System.out.println("price : " + p);
				float price = Float.parseFloat(p);
				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate localDate = LocalDate.now();
				 artist.releasesArticle(title, genre,  localDate.toString(), price);
			}
			
			System.out.println("Exit ? (yes/no)");
			scan.nextLine();
			answ = scan.nextLine();
		}
		
	}
	
	public static void ListenerMenu(Listener listener, Scanner scan) {
		char cont = 'Y';
		int choice = -1;
		System.out.println("Successfully logged in.");
		System.out.println("Hello, Welcome back to your Music Library !");
		while (cont == 'Y' || cont == 'y') { 
			System.out.println("Choose one option:\n 0 -- Print My Library\n 1 -- Buy Article\n 2 -- Create Playlist\n 3 -- Add to Playlist\n ");
			choice = scan.nextInt();
				
		
			if (choice == 0) { 		// PRINT LISTENER LIBRARY					
				listener.printLibrary();

				
				System.out.println("\nWould you like to return to the menu?");
				System.out.println("Y -- Yes please!, N -- No thank you. Please exit the app.\n");
				cont = scan.next().charAt(0);
				
				
			} else if (choice == 1) { 		// BUY ARTICLE 
				int articleID = 0;
				int orderID = listener.createCart();
				System.out.println("Your order ID is: " + orderID);
				System.out.println("Reminder: to buy an article, please remember your order ID number as well as the ID number of the song or album you wish to purchase. \n"
						+ "To view the ID number of a song or album, print your library.");
				
				while (articleID != -1) { 
					boolean success = true;  // **
					System.out.println("Please enter the ID number of the song or album you wish to add to your cart: ");
					
					articleID = scan.nextInt();
					
					success = listener.addToCart(orderID, articleID);
					
					if (success) { 
						System.out.println("Item successfully added to shopping cart. Would you like to add another item to your cart?");
						System.out.println("Y -- Yes please! ; N -- No thank you. I would like to checkout.");
						char x = scan.next().charAt(0);
						
						if (x == 'Y') { 
							articleID = 0;
						} else { 
							articleID = -1;
						}
					} else { 
						System.out.println("Article ID does not exist");
					}
				}
				
				listener.checkOutCart(orderID);
				System.out.println("Shopping cart successfully check out. Items successfully purchased.");
				
				System.out.println("\nWould you like to return to the menu?");
				System.out.println("Y -- Yes please!, N -- No thank you. Please exit the app.\n");
				cont = scan.next().charAt(0);
				
			} else if (choice == 2) { 	 // CREATE PLAYLIST
				System.out.println("You are now creating a playlist. Please enter the name of the playlist:");
				//System.out.println("Name: ");
			//	System.out.println("Status : ");
				scan.nextLine();
				String name = scan.nextLine();
				System.out.println("Please enter the status of the playlist (0 -- public, 1 -- private): ");

				int st = scan.nextInt();
				
				
				String status;
				
				if (st == 0) { 
					status = "public";
				} else { 
					status = "private";
				}
				
				boolean success = listener.createPlaylist(name, status);
				//success = true;
				
				if (success) {
					System.out.println("Playlist successfully created! Here are the details:\n Name: " + name + "\n Status: " + status + "\n");
					
				} else { 
					System.out.println("Error in creating playlist. Try again.\n");
				}
				
				System.out.println("\nWould you like to return to the menu?");
				System.out.println("Y -- Yes please!, N -- No thank you. Please exit the app.\n");
				cont = scan.next().charAt(0);
				
			} else {  		// ADD TO PLAYLIST
				System.out.println("You are now adding items to your playlist. \nReminder: to add an item to you playlist, "
						+ "please remember your playlist name as well as the ID number of the song or album you wish to add. "
						+ "To view the ID number of a song or album, print your library.\n");	
				
				System.out.println("Please enter the name of the playlist: ");
				scan.nextLine();					
				String name = scan.nextLine();
		
				boolean cont2 = true;
				
				while (cont2) { 
					System.out.println("Please enter the ID number of the song or album you wish to add to this playlist: ");
					int articleID = scan.nextInt();
					
					boolean success = listener.addToPlaylist(name, articleID);
			//		boolean success = true;
					
					if (success) { 
						System.out.println("Would you like to add another item to the playlist?\n"
								+ "(Y -- Yes please! \n N -- No thank you.");
						char x = scan.next().charAt(0);
						
						if (x == 'Y' || x == 'y') { 
							cont2 = true;
						} else { 
							cont2 = false;
						}
					} else { 
						System.out.println("Error in adding to playlist. Try again.");
					}
				}
				
				System.out.println("\nWould you like to return to the menu?");
				System.out.println("Y -- Yes please!, N -- No thank you. Please exit the app.\n");
				cont = scan.next().charAt(0);
			}
		}
	}

}
