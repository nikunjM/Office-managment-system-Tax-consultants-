package com.bhanu.servlet;
 import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bhanu.Bean.BhanuUserDetailsBean;
import com.bhanu.helperss.BhanuSessionCheckerHelper;
import com.bhanu.helperss.BhanuUserEntryHelper;
import com.bhanu.helperss.ConnectionHelper;
//@WebServlet("/BhanuRegistration")
public class BhanuRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
  	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
  	{
boolean reg=false;
response.setContentType("text/html;charset=UTF-8");
String uId=request.getParameter("UserPkey");
System.out.println("User Recevied value====>>>>"+uId);
BhanuUserDetailsBean lUserDetailsBean= new BhanuUserDetailsBean();//which Creates new bean which we r passing to helper to insert
BhanuUserEntryHelper lUserEntryHelper = new BhanuUserEntryHelper();

try
{
	lUserEntryHelper.fillHelper(request,lUserDetailsBean);
}
catch (Exception e1)
{
	e1.printStackTrace();
}
ConnectionHelper connClass=new ConnectionHelper();
Connection connect = connClass.connect();
System.out.print(reg);
try
{
	if(uId.equalsIgnoreCase("null") || uId.length()<=0)
	{
		lUserEntryHelper.insert(connect,lUserDetailsBean);
		System.out.print("Insert Main Gaya Saala ");
		reg=true;
	}
	else
	{
		lUserEntryHelper.updateUserDetails(connect,lUserDetailsBean,uId);
		System.out.print("update Main Gaya Saala");
		reg=true;
	}
}
catch (SQLException e)
{
	e.printStackTrace();
}
finally{
if (connect != null)try{connect.close();}catch (SQLException ignore)	{}
//if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
		}
if (reg) {
	 response.sendRedirect(request.getContextPath()+"/ReportsPages/UserDetailsReport.jsp"); // Redirect to home page.
 } else {
     request.setAttribute("message","Unknown username/password, try again");
     request.getRequestDispatcher(request.getContextPath()+"/ClientRegistrationPage.jsp").forward(request, response); // Redisplay JSP.
   }
}
}