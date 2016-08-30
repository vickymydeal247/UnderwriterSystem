package com.underwriter.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UnderWriter;


import bean.*;
/**
 * Servlet implementation class controller_UnderWriter
 */
@WebServlet("/controller_UnderWriter")
public class controller_UnderWriter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller_UnderWriter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//Create Customer Bean Class
		service_Underwriter serviceObj = new service_Underwriter();
		String action=request.getParameter("action");
		Cl_CreateCustomer cc= new Cl_CreateCustomer();
		Cl_CreateProposal cp= new Cl_CreateProposal();
		Cl_AddClaim claimObj= new Cl_AddClaim();
		UnderWriter uw= new UnderWriter();
		
		// add customer

		
		
		if(action.equalsIgnoreCase("rfq_Proposals1"))
		{
			
			
			String[] s=request.getParameterValues("proposals");
			for (String str : s) 
			{
				
				Double dd=uw.generatePreimum(str);
				
				response.sendRedirect("Underwriter/RFQProposals.jsp");
			}
		}
		
		if(action.equalsIgnoreCase("setDeviation"))
		{
			
			
			System.out.println(request.getParameter("range"));
			System.out.println(request.getParameter("id"));
			double d= Double.parseDouble(request.getParameter("range"));
			uw.updatePremium(d,request.getParameter("id"));
			response.sendRedirect("Underwriter/RFQProposals.jsp");
			
		}
		
		if(action.equalsIgnoreCase("rfq_Proposal6"))
		{
			 
			String[] ss= request.getParameterValues("proposals");
			String data="";
			for(String s :ss )
			{
				data=data + " " +s;	
			}
			  uw.quoteGenerated(ss);
			response.sendRedirect("Underwriter/RFQProposals.jsp");
		}
		
		if(action.equalsIgnoreCase("add_Customer"))
				{
					System.out.println("In addUser");
					/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
					requestDispatcher.forward(request, response);
					*/  
					cc.setCustomerName(request.getParameter("username"));
					cc.setAge(Integer.parseInt(request.getParameter("age")));
					cc.setCustomerType(request.getParameter("insuranceType")); 
					cc.setAddress(request.getParameter("address"));
					cc.setCity(request.getParameter("city"));
					System.out.println(request.getParameter("state"));
					cc.setState(request.getParameter("state"));
					cc.setZipCode(request.getParameter("zip")); 
					cc.setGender(request.getParameter("gender"));
					cc.setOccupation(request.getParameter("optionsRadios"));
					cc.setPhoneNumber(request.getParameter("mobnumber"));
				    String s=	uw.insertIntoTableCreateCustomer(cc);
					 HttpSession httpSession=request.getSession(false);
						httpSession.setAttribute("onload","CustomerID=>"+s );
					
					response.sendRedirect("Underwriter/addCustomer.jsp");
				}
		
		if(action.equalsIgnoreCase("deleteProposal"))
		{
			
			//System.out.println("dflgjkrl");
			
			//Cl_CreateCustomer customerObj=  beanObjCust( request,  response);
			System.out.println("2");
			System.out.println(request.getParameter("del"));
			uw.deleteProposal(request.getParameter("del"));
		
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully" );
				
			
			response.sendRedirect("Underwriter/deleteProposal.jsp");
		}
		
		if(action.equalsIgnoreCase("delete_Customer"))
		{
			
			//System.out.println("dflgjkrl");
			
			//Cl_CreateCustomer customerObj=  beanObjCust( request,  response);
			System.out.println("2");
			System.out.println(request.getParameter("del"));
			uw.deleteCustomer(request.getParameter("del"));
			//uw.deleteProposal(request.getParameter("del"));

			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully" );
			
			
			response.sendRedirect("Underwriter/delete_Customer.jsp");
		}
		
		if(action.equalsIgnoreCase("create_Customer"))
		{
			
			System.out.println("dflgjkrl");
			
			Cl_CreateCustomer customerObj=  beanObjCust( request,  response);
			System.out.println("2");
			String cusId=serviceObj.add_Customer( customerObj);
			
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload",cusId );
			
			response.sendRedirect("Underwriter/create_Customer.jsp");
		}
		//edit_Proposal
		if(action.equalsIgnoreCase("edit_Proposal"))
		{
			
			
			System.out.println("32");
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("customer_Id"));
			System.out.println(request.getParameter("insurance_Type"));
			System.out.println(request.getParameter("sum_Insured"));
			System.out.println(request.getParameter("number_Of_Years"));
			System.out.println(request.getParameter("product_Type"));
			System.out.println(request.getParameter("referred_By"));
			System.out.println("jjjj");
			cp.setCustomerId(request.getParameter("customer_Id"));
			cp.setInsuranceTypeId(request.getParameter("insurance_Type"));
			cp.setSumInsured(Double.parseDouble(request.getParameter("sum_Insured")));
			cp.setNumberOfYears(Integer.parseInt(request.getParameter("number_Of_Years")));
			
			cp.setInsuranceProduct(request.getParameter("product_Type"));
			cp.setReferredBy(request.getParameter("referred_By"));
			uw.updateProposal(request.getParameter("id"), cp);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Edited Successfully" );
			//uw.updateCustomer(request.getParameter("cid"), cc);
			//cc.setCustomerType(customerType);
			response.sendRedirect("Underwriter/edit_Proposal.jsp");
		}
		
		
		
		
		
		if(action.equalsIgnoreCase("edit_Customer"))
		{
			
			
			System.out.println("32");
			System.out.println(request.getParameter("cid"));
			System.out.println(request.getParameter("ctype"));
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("Occupation"));
			System.out.println(request.getParameter("age"));
			System.out.println(request.getParameter("gender"));
			System.out.println(request.getParameter("add"));
			System.out.println(request.getParameter("city"));
			System.out.println(request.getParameter("state"));
			System.out.println(request.getParameter("zipCode"));
			System.out.println(request.getParameter("mobileNumber"));
			cc.setCustomerType(request.getParameter("ctype"));
			cc.setCustomerName(request.getParameter("name"));
			cc.setOccupation(request.getParameter("Occupation"));
			cc.setAge(Integer.parseInt(request.getParameter("age")));
			cc.setGender(request.getParameter("gender"));
			cc.setAddress(request.getParameter("add"));
			cc.setCity(request.getParameter("city"));
			cc.setState(request.getParameter("state"));
			cc.setZipCode(request.getParameter("zipCode"));
			cc.setPhoneNumber(request.getParameter("mobileNumber"));
			
			uw.updateCustomer(request.getParameter("cid"), cc);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Edited Successfully" );
			//cc.setCustomerType(customerType);
			response.sendRedirect("Underwriter/edit_Customer.jsp");
		}
		
		
		if(action.equalsIgnoreCase("create_Policy"))
		{
			
			
			//System.out.println(request.getParameter("proposal_Id"));
			//PDFGeneration.policyCode(request.getParameter("proposal_Id"));
			serviceObj.policy_Creation(request.getParameter("proposal_Id"));
			 System.out.println("abc");
		
			response.sendRedirect("Underwriter/create_Policy.jsp");
			
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Policy Generated Successfully" );
			response.sendRedirect("Underwriter/homeUnderwriter.jsp");
		}
		
		
		
		//Add Proposal servlet
		 if(action.equalsIgnoreCase("create_Proposal"))
		 {
		//Cl_CreateProposal proposalObj=propBeanMethod(request,response);
		System.out.println("hhhhh");
		System.out.println(request.getParameter("cid"));
		System.out.println(request.getParameter("inusrance_Type"));
		System.out.println(request.getParameter("product_Type"));
		System.out.println(request.getParameter("sum_Insured"));
		System.out.println(request.getParameter("number_Of_Years"));
		System.out.println(request.getParameter("bid"));
		System.out.println("kkkkk");
		cp.setCustomerId(request.getParameter("cid"));
		cp.setInsuranceTypeId(request.getParameter("inusrance_Type"));
		cp.setInsuranceProduct(request.getParameter("product_Type"));
		cp.setSumInsured(Double.parseDouble(request.getParameter("sum_Insured")));
		cp.setNumberOfYears(Integer.parseInt(request.getParameter("number_Of_Years")));
		cp.setReferredBy(request.getParameter("bid"));
		String ss= uw.createProposals(cp);
		 HttpSession httpSession=request.getSession(false);
			httpSession.setAttribute("onload",ss );
			response.sendRedirect("Underwriter/homeUnderwriter.jsp");
		}

		

	//Add Claims //add_Claim
	 //Doubt on add claim part please check 
		// UnderWriter ud=new UnderWriter();
		if(action.equalsIgnoreCase("add_Claim")){
			System.out.println("11");
	System.out.println(request.getParameter("claim_id"));
	System.out.println(request.getParameter("id"));
	System.out.println(request.getParameter("policy_Id"));
	System.out.println(request.getParameter("claim_Amount"));
	System.out.println(request.getParameter("payment_Date"));
	
	claimObj.setClaimId(request.getParameter("claim_id"));
	claimObj.setCustomerId(request.getParameter("id"));
	
	claimObj.setPolicyId(request.getParameter("policy_Id"));
	claimObj.setClaimAmount(Double.parseDouble(request.getParameter("claim_Amount")));
	claimObj.setPaymentDate(Date.valueOf(request.getParameter("payment_Date")));
	
	System.out.println("22");
	uw.addClaims(claimObj);
	 HttpSession httpSession=request.getSession(false);
		httpSession.setAttribute("onload","Claim Added Successfully" );
		response.sendRedirect("Underwriter/add_Claim.jsp");
		}
		
	
		
		if(action.equalsIgnoreCase("create_Rule"))
		{
			System.out.println("44");
			Cl_RuleEngine ruleobj = beanObjRule(request, response);
			System.out.println("55");
			serviceObj.add_Rule_Book(ruleobj);
			System.out.println("66");
			response.sendRedirect("Admin/add_Claim.jsp");
		}

		
	
	}
	
	
	
	
	
	
	
	

	
	


	public Cl_CreateCustomer beanObjCust(HttpServletRequest request, HttpServletResponse response){
		Cl_CreateCustomer customerObj = new Cl_CreateCustomer();
		System.out.println("323");
		System.out.println(request.getParameter("customerType"));
		if(request.getParameter("customerType").equalsIgnoreCase("family")){
			
			System.out.println("3333333");
			
			
			customerObj.setGender(request.getParameter(null));//comp
			customerObj.setOccupation(request.getParameter(null));//comp
			customerObj.setCustomerType(request.getParameter("customerType"));
			customerObj.setCustomerName(request.getParameter("customerName"));
			customerObj.setAge(Integer.parseInt(request.getParameter("age")));
			customerObj.setAddress(request.getParameter("address"));
			customerObj.setCity(request.getParameter("city"));
			customerObj.setState(request.getParameter("state"));
			customerObj.setZipCode(request.getParameter("zipCode"));
			customerObj.setPhoneNumber(request.getParameter("mobileNumber"));
			}
		else
			if(request.getParameter("customerType").equalsIgnoreCase("Group"))
		{
				
				
				System.out.println("4444");
			customerObj.setGender(null);//comp
			customerObj.setOccupation(request.getParameter("Occupation"));
			customerObj.setCustomerType(request.getParameter("customerType"));
			customerObj.setCustomerName(request.getParameter("customerName"));
			customerObj.setAge(Integer.parseInt(request.getParameter("age")));
			customerObj.setAddress(request.getParameter("address"));
			customerObj.setCity(request.getParameter("city"));
			customerObj.setState(request.getParameter("state"));
			customerObj.setZipCode(request.getParameter("zipCode"));
			customerObj.setPhoneNumber(request.getParameter("mobileNumber"));
		}
			else
				if(request.getParameter("customerType").equalsIgnoreCase("individual"))
				{
					System.out.println("66666");
					customerObj.setGender(request.getParameter("gender"));
					System.out.println("1");
					customerObj.setOccupation(request.getParameter("Occupation"));System.out.println("1");
					customerObj.setCustomerType(request.getParameter("customerType"));System.out.println("1");
					customerObj.setCustomerName(request.getParameter("customerName"));System.out.println("1");
					customerObj.setAge(Integer.parseInt(request.getParameter("age")));System.out.println("1");
					customerObj.setAddress(request.getParameter("address"));System.out.println("1");
					customerObj.setCity(request.getParameter("city"));System.out.println("1");
					customerObj.setState(request.getParameter("state"));System.out.println("1");
					customerObj.setZipCode(request.getParameter("zipCode"));System.out.println("1");
					customerObj.setPhoneNumber(request.getParameter("mobileNumber"));System.out.println("1");	
					
				}
		
		
		return customerObj;
		
	}
	
	public Cl_RuleEngine beanObjRule(HttpServletRequest request, HttpServletResponse response){ 
		Cl_RuleEngine ruleobj = new Cl_RuleEngine();
	if(request.getParameter("insuranceType").equalsIgnoreCase("family"))
	{
		ruleobj.setGenderMale(0);//comp
		ruleobj.setGenderFemale(0);//comp
		ruleobj.setOccupationMiningNuclear(0); //comp
		ruleobj.setOccupationOthers(0); //comp
		ruleobj.setG80(Float.parseFloat(request.getParameter("ag80")));
		ruleobj.setG60l80(Float.parseFloat(request.getParameter("ag60l80")));
		ruleobj.setG40l60(Float.parseFloat(request.getParameter("ag40l60")));
		ruleobj.setL40(Float.parseFloat(request.getParameter("al40")));
		ruleobj.setGovTax(Float.parseFloat(request.getParameter("taxPerc")));
		ruleobj.setInsuranceTypeId(request.getParameter("insuranceType"));
		ruleobj.setInsuranceTypeName(request.getParameter("abcd"));		//	Value should be enter from the previous module
	}
	else
		if(request.getParameter("insuranceType").equalsIgnoreCase("Group"))
		{
			ruleobj.setGenderMale(0);//comp
			ruleobj.setGenderFemale(0);//comp
			ruleobj.setOccupationMiningNuclear(Float.parseFloat(request.getParameter("minAndNuclear")));
			ruleobj.setOccupationOthers(Float.parseFloat(request.getParameter("others")));
			ruleobj.setG80(Float.parseFloat(request.getParameter("ag80")));
			ruleobj.setG60l80(Float.parseFloat(request.getParameter("ag60l80")));
			ruleobj.setG40l60(Float.parseFloat(request.getParameter("ag40l60")));
			ruleobj.setL40(Float.parseFloat(request.getParameter("al40")));
			ruleobj.setGovTax(Float.parseFloat(request.getParameter("taxPerc")));
			ruleobj.setInsuranceTypeId(request.getParameter("insuranceType"));
			ruleobj.setInsuranceTypeName(request.getParameter("abcd"));			//	Value should be enter from the previous module
		}
		else
			if(request.getParameter("insuranceType").equalsIgnoreCase("individual"))
			{
				ruleobj.setGenderMale(Float.parseFloat(request.getParameter("male")));
				ruleobj.setGenderFemale(Float.parseFloat(request.getParameter("female")));
				ruleobj.setOccupationMiningNuclear(Float.parseFloat(request.getParameter("minAndNuclear")));
				ruleobj.setOccupationOthers(Float.parseFloat(request.getParameter("others")));
				ruleobj.setG80(Float.parseFloat(request.getParameter("ag80")));
				ruleobj.setG60l80(Float.parseFloat(request.getParameter("ag60l80")));
				ruleobj.setG40l60(Float.parseFloat(request.getParameter("ag40l60")));
				ruleobj.setL40(Float.parseFloat(request.getParameter("al40")));
				ruleobj.setGovTax(Float.parseFloat(request.getParameter("taxPerc")));
				ruleobj.setInsuranceTypeId(request.getParameter("insuranceType"));
				ruleobj.setInsuranceTypeName(request.getParameter("abcd"));			//	Value should be enter from the previous module	
				
				}
		return ruleobj;
		}
	
	public Cl_CreateProposal propBeanMethod(HttpServletRequest request, HttpServletResponse response){
	Cl_CreateProposal proposalObj=new Cl_CreateProposal();
	
	System.out.println(request.getParameter("cid" ));
	proposalObj.setCustomerId(request.getParameter("cid"));
	    System.out.println(request.getParameter("inusrance_Type") );
		proposalObj.setInsuranceTypeId(request.getParameter("inusrance_Type"));
		
		System.out.println(request.getParameter("product_Type") );
		proposalObj.setInsuranceProduct(request.getParameter("product_Type"));
		System.out.println(request.getParameter("sum_Insured") );
		proposalObj.setSumInsured(Double.parseDouble(request.getParameter("sum_Insured")));
		System.out.println(request.getParameter("number_Of_Years") );// need to check
		proposalObj.setNumberOfYears(Integer.parseInt(request.getParameter("number_Of_Years")));
		System.out.println(request.getParameter("bid") );
		proposalObj.setReferredBy(request.getParameter("bid"));
		 
	
	
	return proposalObj;
	}
	}