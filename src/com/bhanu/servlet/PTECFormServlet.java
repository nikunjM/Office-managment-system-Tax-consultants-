package com.bhanu.servlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bhanu.Bean.PTECRegistrationBean;
import com.bhanu.helperss.ConnectionHelper;
import com.bhanu.helperss.PTECFormHelper;
//@WebServlet("/BhanuRegistration")

public class PTECFormServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
 	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
 	{
boolean reg=false;
response.setContentType("text/html;charset=UTF-8");
String lUserKey=request.getParameter("PKey");
String lVatYrSelected=request.getParameter("AssYr");
String lVatSerNno=request.getParameter("SerKey");
System.out.println("Sub value PTEC----------->>"+lVatSerNno+lVatYrSelected+lUserKey);
PTECRegistrationBean lUserDetailsBean= new PTECRegistrationBean();//which Creates new bean which we r passing to helper to insert
PTECFormHelper lUserEntryHelper = new PTECFormHelper();
boolean login = false;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
String CheckingLogin = "Select PTEC_pKey,PTEC_UserKey,PTEC_SerKey,PTEC_Period from ptecservice PTEC INNER JOIN serviceselector ser on PTEC.PTEC_SerKey=ser.Ser_Id WHERE PTEC_UserKey='"+lUserKey+"' AND ser.Ser_YearSelect='"+lVatYrSelected+"'";
PreparedStatement statement = null;
ResultSet resultSet = null;
System.out.println("Check Query--------------------------------------->"+CheckingLogin);
boolean loginlog;
try
{
	Statement lstatement= connect.createStatement();
	resultSet=lstatement.executeQuery(CheckingLogin);
    login = resultSet.next();
}
catch (Exception e) {
   throw new ServletException("Already Entered", e);
}
System.out.println("Log Is Started _____>>"+login);
if(login)
{
	  request.setAttribute("messageSer","For This Year Service Already Selected");
}
else{
try
{
	lUserEntryHelper.fillHelper(request,lUserDetailsBean);
}
catch (Exception e1)
{
	e1.printStackTrace();
}
System.out.print(reg);
try
{
	lUserEntryHelper.PTECinsert(connect,lUserDetailsBean);
	System.out.print("Insert Main Gaya Saala ");
}
catch (SQLException e)
{
	e.printStackTrace();
}

finally{
if (connect != null)try{connect.close();}catch (SQLException ignore)	{}
		}
}
if (!login)
{
	 response.sendRedirect("./ReportsPages/CstReport.jsp"); // Redirect to home page.
} else {
    request.getRequestDispatcher("./ReportsPages/CommonQuerySelector.jsp").forward(request, response); // Redisplay JSP.
  }
}
}
