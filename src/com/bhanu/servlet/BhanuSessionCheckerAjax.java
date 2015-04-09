package com.bhanu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//@WebServlet("/SessionCheckerAjax")
public class BhanuSessionCheckerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UserDetailsBean lbean=(UserDetailsBean)session.getAttribute("UserBean");
		String userName=request.getParameter("id");
		boolean valid;
		if(userName==null)
		{
			valid= false;
		System.out.println("Valid Value"+valid+userName);
			}
		else{
			valid= true;
			}
		  response.setContentType("text/plain");
          response.getWriter().print(valid);
	}
	}
