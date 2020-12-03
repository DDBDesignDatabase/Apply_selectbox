<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="library.DBconnection" %> --%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="library_" class="library.Library" scope="page"/>
<jsp:useBean id="Juso_" class="library.Juso" scope="page"/>

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
String sido = request.getParameter("mainCategory");
String sigungu =request.getParameter("subCategory");
Juso_.setSido(sido);
Juso_.setSigungu(sigungu);
%>
<%=Juso_.getSido() %>
<%=Juso_.getSigungu() %>에 위치한 도서관 정보입니다. 

<%
	/* String nSI_DO = request.getParameter("서울특별시"); */
	
	try{
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/postgres";
		String id = "postgres";
		String pw = "1234";
		Connection con = DriverManager.getConnection(url, id, pw);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, HOLIDAY FROM Library where nSI_DO ='"+ sido +"'and nSI_GUN_GU ='"+ sigungu +"' ");
		while (rs.next()) {
			library_.setNAME(rs.getString("NAME"));
			library_.setnSI_DO(rs.getString("nSI_DO"));
			library_.setnSI_GUN_GU(rs.getString("nSI_GUN_GU"));
			library_.setHOLIDAY(rs.getString("HOLIDAY"));
/* 			out.println(library_.getNAME()+" "+library_.getnSI_DO()+" "+library_.getnSI_GUN_GU()+" "+library_.getHOLIDAY()+"<br>");*/
 %>
 	
		<table border=1>
			<tr>
		       <td><%=library_.getNAME() %></td>
		       <td><%=library_.getnSI_DO() %></td>
		       <td><%=library_.getnSI_GUN_GU() %></td>
		       <td><%=library_.getHOLIDAY() %></td>
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