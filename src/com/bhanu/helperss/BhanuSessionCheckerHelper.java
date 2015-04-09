package com.bhanu.helperss;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BhanuSessionCheckerHelper
{
	public boolean login(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session = request.getSession(false);
		if (session == null)
		{
			return false;
		}
		else
		{
			//BhanuUserDetailsBean User=(BhanuUserDetailsBean) session.getAttribute("UserBean");
			String lUserSession=(String)session.getAttribute("username");
			if(lUserSession==null)
			{
				return false;
			}
		}
		return true;
	}
 public void forwardToAnyPage(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
{
	 System.out.print("Inside BhanuSessienChecker logout page main");
	 response.sendRedirect("/IssueTracker/BhanuLogIn.jsp"); // Redirect to home page.
	}
}

