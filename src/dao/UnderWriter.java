package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.ws.api.ha.StickyFeature;
import com.underwriter.controller.DBConnection;

import bean.*;


public class UnderWriter {
			//Adding Customer
	Cl_CreateCustomer cl= new Cl_CreateCustomer();
	public String insertIntoTableCreateCustomer(Cl_CreateCustomer customerObject) 
	{Connection con=null;
		
		con=DBConnection.getConnection(); 
		String CUSTOMER=null;
		try{
			
			 PreparedStatement ps=  con.prepareStatement("select sq_customerId.nextval from dual"); 
			 ResultSet rs=ps.executeQuery(); 
			int customerId=0;
			while(rs.next())
			{
				customerId = rs.getInt(1);
			}	
			
	    	CUSTOMER ="customer"+ customerId; 
	    	PreparedStatement pst = con.prepareStatement("insert into TBL_CREATECUSTOMER values (?,?,?,?,?,?,?,?,?,?,?)");
	    	pst.setString(1, customerObject.getCustomerType());
			pst.setString(2, customerObject.getCustomerName());
			pst.setString(3, customerObject.getOccupation());
			pst.setInt(4, customerObject.getAge());
			pst.setString(5, customerObject.getGender());
			pst.setString(6, customerObject.getAddress());
			pst.setString(7, customerObject.getCity());
			pst.setString(8, customerObject.getState());
			pst.setString(9, customerObject.getZipCode());
			pst.setString(10, customerObject.getPhoneNumber());
			pst.setString(11, CUSTOMER);
			int i = pst.executeUpdate(); 
			System.out.println("Insert Successfully !");
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
		return CUSTOMER ;
	}
	
	
			// Update customer
	
	public static ArrayList<String> searchCustomer() {
		ArrayList<String> aryCust=new ArrayList<>();
		String id;
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement pStatement=con.prepareStatement("select customer_id from TBL_CREATECUSTOMER");
			ResultSet rs=pStatement.executeQuery();
			while(rs.next()){
				id=rs.getString(1);
				aryCust.add(id);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return aryCust;
	}
	
	
	
	// quote not generated
			public void quoteGenerated(String[] proposalId) 
			{
				
				Connection con=null; 
				con=DBConnection.getConnection();  
				try{
					
					PreparedStatement ps;   
					int length = proposalId.length;
					int i=0;
					while(i<length){ 
						ps = con.prepareStatement("UPDATE TBL_PROPOSALS SET STATUS ='Quote Generated Waiting For Approval By Customer' WHERE PROPOSALID = ?");
						ps.setString(1, proposalId[i]); 
						ps.executeUpdate();
						i++;
					}
					System.out.println("UPDATE Successfully");
					  
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
			
			// approve by customer
			
			public void aproveByCustomer(String proposalId,String dec ) 
			{
				
				Connection con=null; 
				con=DBConnection.getConnection();  
				try{
					
					PreparedStatement ps;   
					 
						  ps = con.prepareStatement("UPDATE TBL_PROPOSALS SET STATUS =? WHERE PROPOSALID = ?");
						  if(dec.equalsIgnoreCase("accept"))
						  ps.setString(1, "Quote Generated Approved By Customer");
						  else
							 ps.setString(1, "Quote Generated Rejected By Customer"); 
						  
						  ps.setString(2, proposalId); 
						  ps.executeUpdate();
					 System.out.println(proposalId);
					System.out.println("UPDATE Successfully");
					  
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
	
	
	
	public static Cl_CreateCustomer retriveCustomer(String s) {
		Cl_CreateCustomer obj=new Cl_CreateCustomer();
		ArrayList<String> list=new ArrayList<>();
		
		Connection con=DBConnection.getConnection();
		try {
			PreparedStatement pStatement=con.prepareStatement("select * from TBL_CREATECUSTOMER where customer_id=?");
			pStatement.setString(1,s);
			ResultSet rs=pStatement.executeQuery();
			while(rs.next()){
				
				obj.setCustomerType(rs.getString(1));
				obj.setCustomerName(rs.getString(2));
				obj.setOccupation(rs.getString(3));
				obj.setAge(rs.getInt(4));
				obj.setGender(rs.getString(5));
				obj.setAddress(rs.getString(6));
				obj.setCity(rs.getString(7));
				obj.setState(rs.getString(8));
				obj.setZipCode(rs.getString(9));
				obj.setPhoneNumber(rs.getString(10));
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return	obj;
	}
	
	
	public static int updateCustomer(String Id, Cl_CreateCustomer obj){
		Connection con=DBConnection.getConnection();
		PreparedStatement updatecustomer=null;
		String customerId=null;
		int i =0;
		try{
			 updatecustomer=con.prepareStatement("UPDATE TBL_CREATECUSTOMER set customer_type = ? ,customer_name = ? ,customer_occupation = ?, customer_age = ?, customer_gender = ?, customer_address = ?, customer_city = ?, customer_state = ?, customer_zipcode = ?, customer_phno = ? where customer_id=?");
			//createproposal.setString(1, obj.getCustomerId());
			 /*ps.setString(1, obj.getInsuranceTypeName());*/
			 updatecustomer.setString(1, obj.getCustomerType());
			 updatecustomer.setString(2, obj.getCustomerName());
			 updatecustomer.setString(3, obj.getOccupation());
			 updatecustomer.setInt(4, obj.getAge());
			 updatecustomer.setString(5, obj.getGender());
			 updatecustomer.setString(6, obj.getAddress());
			 updatecustomer.setString(7, obj.getCity());
			 updatecustomer.setString(8, obj.getState());
			 updatecustomer.setString(9, obj.getZipCode());
			 updatecustomer.setString(10, obj.getPhoneNumber());
			 updatecustomer.setString(11, Id);
			 i=updatecustomer.executeUpdate();
			
			 if(i==1)
			 {
				 System.out.println("update successfull");
			 }
			 else
				 System.out.println("update failed");
			
		
		}catch (Exception e){
			e.printStackTrace();
		}return i;

	}
	
	
	
	
	

			//Create Rule Engine
	
	
				//Update rule engine
	public ArrayList<String> getInsuranceType()
	{String insuranceTypeId,insName;
	Connection con=null;
		ArrayList<String> arraylist=new ArrayList<String>();
	 try{
			
		 con=DBConnection.getConnection();
			PreparedStatement pst = con.prepareStatement("select insuranceType_Id ,insurance_Type_Name from TBL_RULEENGINE ");
			
			ResultSet rs = pst.executeQuery(); 
			while(rs.next())
			{
				insuranceTypeId=rs.getString(1);
				insName=rs.getString(2);
				arraylist.add(insuranceTypeId+"_"+insName);
			}
			
			}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			DBConnection.closeConnection(con);
			
		}
		
		return arraylist;
	}


	public static Cl_RuleEngine displayData(String id) {
		
	java.sql.Connection con=	DBConnection.getConnection();
	Cl_RuleEngine obj = new Cl_RuleEngine();
	 try{
			
		 con=DBConnection.getConnection();
	
	PreparedStatement ps=con.prepareStatement("select * from TBL_RULEENGINE where insuranceType_id=? ");
	ps.setString(1, id);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
	obj.setInsuranceTypeId(rs.getString(1));
	obj.setInsuranceTypeName(rs.getString(2));
	obj.setG40l60(rs.getFloat(5));
	obj.setG60l80(rs.getFloat(4));
	obj.setG80(rs.getFloat(3));
	obj.setL40(rs.getFloat(6));
	obj.setGovTax(rs.getFloat(7));
	obj.setGenderMale(rs.getFloat(8));
	obj.setGenderFemale(rs.getFloat(9));
	obj.setOccupationMiningNuclear(rs.getFloat(10));
	obj.setOccupationOthers(rs.getFloat(11));



	}
	}
	catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}

	return obj;


	}


	public static int updateRuleBook(Cl_RuleEngine obj) {
	java.sql.Connection con=	DBConnection.getConnection();
	int i=0;
	String id=obj.getInsuranceTypeId();
	obj.getInsuranceTypeId();
	PreparedStatement ps;
	try {
	ps = con.prepareStatement("update TBL_RULEENGINE set insurance_Type_Name=?, ag80=?, ag60l80=?,ag40l60=?, al40=?, gov_tax=?, gen_m=?, gen_f=?, occ_mining=?,occ_others=? where insuranceTypeid=? ");
	ps.setString(1, obj.getInsuranceTypeName());
	ps.setFloat(2, obj.getG80());
	ps.setFloat(3, obj.getG60l80());
	ps.setFloat(4, obj.getG40l60());
	ps.setFloat(5, obj.getL40());
	ps.setFloat(6, obj.getGovTax());
	ps.setFloat(7, obj.getGenderMale());
	ps.setFloat(8, obj.getGenderFemale());
	ps.setFloat(9, obj.getOccupationMiningNuclear());
	ps.setFloat(10, obj.getOccupationOthers());	
	ps.setString(11, id);
	i=ps.executeUpdate();
	
	if(i==1)
	{
		System.out.println("Update successfull");
	}
	else
		System.out.println("update fail");
	
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	return i;

	}
	
	
	
				//Delete rule book
	public static int deleteRuleBook(String s) {
	java.sql.Connection con=	DBConnection.getConnection();
	int i=0;
	PreparedStatement ps;
	try {
	ps = con.prepareStatement("delete * from TBL_RULEENGINE where INSURANCETYPE_Id=? ");
	ps.setString(1, s);
	i=ps.executeUpdate();
	} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}

	return i;

	}

















				//Add Claims
public static boolean  addClaims(Cl_AddClaim obj) {
Connection con=DBConnection.getConnection();
System.out.println("here3");
int i=0;
PreparedStatement addclaims=null;
//PreparedStatement seq=null;
ResultSet rs=null;
try {
	
	 addclaims=con.prepareStatement("insert into TBL_ADDCLAIM  values(?,?,?,?,?)");
	//i= addclaims.executeUpdate();
	 System.out.println("here2");
	 System.out.println(obj.getClaimId()+" "+obj.getCustomerId()+obj.getPolicyId()+obj.getClaimAmount()+obj.getPaymentDate());
	addclaims.setString(1, obj.getClaimId());
	addclaims.setString(2, obj.getCustomerId());
	addclaims.setString(3, obj.getPolicyId());
	addclaims.setDouble(4, obj.getClaimAmount());
	addclaims.setDate(5, obj.getPaymentDate());
	System.out.println("hhhhh");
	i=addclaims.executeUpdate();
	System.out.println("here1");
	if(i==1)
	{
		return true;
	}
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return false;
}

//Add Proposal
public String createProposals(Cl_CreateProposal obj ){
	int i=0;
	System.out.println("14254");
	Connection con=DBConnection.getConnection();
	PreparedStatement createproposal=null;
	PreparedStatement seq=null;
	PreparedStatement sql=null;
	ResultSet rs=null;
	String proposalId=null;
	try{
		
		seq=con.prepareStatement("select proposal_sequence.nextVal as ID from dual");
		rs=seq.executeQuery();
		while(rs.next())
		{
			proposalId=rs.getString(1);
			System.out.println("jjj");
		}
		createproposal=con.prepareStatement("INSERT INTO TBL_CREATEPROPOSAL values(?,?,?,?,?,?,?)");
		createproposal.setString(7, proposalId);
		createproposal.setString(1, obj.getCustomerId());
		createproposal.setString(2, obj.getInsuranceTypeId());
		createproposal.setDouble(3, obj.getSumInsured());
		createproposal.setInt(4, obj.getNumberOfYears());
		createproposal.setString(5, obj.getInsuranceProduct());
		createproposal.setString(6, obj.getReferredBy());
		System.out.println("val");
		i=createproposal.executeUpdate();
		
		System.out.println("done");
		sql=con.prepareStatement("insert into tbl_proposals values(?,'Premium Not Generated',0,'')");
		sql.setString(1, proposalId);
		System.out.println("done1");
		sql.executeUpdate();
		System.out.println("done2");
		
		
	
	}catch (Exception e){
		e.printStackTrace();
	}
	return proposalId;
}
		
				//Update proposal
public static ArrayList<String> searchProposal() {
	ArrayList<String> ary=new ArrayList<>();
	String id;
	Connection con=DBConnection.getConnection();
	try {
		PreparedStatement pStatement=con.prepareStatement("select proposal_id form TBL_CREATEPROPOSAL");
		ResultSet rs=pStatement.executeQuery();
		while(rs.next()){
			id=rs.getString(1);
			ary.add(id);
			
		}
		
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return ary;
	
	
}


public static ArrayList<String> searchCust() {
	ArrayList<String> ary=new ArrayList<>();
	String id,name;
	Connection con=DBConnection.getConnection();
	try {
		PreparedStatement pStatement=con.prepareStatement("select CUSTOMER_ID,CUSTOMER_NAME  form TBL_CREATECUSTOMER");
		ResultSet rs=pStatement.executeQuery();
		while(rs.next()){
			id=rs.getString(1);
			name=rs.getString(10);
			ary.add(id);
			ary.add(name);
			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return ary;
		
		
	}
		
public static Cl_CreateProposal retriveProposal(String s) {
	Cl_CreateProposal obj=new Cl_CreateProposal();
	ArrayList<String> list=new ArrayList<>();
	
	Connection con=DBConnection.getConnection();
	try {
		PreparedStatement pStatement=con.prepareStatement("select * form TBL_CREATEPROPOSAL where proposal_id=?");
		pStatement.setString(1,s);
		ResultSet rs=pStatement.executeQuery();
		while(rs.next()){
			
			obj.setCustomerId(rs.getString(1));
			obj.setInsuranceTypeId(rs.getString(2));
			obj.setSumInsured(rs.getDouble(3));
			obj.setNumberOfYears(rs.getInt(4));
			obj.setInsuranceProduct(rs.getString(5));
			obj.setReferredBy(rs.getString(6));
			
		}
		
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
return	obj;
}



public static int updateProposal(String Id, Cl_CreateProposal obj){
	Connection con=DBConnection.getConnection();
	PreparedStatement updateproposal=null;
	String proposalId=null;
	int i =0;
	try{
		 updateproposal=con.prepareStatement("UPDATE TBL_CREATEPROPOSAL set customer_id=?, insuranceType_Id= ? ,sum_Insured = ? ,number_Of_Years = ?, insurance_Product = ?, referred_By = ? where proposal_id=?");
		//createproposal.setString(1, obj.getCustomerId());
		 /*ps.setString(1, obj.getInsuranceTypeName());*/
		 updateproposal.setString(1, obj.getCustomerId());
		updateproposal.setString(2, obj.getInsuranceTypeId());
		 updateproposal.setDouble(3, obj.getSumInsured());
		 updateproposal.setInt(4, obj.getNumberOfYears());
		 updateproposal.setString(5, obj.getInsuranceProduct());
		 updateproposal.setString(6, obj.getReferredBy());
		 updateproposal.setString(7,Id);
		 i=updateproposal.executeUpdate();
		
		//seq=con.prepareStatement("select proposal_sequence.currVal as ID from dual");
		//rs=seq.executeQuery();
		//if(rs.next()){
			//proposalId=rs.getInt(1);
		//}
		 if(i==1)
		 {
			 System.out.println("update successfull");
		 }
		 else
			 System.out.println("update failed");
		
	
	}catch (Exception e){
		e.printStackTrace();
	}return i;

}
			

			//Delete proposal
public boolean deleteProposal(String Id){
	Connection con=DBConnection.getConnection();
	PreparedStatement deleteproposal=null;
	int rs=0;
	String deleteproposalSQL="DELETE FROM TBL_CREATEPROPOSAL where proposal_id=?";
	System.out.println("ss");
	try{
		deleteproposal=con.prepareStatement(deleteproposalSQL);
		deleteproposal.setString(1, Id);
		rs=deleteproposal.executeUpdate();
		System.out.println("s2s");
		if(rs>0)
			return true;
		
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("done");
	return false;
}


public void deleteCustomer(String id) {
	// TODO Auto-generated method stub
	Connection con=DBConnection.getConnection();
	PreparedStatement deleteproposal=null;
	int rs=0;
	String deleteproposalSQL="DELETE FROM TBL_CREATECUSTOMER where customer_id=?";
	System.out.println("ss");
	try{
		deleteproposal=con.prepareStatement(deleteproposalSQL);
		deleteproposal.setString(1, id);
		rs=deleteproposal.executeUpdate();
		System.out.println("s2s");
		
		
		
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	System.out.println("done");

	
}
public void updatePremium(double precentage,String proId) {
Connection conn=null;
double premiumAmt=0;
try {
	conn=DBConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("select * from TBL_PROPOSALS where proposalid=?");
	ps.setString(1, proId);
	
	ResultSet rs = ps.executeQuery();
	while (rs.next()) 
	{
		premiumAmt=Double.parseDouble(rs.getString(3));
		
	}

premiumAmt=premiumAmt + (premiumAmt * precentage)/100;
 ps=conn.prepareStatement("update TBL_PROPOSALS set premiumamount=?,status='Premium Generated Waiting For Approval' where proposalid=?");
 ps.setDouble(1, premiumAmt);
 ps.setString(2, proId);
 ps.executeUpdate();
 
 

} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

}

public double generatePreimum(String id) {
	Cl_RuleEngine RuleObj = new Cl_RuleEngine();
	Cl_CreateProposal proObj = new Cl_CreateProposal();
	Cl_CreateCustomer custObj = new Cl_CreateCustomer();
	Connection conn = null;
	String cid=null;
	String insID=null;
	double pre = 0, TPre = 0;
	try {

		System.out.println("1");
		conn = DBConnection.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;
		System.out.println("2");
		
		ps = conn.prepareStatement("select * from tbl_createproposal where proposal_id=? ");
		ps.setString(1, id);
		System.out.println("3");
		rs = ps.executeQuery();
		System.out.println("4");
		while (rs.next()) 
		{
			System.out.println(rs.getString(1));
			cid=rs.getString(1);
			insID=rs.getString(2);
			System.out.println(rs.getString(2));
			System.out.println(rs.getString(3));
			System.out.println(rs.getString(4));
			System.out.println(rs.getString(5));
			System.out.println(rs.getString(6));
			proObj.setCustomerId(rs.getString(1));
			proObj.setInsuranceTypeId(rs.getString(2));
			proObj.setSumInsured(Double.parseDouble(rs.getString(3)));
			proObj.setNumberOfYears(Integer.parseInt(rs.getString(4)));
			proObj.setInsuranceProduct(rs.getString(5));
			proObj.setReferredBy(rs.getString(6));

			

		}
		System.out.println("5");
		pre = proObj.getSumInsured() / (proObj.getNumberOfYears() * 12);
		System.out.println("sum:"+pre);
		
		
		System.out.println("6");
		 ps = conn.prepareStatement("select * from tbl_ruleengine where insurancetype_id=? ");
		 ps.setString(1, insID);
		 System.out.println("7");
		 rs = ps.executeQuery();
		 System.out.println("8");
		while (rs.next()) {
			RuleObj.setInsuranceTypeId( rs.getString(1));
			RuleObj.setInsuranceTypeName(rs.getString(2));
			RuleObj.setG80(Float.parseFloat(rs.getString(3)));
			RuleObj.setG60l80(Float.parseFloat(rs.getString(4)));
			RuleObj.setG40l60(Float.parseFloat(rs.getString(5)));
			RuleObj.setL40(Float.parseFloat(rs.getString(6)));
			RuleObj.setGovTax(Float.parseFloat(rs.getString(7)));
			RuleObj.setGenderMale(Float.parseFloat(rs.getString(8)));
			RuleObj.setGenderFemale(Float.parseFloat(rs.getString(9)));
			RuleObj.setOccupationMiningNuclear(Float.parseFloat(rs.getString(10)));
			RuleObj.setOccupationOthers(Float.parseFloat(rs.getString(11)));
			String name = rs.getString(2);
			Float ag60 = rs.getFloat(3);
			Float ag60l80 = rs.getFloat(4);
			Float ag40l60 = rs.getFloat(5);
			Float al40 = rs.getFloat(6);
			Float gov_tax = rs.getFloat(7);
			Float gen_m = rs.getFloat(8);
			Float gen_f = rs.getFloat(9);
			Float occ_m = rs.getFloat(10);
			Float occ_others = rs.getFloat(11);
		}

		System.out.println("8");

	//	ps = conn.prepareStatement("grouped Query");
	//	rs = ps.executeQuery();
	//	while (rs.next()) {

	//		custObj.setAddress(null);
	//}

		 ps = conn.prepareStatement("select * from TBL_CREATECUSTOMER where customer_id=?");
		 ps.setString(1, cid);
		
		 System.out.println("77");
		 rs = ps.executeQuery();
		 System.out.println("88");
		while (rs.next()) {
			
			custObj.setCustomerType(rs.getString(1));
			custObj.setCustomerName(rs.getString(2));
			custObj.setOccupation(rs.getString(3));
			custObj.setAge(Integer.parseInt(rs.getString(4)));
			custObj.setGender(rs.getString(5));
			custObj.setAddress(rs.getString(6));
			custObj.setCity(rs.getString(7));
			custObj.setState(rs.getString(8));
			custObj.setZipCode(rs.getString(9));
			custObj.setPhoneNumber(rs.getString(10));
			
			
		}
		System.out.println("hh"+custObj.getAge());
		System.out.println("hh"+custObj.getGender());
		if (custObj.getAge() > 80) {

			TPre = pre + pre * RuleObj.getG80()/100;
			System.out.println("91");
		} else if (custObj.getAge() <= 80 && custObj.getAge() > 60) {
			System.out.println("92");
			TPre = pre + pre * RuleObj.getG60l80()/100;
		} else if (custObj.getAge() <= 60 && custObj.getAge() > 40) {
			System.out.println("93");
			TPre = pre + pre * RuleObj.getG40l60()/100;
		} else if (custObj.getAge() < 40) {
			System.out.println("94");
			TPre = pre + pre * RuleObj.getG40l60()/100;
		}
		if(custObj.getGender().equalsIgnoreCase("Male"))
		{
			TPre=TPre+pre*RuleObj.getGenderMale()/100;
		}
		if(custObj.getGender().equalsIgnoreCase("female"))
		{
			TPre=TPre+pre*RuleObj.getGenderFemale()/100;
		}
		System.out.println("9tt45");
		if (custObj.getCustomerType().equalsIgnoreCase("Individual")||custObj.getCustomerType().equalsIgnoreCase("Group"))
		{
			System.out.println("9tt46");
			if (custObj.getOccupation().equalsIgnoreCase("other"))
				{
				System.out.println("9tt47");
				
				TPre = TPre + pre*RuleObj.getOccupationOthers()/100;
				}
			else
			{
				System.out.println("9tt48");
				TPre = TPre + pre*RuleObj.getOccupationMiningNuclear()/100;
			}
		
		}	
			
		System.out.println("9tt49");
		
		TPre=TPre+pre*RuleObj.getGovTax()/100;
		System.out.println("9tt43");
		//UPDATE Customers SET ContactName='Alfred Schmidt', City='Hamburg' WHERE CustomerName='Alfreds Futterkiste';
		ps = conn.prepareStatement("update TBL_PROPOSALS set  status='Deviation Not Generated',premiumamount=? where proposalid =? ");
        ps.setString(2, id);
        ps.setDouble(1, TPre);
        ps.executeUpdate();
	
        
        
        
        
        
	
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	
	System.out.println("done");
	return Math.round(TPre);
	

}


}
