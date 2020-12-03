
package lecture;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class ex03 {
    public static void main( String args[] ) {
        Connection c = null;
        Statement stmt = null;
        int num = 1;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager
                    .getConnection("jdbc:postgresql://127.0.0.1:5432/",
                            "postgres", "");
//            c.setAutoCommit(false);
//            System.out.println("Opened database successfully");
//            for (int temp = 0; temp < 10; temp++) {
            stmt = c.createStatement();
            String sql = "CREATE TABLE LEARNING_PROGRAM " +
                    "(ID INT  NOT NULL," +
                    " L_NAME        CHAR(50),  " +
                    " ADDRESS        CHAR(50),  " +
                    " OPERATING_DAY        CHAR(50),  " +
                    " T_NAME        CHAR(50),  " +
                    " HP        CHAR(50),  " +
                    " ON_OFF        CHAR(50))";
            stmt.executeUpdate(sql);
            stmt.close();
            c.close();

//                stmt = c.createStatement();
//                String sql = "INSERT INTO LEARNING_PROGRAM (ID ,L_NAME, ADDRESS, OPERATING_DAY, T_NAME, HP, ON_OFF) "
//                        + "VALUES (1, '23', '23', '23', '232', '141', '124')";
//
//                stmt.executeUpdate(sql);
//            }
//            stmt.close();
//            c.commit();
//            c.close();

        } catch ( Exception e ) {
            System.err.println( e.getClass().getName()+": "+ e.getMessage() );
            System.exit(0);
        }
        System.out.println("Table created successfully");
    }
}