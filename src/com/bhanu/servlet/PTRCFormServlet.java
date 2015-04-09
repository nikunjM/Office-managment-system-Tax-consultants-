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

import com.bhanu.Bean.PTRCRegistrationBean;
import com.bhanu.Bean.VatRegistraFormBean;
import com.bhanu.helperss.ConnectionHelper;
import com.bhanu.helperss.PTRCFormHelper;
import com.bhanu.helperss.VatFormHelper;
//@WebServlet("/BhanuRegistration")
public class PTRCFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
  	{
boolean reg=false;
response.setContentType("text/html;charset=UTF-8");
//String uId=request.getParameter("UserPkey");
//String uYrSelected=request.getParameter("YrSelect");

String lUserKey=request.getParameter("PKey");
String lVatPeriod=request.getParameter("PTRCPeriod");
String lVatType=request.getParameter("PTRCType");
String lVatYrSelected=request.getParameter("AssYr");
String lVatSerNno=request.getParameter("SerKey");
System.out.println("Sub value----------->>"+lVatSerNno+lVatYrSelected+lVatType+lVatPeriod+lUserKey);
PTRCRegistrationBean lUserDetailsBean= new PTRCRegistrationBean();//which Creates new bean which we r passing to helper to insert
PTRCFormHelper lUserEntryHelper = new PTRCFormHelper();
boolean login = false;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
String CheckingLogin = "SELECT PTRC_Pkey,PTRC_UserKey,PTRC_SerKey,PTRC_Type,PTRC_Period,ser.Ser_YearSelect from PTRCservice vat INNER JOIN serviceselector ser on vat.PTRC_SerKey=ser.Ser_Id where PTRC_UserKey='"+lUserKey+"' and PTRC_Period='"+lVatPeriod+"' and PTRC_Type='"+lVatType+"'and ser.Ser_YearSelect='"+lVatYrSelected+"'";
PreparedStatement statement = null;
ResultSet resultSet = null;
System.out.println("Check Query--------------------------------------->"+CheckingLogin);
boolean loginlog;
try
{
	/*
	 statement = connect.prepareStatement(CheckingLogin);
     statement.setString(1,lUserKey);
     statement.setString(2,lVatPeriod);
     statement.setString(3,lVatType);
     statement.setString(4,lVatYrSelected);
     resultSet = statement.executeQuery();
   */
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
	lUserEntryHelper.PTRCinsert(connect,lUserDetailsBean);
	System.out.print("Insert Main Gaya Saala ");
}
catch (SQLException e)
{
	e.printStackTrace();
}

finally{
if (connect != null)try{connect.close();}catch (SQLException ignore)	{}
//if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
		}
}//esle send msg its already entered .....................to serviceSelectionPage
if (!login)
{
	 response.sendRedirect("./ReportsPages/VatReport.jsp"); // Redirect to home page.
} else {
	 //  response.sendRedirect(request.getContextPath()+"/VatFormApplication.jsp"); // Redirect to home page.
     request.getRequestDispatcher("./ReportsPages/CommonQuerySelector.jsp").forward(request, response); // Redisplay JSP.
   }
}
}