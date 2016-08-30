package dao;
import java.sql.*;
import java.util.ArrayList;

import com.underwriter.controller.DBConnection;

import bean.AddBrokerBean;
import bean.Cl_Coverage;
import bean.Cl_Login;
import bean.Cl_Products;
import bean.Cl_RuleEngine;
import bean.Cl_Types;



public class UserDAO {
	private static PreparedStatement preparedstatement=null;
	private static  PreparedStatement preparedstatement2=null;

	public String createUser(Cl_Login user)
	{
		System.out.println("aa2");
		Connection connection=DBConnection.getConnection();
		String userId=null;
		try {

			preparedstatement=connection.prepareStatement("select sq_userId.nextval from dual");
			System.out.println("aa3");
			ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				userId=rs.getString(1);
			}	
			System.out.println("aa4");
			String user1="user"+userId;
			preparedstatement=connection.prepareStatement("insert into tbl_Login values(?,?,?,?,?)");
			preparedstatement.setString(1,user1);
			preparedstatement.setString(2,user.getUserName());
			preparedstatement.setString(3,"test@123");
			preparedstatement.setString(4,user.getRole());
			preparedstatement.setString(5,user.getStatus());
			System.out.println("aa5");
			preparedstatement.executeUpdate();
			System.out.println("aa6");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userId;
	}

	
	public void deleteUser(Cl_Login cl) 
	{
		
		System.out.println("aa2");
		Connection connection=DBConnection.getConnection();
		String userId=null;
		try {

			preparedstatement=connection.prepareStatement("delete from TBL_LOGIN where user_id=?");
			System.out.println(cl.getUserName());
			preparedstatement.setString(1,cl.getUserName());
			System.out.println("aa3");
			preparedstatement.executeUpdate();
		
			System.out.println("deleted");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	
	
	public ArrayList<String> searchUser()
	{
		Connection connection=DBConnection.getConnection();

		String name,id;

		ArrayList<String> ary=new ArrayList<>();


		try {
			preparedstatement=connection.prepareStatement("select user_id, username from tbl_login where status='active'");
			ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				name=rs.getString(1);
				id=rs.getString(2);
				ary.add(id+"_"+name);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ary;
	}

	public Cl_Login retrieveUser (String id) 
	{

		Connection connection=DBConnection.getConnection();


		Cl_Login obj=new Cl_Login();


		try {
			preparedstatement=connection.prepareStatement("select *  from tbl_login where user_id=? and status='active'");
			preparedstatement.setString(1, id);

			ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				obj.setUserName(rs.getString(2));		
				obj.setRole(rs.getString(3));
				obj.setStatus(rs.getString(4));
			}} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return obj;

	}



	public  void updateUser(String id,Cl_Login user) 
	{

		Connection connection=DBConnection.getConnection();


		


		try {
			preparedstatement =connection.prepareStatement("update tbl_login set username = ? , role =?, status =? where user_id=?");
			preparedstatement.setString(1,user.getUserName());
			preparedstatement.setString(2,user.getRole());
			preparedstatement.setString(3,user.getStatus());
			preparedstatement.setString(4, id);

			int update=preparedstatement.executeUpdate();
			if(update==1)
	        	   System.out.println("Details updated successfully");
	         else
	        System.out.println("Details not updated successfully"); 
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

	}

	public  void deleteUser (String id) 
	{
         int i=0;
		Connection connection=DBConnection.getConnection();

		try {
			preparedstatement=connection.prepareStatement("delete from tbl_login where user_id=");
			preparedstatement.setString(1, id);

			 i=preparedstatement.executeUpdate();
		 if(i==1)
	        	   System.out.println("Details Deleted successfully");
	         else
	        System.out.println("Details not deleted");  
		
		} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	

	}
	//COVERAGE STARTS HERE


public String createCoverage(Cl_Coverage coverage)
	{
		Connection connection=DBConnection.getConnection();
		String coverageId=null;
	    try {
	    	preparedstatement=connection.prepareStatement("select sq_coverageId.nextval from dual");
			ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				coverageId=rs.getString(1);
			}	
			String Coverage1="Coverage"+coverageId;
			preparedstatement=connection.prepareStatement("insert into tbl_Coverage values( ?,?,?)");
			preparedstatement.setString(1,Coverage1);
			 preparedstatement.setString(2,coverage.getCoverageName());
			    preparedstatement.setString(3,coverage.getStatus());
			    preparedstatement.executeUpdate();
			
			while(rs.next())
			{
				coverageId=rs.getString(1);
			}	
	    
	    }
	    catch (SQLException e) 
	    {
			e.printStackTrace();
		}
	   
	return coverageId;
	}

	public  ArrayList<String> searchCoverage()
	{
		Connection connection=DBConnection.getConnection();
	  
	    String name,id;
	    
	    ArrayList<String> ary = new ArrayList<String>();
	    
	    
	   try {
		preparedstatement=connection.prepareStatement("select coveragename,coverage_id from tbl_Coverage where status ='active'");
		 ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				name=rs.getString(1);
				id=rs.getString(2);
			ary.add(id+"_"+name);
			
			}
		   } catch (SQLException e) 
		   {
		     e.printStackTrace();
	       }
	  
	return ary;
	}
	public  Cl_Coverage retrieveCoverage (String id) 
	{
		
		Connection connection=DBConnection.getConnection();
		  
	    
	    Cl_Coverage obj= new Cl_Coverage();
	       
	    
	   try {
		preparedstatement=connection.prepareStatement("select *  from tbl_Coverage where coverage_id=? and status='active'");
		preparedstatement.setString(1, id);
		   
		   ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				obj.setCoverageName(rs.getString(2));		
			    obj.setStatus(rs.getString(4));
			}} catch (SQLException e) {
		e.printStackTrace();
	}
	   
		return obj;
		
	}



	public void updateCoverage(String id,Cl_Coverage coverage) 
	{
		
		Connection connection=DBConnection.getConnection();
		  
	    
	  try {
		preparedstatement =connection.prepareStatement("update tbl_Coverage set coveragename = ? , status =? where coverage_id=?");
		 preparedstatement.setString(1,coverage.getCoverageName());
		 
		   preparedstatement.setString(2,coverage.getStatus());
	  
		   preparedstatement.setString(3,id);
		   
		  int update=preparedstatement.executeUpdate();
		   if(update==1)
	    	   System.out.println("Details updated successfully");
	       else
	    	   System.out.println("Details not updated successfully"); 
	   }
	   catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	public  String deleteCoverage (String id) 
	{
		
		Connection connection=DBConnection.getConnection();
		  String st=null;
		  String ss=null;
		  int flag=0;
	   try {
		   
		    preparedstatement=connection.prepareStatement("select * from tbl_prd_cvrg where coverage_id=?");
			preparedstatement.setString(1, id);
			 ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
		      {flag=1;
				 st="Coverage  cannot be deleted because it is covered under a product. You can either Disable Coverage or Delete Product First which is associated with it. ";
			  	   System.out.println(st);	
		      }
			if(flag==0){
			System.out.println("lelo");
			preparedstatement=connection.prepareStatement("delete from tbl_Coverage where coverage_id=?");
	        preparedstatement.setString(1, id);
		preparedstatement.executeUpdate();
		
			
			//st="Details deleted successfully";
			//ss="";
	  	   System.out.println(st);
	    
	     }
			
			
				
		 	}
	 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return st;
	}
	   
		
		

	
	//PRODUCT CREATION STARTS HERE

	public String createProducts(Cl_Products product,String[] ar)
	{
		Connection connection=DBConnection.getConnection();
		String product1 = null;
		String productId=null;
		try {
			preparedstatement=connection.prepareStatement("select SQ_ProductId.nextval from dual");
			ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				productId=rs.getString(1);
			}	
			product1="Product"+productId;

			//System.out.println("j1j");
			preparedstatement=connection.prepareStatement("insert into tbl_Products values(?,?,?)");
			preparedstatement.setString(1,product1);
			preparedstatement.setString(2,product.getProductName());
			preparedstatement.setString(3,product.getStatus());

			//System.out.println("jj");
			preparedstatement.executeUpdate();
		
			
			
			
			
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int ln=ar.length;
		for(int i=0;i<ln;i++)
		{
			createProductsaddproducts(product1,ar[i]);
			
		}

		return product1;

	}


	public ArrayList<String> searchProduct()
	{
		Connection connection=DBConnection.getConnection();

		String name,id;

		ArrayList<String> ary=new ArrayList<>();


		try {
			preparedstatement=connection.prepareStatement("select product_id, productname from tbl_Products where status='active'");
			ResultSet rs=preparedstatement.executeQuery();
			while(rs.next())
			{
				name=rs.getString(1);
				id=rs.getString(2);
				ary.add(id+"_"+name);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ary;
	}

	public Cl_Products retrieveProducts (String id) 
	{

		Connection connection=DBConnection.getConnection();
		int count=0,i=0;
		String[] arr=null;

		Cl_Products obj=new Cl_Products();


		try {
			preparedstatement=connection.prepareStatement("select *  from tbl_Products where product_id=? and status='active'");
			preparedstatement.setString(1, id);

			ResultSet rs=preparedstatement.executeQuery();
			preparedstatement=connection.prepareStatement("select count(coverage_id) from tbl_Prd_cvrg where product_id=?");
			preparedstatement.setString(1, id);

			/* //rs=preparedstatement.executeQuery();

//while(rs.next())
//{  
	//count=rs.getInt(1);
//} */
			count = preparedstatement.executeUpdate();

			preparedstatement=connection.prepareStatement("select coverage_id from tbl_Prd_cvrg where product_id=?");
			preparedstatement.setString(1, id);

			arr=new String[count];
			rs=preparedstatement.executeQuery();
			while(rs.next())
			{  
				arr[i]=rs.getString(2);

				i++;
			}

			while(rs.next())
			{  
				obj.setProductName(rs.getString(2));		
				obj.setStatus(rs.getString(3));
			}} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		obj.setCoverageId(arr);


		return obj;

	}


	public  void updateProducts(String id,Cl_Products product,String[] s) 
	{

		Connection connection=DBConnection.getConnection();
      try {
			//preparedstatement =connection.prepareStatement("update tbl_Products set productname = ? , status =? where product_id=?");
			//preparedstatement.setString(1,product.getProductName());
          //  preparedstatement.setString(2,product.getStatus());
			//preparedstatement.setString(3, id);
			//int update=preparedstatement.executeUpdate();
            
			preparedstatement=connection.prepareStatement("delete from tbl_prd_cvrg where Product_id=?");
			preparedstatement.setString(1, id);
			preparedstatement.executeUpdate();
			System.out.println("1111");
			
			preparedstatement =connection.prepareStatement("update tbl_Products set productname = ? , status =? where product_id=?");
			preparedstatement.setString(1,product.getProductName());
            preparedstatement.setString(2,product.getStatus());
			preparedstatement.setString(3, id);
			int update=preparedstatement.executeUpdate();
			System.out.println("2222");

			
			int ln=s.length;
			for(int i=0;i<ln;i++)
			{
				createProductsaddproducts(id,s[i]);
				
			}
			 System.out.println("Details updated successfully");
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	

}
	
	
	
	
public String deleteProduct(String id) 
{

	Connection connection=DBConnection.getConnection();
		String sss="";
	try {
		//select * from TBL_PRD_TYPES
		preparedstatement=connection.prepareStatement("select * from TBL_PRD_TYPES where Product_id=?");
		preparedstatement.setString(1, id);
		ResultSet rs=preparedstatement.executeQuery();
		System.out.println("done1");
		
		if(!rs.next())
		{
		preparedstatement=connection.prepareStatement("delete from tbl_prd_cvrg where Product_id=?");
		preparedstatement.setString(1, id);
		int delete=preparedstatement.executeUpdate();
		System.out.println("done1");
		
		
				
		preparedstatement=connection.prepareStatement("delete from tbl_products where product_id=?");
		preparedstatement.setString(1, id);
       int d= preparedstatement.executeUpdate();
		
		
	
		 
		   if(d>0)
		   {
	    	   System.out.println("Details deleted successfully");
	      
		   	}
		   
		}
			else
				sss="Product cannot be deleted because it is covered under an Insurance Type";
				System.out.println(sss);
				
		   
	}
	   catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	return sss;
	
}

public void changepwd (String userid,String password)
{
Connection connection = DBConnection.getConnection();

try {
	preparedstatement=connection.prepareStatement("update  tbl_login set password = ? where user_id=?");

	preparedstatement.setString(1,password);
	
	preparedstatement.setString(2,userid);
	ResultSet rs=preparedstatement.executeQuery();
	System.out.println("21");
    System.out.println(userid);
	


} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

}

//insurance type statrs here

public String createInsuranceType(Cl_Types InsuranceType,String[] ar)
{
	Connection connection=DBConnection.getConnection();
	Cl_Types ct = new Cl_Types();
	String InsuranceTypeId=null;
	String InsuranceType1=null;
	try {

		preparedstatement=connection.prepareStatement("select sq_typeId.nextval from dual");
		ResultSet rs=preparedstatement.executeQuery();
		System.out.println("don2e");
		if(rs.next())
		{
		InsuranceTypeId=rs.getString(1);
		}
		 InsuranceType1="INSType"+InsuranceTypeId;
		preparedstatement=connection.prepareStatement("insert into tbl_types values(?,?,?)");
		System.out.println("done222");
		preparedstatement.setString(1,InsuranceType1);
		preparedstatement.setString(2,InsuranceType.getTypeName());
		preparedstatement.setString(3,InsuranceType.getStatus());
		
		
		preparedstatement.executeUpdate();
		System.out.println("done");
		


	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	int ln=ar.length;
	for(int i=0;i<ln;i++)
	{
		createInsuranceTypesAddProducts(InsuranceType1,ar[i]);
		
	}

	return InsuranceType1;
}





public void createInsuranceTypesAddProducts(String id, String s) 
{
	Connection connection=DBConnection.getConnection();

	//String productId=null;
	try {
		
		//String product1="Product"+productId;

		System.out.println("j1j");
		System.out.println(id+"  "+s);
		preparedstatement=connection.prepareStatement("insert into tbl_prd_types values(?,?)");
		preparedstatement.setString(2,id);
		preparedstatement.setString(1,s);
		System.out.println("j2j");
		
		preparedstatement.executeUpdate();
		System.out.println("j3j");
		
		
		
		
	} catch (SQLException e) 
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
	
}






public ArrayList<String> searchInsuranceType()
{
	Connection connection=DBConnection.getConnection();

	String name,id;

	ArrayList<String> ary=new ArrayList<>();


	try {
		preparedstatement=connection.prepareStatement("select insurancetype_id, insurancetypename from tbl_types where status='active'");
		ResultSet rs=preparedstatement.executeQuery();
		while(rs.next())
		{
			name=rs.getString(1);
			id=rs.getString(2);
			ary.add(id+"_"+name);

		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return ary;
}


public Cl_Types retrieveInsuranceTypes (String id) 
{

	Connection connection=DBConnection.getConnection();
	int count=0,i=0;
	String[] arr=null;

	Cl_Types obj=new Cl_Types();


	try {
		preparedstatement=connection.prepareStatement("select *  from tbl_Types where insurancetype_id=? and status='active'");
		preparedstatement.setString(1, id);

		ResultSet rs=preparedstatement.executeQuery();
		preparedstatement=connection.prepareStatement("select count(product_id) from tbl_Prd_types where insurancetype_id=?");
		preparedstatement.setString(1, id);

		/* //rs=preparedstatement.executeQuery();

//while(rs.next())
//{  
//count=rs.getInt(1);
//} */
		count = preparedstatement.executeUpdate();

		preparedstatement=connection.prepareStatement("select product_id from tbl_Prd_types where insurancetype_id=?");
		preparedstatement.setString(1, id);

		arr=new String[count];
		rs=preparedstatement.executeQuery();
		while(rs.next())
		{  
			arr[i]=rs.getString(2);

			i++;
		}

		while(rs.next())
		{  
			obj.setTypeName(rs.getString(2));		
			obj.setStatus(rs.getString(3));
		}} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	obj.setProductId(arr);


	return obj;

}

public  void updateInsuranceTypes(Cl_Types type,String id) 
{


	Connection connection=DBConnection.getConnection();

	try { 
		
		preparedstatement =connection.prepareStatement("delete from TBL_PRD_TYPES where insurancetype_id = ?");
	    preparedstatement.setString(1, id); 
	    preparedstatement.executeUpdate();
		 
	    
		preparedstatement =connection.prepareStatement("update tbl_types set insurancetypename = ? ,status=? where insurancetype_id=?");
		preparedstatement.setString(1,type.getTypeName());
        preparedstatement.setString(2,type.getStatus());
		preparedstatement.setString(3, id);
		int update=preparedstatement.executeUpdate();
   
		String[] content =type.getProductId(); 
		int length = content.length;
		int i=0;
		while(i<length){
			preparedstatement2=connection.prepareStatement("INSERT INTO TBL_PRD_TYPES values(? , ?)");
			preparedstatement2.setString(1, content[i]);
			preparedstatement2.setString(2, id);  
			preparedstatement2.executeUpdate(); 
			i++;
		}
		 if(update==1 && i==length)
      	   System.out.println("Details updated successfully");
         else
      	   System.out.println("Details not updated successfully"); 
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


}

public  String deleteInsuranceType(String id) 
{

	Connection connection=DBConnection.getConnection();
	String ss= "";
	try {
		
		
		


		

			preparedstatement=connection.prepareStatement("delete from tbl_prd_types where insurancetype_id=?");
			preparedstatement.setString(1, id);
			preparedstatement.executeUpdate();
			
				System.out.println("Details Deleted successfully");
			
				preparedstatement=connection.prepareStatement("delete from tbl_RuleEngine where insurancetype_id=?");
				preparedstatement.setString(1, id);
				int i=preparedstatement.executeUpdate();
				if(i>0)
				{
					System.out.println("Details Deleted successfully");
				}	
					else
						
						{
						ss="InsuranceType cannot be deleted because it is covered under rule engine or proposals";
						System.out.println(ss);
						}
				
			
			
		}
		
	catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	return ss;
		}

public void createProductsaddproducts(String id, String s) 
{
	Connection connection=DBConnection.getConnection();

	//String productId=null;
	try {
		
		//String product1="Product"+productId;

		System.out.println("j1j");
		System.out.println(id+"  "+s);
		preparedstatement=connection.prepareStatement("insert into tbl_prd_cvrg values(?,?)");
		preparedstatement.setString(1,id);
		preparedstatement.setString(2,s);
		System.out.println("j2j");
		
		preparedstatement.executeUpdate();
		System.out.println("j3j");
		
		
		
		
	} catch (SQLException e) 
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	
	
}


public String addBroker(AddBrokerBean broker) {
	int i = 0;String BID=null;
	Connection connection=DBConnection.getConnection();
	//Connection conn = null;
	try {
		String id=null;
		System.out.println("1");
		preparedstatement2=connection.prepareStatement("select broker_typeId.nextval from dual");
		System.out.println("aa3");
		ResultSet rs=preparedstatement2.executeQuery();
		if(rs.next())
		{
			id=rs.getString(1);
		}	
		System.out.println("aa4");
		BID="broker"+id;
		System.out.println("11");
		connection = DBConnection.getConnection();
		// ps.setInt(1, Integer.parseInt(req.getParameter("id".trim())));
		PreparedStatement ps = connection.prepareStatement("Insert into tbl_add_broker values(?,?,?,?,?,?,?,?)");
		System.out.println("112");
		ps.setString(1, broker.getBrokerName());
		ps.setString(2, broker.getAddress());
		ps.setString(3, broker.getCity());
		ps.setString(4, broker.getState());
		ps.setLong(5, broker.getZipcode());
		ps.setLong(6, broker.getPhone());
		ps.setString(7, BID);
		ps.setInt(8, 0);
		System.out.println("113");
		i = ps.executeUpdate();
		System.out.println("114");
		if (i == 1) 
		{
			System.out.println("Broker Inserted Successfully");
		} else {
			System.out.println("Broker Insertion Failed!");
		}

	} catch (SQLException e) {
		e.printStackTrace();
	}
	return BID;
}


public void deleteBroker(String id) {
	Connection connection=DBConnection.getConnection();

	try {
		preparedstatement=connection.prepareStatement("delete from TBL_ADD_BROKER where brokerid=?");
		preparedstatement.setString(1, id);

		int  i=preparedstatement.executeUpdate();
	 if(i==1)
        	   System.out.println("Details Deleted successfully");
         else
        System.out.println("Details not deleted");  
	
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
}


public void deleteRule(String id) {
	// TODO Auto-generated method stub
	Connection connection=DBConnection.getConnection();

	try {
		preparedstatement=connection.prepareStatement("delete from TBL_RULEENGINE where insurancetype_id=?");
		preparedstatement.setString(1, id);

		int  i=preparedstatement.executeUpdate();
	 if(i==1)
        	   System.out.println("Details Deleted successfully");
         else
        System.out.println("Details not deleted");  
	
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}



public String authenticateUser(String userid,String password)
{
	Connection connection = DBConnection.getConnection();
	String role=null;
	String status=null;
	try {
		preparedstatement=connection.prepareStatement("select role,status from tbl_login where user_id=? and password=?");
	
		preparedstatement.setString(1,userid);
		
		preparedstatement.setString(2,password);
		ResultSet rs=preparedstatement.executeQuery();
		

		while(rs.next())
		{
		role = rs.getString(1);
        status=rs.getString(2);
		}
	
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if(role==null)
		{
		
		
		return null;}

	else if(password.equalsIgnoreCase("test@123"))
       return "change password";
	else
	   if(status.equalsIgnoreCase("inactive"))
	return "access denied";
	   else 
		   return role;

	}

	




public void insertIntoTblRuleEngine(Cl_RuleEngine ruleobject)
{
	Connection con=null;
	//boolean insertIntoTblRuleEngine=false;
	con=DBConnection.getConnection();
	
	
	try{
		PreparedStatement pst = con.prepareStatement("insert into TBL_RULEENGINE values (?,?,?,?,?,?,?,?,?,?,?)");
	//	System.out.println("77");
		pst.setString(1, ruleobject.getInsuranceTypeId());
		System.out.println("55");
		pst.setString(2, ruleobject.getInsuranceTypeName());
		System.out.println( ruleobject.getInsuranceTypeName());
		pst.setFloat(3, ruleobject.getG80());
		System.out.println(ruleobject.getG80());
		
		pst.setFloat(4, ruleobject.getG60l80());
		
		pst.setFloat(5, ruleobject.getG40l60());
		
		pst.setFloat(6, ruleobject.getL40());
		
		pst.setFloat(7, ruleobject.getGovTax());
		
		pst.setFloat(8, ruleobject.getGenderMale());
		
		pst.setFloat(9, ruleobject.getGenderFemale());
		
		pst.setFloat(10, ruleobject.getOccupationMiningNuclear());
		
		pst.setFloat(11, ruleobject.getOccupationOthers());
		
		int i = pst.executeUpdate();
		
		System.out.println(i);
		//insertIntoTblRuleEngine=true;
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	finally{
		if(con!=null){
			try{
				con.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				DBConnection.closeConnection(con);
			
	}
}
}

}


public void updateRuleEngine(Cl_RuleEngine ruleobject) {
	Connection con=null;
	//boolean insertIntoTblRuleEngine=false;
	con=DBConnection.getConnection();
	
	
	try{
		//update tbl_types set insurancetypename = ? ,status=?where insurancetype_id=?
		PreparedStatement pst = con.prepareStatement("update TBL_RULEENGINE set insurance_type_name=?,ag80=?,ag60l80=?,ag40l60=?,al40=?,gov_tax=?,gen_m=?,gen_f=?,occ_mining=?,occ_others=? where insurancetype_id=?");
	//	System.out.println("77");
		pst.setString(11, ruleobject.getInsuranceTypeId());
		System.out.println("55");
		pst.setString(1, ruleobject.getInsuranceTypeName());
		System.out.println( ruleobject.getInsuranceTypeName());
		pst.setFloat(2, ruleobject.getG80());
		System.out.println(ruleobject.getG80());
		
		pst.setFloat(3, ruleobject.getG60l80());
		
		pst.setFloat(4, ruleobject.getG40l60());
		
		pst.setFloat(5, ruleobject.getL40());
		
		pst.setFloat(6, ruleobject.getGovTax());
		
		pst.setFloat(7, ruleobject.getGenderMale());
		
		pst.setFloat(8, ruleobject.getGenderFemale());
		
		pst.setFloat(9, ruleobject.getOccupationMiningNuclear());
		
		pst.setFloat(10, ruleobject.getOccupationOthers());
		
		int i = pst.executeUpdate();
		
		System.out.println(i);
		System.out.println("done");
		//insertIntoTblRuleEngine=true;
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}




	}








