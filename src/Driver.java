
import java.sql.*;
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
				System.out.println("Enter user ID number: ");
				int uidn = scan.nextInt();
				
				System.out.println("Enter user name: ");
				scan.nextLine();	
				String user = scan.nextLine();
				
				System.out.println("Enter password: ");
				scan.nextLine();	
				String pw = scan.nextLine();
				
				System.out.println("Choose account type. \n0 -- Listener ; 1 -- Artist");
				userType = scan.nextInt();
				
				if (userType == 0) { 
					// Check if login works in Listener class 
					Listener list = new Listener(con, uidn, user, pw);
					
				} else { 
					// Check if login works in Artist class
				}

			} else {
				System.out.println("You are now creating a new account.");
				
				System.out.println(" Enter your full name: ");
				scan.nextLine();	
				String fullName = scan.nextLine();

				System.out.println("Enter user name: ");
				scan.nextLine();	
				String user = scan.nextLine();
				
				System.out.println("Enter your email: ");
				scan.nextLine();	
				String email = scan.nextLine();
				
				System.out.println("Enter your password: ");
				scan.nextLine();	
				String pwd = scan.nextLine();
				
				System.out.println("Enter your country: ");
				scan.nextLine();	
				String country = scan.nextLine();
				
				System.out.println("Enter your date of birth: ");
				scan.nextLine();	
				String dateOfBirth = scan.nextLine();
				
				System.out.println("Enter your credit: ");
				scan.nextLine();	
				String credit = scan.nextLine();
				
				System.out.println("Are you a listener or an artist? \n0 -- Listener ; 1 -- Artist");
				int c = scan.nextInt();
				
				if (c == 1) { 
					System.out.println("Enter your stage name: ");
					scan.nextLine();	
					String stageName = scan.nextLine();
					
					// Artist art = new Artist(con, fullName, stageName, email, user, pwd, country, dateOfBirth, credit);
				}
				
				Listener list = new Listener(con, fullName, email, user, pwd, country, dateOfBirth, credit);	
				System.out.print("Account successfully created.");
			}
			
		//	Listener listener = new Listener(con, "Janna Agustin", "jannajanna123@gmail.com", "jannalouise", "temp123", "Canada", "2015-05-12", "12345678");
			
			
			// uid = 131
			
			//
			//
			//
			//				 LISTENER MENU 
			//
			// if (userType == 0) { 
			//
			
			

			char cont = 'Y';
			int choice = -1;
			
			while (cont == 'Y' || cont == 'y') { 
				System.out.println("Choose one option:\n 0 -- Print My Library\n 1 -- Buy Article\n 2 -- Create Playlist\n 3 -- Add to Playlist\n ");
				choice = scan.nextInt();
					
			
				if (choice == 0) { 		// PRINT LISTENER LIBRARY					
//					listener.printLibrary();

					
					System.out.println("\nWould you like to return to the menu?");
					System.out.println("Y -- Yes please!, N -- No thank you. Please exit the app.\n");
					cont = scan.next().charAt(0);
					
					
				} else if (choice == 1) { 		// BUY ARTICLE 
					int articleID = 0;
			//		int orderID = listener.createCart();
				//	System.out.println("Your order ID is: " + orderID);
					System.out.println("Reminder: to buy an article, please remember your order ID number as well as the ID number of the song or album you wish to purchase. \n"
							+ "To view the ID number of a song or album, print your library.");
					
					while (articleID != -1) { 
						boolean success = true;  // **
						System.out.println("Please enter the ID number of the song or album you wish to add to your cart: ");
						
						articleID = scan.nextInt();
						
			//			success = listener.addToCart(orderID, articleID);
						
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
					
		//			listener.checkOutCart(orderID);
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
					
			//		boolean success = listener.createPlaylist(name, status);
					boolean success = true;
					
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
						
		//				boolean success = listener.addToPlaylist(name, articleID);
						boolean success = true;
						
						if (success) { 
							System.out.println("Item successfully added to playlist. Would you like to add another item to the playlist?\n"
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
				
				//cont = true;
			}
			
			scan.close();			
			closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
