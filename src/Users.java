import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Users {

	private static Connection con;
	//private int userID, libID;
	//private String name, email, username, password, country, creditInfo,  dob;

	public Users(Connection c) {
		this.con = c;
	}
	public static Connection getCon() {
		return con;
	}
	
public static ArrayList<String> getUsers() {
		
		ArrayList<String> Users = new ArrayList<String>();
		
		try {
				Statement statement = con.createStatement();
				String s = "SELECT username FROM users" + ";";
				ResultSet rs = statement.executeQuery(s);
				
				String username;
			
				while (rs.next()) { 
					username = rs.getString("username");
					System.out.println("We have the username : " + username);
					Users.add(username);
				}
				
				statement.close();
				con.close();
			} catch (SQLException e) {
				System.err.println("msg: " + e.getMessage() + 
						" code: " + e.getErrorCode() + 
						" state: " + e.getSQLState() + " in users.");
			}
		
		return Users;
	}
}
