package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;

public class DBconnection {
	private Connection conn;
	private PreparedStatement pstmt;
//	private ResultSet rs;
	
	public DBconnection() {
		try {
			String url = "jdbc:postgresql://localhost:5432/Library";
			String id = "hyewon";
			String pw = "zxcasd123";
			conn = DriverManager.getConnection(url, id, pw);
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int select(Library library) {
//		drop table library;
//		create table library(num int primary key, name char(50), nsi_do char(10), nsi_gun_gu char(10), holiday char(100));
//		select * from library

//		copy library(num, "name", "nsi_do", "nsi_gun_gu","holiday")
//		from '/Users/hyewon/Desktop/JSP/library.csv'
//		DELIMITER ','
//		CSV HEADER
//		ENCODING 'EUC_KR';
		
//		copy public.library (id, name, nsi_do, nsi_gun_gu, holiday) FROM '/Users/hyewon/Desktop/JSP/library.csv' DELIMITER ',' CSV HEADER ENCODING 'EUC_KR' 
		String SQL = "SELECT name, nSI_DO, nSI_GUN_GU, HOLIDAY FROM Library Where nSI_DO = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, library.getNAME());
			pstmt.setString(2, library.getnSI_DO());
			pstmt.setString(3, library.getnSI_GUN_GU());
			pstmt.setString(4, library.getHOLIDAY());
			return pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}

}
