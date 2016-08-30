<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@page import="bean.*" %>
<%
String s = request.getParameter("val");
//out.println(s);
if(s==null || s.trim().equals("")){
out.print("Please enter id");
}else{  
 try {      
	        DatabaseUtil d = new DatabaseUtil();
			Connection c = d.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = c.prepareStatement("select CUSTOMER_TYPE, CUSTOMER_NAME,  CUSTOMER_OCCUPATION,   CUSTOMER_AGE, CUSTOMER_GENDER, CUSTOMER_ADDRESS, CUSTOMER_CITY, CUSTOMER_STATE, CUSTOMER_ZIPCODE, CUSTOMER_PHNO from TBL_CREATECUSTOMER where CUSTOMER_ID = ? ");
			ps.setString(1,s); 
			rs = ps.executeQuery(); 
			while(rs.next())
			{  		
			  out.print("hi!"+rs.getString(1)+"!"+rs.getString(2)+"!"+rs.getString(3)+"!"+rs.getString(4)+"!"+rs.getString(5)+"!"+rs.getString(6)+"!"+rs.getString(7)+"!"+rs.getString(8)+"!"+rs.getString(9)+"!"+rs.getString(10)); 
			}
			 	
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
}
%>