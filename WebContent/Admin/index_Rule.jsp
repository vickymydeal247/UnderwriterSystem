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
            String[] parts = s.split("!");
			String str = parts[0]; 
	        DBConnection d = new DBConnection();
			Connection c = d.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			ps = c.prepareStatement("select  AG80, AG60L80, AG40L60, AL40, GOV_TAX, GEN_M, GEN_F, OCC_MINING, OCC_OTHERS  from TBL_RULEENGINE  where INSURANCETYPE_ID = ? ");
			ps.setString(1,str); 
			rs = ps.executeQuery();  
			while(rs.next())
			{  
			  out.print("hi"+"!"+rs.getInt(1)+"!"+rs.getInt(2)+"!"+rs.getInt(3)+"!"+rs.getInt(4)+"!"+rs.getInt(5)+"!"+rs.getInt(6)+"!"+rs.getInt(7)+"!"+rs.getInt(8)+"!"+rs.getInt(9)); 
			}
			 	
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
}
%>