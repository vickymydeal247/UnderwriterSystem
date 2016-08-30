package com.underwriter.controller;

import java.util.ArrayList;

import dao.UnderWriter;

import bean.Cl_AddClaim;
import bean.Cl_CreateCustomer;
import bean.Cl_CreateProposal;
import bean.Cl_RuleEngine;
import dao.UnderWriter;

public class service_Underwriter {
	
	UnderWriter underwriter = new UnderWriter();
	public void policy_Creation(String s) {
		System.out.println("dfj");
		//new PDFGeneration().policyCode(s);
		System.out.println("78955");
	}
	public String add_Customer(Cl_CreateCustomer cust)
	{
		String cusId=underwriter.insertIntoTableCreateCustomer(cust);
		return cusId;
	}
	
	public void add_Rule_Book(Cl_RuleEngine rule)
	{
		//underwriter.insertIntoTblRuleEngine(rule);
	}
	
	public boolean addClaim(Cl_AddClaim claimObj) {
		boolean stat=underwriter.addClaims(claimObj);
		return stat;
		
	}

	public String createProposal(Cl_CreateProposal proposalObj) {
		System.out.println("123456789");
		String proposalId= underwriter.createProposals(proposalObj);
		return proposalId;
	}
	public ArrayList<String> getInsuranceType()
	{
		ArrayList<String> insType=new ArrayList<String>();
		insType=underwriter.getInsuranceType();
		return insType;
	}
	public static  Cl_RuleEngine displayData(String id)
	{
		Cl_RuleEngine rObj=new Cl_RuleEngine();
		rObj=UnderWriter.displayData(id);
		return rObj;
	}
	
	public static int updateRuleBook(Cl_RuleEngine obj)
	{
		int t= UnderWriter.updateRuleBook(obj);
		return t;
	}
	public static int deleteRuleBook(String s) 
	{
		int i=UnderWriter.deleteRuleBook(s);
		return i;
	}
	public static ArrayList<String> searchCustomer() 
	{
		ArrayList<String> searchCust=new ArrayList<String>();
		searchCust=UnderWriter.searchCustomer();
		return searchCust;
	}
	public static Cl_CreateCustomer retriveCustomer(String s)
	{
		Cl_CreateCustomer cObj= new Cl_CreateCustomer();
		cObj=UnderWriter.retriveCustomer(s);
		return cObj;
	}
	public static int updateCustomer(String Id, Cl_CreateCustomer obj)
	{
		int u=UnderWriter.updateCustomer(Id, obj);
		return u;
	}
	public ArrayList<String> searchProposal()
	{
		ArrayList<String> searchPro= new ArrayList<String>();
		searchPro=underwriter.searchProposal();
		return searchPro;
	}
	public Cl_CreateProposal retrive_Proposal(String proposalId){
	Cl_CreateProposal retriveobj=new Cl_CreateProposal();
	retriveobj=underwriter.retriveProposal(proposalId);
		return retriveobj;
	}
	public int update_proposal(String Id,Cl_CreateProposal proposalObj){
		int i= underwriter.updateProposal( Id, proposalObj);
		return i;
	}
	public boolean delete_Proposal(String Id){
		boolean i= underwriter.deleteProposal( Id);
		return i;
	}

	public ArrayList<String> searchCust() {
		ArrayList<String> searchCust= new ArrayList<String>();
		searchCust=underwriter.searchCust();
		return searchCust;
	}
	
}
