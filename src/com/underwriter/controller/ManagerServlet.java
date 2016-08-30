package com.underwriter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ManageFunction;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet("/ManagerServlet")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServlet() {
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
		if(action.equalsIgnoreCase("acceptAndRejectProposals"))
		{
			response.sendRedirect("Underwriter/homeUnderwriter.jsp");
			String sub = request.getParameter("submit");
			if(sub.equalsIgnoreCase("approved"))
			{
				
				System.out.println("app");
				System.out.println(request.getParameter("pid"));
			}
			else if(sub.equalsIgnoreCase("rejected"))
			{
				System.out.println("rej");
				System.out.println(request.getParameter("pid"));
			}
			response.sendRedirect("Admin/acceptAndRejectProposals.jsp");
		}
		
		
		ManageFunction mf = new ManageFunction ();
		action = request.getParameter("action");
		if(action.equalsIgnoreCase("response"))
		{
			//response.sendRedirect("Underwriter/homeUnderwriter.jsp");
			String sub = request.getParameter("submit");
			System.out.println(request.getParameter("submit"));
			System.out.println(request.getParameter("pid"));
			System.out.println(request.getParameter("comment"));
			mf.updateProposalStatusByCustomer(request.getParameter("pid"),request.getParameter("submit"),request.getParameter("comment"));
	//		updateProposalStatusByCustomer
			response.sendRedirect("Admin/acceptAndRejectProposals.jsp");
		}
	}

}
