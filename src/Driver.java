
import java.sql.*;


public class Driver {	

	public static Connection openCon(String user, String pass) throws Exception {
		Connection con = DriverManager.getConnection("jdbc:postgresql://comp421.cs.mcgill.ca:5432/cs421", user, pass);
		return con;	
	}
	
	public static void closeCon(Connection con) throws SQLException {
		con.close();
	}
	
	
	public static void main(String[] args) { 
		
		String username = "jagust1";
		String pass = "dKX7sj6I";
		Connection con = null;
	
		 
		try {
		    DriverManager.registerDriver ( new org.postgresql.Driver() ) ;
			con = openCon(username, pass);			// open connection to database
			
			
		//	Listener user = new Listener();
			
			
		
			
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
