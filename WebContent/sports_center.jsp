<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ page import="library.DBconnection" %> --%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%> 
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="Sports_center_" class="sports_center.Sports_center" scope="page"/>
<jsp:useBean id="Juso_" class="sports_center.Juso" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {border: 2px double pink; width:666px}
  td,th{border:1px pink solid ; text-align: center; padding:5px}
</style>
</head>

<body>
<%
String sido =request.getParameter("mainCategory");
String sigungu =request.getParameter("subCategory");
Juso_.setSido(sido);
Juso_.setSigungu(sigungu);
%>
<%=Juso_.getSido() %>
<%=Juso_.getSigungu() %>에 위치한 스포츠 센터 정보입니다. 

<%

	/* String nSI_DO = request.getParameter("서울특별시"); */
	
	try{
		String driver = "org.postgresql.Driver";
		Class.forName(driver);
		String url = "jdbc:postgresql://localhost:5432/postgres";
		String id = "postgres";
		String pw = "1234";
		
		
		/* System.out.println("1"); */
		Connection con = DriverManager.getConnection(url, id, pw);
		/* System.out.println("2"); */
		Statement st = con.createStatement();
		/* System.out.println("3"); */
		ResultSet rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO ='"+ sido +"'and nSI_GUN_GU ='"+ sigungu +"' ");
		System.out.println("4");
		while (rs.next()) {
			Sports_center_.setNAME(rs.getString("NAME"));
			Sports_center_.setnSI_DO(rs.getString("nSI_DO"));
			Sports_center_.setnSI_GUN_GU(rs.getString("nSI_GUN_GU"));
			Sports_center_.setFACILITY(rs.getString("FACILITY"));
 			/* out.println(Sports_center_.getNAME()+" "+Sports_center_.getnSI_DO()+" "+Sports_center_.getnSI_GUN_GU()+" "+Sports_center_.getFACILITY()+"<br>"); */
 %>
 	
		<table border=1>
			<tr>
		       <td><%=Sports_center_.getNAME() %></td>
		       <td><%=Sports_center_.getnSI_DO() %></td>
		       <td><%=Sports_center_.getnSI_GUN_GU() %></td>
		       <td><%=Sports_center_.getFACILITY() %></td>
		     </tr>  
		</table>
		
	<%	
		}
		
		
	}catch(SQLException e){
		out.println(e);
	}
    
		
%>


</body>
</html>