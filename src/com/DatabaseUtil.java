package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseUtil 
{

	static final String URL         =  "jdbc:oracle:thin:@inchnilpdb03.India.TCS.com:1521:JavaDB03" ;
	static final String USERNAME    =  "E926856"; 
	static final String PASSWORD    =  "E926856";
	static final String DRIVER_NAME =  "oracle.jdbc.driver.OracleDriver";
	Connection connection;

	public Connection getConnection() 
	{
		 
		try {
			closeConnection(); 
			Class.forName(DRIVER_NAME);
			
			
			connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			return connection;
		
	}


	public void closeConnection()
	{
		
		try
		{
		if(connection != null && connection.isClosed() == false)
		{
		   connection.close();
		}
		
		connection = null;
		}
		catch(SQLException e)
		{
		e.printStackTrace();
		}
		
	}
	
	public void closeStatement(PreparedStatement ps)
	{
		
		
		
	}
	
}
