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
<jsp:useBean id="Learning_Program_" class="lecture.Learning_Program" scope="page"/>
<jsp:useBean id="Juso_" class="lecture.Juso" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 <link href="CSS/styles.css" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>

* {
  padding: 0;
  margin: 0;
}


body {
  background: #eeebe7;
  padding: 100px 20px;
  text-align: center;
  position: absolute;

  
}

h3{font-family: 'Ropa Sans', sans-serif; font-size:26px;text-transform:uppercase; font-weight:normal; color:#84817a; }





  table {
    width:1000px;
    
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding-right:50px;
   	padding-top:10px;
   	text-align:left; 
   	border:1px white;
  }
  td{width:250px}

</style>
</head>

<body>
<%

String sido = request.getParameter("mainCategory");
String sigungu =request.getParameter("subCategory");
Juso_.setSido(sido);
Juso_.setSigungu(sigungu);

%>
<h3>
<%=Juso_.getSido() %>
<%=Juso_.getSigungu() %>의 강좌 정보입니다. 

</h3>
<table border=0>
 			<tr>
				<td>강좌명</td>
				<td>시도</td>
				<td>시군구</td>
				<td>도로명주소</td>
				<td>강사</td>
				<td>연락처</td>
				<td>수업방식</td>
			</tr>
		</table>
<%
	/* String nSI_DO = request.getParameter("서울특별시"); */
	
	try{
		Class.forName("org.postgresql.Driver");
		String url = "jdbc:postgresql://localhost:5432/Library";
		String id = "hyewon";
		String pw = "zxcasd123";
		Connection con = DriverManager.getConnection(url, id, pw);
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, ADDRESS, T_NAME, HP, ON_OFF FROM Learning_Program where nSI_DO ='"+ sido +"'and nSI_GUN_GU ='"+ sigungu +"' ");
		while (rs.next()) {
			Learning_Program_.setNAME(rs.getString("NAME"));
			Learning_Program_.setnSI_DO(rs.getString("nSI_DO"));
			Learning_Program_.setnSI_GUN_GU(rs.getString("nSI_GUN_GU"));
			Learning_Program_.setADDRESS(rs.getString("ADDRESS"));
			Learning_Program_.setT_NAME(rs.getString("T_NAME"));
			Learning_Program_.setHP(rs.getString("HP"));
			Learning_Program_.setON_OFF(rs.getString("ON_OFF"));
/* 			out.println(library_.getNAME()+" "+library_.getnSI_DO()+" "+library_.getnSI_GUN_GU()+" "+library_.getADDRESS()+" "+library_.getT_NAME()+" "+library_.getHP()+" "+library_.getON_OFF()+"<br>");*/
%>
 	
		<table border=1>
			<tr>
		       <td><%=Learning_Program_.getNAME() %></td>
		       <td><%=Learning_Program_.getnSI_DO() %></td>
		       <td><%=Learning_Program_.getnSI_GUN_GU() %></td>
		       <td><%=Learning_Program_.getADDRESS() %></td>
				<td><%=Learning_Program_.getT_NAME() %></td>
				<td><%=Learning_Program_.getHP() %></td>
				<td><%=Learning_Program_.getON_OFF() %></td>
				
				
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