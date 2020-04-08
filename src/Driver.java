
import java.sql.*;


public class Driver {	

	public static Connection openCon(String user, String pass) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(
				"jdbc:db2://comp421.cs.mcgill.ca:50000/cs421", user, pass);
		
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
		//	con = openCon(username, pass);			// open connection to database
		
			
			GUI gui = new GUI();
			
			
			// calls different methods for different application options 
				// login (which type of user are you) 
				//
			
			
			
		//	closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	
	
	

}
