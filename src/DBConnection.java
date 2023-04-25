import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
   Connection conn=null;
   java.sql.PreparedStatement ps;
   public static Connection dbconnect() {
	   try {
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentmanagement", "root", "rootroot");
		   return conn;
	   }
	   catch(Exception e2) {
		   System.out.println(e2);
		   return null;
	   }
   }
}
