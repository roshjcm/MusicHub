
import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.*;
import java.util.Date;

import com.sun.scenario.effect.Offset; 



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
			

			System.out.println("Conncetion successful.");
			
			Date dob = new Date(); 
			String input =  "2015-05-12 15:15:24".replace( " " , "T" ) ;
			LocalDateTime ldt = LocalDateTime.parse( input ) ;
			LocalDate ld = ldt.toLocalDate() ;
			
		//	SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
			
			Listener user = new Listener(con, "Janna Agustin", "jannajanna123@gmail.com", 
					"jannalouise", "temp123", "Canada", ld, 12345678);
			
		
		//	GUI gui = new GUI();
			
			
			// calls different methods for different application options 
				// login (which type of user are you) 
				//
			
		
			
			closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
