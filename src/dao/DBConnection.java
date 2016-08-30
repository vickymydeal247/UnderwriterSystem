package dao;


import java.sql.*;
public class DBConnection {

		    static final String serverName = "inchnilpdb03.India.TCS.com";
			static final String portNumber = "1521";
			static final String sid = "JavaDB03";
			static final String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + sid;
			static final String username =  "E926856"; 
			static final String password = "E926856"; 
			static Statement statement = null;
			static Connection Connection =null;
			static PreparedStatement pst=null;
			
		public static Connection getConnection()
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
			
			 Connection =DriverManager.getConnection( url, username, password );
		     return Connection;
		  }
		 catch(ClassNotFoundException e)
		 {
			 e.printStackTrace();
		 }
		 catch(SQLException e)
		 {
			 e.printStackTrace();
		 }

			 return Connection;
		}

		public static void closeConnection(Connection Connection)
		{
			try
			{
				Connection.close();
			}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		}

		public static void closeStatement(PreparedStatement pst)
		{
			try
			{
				pst.close();
			}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		}
		}
		
		

