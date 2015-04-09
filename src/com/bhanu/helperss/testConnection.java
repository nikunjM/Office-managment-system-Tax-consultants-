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
import com.bhanu.Bean.VatRegistraFormBean;
import com.bhanu.helperss.ConnectionHelper;
import com.bhanu.helperss.VatFormHelper;
//@WebServlet("/BhanuRegistration")
public class VatformRegistration1 extends HttpServlet {
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
String lVatUpdateKey=request.getParameter("VatPkey");//Vat Key For Updatation Key

//If This Key is present Then Its Update ,No insert has to be Done .
VatRegistraFormBean lUserDetailsBean= new VatRegistraFormBean();//which Creates new bean which we r passing to helper to insert
VatFormHelper lUserEntryHelper = new VatFormHelper();
boolean login = false;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
String CheckingLogin ="";
PreparedStatement statement = null;
ResultSet resultSet = null;
System.out.println("Sub value Ki Key----------->>"+lVatUpdateKey+lVatUpdateKey.length());
System.out.println("Sub value----------->>"+lVatSerNno+lVatYrSelected+lVatType+lVatPeriod+lUserKey);
if( lVatUpdateKey.trim().length()==0)
{
if (lVatType.trim().equalsIgnoreCase("Orignal"))
{
	System.out.println("Orignal Select Hua ");
	CheckingLogin = "SELECT Vat_Pkey,Vat_UserKey,Vat_SerKey,Vat_Type,Vat_Period,ser.Ser_YearSelect from vatservice vat INNER JOIN serviceselector ser on vat.Vat_SerKey=ser.Ser_Id where Vat_UserKey='"+lUserKey+"' and Vat_Period='"+lVatPeriod+"' and vat_Type='"+lVatType+"' and ser.Ser_YearSelect='"+lVatYrSelected+"'";
	try
	{
		 Statement lstatement= connect.createStatement();
		 resultSet=lstatement.executeQuery(CheckingLogin);
	     login = resultSet.next();//True Matlab Already Enterd hua hai.
	     						  //False matlab Enter Hone dega. 
	}
	catch (Exception e) 
	{
	    throw new ServletException("Already Entered", e);
	}
}
else
{
	System.out.println("Revised  Select Hua ");
	CheckingLogin = "SELECT Vat_Pkey,Vat_UserKey,Vat_SerKey,Vat_Type,Vat_Period,ser.Ser_YearSelect,Vat_Status from vatservice vat INNER JOIN serviceselector ser on vat.Vat_SerKey=ser.Ser_Id where Vat_UserKey='"+lUserKey+"' and Vat_Period='"+lVatPeriod+"' and ser.Ser_YearSelect='"+lVatYrSelected+"' and vat_status='Revised'";
	try
	{
		 Statement lstatement= connect.createStatement();
		 resultSet=lstatement.executeQuery(CheckingLogin);
	     login = resultSet.next();//True Matlab Already Enterd hua hai.
	
	}
	catch (Exception e) 
	{
	    throw new ServletException("Already Entered", e);
	}
}
System.out.println("Check Query--------------------------------------->"+CheckingLogin);

System.out.println("Log Is Ka Value Kya Aaya :::::::::::::::------------- _____>>"+login);
if(login)
{
	if (lVatType.trim().equalsIgnoreCase("Orignal"))
	{
	  request.setAttribute("messageSer","For This Period Entry Already Done.");
	}else 
	{
		request.setAttribute("messageSer","The Vat Status For This Period Is Final Or Origanl Period Entry Not Done.");
	}
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
	lUserEntryHelper.Vatinsert(connect,lUserDetailsBean);
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
}
else
{
System.out.println("Update main gaya");
try 
{
  lUserEntryHelper.updateUserDetails(connect, lUserDetailsBean, lVatUpdateKey);
  login=!login;
} catch (SQLException e) 
{
	e.printStackTrace();
}
}
if (!login)
{
	 response.sendRedirect("./ReportsPages/VatReport.jsp"); // Redirect to home page.
} else {
	 //  response.sendRedirect(request.getContextPath()+"/VatFormApplication.jsp"); // Redirect to home page.
     request.getRequestDispatcher("./ReportsPages/CommonQuerySelector.jsp").forward(request, response); // Redisplay JSP.
   }
//Origanlly EDnds Here
  	}
}