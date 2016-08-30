package com.underwriter.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AddBrokerBean;
import bean.Cl_Coverage;
import bean.Cl_Login;
import bean.Cl_Products;
import bean.Cl_RuleEngine;
import bean.Cl_Types;

import dao.*;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String action1 = request.getParameter("action1");
		UserDAO ud= new UserDAO();
		Cl_Login cl = new Cl_Login();
		Cl_Coverage cc= new Cl_Coverage();
		Cl_Products cp = new Cl_Products();
		Cl_Types ct = new Cl_Types();
		Cl_RuleEngine cr=new Cl_RuleEngine();
		AddBrokerBean ab= new AddBrokerBean();
		ManageFunction mf= new ManageFunction();
		
	String id;
		
		if(action.equalsIgnoreCase("addUser"))
		{
			System.out.println("In addUser");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println("a");
			System.out.println(request.getParameter("username"));
			System.out.println(request.getParameter("role"));
			System.out.println(request.getParameter("status"));
			System.out.println("aa");
			cl.setUserName(request.getParameter("username"));
			cl.setRole(request.getParameter("role"));
			cl.setStatus(request.getParameter("status"));
		    id=	ud.createUser(cl);
		    HttpSession httpSession=request.getSession(false);
			httpSession.setAttribute("onload","UserID=>"+id );
			response.sendRedirect("Admin/addUser.jsp");
		}
		
		//edit user
		if(action.equalsIgnoreCase("editUser"))
		{
			System.out.println("In Edit User");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println("a");
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("role"));
			System.out.println(request.getParameter("status"));
			System.out.println("aa");
			cl.setUserName(request.getParameter("name"));
			cl.setRole(request.getParameter("role"));
			cl.setStatus(request.getParameter("status"));
			ud.updateUser(request.getParameter("id"), cl);
			//cl.setUserName(request.getParameter("username"));
			//cl.setRole(request.getParameter("role"));
			//cl.setStatus(request.getParameter("status"));
			//ud.createUser(cl);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Edited User Successfully " );
			response.sendRedirect("Admin/addUser.jsp");
		}
		
		//editRule
		
		
		//editCoverage
		if(action.equalsIgnoreCase("editCoverage"))
		{
			System.out.println("In Edit Coverage");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println("a");
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("status"));
			System.out.println("aa");
			cc.setCoverageName(request.getParameter("name"));
			cc.setStatus(request.getParameter("status"));
			ud.updateCoverage(request.getParameter("id"), cc);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Edited Successfully " );
				response.sendRedirect("Admin/editCoverage.jsp");
			
		}
		
		//editInsuranceProduct
		if(action.equalsIgnoreCase("editInsuranceProduct"))
		{
			System.out.println("In Edit InsuranceProduct");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println("a");
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("status"));
			String[] ss= request.getParameterValues("type1");
			String data="";
			for(String s :ss )
			{
				data=data + " " +s;	
			}
			System.out.println(data);
			System.out.println("aa");
			cp.setProductName(request.getParameter("name"));
			cp.setStatus(request.getParameter("status"));
			ud.updateProducts(request.getParameter("id"), cp,ss);
			//cc.setCoverageName(request.getParameter("name"));
			//cc.setStatus(request.getParameter("status"));
			//ud.updateCoverage(request.getParameter("id"), cc);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Edited Successfully " );
				response.sendRedirect("Admin/editInsuranceProduct.jsp");
			
		}
		
		//editBroker
		if(action.equalsIgnoreCase("editBroker"))
		{
			System.out.println("In Edit Broker");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println("a");
			System.out.println(request.getParameter("id"));
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("address"));
			System.out.println(request.getParameter("city"));
			System.out.println(request.getParameter("state"));
			
			//System.out.println(Long.parseLong(request.getParameter("zip")));
			
			System.out.println(request.getParameter("zip"));
			System.out.println(request.getParameter("mobnumber"));
			System.out.println("aa");
			ab.setBrokerName(request.getParameter("name"));
			ab.setAddress(request.getParameter("address"));
			ab.setCity(request.getParameter("city"));
			ab.setState(request.getParameter("state"));
			ab.setZipcode(Long.parseLong(request.getParameter("zip")));
			ab.setPhone(Long.parseLong(request.getParameter("mobnumber")));
			mf.updateBroker(request.getParameter("id"),ab);
			//cc.setCoverageName(request.getParameter("name"));
			
			//ud.updateCoverage(request.getParameter("id"), cc);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Edited Successfully " );
				response.sendRedirect("Admin/editBroker.jsp");
			
			
		}
		
		if(action.equalsIgnoreCase("deleteUser"))
		{
			System.out.println("In delete User");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println("a");
			//System.out.println();
			System.out.println(request.getParameter("del"));
			//System.out.println(request.getParameter("role"));
			//System.out.println(request.getParameter("status"));
			System.out.println("aa");
			//cl.setUserName(request.getParameter("username"));
			//cl.setRole(request.getParameter("role"));
			//cl.setStatus(request.getParameter("status"));
			cl.setUserName(request.getParameter("del"));
			ud.deleteUser(cl);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully " );
			response.sendRedirect("Admin/deleteUser.jsp");
		}
		
		if(action.equalsIgnoreCase("addCoverage"))
		{
			
			System.out.println("In Add coverage");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println(request.getParameter("coverage"));
			System.out.println(request.getParameter("status"));
			cc.setCoverageName(request.getParameter("coverage"));
			cc.setStatus(request.getParameter("status"));
			
			id=ud.createCoverage(cc);
			HttpSession httpSession=request.getSession(false);
			httpSession.setAttribute("onload","CoverageID=>"+id );
			response.sendRedirect("Admin/addCoverage.jsp");
		}
		//deleteCoverage
		
		if(action.equalsIgnoreCase("deleteCoverage"))
		{
		//	HttpSession hs = request.getSession();
			System.out.println("In delete Coverage");
			
			//RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/deleteCoverage.jsp");
			//requestDispatcher.include(request, response);
			
			System.out.println("a");
			//System.out.println();
			System.out.println(request.getParameter("del"));
			//System.out.println(request.getParameter("role"));
			//System.out.println(request.getParameter("status"));
			System.out.println("aa");
			cc.setCoverageName(request.getParameter("del"));
			//ud.deleteCoverage(cc);
			String ss= ud.deleteCoverage(request.getParameter("del"));
			//ud.deleteUser(cl);
			  System.out.println(ss);
			//hs.setAttribute("reply", ss);
			 HttpSession httpSession=request.getSession(false);
				System.out.println(httpSession.getId()+"   "+"controller"+"  "+ss);
			 httpSession.setAttribute("onload",ss);
			response.sendRedirect("Admin/deleteCoverage.jsp");
		}
		
		
		
		if(action.equalsIgnoreCase("rfq_Proposals8"))
		{
			ManageFunction mng=new ManageFunction();
			UnderWriter uw= new UnderWriter(); 
			String ss= request.getParameter("pid");
			String c = request.getParameter("status");
			System.out.println(ss+"    "+c);
			
			  mng.generatePDF(ss);
			  uw.aproveByCustomer(ss,c);
			
			response.sendRedirect("Underwriter/RFQProposals.jsp");
		}
		
		
		
		
		if(action.equalsIgnoreCase("addInsuranceProduct"))
		{
			System.out.println("In Add Insurance Product");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println(request.getParameter("pname"));
			
			System.out.println(request.getParameter("status"));
			String[] ss= request.getParameterValues("type1");
			String data="";
			for(String s :ss )
			{
				data=data + " " +s;	
			}
			System.out.println(data);
			cp.setProductName(request.getParameter("pname"));
			cp.setStatus(request.getParameter("status"));
			id=ud.createProducts(cp,ss);
			System.out.println(id);
			HttpSession httpSession=request.getSession(false);
			httpSession.setAttribute("onload","Insurance Product ID =>"+id );
		    response.sendRedirect("Admin/addInsuranceProduct.jsp");
		}
		
		if(action.equalsIgnoreCase("deleteInsuranceProduct"))
		{
			HttpSession hs = request.getSession();
			System.out.println("xfgj");
			System.out.println(request.getParameter("tid"));
			
			String ss22=ud.deleteProduct(request.getParameter("tid"));
			System.out.println("hello "+ss22);
			hs.setAttribute("replyss22", ss22);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully " );
			response.sendRedirect("Admin/deleteInsuranceType.jsp");
		}		
		
		//deleteInsuranceType
		if(action.equalsIgnoreCase("deleteInsuranceType"))
		{
			HttpSession hs = request.getSession();
			System.out.println("cxlvk");
			System.out.println(request.getParameter("tid"));
			String s2s=ud.deleteInsuranceType(request.getParameter("tid"));
			System.out.println("hello "+s2s);
			
			hs.setAttribute("replyss", s2s);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully " );
			response.sendRedirect("Admin/deleteInsuranceType.jsp");
			
		}		
		
		
		if(action.equalsIgnoreCase("addInsuranceType"))
		{
			System.out.println("In Add Insurance type");
			/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
			requestDispatcher.forward(request, response);
			*/
			System.out.println(request.getParameter("type"));
			System.out.println(request.getParameter("status"));
			String[] ss= request.getParameterValues("type1");
			String data="";
			for(String s :ss )
			{
				data=data + " " +s;	
			}
			System.out.println(data);
			ct.setProductId(ss);
			System.out.println(request.getParameter("type"));
			System.out.println(request.getParameter("status"));
			ct.setStatus(request.getParameter("status"));
			ct.setTypeName(request.getParameter("type"));
			 id=ud.createInsuranceType(ct,ss);
			 HttpSession httpSession=request.getSession(false);
			 httpSession.setAttribute("onload","AddInsuranceType is=>"+id );
			response.sendRedirect("Admin/addInsuranceType.jsp");
		}
		
		//edit Insurance Type
				if(action.equalsIgnoreCase("editInsuranceType"))
				{
					//System.out.println("In Edit Insurance type");
					/*RequestDispatcher requestDispatcher = request.getRequestDispatcher("Admin/addUser.jsp");
					requestDispatcher.forward(request, response);
					*/
					String[] ss= request.getParameterValues("type1");
					String data="";
					for(String s :ss )
					{
						data=data + " " +s;	
					}
					//System.out.println(data);
					 id=request.getParameter("eId");
					//System.out.println(id);
					ct.setProductId(ss);
					//System.out.println(request.getParameter("type"));
					//System.out.println(request.getParameter("status"));
					ct.setStatus(request.getParameter("status"));
					ct.setTypeName(request.getParameter("type"));
						ud.updateInsuranceTypes(ct,id);
						 HttpSession httpSession=request.getSession(false);
							httpSession.setAttribute("onload","Edited Successfully " );
					response.sendRedirect("Admin/editInsuranceType.jsp");
				}
		if(action.equalsIgnoreCase("createRule"))
		{
			System.out.println("In Add Rule Engine");
		
			System.out.println(request.getParameter("id"));
			String s = request.getParameter("id");
			//String string = "004-034556";
			String[] parts = s.split("!");
			String str1 = parts[0]; // 004
			String str2 = parts[1];
			//int a = s.charAt('!');
			
			System.out.println(str1+" "+str2);
			System.out.println("hh"+Float.parseFloat(request.getParameter("ag80")));
			System.out.println(request.getParameter("ag60l80"));
			System.out.println(request.getParameter("al40"));
			System.out.println(request.getParameter("ag40l60"));
			System.out.println(request.getParameter("male"));
			System.out.println(request.getParameter("female"));
			System.out.println(request.getParameter("minAndNuclear"));
			System.out.println(request.getParameter("others"));
			System.out.println(request.getParameter("taxPerc"));
			cr.setInsuranceTypeId(str1);
			cr.setInsuranceTypeName(str2);
			cr.setG80( Float.parseFloat(request.getParameter("ag80")));
			cr.setG60l80(Float.parseFloat(request.getParameter("ag60l80")));
			cr.setG40l60(Float.parseFloat(request.getParameter("ag40l60")));
			cr.setL40(Float.parseFloat(request.getParameter("al40")));
			cr.setGovTax(Float.parseFloat(request.getParameter("taxPerc")));
			cr.setGenderMale(Float.parseFloat(request.getParameter("male")));
			cr.setGenderFemale(Float.parseFloat(request.getParameter("female")));
			cr.setOccupationMiningNuclear(Float.parseFloat(request.getParameter("minAndNuclear")));
			cr.setOccupationOthers(Float.parseFloat(request.getParameter("others")));
			
			
			ud.insertIntoTblRuleEngine(cr);
			HttpSession httpSession=request.getSession(false);
			httpSession.setAttribute("onload","Rule Updated" );
			//ud.createRule
			//ud.addBroker(ab);
			response.sendRedirect("Admin/createRule.jsp");
		}
		
		//editRule
		if(action.equalsIgnoreCase("editRule"))
		{
			System.out.println("In Edit Rule Engine");
		
			System.out.println(request.getParameter("id"));
			String s = request.getParameter("id");
			//String string = "004-034556";
			String[] parts = s.split("!");
			String str1 = parts[0]; // 004
			String str2 = parts[1];
			//int a = s.charAt('!');
			
			System.out.println(str1+" "+str2);
			System.out.println("hh"+Float.parseFloat(request.getParameter("ag80")));
			System.out.println(request.getParameter("ag60l80"));
			System.out.println(request.getParameter("al40"));
			System.out.println(request.getParameter("ag40l60"));
			System.out.println(request.getParameter("male"));
			System.out.println(request.getParameter("female"));
			System.out.println(request.getParameter("minAndNuclear"));
			System.out.println(request.getParameter("others"));
			System.out.println(request.getParameter("taxPerc"));
			cr.setInsuranceTypeId(str1);
			cr.setInsuranceTypeName(str2);
			cr.setG80( Float.parseFloat(request.getParameter("ag80")));
			cr.setG60l80(Float.parseFloat(request.getParameter("ag60l80")));
			cr.setG40l60(Float.parseFloat(request.getParameter("ag40l60")));
			cr.setL40(Float.parseFloat(request.getParameter("al40")));
			cr.setGovTax(Float.parseFloat(request.getParameter("taxPerc")));
			cr.setGenderMale(Float.parseFloat(request.getParameter("male")));
			cr.setGenderFemale(Float.parseFloat(request.getParameter("female")));
			cr.setOccupationMiningNuclear(Float.parseFloat(request.getParameter("minAndNuclear")));
			cr.setOccupationOthers(Float.parseFloat(request.getParameter("others")));
			
			ud.updateRuleEngine(cr);
			
			 HttpSession httpSession=request.getSession(false);
		     httpSession.setAttribute("onload","Edited Successfully " );
			 response.sendRedirect("Admin/editRule.jsp");
		}
		
		
		
		
		
		
		
		if(action.equalsIgnoreCase("addBroker"))
		{
			System.out.println("In Add Broker");
			
			System.out.println(request.getParameter("name"));
			System.out.println(request.getParameter("address"));
			System.out.println(request.getParameter("city"));
			System.out.println(request.getParameter("slist"));
			System.out.println(request.getParameter("zip"));
			System.out.println(request.getParameter("mobnumber"));
			ab.setBrokerName(request.getParameter("name"));
			ab.setAddress(request.getParameter("address"));
			ab.setCity(request.getParameter("city"));
			ab.setState(request.getParameter("slist"));
			ab.setZipcode(Long.parseLong(request.getParameter("zip")));
			ab.setPhone(Long.parseLong(request.getParameter("mobnumber")));
			id=ud.addBroker(ab);
			HttpSession httpSession=request.getSession(false);
			httpSession.setAttribute("onload","BrokerId is=>"+id );
			response.sendRedirect("Admin/addBroker.jsp");
		}
		
		//deleteBroker
		if(action.equalsIgnoreCase("deleteBroker"))
		{
			System.out.println("In delete Broker");
			
			System.out.println("a");
			
			System.out.println(request.getParameter("del"));
			
			System.out.println("aa");
			//ab.setBrokerID(brokerID)
			ud.deleteBroker(request.getParameter("del"));
			//ud.deleteUser(request.getParameter("del"));
			//cl.setUserName(request.getParameter("del"));
			//ud.deleteUser(cl);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully " );
			response.sendRedirect("Admin/deleteBroker.jsp");
		}
		if(action.equalsIgnoreCase("deleteRule"))
		{
			System.out.println("In delete Rule");
			
			System.out.println("a");
			
			System.out.println(request.getParameter("del"));
			
			System.out.println("aa");
			ud.deleteRule(request.getParameter("del"));
			//ab.setBrokerID(brokerID)
			//ud.deleteBroker(request.getParameter("del"));
			//ud.deleteUser(request.getParameter("del"));
			//cl.setUserName(request.getParameter("del"));
			//ud.deleteUser(cl);
			 HttpSession httpSession=request.getSession(false);
				httpSession.setAttribute("onload","Deleted Successfully " );
			response.sendRedirect("Admin/deleteRule.jsp");
		}
		
		//deleteRule
		
		
		
		//userLogin
		
		if(action.equalsIgnoreCase("authentication"))
		{
			 id = request.getParameter("userid");

			String password = request.getParameter("password");

			UserDAO check = new UserDAO();

			String role = check.authenticateUser(id, password);
			System.out.println(role);

			if (role == null) {

				response.sendRedirect("Admin/login.jsp");
			} else if (role.equalsIgnoreCase("change password")) {

			HttpSession httpSession=request.getSession(true);
			
			httpSession.setAttribute("session",httpSession.getId());
			httpSession.setAttribute("onload", "abhi");
			
				response.sendRedirect("Admin/passwordManagement.jsp?userid="
						+ id + "");
			} else if (role.equalsIgnoreCase("access denied")) {
				response.sendRedirect("Admin/login.jsp");
			}

			else if (role.equalsIgnoreCase("admin")) {
				HttpSession httpSession=request.getSession(true);
				httpSession.setAttribute("session",httpSession.getId());
				httpSession.setAttribute("onload", null);
				response.sendRedirect("Admin/adminHome.jsp");
			} else if (role.equalsIgnoreCase("Underwriter")) {
				HttpSession httpSession=request.getSession(true);
				httpSession.setAttribute("session",httpSession.getId());
				httpSession.setAttribute("onload", null);
				response.sendRedirect("Underwriter/homeUnderwriter.jsp");
			} else if (role.equalsIgnoreCase("manager")) {
				HttpSession httpSession=request.getSession(true);
				httpSession.setAttribute("session",httpSession.getId());
				httpSession.setAttribute("onload", null);
				response.sendRedirect("Admin/homeManager.jsp");
			}
		}
		
		
		
		if (action.equalsIgnoreCase("changePwd")) {

			String userid = request.getParameter("userid");
			String password = request.getParameter("pwd1");
			System.out.println(userid);
			System.out.println(password);
			
			UserDAO check = new UserDAO();
			check.changepwd(userid,password);
			System.out.println("password changed");
			
			response.sendRedirect("Admin/login.jsp");
			

		}



	


		
	}	
		
		
	}


