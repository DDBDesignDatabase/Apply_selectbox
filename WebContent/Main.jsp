
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ page import="java.sql.*" %>



<% 
Connection con = null;
Statement stmt = null;
ResultSet rs = null;


try {
	String driver = "org.postgresql.Driver";
	Class.forName(driver);
	String url = "jdbc:postgresql://localhost:5432/Library";
	String user = "hyewon";
	String password = "zxcasd123";
	
	
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

<link href="CSS/styles.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>

</head>

	<body>
		<div class="header">
		  <div class="header-left-panel">
		    <div class="logo-wrap">
		      <div class="logo">
		        <h2>전국지역정보알리미</h2>
		        <h1>전지적 지역 시점 <h1> 
		      </div>
		    </div>
		  </div>
		  <div class="header-right-panel">
		    
		    
		  </div>
		</div>
		<!--- header div end -->
		<div class="panel-wrap">
		  <div class="panel-wrapper">
		    <div class="panel marRight30">
		      <div class="img"><img src="images/그림2.png"/></div>
		      <div class="title">
		        <h1>전국 도서관 정보</h1>
		      </div>
		      <div class="border"></div>
		      <div class="content">
		        <p>지역의 도서관 위치와 휴관일 정보를 안내합니다.</p>
		        <div class="button-link"><a href="library_Search.jsp">search</a></div>
		      </div>
		    </div>
		    <div class="panel marRight30">
		      <div class="img"><img src="images/그림3.png"/></div>
		      <div class="title">
		        <h1 class="border-bottom">전국 체육 시설 정보</h1>
		      </div>
		      <div class="border"></div>
		      <div class="content">
		        <p>경기장 및 체육관 정보를 제공합니다.  <br />
		        </p>
		        <div class="button-link"><a href="sports_center_Search.jsp">search</a></div>
		      </div>
		    </div>
		    <div class="panel">
		      <div class="img"><img src="images/그림1.png"/></div>
		      <div class="title">
		        <h1 class="border-bottom">전국 평생 학습 강좌</h1>
		      </div>
		      <div class="border"></div>
		      <div class="content">
		        <p>누구나 이용할 수 있는 평생학습강좌의 교육 내용, 강사진에 대한 정보를 제공합니다. </p>
		        <div class="button-link"><a href="Learning_program_Search.jsp">search</a></div>
		      </div>
		    </div>
		  </div>
		</div>
	</body>
</html>