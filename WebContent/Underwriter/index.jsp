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
			ps = c.prepareStatement("select CUSTOMER_ID , INSURANCETYPE_ID ,SUM_INSURED ,NUMBER_OF_YEARS , INSURANCE_PRODUCT ,REFERRED_BY  from TBL_CREATEPROPOSAL  where PROPOSAL_ID = ? ");
			ps.setString(1,s); 
			rs = ps.executeQuery();  
			while(rs.next())
			{    
			  out.print(rs.getString(1)+"!"+rs.getString(2)+"!"+rs.getString(3)+"!"+rs.getString(4)+"!"+rs.getString(5)+"!"+rs.getString(6)); 
			}
			 	
 }
 catch(Exception e)
 {
	 e.printStackTrace();
 }
}
%>