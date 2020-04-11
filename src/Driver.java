
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
			
		//	Listener user = new Listener(con, "Janna Agustin", "jannajanna123@gmail.com", 
		//			"jannalouise", "temp123", "Canada", "2015-05-12", "12345678");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE uid = 883;");
			
			while (rs.next()) { 
				System.out.println("Pulled user with id: " + rs.getInt(1) + " and name " + rs.getString(2));
			}
			
		//	GUI gui = new GUI();
		
			
			closeCon(con);  						// close connection to DB
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}

}
