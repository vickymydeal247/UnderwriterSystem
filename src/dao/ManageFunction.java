package dao;

import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.underwriter.controller.DBConnection;

import bean.AddBrokerBean;
import bean.Cl_CreateCustomer;
import bean.Cl_CreateProposal;
import bean.Cl_RuleEngine;
import bean.ProposalBean;

public class ManageFunction {
	
	
	public void updateProposalStatusByCustomer(String id, String status,
			String comment) 
	{
		PreparedStatement ps=null;
		Connection conn=null;
		conn = DBConnection.getConnection();
		try{
			System.out.println("hh");
			 ps=conn.prepareStatement("update TBL_PROPOSALS set status=?,comments=? where proposalid=?");
			 ps.setString(1, status);
			 ps.setString(2, comment);
			 ps.setString(3, id);
			 System.out.println("hhd");
			 ps.executeUpdate();
			 System.out.println("donedddd");
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
	}

	
	
	
	public void addBroker(AddBrokerBean broker) {
		int i = 0;
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();
			// ps.setInt(1, Integer.parseInt(req.getParameter("id".trim())));
			PreparedStatement ps = conn.prepareStatement("Insert into tbl_add_broker values(?,?,?,?,?,?,?,?)");
			ps.setString(1, broker.getBrokerName());
			ps.setString(2, broker.getAddress());
			ps.setString(3, broker.getCity());
			ps.setString(4, broker.getState());
			ps.setLong(5, broker.getZipcode());
			ps.setLong(6, broker.getPhone());
			ps.setString(7, broker.getBrokerID());
			ps.setInt(8, broker.getBrokeragePoint());
			i = ps.executeUpdate();
			if (i == 1) {
				System.out.println("Broker Inserted Successfully");
			} else {
				System.out.println("Broker Insertion Failed!");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ProposalBean> viewAllProposals() {
		Connection conn = null;
		ArrayList<ProposalBean> al = new ArrayList<ProposalBean>();

		try {
			conn = DBConnection.getConnection();
			// ps.setInt(1, Integer.parseInt(req.getParameter("id".trim())));
			PreparedStatement ps = conn
					.prepareStatement("select * from tbl_proposals ");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String pid = rs.getString(1);
				String status = rs.getString(2);
				double preAmt = rs.getDouble(3);

				ProposalBean pb = new ProposalBean();

				pb.setPremiumAmount(preAmt);
				pb.setProposalID(pid);
				pb.setStatus(status);

				al.add(pb);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;

	}

	public ArrayList<ProposalBean> viewAllProposalsStatus(String status) {
		Connection conn = null;
		ArrayList<ProposalBean> al = new ArrayList<ProposalBean>();
		ProposalBean pb = new ProposalBean();
		try {
			conn = DBConnection.getConnection();
			// ps.setInt(1, Integer.parseInt(req.getParameter("id".trim())));
			PreparedStatement ps = conn
					.prepareStatement("select * from tbl_proposals where Status=? ");
			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				pb.setPremiumAmount(rs.getDouble(3));
				pb.setProposalID(rs.getString(1));
				pb.setStatus(rs.getString(2));

				al.add(pb);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;

	}

	public double generatePreimum(String id) {
		Cl_RuleEngine RuleObj = new Cl_RuleEngine();
		Cl_CreateProposal proObj = new Cl_CreateProposal();
		Cl_CreateCustomer custObj = new Cl_CreateCustomer();
		Connection conn = null;
		double pre = 0, TPre = 0;
		try {

			conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from tlb_ruleengine where ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				RuleObj.setInsuranceTypeId( rs.getString(1));
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

			ps = conn.prepareStatement("select * from tbl_createproposal where proposal_id=? ");
			//ps.setString(0, arg1)
			rs = ps.executeQuery();
			while (rs.next()) {

				proObj.setSumInsured(0);

			}

			ps = conn.prepareStatement("grouped Query");
			rs = ps.executeQuery();
			while (rs.next()) {

				custObj.setAddress(null);
			}

			pre = proObj.getSumInsured() / (proObj.getNumberOfYears() * 12);
			if (custObj.getAge() > 80) {

				TPre = pre + pre * RuleObj.getG80()/100;
			} else if (custObj.getAge() <= 80 && custObj.getAge() > 60) {

				TPre = pre + pre * RuleObj.getG60l80()/100;
			} else if (custObj.getAge() <= 60 && custObj.getAge() > 40) {

				TPre = pre + pre * RuleObj.getG40l60()/100;
			} else if (custObj.getAge() < 40) {

				TPre = pre + pre * RuleObj.getG40l60()/100;
			}
			if (custObj.getCustomerType().equalsIgnoreCase("Individual")||custObj.getCustomerType().equalsIgnoreCase("Group")) {
				if (custObj.getOccupation().equalsIgnoreCase("other"))
					TPre = TPre + pre*RuleObj.getOccupationOthers()/100;
				else
					TPre = TPre + pre*RuleObj.getOccupationMiningNuclear()/100;

			}
			TPre=TPre+pre*RuleObj.getGovTax()/100;
			
			// pre= (premium*gender
			// component)/100 + (premium*Occupation component)/100 +
			// (pre*RuleObj.getGovTax())/100;

			ps = conn.prepareStatement("update into from proposal set=?  status=premimumGeneratedQuateNotGenerated proId =? ");
            ps.setString(2, id);
            ps.setDouble(2, TPre);
            ps.executeUpdate();
		
            
            
            
            
            
		
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return TPre;

	}
	
	
	
public void updatePremium(double precentage,String proId) {
	Connection conn=null;
	double premiumAmt=0;
	try {
		conn=DBConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("select premiAmount from where id=?");
		ps.setString(1, proId);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			premiumAmt=rs.getDouble(1);
			
		}
	
	premiumAmt=premiumAmt + (premiumAmt * precentage)/100;
	 ps=conn.prepareStatement("update set premiAmt=? where id=?");
	 ps.setDouble(1, premiumAmt);
	 ps.setString(2, proId);
	 ps.executeUpdate();
	 
	 
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
	
//



	


	
public ArrayList checkClaims(String CustomerId)
{
	ArrayList al = new ArrayList();
	//Cl_AddClaim ca = new Cl_AddClaim();
int i,j;
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{
	
	conn=DBConnection.getConnection();
	ps=conn.prepareStatement("select count(*),sum(CLAIM_AMOUNT) from tbl_addclaim where customer_id=? ");
ps.setString(1, CustomerId);
	rs=ps.executeQuery();
	
if(rs.next())
{
	i=rs.getInt(1);
	j=rs.getInt(2);
	al.add(i);
	al.add(j);
}
}catch(SQLException e)
{
	e.printStackTrace();
}
return al;
}

public void updateBroker(String id, AddBrokerBean ab) {
	Connection connection=DBConnection.getConnection();
	//Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	  
    
	  try {
		ps =connection.prepareStatement("update TBL_ADD_BROKER set brokername = ? ,address=?,city=?,state=?,zipcode=?,phnno=? where brokerid=?");
		 ps.setString(1,ab.getBrokerName());
		 ps.setString(2,ab.getAddress());
		 ps.setString(3,ab.getCity());
		 ps.setString(4,ab.getState());
		 ps.setLong(5,ab.getZipcode());
		 ps.setLong(6,ab.getPhone());
		 
		 ps.setString(7,id);
		 
		  
		   
		  int update=ps.executeUpdate();
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
	


public double calculateClaimAmt(String product){
	 String i=null;
	
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
ArrayList<String> id=new ArrayList<String>();
	 
	 try{
			
			conn=DBConnection.getConnection();
			ps=conn.prepareStatement("select customer_id from tbl_createproposal where insurance_product=? ");
		
		ps.setString(1,product);
		rs=ps.executeQuery();
		while(rs.next()){
		i=rs.getString(1);
		id.add(i);
		}
	}catch(SQLException e)
	{
		e.printStackTrace();
	}

	double count=0,x=0;
	 for(String temp:id){
		 try{
				
				conn=DBConnection.getConnection();
				ps=conn.prepareStatement("select sum(claim_amount) from tbl_addclaim where customer_id=? ");
			
			ps.setString(1,temp);
			rs=ps.executeQuery();
			while(rs.next()){
			x=rs.getDouble(1);
			count=count+x;
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		 
	 }
	 return count;
}



public void generatePDF(String proposalId){
	Document document = new Document();
	Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
		      Font.BOLD);
		  Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
		      Font.NORMAL, BaseColor.RED);
		  Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
		      Font.BOLD);
		  Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
		      Font.BOLD);
	try
	{
		
		  String CustomerId = null;
		  String name = null,name2 = null,name3=null,name4=null,name5=null;int name6=0;
		  Connection conn=null;
			PreparedStatement ps = null;
			PreparedStatement ps0 = null;
			ResultSet rs=null;
			
			conn=DBConnection.getConnection();
			ps=conn.prepareStatement("select customer_ID from tbl_createProposal where proposal_ID=? ");
			ps.setString(1,proposalId);
			rs=ps.executeQuery();
			while(rs.next()){
				CustomerId = rs.getString(1);
			}
			
			
			ps0=conn.prepareStatement("select customer_name from tbl_createcustomer where customer_id=? ");
			ps0.setString(1,CustomerId);
			rs=ps0.executeQuery();
			while(rs.next()){
				name=rs.getString(1);
			}
			
			PreparedStatement ps2 = conn.prepareStatement("select Insurancetype_id from tbl_createproposal where customer_id=?");
			ps2.setString(1,CustomerId);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next()){name2=rs2.getString(1);}
			
			PreparedStatement ps3 = conn.prepareStatement("select sum_insured from tbl_createproposal where customer_id=?");
			ps3.setString(1,CustomerId);
			ResultSet rs3 = ps3.executeQuery();
			while(rs3.next()){name3=rs3.getString(1);}
			
			PreparedStatement ps4 = conn.prepareStatement("select proposal_id from tbl_createproposal where customer_id=?");
			ps4.setString(1,CustomerId);
			ResultSet rs4 = ps4.executeQuery();
			while(rs4.next()){name4=rs4.getString(1);}
			
			PreparedStatement ps5 = conn.prepareStatement("select number_of_years from tbl_createproposal where customer_id=?");
			ps5.setString(1,CustomerId);
			ResultSet rs5 = ps5.executeQuery();
			while(rs5.next()){name5=rs5.getString(1);}
			
			PreparedStatement ps6 = conn.prepareStatement("select PremiumAmount from tbl_proposals where proposalid=?");
			ps6.setString(1,name4);
			ResultSet rs6 = ps6.executeQuery();
			while(rs6.next()){name6=rs6.getInt(1);}
			
			String ss="c:\\temp\\"+CustomerId+".pdf";
			
	    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(ss));
	    document.open();
	    document.add(new Paragraph("Quote Declaration",catFont));
	    document.add( Chunk.NEWLINE );
	    document.add( Chunk.NEWLINE );
	    //Add ordered list
	    List orderedList = new List(List.ORDERED);
	    orderedList.add(new ListItem("Customer Name= "+name));
	   
	    orderedList.add(new ListItem("Customer Id= "+CustomerId));
	   
	  
	    orderedList.add(new ListItem("Insurance Type ID= "+name2));
	   
	    orderedList.add(new ListItem("Sum_Insured= "+name3));
	    
	    orderedList.add(new ListItem("Proposal ID= "+name4));
	   
	    orderedList.add(new ListItem("Time Period= "+name5));
	   
	    orderedList.add(new ListItem("Monthly Premium= "+name6));
	    
	   
	    document.add(orderedList);
	 
	    document.add( Chunk.NEWLINE );
	    document.add( Chunk.NEWLINE );
	    document.add(new Paragraph("Please accept this Premium Quote by signing this agreement if you agree with the above information.",redFont));
	    
	    document.add(new Paragraph("Thanks and Regards"));
	    document.add( Chunk.NEWLINE );
	    document.add(new Paragraph("Ashish Kumar"));
	    
	    document.add(new Paragraph("JeevanSure Insurance pvt. ltd."));
	    document.add( Chunk.NEWLINE );
	    document.add( Chunk.NEWLINE );
	    document.add(new Paragraph("Signature of "+name));
	    document.add( Chunk.NEWLINE );
	    document.add(new Paragraph("Date-"));
	    
	  
	   
	    document.close();
	    writer.close();
	} catch (Exception e)
	{
	    e.printStackTrace();
	}
}





	
	
}
