<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.underwriter.controller.DBConnection"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>  
<%
String s = request.getParameter("val");
//out.println(s);
if(s==null || s.trim().equals("")){
out.print("Please enter id");
}else{  
 try {      
	        DBConnection d = new DBConnection();
			Connection c = d.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = c.prepareStatement("select * from TBL_PRODUCTS where PRODUCT_ID = ? ");
			ps.setString(1,s); 
			rs = ps.executeQuery(); 
			while(rs.next())
			{    
			  out.print(rs.getString(2)+"!"+rs.getString(3)); 
			}
			 	
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
}
%>