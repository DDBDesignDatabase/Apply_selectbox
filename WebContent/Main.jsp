
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ page import="java.sql.*" %>



<% 
Connection con = null;
Statement stmt = null;
ResultSet rs = null;


try {
	String driver = "org.postgresql.Driver";
	Class.forName(driver);
	String url = "jdbc:postgresql://localhost:5432/postgres";
	String user = "postgres";
	String password = "1234";
	
	
	String sql = "SELECT * FROM SPORTS_CENTER";
	System.out.println("check1");

	System.out.println("check2");
	
	System.out.println("check3");
	
	con = DriverManager.getConnection(url, user, password);
	System.out.println("check4");
	stmt = con.createStatement();
	System.out.println("check5");
	
	rs = stmt.executeQuery(sql);
	System.out.println("check6");
	/* while (rs.next()) {
		System.out.println(rs.getString("id"));
		System.out.println(rs.getString("name"));
		// out.println(rs.getString("id") + rs.getString("name") + rs.getString("nsi_do") + rs.getString("nsi_gun_gu") + rs.getString("facility")); // jsp 화면에 출력
	} */

}

catch(Exception e) {
System.out.println("ERROR: " + e.getMessage());

}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국 서비스</title>

<style>
div.a {
  text-align: center;
  line-height: 1.6;
  margin: 6px 6px 6px 6px;
}
</style>
</head>

<body>
<center>
<H2>전국 서비스</H2>
<HR>
접속 시간 : <%=new java.util.Date() %>

<br> 
<div class="a">
<button onclick = "location='library_Search.jsp'"> 도서관 </button>
</div>

<div class="a">
<button onclick = "location='sports_center_Search.jsp'"> 체육관 </button>
</div>

<div class="a">
<button onclick = "location='Main.jsp'"> 강좌 </button>
</div>

</center>
</body>
</html>