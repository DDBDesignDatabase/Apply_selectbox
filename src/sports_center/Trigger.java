package sports_center;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Trigger {

	public static void main(String[] args) throws SQLException {
		
		Connection connection = null;
		Statement st = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Statement statement = null;
		
		String url = "jdbc:postgresql://localhost:5432/Library";
		String user = "hyewon";
		String password = "zxcasd123";
		
		try
		{
			connection = DriverManager.getConnection(url, user, password);
			st = connection.createStatement();
			
			Statement st2 = connection.createStatement();
			String V_Query="create view noFacility as select * from sports_center;";
			System.out.println("1");
			st2.execute(V_Query);
			
			String query1 = "delete from noFacility where facility = '없음';";
			st2.executeUpdate(query1);
			String query2 = "select * from noFacility";
			ResultSet result1 = st2.executeQuery(query2);
			while(result1.next()) {
				int id = result1.getInt("id");
				String name = result1.getString("name");
				String nsi_do = result1.getString("nsi_do");
				String nsi_gun_gu = result1.getString("nsi_gun_gu");
				String facility = result1.getString("facility");
				System.out.printf("%d | %s | %s | %s | %s\n", id, name, nsi_do, nsi_gun_gu, facility);
			}
			
			System.out.println("2");
		} catch (SQLException ex) {
			throw ex;

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (connection != null) {
					connection.close();
				}

			} catch (SQLException ex2) {
				throw ex2;
			}
		} 
	}

}