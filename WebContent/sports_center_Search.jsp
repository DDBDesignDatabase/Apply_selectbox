<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.util.ArrayList"%>
<jsp:useBean id="Sports_center_" class="sports_center.Sports_center" scope="page"/>
<jsp:useBean id="Juso_" class="sports_center.Juso" scope="page"/>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <Title>검색</Title> 
        <Meta Http-Equiv="Content-Type" Content="text/html; charset=utf-8">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    </head>
 	<form name="form1"  method="post" action="sports_center.jsp"> 
    시도: <select name="mainCategory" style="width:200px">
        <option value="">전체</option>
    </select>
    시군구: <select name="subCategory" style="width:200px">
        <option value="">전체</option>
    </select>
    <input type="submit" class="btn btn-primary form-control" value="검색">
    </form>
 
<script type="text/javascript">
 
$(document).ready(function() {
    
    //Main 카테고리를 선택 할때 마다 AJAX를 호출할 수 있지만 DB접속을 매번 해야 하기 때문에 main, sub카테고리 전체을 들고온다.
    
    //****************이부분은 DB로 셋팅하세요.
	<%
	ArrayList<String> sidoList = new ArrayList<String>(); 
	ArrayList<String> sigunguList = new ArrayList<String>();
	/* //중복제거 */
	ArrayList<String> sidoList2 = new ArrayList<String>(); 
	ArrayList<String> sigunguList2 = new ArrayList<String>();
		
		try{
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost:5432/postgres";
			String id = "postgres";
			String pw = "1234";
			
			Connection con = DriverManager.getConnection(url, id, pw);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList2.contains(item))
	            	sidoList2.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList2.contains(item2))
	            	sigunguList2.add(item2);
	        }
			/* out.println(sidoList2);
			out.println(sigunguList2); */
			
		}catch(SQLException e){
			out.println(e);
		}
	%>
    //Main 카테고리 셋팅 (DB에서 값을 가져와 셋팅 하세요.)
    var mainCategoryArray = new Array();
    var mainCategoryObject = new Object();
    
    
    <%
    String si_do = null;
    for(int i = 0; i < sidoList2.size(); i++){%>
    
    	mainCategoryObject = new Object();
    	mainCategoryObject.main_category_id = "<%=i%>";
    	mainCategoryObject.main_category_name = "<%=sidoList2.get(i)%>";
    	mainCategoryArray.push(mainCategoryObject);
    	
    <%}%>
    
    
    var subCategoryArray = new Array();
    var subCategoryObject = new Object();
    
    //스포츠에 해당하는 sub category 리스트
    
    <%
    String si_gu = null;
    String si_gun_gu = null;
	sidoList = new ArrayList<String>(); 
	sigunguList = new ArrayList<String>();
	/* //중복제거 */
	sidoList2 = new ArrayList<String>(); 
	sigunguList2 = new ArrayList<String>();
	ArrayList<String> sidoList3 = new ArrayList<String>(); ArrayList<String> sigunguList3 = new ArrayList<String>();
	ArrayList<String> sidoList4 = new ArrayList<String>(); ArrayList<String> sigunguList4 = new ArrayList<String>();
	ArrayList<String> sidoList5 = new ArrayList<String>(); ArrayList<String> sigunguList5 = new ArrayList<String>();
	ArrayList<String> sidoList6 = new ArrayList<String>(); ArrayList<String> sigunguList6 = new ArrayList<String>();
	ArrayList<String> sidoList7 = new ArrayList<String>(); ArrayList<String> sigunguList7 = new ArrayList<String>();
	ArrayList<String> sidoList8 = new ArrayList<String>(); ArrayList<String> sigunguList8 = new ArrayList<String>();
	ArrayList<String> sidoList9 = new ArrayList<String>(); ArrayList<String> sigunguList9 = new ArrayList<String>();
	ArrayList<String> sidoList10 = new ArrayList<String>(); ArrayList<String> sigunguList10 = new ArrayList<String>();
	ArrayList<String> sidoList11 = new ArrayList<String>(); ArrayList<String> sigunguList11 = new ArrayList<String>();
	ArrayList<String> sidoList12 = new ArrayList<String>(); ArrayList<String> sigunguList12 = new ArrayList<String>();
	ArrayList<String> sidoList13 = new ArrayList<String>(); ArrayList<String> sigunguList13 = new ArrayList<String>();
	ArrayList<String> sidoList14 = new ArrayList<String>(); ArrayList<String> sigunguList14 = new ArrayList<String>();
	ArrayList<String> sidoList15 = new ArrayList<String>(); ArrayList<String> sigunguList15 = new ArrayList<String>();
	ArrayList<String> sidoList16 = new ArrayList<String>(); ArrayList<String> sigunguList16 = new ArrayList<String>();
	ArrayList<String> sidoList17 = new ArrayList<String>(); ArrayList<String> sigunguList17 = new ArrayList<String>();
	ArrayList<String> sidoList18 = new ArrayList<String>(); ArrayList<String> sigunguList18 = new ArrayList<String>();
		
		try{
			Class.forName("org.postgresql.Driver");
			String url = "jdbc:postgresql://localhost:5432/postgres";
			String id = "postgres";
			String pw = "1234";
			Connection con = DriverManager.getConnection(url, id, pw);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='서울특별시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList2.contains(item))
	            	sidoList2.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList2.contains(item2))
	            	sigunguList2.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        //부산광역시
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='부산광역시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList3.contains(item))
	            	sidoList3.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList3.contains(item2))
	            	sigunguList3.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='대전광역시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList4.contains(item))
	            	sidoList4.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList4.contains(item2))
	            	sigunguList4.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='충청북도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
	        for(String item : sidoList){
	            if(!sidoList5.contains(item))
	            	sidoList5.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList5.contains(item2))
	            	sigunguList5.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='울산광역시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList6.contains(item))
	            	sidoList6.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList6.contains(item2))
	            	sigunguList6.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='경기도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList7.contains(item))
	            	sidoList7.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList7.contains(item2))
	            	sigunguList7.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='광주광역시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList8.contains(item))
	            	sidoList8.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList8.contains(item2))
	            	sigunguList8.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='전라남도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList9.contains(item))
	            	sidoList9.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList9.contains(item2))
	            	sigunguList9.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='인천광역시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList10.contains(item))
	            	sidoList10.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList10.contains(item2))
	            	sigunguList10.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='강원도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList11.contains(item))
	            	sidoList11.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList11.contains(item2))
	            	sigunguList11.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='경상남도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList12.contains(item))
	            	sidoList12.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList12.contains(item2))
	            	sigunguList12.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='전라북도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList13.contains(item))
	            	sidoList13.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList13.contains(item2))
	            	sigunguList13.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='충청남도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList14.contains(item))
	            	sidoList14.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList14.contains(item2))
	            	sigunguList14.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='경상북도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList15.contains(item))
	            	sidoList15.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList15.contains(item2))
	            	sigunguList15.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='대구광역시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList16.contains(item))
	            	sidoList16.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList16.contains(item2))
	            	sigunguList16.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='제주특별자치도'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList17.contains(item))
	            	sidoList17.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList17.contains(item2))
	            	sigunguList17.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        rs = st.executeQuery("SELECT NAME, nSI_DO, nSI_GUN_GU, FACILITY FROM SPORTS_CENTER where nSI_DO='세종특별자치시'");
			while (rs.next()) {
				sidoList.add(rs.getString("nSI_DO"));
				sigunguList.add(rs.getString("nSI_GUN_GU"));
			}
			/* 중복제거해서 시구, 시군구받아서 리스트에 넣기 */
	        for(String item : sidoList){
	            if(!sidoList18.contains(item))
	            	sidoList18.add(item);
	        }
	        for(String item2 : sigunguList){
	            if(!sigunguList18.contains(item2))
	            	sigunguList18.add(item2);
	        }
	        sidoList.clear();
	        sigunguList.clear();
	        
		}catch(SQLException e){
			out.println(e);
		}
	    for(int i = 0; i < sidoList2.size(); i++){
		    for(int j = 0; j < sigunguList2.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "0";
		    	subCategoryObject.main_category_name = "<%=sidoList2.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList2.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
	    
	    for(int i = 0; i < sidoList3.size(); i++){
		    for(int j = 0; j < sigunguList3.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "1";
		    	subCategoryObject.main_category_name = "<%=sidoList3.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList3.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	
   	 	for(int i = 0; i < sidoList4.size(); i++){
		    for(int j = 0; j < sigunguList4.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "2";
		    	subCategoryObject.main_category_name = "<%=sidoList4.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList4.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	
   	 	for(int i = 0; i < sidoList5.size(); i++){
		    for(int j = 0; j < sigunguList5.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "3";
		    	subCategoryObject.main_category_name = "<%=sidoList5.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList5.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList6.size(); i++){
		    for(int j = 0; j < sigunguList6.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "4";
		    	subCategoryObject.main_category_name = "<%=sidoList6.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList6.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList7.size(); i++){
		    for(int j = 0; j < sigunguList7.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "5";
		    	subCategoryObject.main_category_name = "<%=sidoList7.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList7.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList8.size(); i++){
		    for(int j = 0; j < sigunguList8.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "6";
		    	subCategoryObject.main_category_name = "<%=sidoList8.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList8.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList9.size(); i++){
		    for(int j = 0; j < sigunguList9.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "7";
		    	subCategoryObject.main_category_name = "<%=sidoList9.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList9.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList10.size(); i++){
		    for(int j = 0; j < sigunguList10.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "8";
		    	subCategoryObject.main_category_name = "<%=sidoList10.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList10.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList11.size(); i++){
		    for(int j = 0; j < sigunguList11.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "9";
		    	subCategoryObject.main_category_name = "<%=sidoList11.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList11.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList12.size(); i++){
		    for(int j = 0; j < sigunguList12.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "10";
		    	subCategoryObject.main_category_name = "<%=sidoList12.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList12.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList13.size(); i++){
		    for(int j = 0; j < sigunguList13.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "11";
		    	subCategoryObject.main_category_name = "<%=sidoList13.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList13.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList14.size(); i++){
		    for(int j = 0; j < sigunguList14.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "12";
		    	subCategoryObject.main_category_name = "<%=sidoList14.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList14.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList15.size(); i++){
		    for(int j = 0; j < sigunguList15.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "13";
		    	subCategoryObject.main_category_name = "<%=sidoList15.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList15.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList16.size(); i++){
		    for(int j = 0; j < sigunguList16.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "14";
		    	subCategoryObject.main_category_name = "<%=sidoList16.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList16.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList17.size(); i++){
		    for(int j = 0; j < sigunguList17.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "15";
		    	subCategoryObject.main_category_name = "<%=sidoList17.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList17.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}
   	 	for(int i = 0; i < sidoList18.size(); i++){
		    for(int j = 0; j < sigunguList18.size(); j++){%>
		    	subCategoryObject = new Object(); 
		    	subCategoryObject.main_category_id = "16";
		    	subCategoryObject.main_category_name = "<%=sidoList18.get(i)%>";
		    	subCategoryObject.sub_category_id = "<%=j%>";
		    	subCategoryObject.sub_category_name = "<%=sigunguList18.get(j)%>";
		    	subCategoryArray.push(subCategoryObject);
   	 	<%}}%>
      
    
    //메인 카테고리 셋팅
    var mainCategorySelectBox = $("select[name='mainCategory']");
    
    for(var i=0;i<mainCategoryArray.length;i++){
        mainCategorySelectBox.append("<option value='"+mainCategoryArray[i].main_category_name+"'>"+mainCategoryArray[i].main_category_name+"</option>");
        
    }
    
    //*********** 1depth카테고리 선택 후 2depth 생성 START ***********
    $(document).on("change","select[name='mainCategory']",function(){
        
        //두번째 셀렉트 박스를 삭제 시킨다.
        var subCategorySelectBox = $("select[name='subCategory']");
        subCategorySelectBox.children().remove(); //기존 리스트 삭제
        
        //선택한 첫번째 박스의 값을 가져와 일치하는 값을 두번째 셀렉트 박스에 넣는다.
        $("option:selected", this).each(function(){
            var selectValue = $(this).val(); //main category 에서 선택한 값
            subCategorySelectBox.append("<option value=''>전체</option>");
           
        		
            
            for(var i=0;i<subCategoryArray.length;i++){
                if(selectValue == subCategoryArray[i].main_category_name){
                    
                    subCategorySelectBox.append("<option value='"+subCategoryArray[i].sub_category_name+"'>"+subCategoryArray[i].sub_category_name+"</option>");
                }
            }
           
        });
        
    });
    //*********** 1depth카테고리 선택 후 2depth 생성 END ***********
        
});
</script>