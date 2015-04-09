package com.bhanu.servlet;
 import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bhanu.Bean.ServiceSelector;
import com.bhanu.helperss.ConnectionHelper;
import com.bhanu.helperss.ServiceSelectoreHelper;
//@WebServlet("/BhanuRegistration")
public class ServiceSelectoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
  	{
boolean reg=false;
response.setContentType("text/html;charset=UTF-8");
String uId=request.getParameter("UserPkey");
String uYrSelected=request.getParameter("YrSelect");
System.out.println("User Recevied value====>>>>"+uId);
System.out.println("User Date value====>>>>"+uYrSelected);
ServiceSelector lUserDetailsBean= new ServiceSelector();//which Creates new bean which we r passing to helper to insert
ServiceSelectoreHelper lUserEntryHelper = new ServiceSelectoreHelper();
boolean login = false;
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
//String CheckingLogin = "SELECT * FROM adminuser WHERE ADD_UserName = ? AND ADD_UserPassWord = ? AND ADD_UserStatus= '1' ";
String CheckingLogin = "SELECT ser_YearSelect,Ser_UserId from serviceselector where ser_YearSelect=? and Ser_UserId=?";
PreparedStatement statement = null;
ResultSet resultSet = null;
boolean loginlog;
try
{
	 statement = connect.prepareStatement(CheckingLogin);
     statement.setString(1,uYrSelected);
     statement.setString(2,uId);
     resultSet = statement.executeQuery();
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
	lUserEntryHelper.insert(connect,lUserDetailsBean);
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
	response.sendRedirect("./ReportsPages/ServiceSelectoreReport.jsp"); // Redirect to home page.
} else {
     request.setAttribute("message","Unknown username/password, try again");
     request.getRequestDispatcher("/ServiceSelectionPage.jsp").forward(request, response); // Redisplay JSP.
   }
}
}