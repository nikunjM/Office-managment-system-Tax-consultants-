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

import com.bhanu.Bean.CSTRegistrationFormBean;
import com.bhanu.helperss.ConnectionHelper;
import com.bhanu.helperss.CstFormHelper;
//@WebServlet("/BhanuRegistration")
public class CstFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
  	{
boolean reg=false;
response.setContentType("text/html;charset=UTF-8");
//String uId=request.getParameter("UserPkey");
//String uYrSelected=request.getParameter("YrSelect");

String lUserKey=request.getParameter("PKey");
String lVatPeriod=request.getParameter("VatPeriod");
String lVatType=request.getParameter("VatType");
String lVatYrSelected=request.getParameter("AssYr");
String lVatSerNno=request.getParameter("SerKey");
System.out.println("Sub value----------->>"+lVatSerNno+lVatYrSelected+lVatType+lVatPeriod+lUserKey);
CSTRegistrationFormBean lUserDetailsBean= new CSTRegistrationFormBean();//which Creates new bean which we r passing to helper to insert
CstFormHelper lUserEntryHelper = new CstFormHelper();
boolean login = false;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
String CheckingLogin = "SELECT Cst_Pkey,Cst_UserKey,Cst_SerKey,Cst_Type,Cst_Period,ser.Ser_YearSelect from cstservice vat INNER JOIN serviceselector ser on vat.Cst_SerKey=ser.Ser_Id where Cst_UserKey='"+lUserKey+"' and Cst_Period='"+lVatPeriod+"' and Cst_Type='"+lVatType+"' and ser.Ser_YearSelect='"+lVatYrSelected+"'";
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
	lUserEntryHelper.Cstinsert(connect,lUserDetailsBean);
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
	 response.sendRedirect("./ReportsPages/CstReport.jsp"); // Redirect to home page.
} else {
	 //  response.sendRedirect(request.getContextPath()+"/VatFormApplication.jsp"); // Redirect to home page.
     request.getRequestDispatcher("./ReportsPages/CommonQuerySelector.jsp").forward(request, response); // Redisplay JSP.
   }
}
}